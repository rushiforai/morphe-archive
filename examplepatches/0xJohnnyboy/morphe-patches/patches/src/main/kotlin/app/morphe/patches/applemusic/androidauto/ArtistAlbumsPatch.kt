package app.morphe.patches.applemusic.androidauto

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val mediaLibrary = "Lcom/apple/android/medialibrary/library/MediaLibrary;"
private const val mediaPlaybackService = "Lcom/apple/android/music/player/MediaPlaybackService;"
private const val artistAlbumsQuery = "$mediaLibrary->t(LM6/d;LN6/g;)Lzh/m;"
private const val albumSongsQuery = "$mediaLibrary->d(LM6/d;LN6/g;)Lzh/m;"
private const val booleanValueOf = "Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;"
private const val playAlbumLabel = "morphe_android_auto_play_album"

private val albumPlaybackResources = resourcePatch {
    execute {
        for ((locale, label) in mapOf("values" to "Play album", "values-fr" to "Jouer l’album")) {
            document("res/$locale/strings.xml").use { doc ->
                val string = doc.createElement("string")
                string.setAttribute("name", playAlbumLabel)
                string.textContent = label
                doc.documentElement.appendChild(string)
            }
        }
    }
}

private fun Instruction.calls(descriptor: String): Boolean =
    ((this as? ReferenceInstruction)?.reference as? MethodReference)?.toString() == descriptor

private fun artistLibraryPath(path: String, scratch: String, fallback: String) = """
    const-string $scratch, "library"
    invoke-interface {$path, $scratch}, Ljava/util/List;->contains(Ljava/lang/Object;)Z
    move-result $scratch
    if-eqz $scratch, :$fallback
    const-string $scratch, "artists"
    invoke-interface {$path, $scratch}, Ljava/util/List;->contains(Ljava/lang/Object;)Z
    move-result $scratch
    if-eqz $scratch, :$fallback
    const-string $scratch, "offline_content"
    invoke-interface {$path, $scratch}, Ljava/util/List;->contains(Ljava/lang/Object;)Z
    move-result $scratch
    if-nez $scratch, :$fallback
""".trimIndent()

// Leaves the album token in id and reuses scratch for the path checks.
private fun albumLibraryPath(path: String, id: String, scratch: String, fallback: String) = """
    ${artistLibraryPath(path, scratch, fallback)}
    invoke-interface {$path}, Ljava/util/List;->size()I
    move-result $scratch
    add-int/lit8 $scratch, $scratch, -0x1
    invoke-interface {$path, $scratch}, Ljava/util/List;->get(I)Ljava/lang/Object;
    move-result-object $id
    check-cast $id, Ljava/lang/String;
    const-string $scratch, "3-"
    invoke-virtual {$id, $scratch}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    move-result $scratch
    if-eqz $scratch, :$fallback
""".trimIndent()

