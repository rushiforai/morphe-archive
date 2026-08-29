package app.danielthemaniel.patches.pokeraid

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.Opcode
import org.w3c.dom.Element

private const val QUICK_JOIN_PREF_KEY = "daniel_quick_join"

/**
 * Adds the visible JOIN control to each raid-room card.
 */
private val quickJoinButtonResourcePatch = resourcePatch {
    compatibleWith(COMPATIBILITY_POKERAID)

    execute {
        document("res/layout/item_raid_room.xml").use { document ->
            val root = document.documentElement

            val existing = document.getElementsByTagName("Button")
            for (i in 0 until existing.length) {
                val element = existing.item(i) as? Element ?: continue
                if (element.getAttribute("android:tag") == "daniel_quick_join_button") {
                    return@use
                }
            }

            val button = document.createElement("Button").apply {
                setAttribute("android:id", "@+id/btnQuickJoin")
                setAttribute("android:tag", "daniel_quick_join_button")
                setAttribute("android:text", "JOIN")
                setAttribute("android:textAllCaps", "true")
                setAttribute("android:textSize", "11sp")

                setAttribute("android:layout_width", "wrap_content")
                setAttribute("android:layout_height", "28dp")
                setAttribute("android:minWidth", "52dp")
                setAttribute("android:minHeight", "0dp")

                setAttribute("android:paddingLeft", "10dp")
                setAttribute("android:paddingRight", "10dp")
                setAttribute("android:paddingTop", "0dp")
                setAttribute("android:paddingBottom", "0dp")

                setAttribute("android:layout_marginTop", "2dp")
                setAttribute("android:layout_marginEnd", "8dp")

                setAttribute(
                    "app:layout_constraintTop_toBottomOf",
                    "@+id/tvRoomState"
                )
                setAttribute(
                    "app:layout_constraintEnd_toEndOf",
                    "parent"
                )
            }

            root.appendChild(button)
        }
    }
}

/**
 * Adds a one-tap JOIN button to raid-room cards.
 *
 * Flow:
 *
 *   JOIN
 *     -> JOIN is hidden entirely on subscription/manual-restricted cards
 *     -> ordinary cards arm a process-local one-shot marker
 *     -> run the exact stock room-card navigation callback
 *     -> RaidRoomMembersViewModel.u() immediately consumes the marker
 *     -> call t(null), which starts PokeRaid's normal authenticated join POST
 *        and reuses its stock success/error callbacks
 *
 * This is intentionally optimistic for ordinary rooms: room-full/state/etc.
 * are left to the server response. Subscription/manual-restriction cards are
 * never show Quick Join and therefore keep PokeRaid's normal gated flow.
 */