val artistAlbumsPatch = bytecodePatch(
    name = "Browse artist albums in Android Auto",
    description = "Opens an artist’s library albums in Android Auto without starting shuffle.",
    default = true
) {
    compatibleWith(Compatibility(
        packageName = "com.apple.android.music",
        name = "Apple Music",
        targets = listOf(
            AppTarget("7.0.1", 1622, false, 30),
            AppTarget("7.0.2", 1624, false, 30)
        )
    ))
    dependsOn(albumPlaybackResources)

    execute {
        val provider = mutableClassDefBy(classDefBy { candidate ->
            candidate.methods.any { method ->
                method.returnType == "Ljava/io/Serializable;" &&
                    method.parameterTypes == listOf("Ljava/util/List;", mediaLibrary, "Lgi/c;") &&
                    method.implementation?.instructions?.any { it.calls(artistAlbumsQuery) } == true
            }
        })

        val serviceField = provider.fields.single { it.type == mediaPlaybackService }
        val builderField = provider.fields.single {
            it.accessFlags and 0x8 == 0 && it.type != mediaPlaybackService
        }
        val builderType = builderField.type
        val buttonBuilder = classDefBy { it.type == builderType }.methods.single { method ->
            method.name == "f" &&
                method.parameterTypes == listOf(
                    builderType, "Ljava/util/List;", "Ljava/lang/String;", "Ljava/lang/String;",
                    "Ljava/lang/Integer;", "I"
                ) && method.returnType == "Lz3/w;"
        }

        val mediaItems = provider.methods.single { method ->
            method.returnType == "Ljava/io/Serializable;" &&
                method.parameterTypes == listOf(
                    "Lcom/apple/android/medialibrary/results/l;", "Ljava/lang/String;",
                    "I", "Ljava/util/List;", "Lgi/c;"
                ) &&
                method.implementation?.instructions?.any { instruction ->
                    ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string ==
                        "android.media.browse.CONTENT_STYLE_BROWSABLE_HINT"
                } == true
        }
        val mediaItemsImpl = checkNotNull(mediaItems.implementation)
        check(mediaItemsImpl.registerCount == 28)
        val itemInstructions = mediaItemsImpl.instructions
        val subtitle = itemInstructions.indexOfFirst {
            it.calls("Lcom/apple/android/music/model/CollectionItemView;->getSubTitle()Ljava/lang/String;")
        }
        check(subtitle >= 0)
        val flags = subtitle + 3
        check(itemInstructions[flags].calls(booleanValueOf))
        check(itemInstructions[flags + 1].opcode == Opcode.MOVE_RESULT_OBJECT)
        fun flagField(offset: Int): FieldReference {
            val instruction = itemInstructions[flags + offset]
            check(instruction.opcode == Opcode.IPUT_OBJECT)
            check((instruction as TwoRegisterInstruction).let { it.registerA == 5 && it.registerB == 6 })
            return ((instruction as ReferenceInstruction).reference as FieldReference).also {
                check(it.type == "Ljava/lang/Boolean;")
            }
        }
        val browsable = flagField(2)
        val playable = flagField(4)

        // v3 is the parent path, v11 the content type, and v5 is reused by the stock flag builder.
        mediaItems.addInstructionsWithLabels(
            flags,
            """
                const/4 v5, 0x6
                if-eq v11, v5, :artist_or_album
                const/4 v5, 0x3
                if-ne v11, v5, :stock_flags
                :artist_or_album
                ${artistLibraryPath("v3", "v5", "stock_flags")}
                const/4 v5, 0x3
                if-ne v11, v5, :browse_only
                iget-object v5, v6, Lz3/y${'$'}a;->I:Landroid/os/Bundle;
                const-string v10, "android.media.browse.CONTENT_STYLE_PLAYABLE_HINT"
                const/4 v11, 0x1
                invoke-virtual {v5, v10, v11}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V
                const/4 v11, 0x3
                :browse_only
                sget-object v5, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                iput-object v5, v6, $browsable
                sget-object v5, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
                iput-object v5, v6, $playable
                goto :flags_ready
            """.trimIndent(),
            ExternalLabel("stock_flags", itemInstructions[flags]),
            ExternalLabel("flags_ready", itemInstructions[flags + 5])
        )

        val artwork = itemInstructions.indexOfFirst {
            it.opcode == Opcode.IPUT_OBJECT && (it as? ReferenceInstruction)?.reference?.toString() ==
                "Lz3/y\$a;->n:Landroid/net/Uri;"
        }
        check(artwork >= 0)
        // The existing artwork URI is in v5. v10 and v11 are dead before the item is constructed.
        mediaItems.addInstructionsWithLabels(
            artwork,
            """
                ${albumLibraryPath("v3", "v10", "v11", "write_artwork")}
                const/4 v5, 0x0
            """.trimIndent(),
            ExternalLabel("write_artwork", itemInstructions[artwork])
        )

        val release = itemInstructions.indexOfFirst {
            it.calls("Lcom/apple/android/medialibrary/results/l;->release()V")
        }
        check(release >= 0 && itemInstructions[release + 1].opcode == Opcode.RETURN_OBJECT)
        // At the return v4 holds the populated list. Appending the album token as the final ID
        // segment keeps the row unique while routing it through the native album playback handler.
        mediaItems.addInstructionsWithLabels(
            release + 1,
            """
                ${albumLibraryPath("v3", "v2", "v5", "rows_ready")}
                move-object v8, v4
                move-object v1, v3
                iget-object v6, v0, ${provider.type}->${serviceField.name}:${serviceField.type}
                invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
                move-result-object v7
                const-string v3, "$playAlbumLabel"
                const-string v4, "string"
                invoke-virtual {v6}, Landroid/content/Context;->getPackageName()Ljava/lang/String;
                move-result-object v5
                invoke-virtual {v7, v3, v4, v5}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
                move-result v5
                if-nez v5, :label_ready
                const v5, 0x7f1407d1
                :label_ready
                invoke-virtual {v6, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;
                move-result-object v3
                iget-object v0, v0, ${provider.type}->${builderField.name}:${builderField.type}
                const v5, 0x7f0803b5
                invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
                move-result-object v4
                const/4 v5, 0x0
                invoke-static/range {v0 .. v5}, $buttonBuilder
                move-result-object v0
                const/4 v5, 0x0
                invoke-virtual {v8, v5, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V
                move-object v4, v8
            """.trimIndent(),
            ExternalLabel("rows_ready", itemInstructions[release + 1])
        )

        val artistChildren = provider.methods.single { method ->
            method.parameterTypes == listOf("Ljava/util/List;", mediaLibrary, "Lgi/c;") &&
                method.implementation?.instructions?.any { it.calls(artistAlbumsQuery) } == true
        }
        val childrenImpl = checkNotNull(artistChildren.implementation)
        check(childrenImpl.registerCount == 11)
        val children = childrenImpl.instructions
        val parseId = children.indexOfFirst { it.calls("Ljava/lang/Long;->parseLong(Ljava/lang/String;)J") }
        val query = children.indexOfFirst { it.calls(artistAlbumsQuery) }
        check(parseId >= 0 && query > parseId + 2)
        check(children[parseId + 1].opcode == Opcode.MOVE_RESULT_WIDE)
        check(children[parseId + 2].opcode == Opcode.NEW_INSTANCE)
        check(children[query + 1].opcode == Opcode.MOVE_RESULT_OBJECT)

        // Use the existing album PID and resume at the shared coroutine tail with the song query.
        artistChildren.addInstructionsWithLabels(
            parseId + 2,
            """
                ${albumLibraryPath("p1", "p3", "v1", "artist_query")}

                new-instance p3, LN6/f${'$'}a;
                invoke-direct {p3}, LN6/f${'$'}a;-><init>()V
                sget-object v1, LN6/g${'$'}c;->MediaTypeSong:LN6/g${'$'}c;
                invoke-virtual {p3, v1}, LN6/f${'$'}a;->c(LN6/g${'$'}c;)V
                new-instance v1, LN6/f;
                invoke-direct {v1, p3}, LN6/f;-><init>(LN6/f${'$'}a;)V
                move-object p3, v1
                const/4 v1, 0x3
                invoke-static {v1, v4, v5}, LF9/o;->h(IJ)LM6/d;
                move-result-object v1
                invoke-interface {p2, v1, p3}, $albumSongsQuery
                move-result-object p2
                goto :query_ready
            """.trimIndent(),
            ExternalLabel("artist_query", children[parseId + 2]),
            ExternalLabel("query_ready", children[query + 2])
        )
    }
}