@Suppress("unused")
val quickJoinButtonPatch = bytecodePatch(
    name = "Quick Join Button",
    description = "Adds an optimistic JOIN button to room cards using PokeRaid's stock authenticated join request.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_POKERAID)
    dependsOn(quickJoinButtonResourcePatch)

    execute {
        /*
         * item_raid_room's binding is gj.tk.
         *
         * It already owns:
         *
         *     V = new uk.b(this, 1)
         *
         * and tk.b(int) ignores the integer and simply runs the room-card
         * callback. Reuse V directly instead of creating or patching another
         * generated binding callback.
         */
        mutableClassDefBy("Lgj/tk;").methods
            .first {
                it.name == "g" &&
                    it.parameterTypes.isEmpty() &&
                    it.returnType == "V"
            }
            .addInstructions(
                0,
                """
                # p0 is high in this large binding method, so bring it into
                # an existing low local first.
                move-object/from16 v2, p0

                iget-object v0, v2, Lgj/tk;->S:Landroidx/constraintlayout/widget/ConstraintLayout;

                const-string v1, "daniel_quick_join_button"
                invoke-virtual { v0, v1 }, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;
                move-result-object v0

                if-eqz v0, :quick_join_listener_done

                # Hide Quick Join completely for subscription/manual-restricted
                # rooms. gj.tk already observes n0.U, so executeBindings() is
                # rerun when this flag changes and recycled cards stay correct.
                iget-object v1, v2, Lgj/tk;->R:Lym/n0;
                if-eqz v1, :quick_join_hide_button

                iget-object v1, v1, Lym/n0;->U:Ldev/icerock/moko/mvvm/livedata/e;
                invoke-virtual { v1 }, Ldev/icerock/moko/mvvm/livedata/e;->b()Ljava/lang/Object;
                move-result-object v1
                check-cast v1, Ljava/lang/Boolean;
                invoke-virtual { v1 }, Ljava/lang/Boolean;->booleanValue()Z
                move-result v1

                if-nez v1, :quick_join_hide_button

                const/4 v1, 0x0
                invoke-virtual { v0, v1 }, Landroid/view/View;->setVisibility(I)V

                iget-object v1, v2, Lgj/tk;->V:Luk/b;
                invoke-virtual { v0, v1 }, Landroid/view/View;->setOnClickListener(Landroid/view/View${'$'}OnClickListener;)V
                goto :quick_join_listener_done

                :quick_join_hide_button
                const/16 v1, 0x8
                invoke-virtual { v0, v1 }, Landroid/view/View;->setVisibility(I)V

                :quick_join_listener_done
                """.trimIndent()
            )

        /*
         * uk.b is the generated click listener used by the room card.
         *
         * Only our JOIN view has the tag whose Java hashCode is 0x653f89f5.
         * Normal room-card clicks fall directly into the untouched original
         * onClick(View) body.
         *
         * uk.b.onClick has only three total registers:
         *   v0  = local
         *   p0  = this
         *   p1  = clicked View
         *
         * The quick-join branch therefore deliberately uses only those three.
         */
        mutableClassDefBy("Luk/b;").methods
            .first {
                it.name == "onClick" &&
                    it.parameterTypes.size == 1 &&
                    it.parameterTypes[0] == "Landroid/view/View;" &&
                    it.returnType == "V"
            }
            .addInstructions(
                0,
                """
                invoke-virtual { p1 }, Landroid/view/View;->getTag()Ljava/lang/Object;
                move-result-object v0

                if-eqz v0, :original_click

                invoke-virtual { v0 }, Ljava/lang/Object;->hashCode()I
                move-result v0

                sparse-switch v0, :quick_join_tag_switch
                goto :original_click

                :quick_join_click
                # The room-card ViewModel exposes U=true for the subscription /
                # manual-restriction cases. Do not arm optimistic Quick Join for
                # those cards; preserve PokeRaid's normal gated details flow.
                iget-object p1, p0, Luk/b;->a:Luk/a;
                check-cast p1, Lgj/tk;
                iget-object p1, p1, Lgj/tk;->R:Lym/n0;
                iget-object p1, p1, Lym/n0;->U:Ldev/icerock/moko/mvvm/livedata/e;
                invoke-virtual { p1 }, Ldev/icerock/moko/mvvm/livedata/e;->b()Ljava/lang/Object;
                move-result-object p1
                check-cast p1, Ljava/lang/Boolean;
                invoke-virtual { p1 }, Ljava/lang/Boolean;->booleanValue()Z
                move-result p1

                if-nez p1, :quick_join_restricted

                # Ordinary room: arm quick-join before navigation starts.
                # System properties are process-local and need no extra Context.
                const-string v0, "$QUICK_JOIN_PREF_KEY"
                move-object p1, v0
                invoke-static { v0, p1 }, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

                :quick_join_restricted
                # Run the exact stock room-card callback. For ordinary rooms the
                # destination ViewModel consumes the marker immediately; for
                # restricted rooms this is just the untouched normal flow.
                iget-object v0, p0, Luk/b;->a:Luk/a;
                iget p0, p0, Luk/b;->b:I
                invoke-interface { v0, p0 }, Luk/a;->b(I)V

                return-void

                :quick_join_tag_switch
                .sparse-switch
                    0x653f89f5 -> :quick_join_click
                .end sparse-switch

                :original_click
                """.trimIndent()
            )

        /*
         * Optimistic join trigger. RaidRoomMembersViewModel.u() is the small
         * method that starts/refreshes the room-members request and is called by
         * the normal ViewModel lifecycle. It already has the room id + repository
         * available through this ViewModel.
         *
         * For a Quick Join marker, consume it immediately and call t(null). t()
         * is null-safe through its local restriction preamble and then executes
         * the exact stock authenticated raid_room/join/{roomId} request pipeline
         * with PokeRaid's existing success/error callbacks.
         *
         * We only ever set this marker on cards whose n0.U is false, so the
         * subscription/manual-restriction cases never take this optimistic path.
         */
        val refreshRoom = mutableClassDefBy(
            "Lme/pokelounge/raid/member/c;"
        ).methods.first {
            it.name == "u" &&
                it.parameterTypes.isEmpty() &&
                it.returnType == "V"
        }

        refreshRoom.addInstructions(
            0,
            """
            const-string v0, "$QUICK_JOIN_PREF_KEY"
            invoke-static { v0 }, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;
            move-result-object v0

            if-eqz v0, :quick_join_refresh_continue

            const-string v0, "$QUICK_JOIN_PREF_KEY"
            invoke-static { v0 }, Ljava/lang/System;->clearProperty(Ljava/lang/String;)Ljava/lang/String;

            # t(null) skips the optional client-side preflight data checks and
            # immediately starts the stock authenticated join request. The
            # server result is still processed by PokeRaid's normal callbacks.
            const/4 v0, 0x0
            invoke-virtual { p0, v0 }, Lme/pokelounge/raid/member/c;->t(Lme/pokelounge/network/model/RaidRoomInfoResponse;)V

            :quick_join_refresh_continue
            nop
            """.trimIndent()
        )
    }
}
