package app.morphe.patches.tildes.boostforlemmy

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.getReference
import app.morphe.util.indexOfFirstInstructionOrThrow
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction22c
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

/**
 * Points Boost for Lemmy at tildes.net.
 *
 * Tildes is not Lemmy and has no public API, so there is nothing to redirect
 * Boost *to*. Instead an OkHttp interceptor is added to the client Boost
 * already builds, and answers the `/api/v3/` calls itself by scraping
 * tildes.net. Retrofit and Gson never learn the difference, and no request
 * leaves the device for an instance that does not exist.
 *
 * The alternative -- a bridge server on loopback -- works and lives in this
 * repo, but needs a second app running, and TLS with a certificate Android
 * trusts, because Boost builds its base URL as a literal `"https://" + host`.
 * Answering inside the app removes all of that.
 */
val tildesPatch = bytecodePatch(
    name = "Boost for Tildes",
    description = "Adds tildes.net to Boost for Lemmy, as an account beside the Lemmy ones.",
) {
    compatibleWith(*BoostForLemmyCompatible)

    // Everything follows the account now, wording included, so this is one
    // patch again rather than a translation you tick and a wording you leave
    // off. The two resource halves are dependencies: one writes Tildes' words
    // into a table of their own, the other only checks that the sort strings
    // the extension resolves at runtime are still called what it expects.
    dependsOn(tildesWordsPatch, tildesMenuNamesPatch, tildesAddressesPatch)

    // Merges extensions/boostforlemmy.mpe into the APK. The Gradle plugin puts
    // the compiled extension in the bundle either way, but nothing loads it
    // into the app without this, and the injected call then resolves to a class
    // that is not there: the app dies on launch with a NoClassDefFoundError
    // naming the interceptor, which reads like a patch that never applied.
    extendWith("extensions/boostforlemmy.mpe")

    execute {
        /*
         * `j.W1(ArrayList)`, the one method every screen's drawer takes its
         * subscriptions through.
         *
         * Found on the class the drawer's own rows are built on, it being the
         * only method there that takes a list, and edited twice: the list
         * arrives at the head, and each row is tested against the hidden flag
         * further down.
         */
        fun drawerListMethod() =
            drawerRowsFingerprint.classDef.methods.single { method ->
                method.returnType == "V" &&
                    method.parameterTypes.map(CharSequence::toString) ==
                    listOf("Ljava/util/ArrayList;")
            }

        apiClientBuilderFingerprint.method.apply {
            // The last call in the builder chain is OkHttpClient.Builder.build().
            // Inserting before it means the interceptor is attached to the very
            // client Retrofit is about to use.
            val buildIndex = indexOfFirstInstructionOrThrow {
                opcode == Opcode.INVOKE_VIRTUAL &&
                    getReference<MethodReference>()?.let {
                        it.definingClass == "Lokhttp3/OkHttpClient\$Builder;" && it.name == "build"
                    } == true
            }

            // Whichever register currently holds the Builder.
            val builderRegister = getInstruction<FiveRegisterInstruction>(buildIndex).registerC

            addInstructions(
                buildIndex,
                """
                    invoke-static { v$builderRegister }, $EXTENSION_CLASS_DESCRIPTOR->addTo(Lokhttp3/OkHttpClient${'$'}Builder;)Lokhttp3/OkHttpClient${'$'}Builder;
                    move-result-object v$builderRegister
                """,
            )
        }

        /*
         * Which site the app is pointed at when nobody is signed in.
         *
         * The host is one field on the client above, and Boost writes it from
         * an account and from nowhere else -- so with no account the write is
         * skipped and the field keeps the constant the constructor chose, which
         * is `lemmy.world`. That is the whole of why a freshly patched app, and
         * an app you have just signed out of, ask the wrong site for everything.
         *
         * Nothing else was in the way. Boost attaches its token only when it has
         * one and gates no read behind having one, so browsing signed out is a
         * thing it already does -- its own account switcher calls it Guest.
         *
         * Written over the argument at the point the constructor first reads it,
         * which is the `TextUtils.isEmpty` behind the fallback. The same register
         * carries the else branch, so one rewrite answers both the test and the
         * assignment, and a host that arrived non-empty comes back untouched --
         * which is what leaves the login screen's own client alone.
         */
        apiHostFingerprint.method.apply {
            val asks = indexOfFirstInstructionOrThrow { asksIfEmpty() }
            if (isJumpedTo(asks)) {
                throw PatchException("$name branches to the host check this injects before")
            }
            val host = getInstruction<FiveRegisterInstruction>(asks).registerC

            addInstructions(
                asks,
                """
                    invoke-static { v$host }, $EXTENSION_CLASS_DESCRIPTOR->guestHost(Ljava/lang/String;)Ljava/lang/String;
                    move-result-object v$host
                """,
            )
        }

        /*
         * Which comment a model is, which two of the hooks below have to ask
         * the extension about. Whichever field the copy off the Lemmy JSON
         * writes the stringified id into, read off the app rather than named
         * here, since it is a single letter.
         */
        val idField = commentFromLemmyFingerprint.method.let { mapping ->
            val valueOf = mapping.indexOfFirstInstructionOrThrow {
                opcode == Opcode.INVOKE_STATIC &&
                    getReference<MethodReference>()?.let {
                        it.definingClass == "Ljava/lang/String;" && it.name == "valueOf"
                    } == true
            }
            val put = mapping.indexOfFirstInstructionOrThrow(valueOf) {
                opcode == Opcode.IPUT_OBJECT
            }
            mapping.getInstruction(put).getReference<FieldReference>()!!
        }

        /*
         * Tildes folds every comment chain holding nothing posted since your
         * last visit, so the new replies are what you land on. Boost can do
         * that -- the fold is already written, and it already hides a folded
         * comment's whole subtree -- but it only ever runs it for a blocked
         * author, and there is no Lemmy field meaning "collapse this".
         *
         * So the read becomes a question. An earlier version pointed the fold
         * at `activity_alert` instead, which the interceptor filled in from
         * Tildes' own `is-comment-collapsed`: one instruction, and no way back
         * for anyone else, since a blocked author's comments then stopped
         * folding on every instance the app was pointed at. Asking costs three
         * instructions more and hands the question back whenever the answer did
         * not come from Tildes.
         *
         * Blocking would have been the wrong field to borrow even unscoped.
         * Boost draws a folded blocked comment as "Blocked user" instead of the
         * author's name and offers "Unblock" in its menu, so every folded chain
         * would have lost its author.
         *
         * The id is read into the register the fold was about to fill, so this
         * needs no register the method did not already have. It is a `String`
         * there and an int after the call, which the verifier is happy with
         * because the two paths meet as one.
         */
        commentsLoadedFingerprint.method.apply {
            val index = indexOfFirstInstructionOrThrow {
                opcode == Opcode.IGET_BOOLEAN &&
                    getReference<FieldReference>()?.name == CREATOR_BLOCKED_FIELD
            }

            // Reading the owning class off the app rather than naming it keeps
            // the patch honest if R8 moves the field.
            val read = getInstruction<Instruction22c>(index)
            val owner = (read.reference as FieldReference).definingClass
            val answer = read.registerA
            val comment = read.registerB

            removeInstruction(index)
            addInstructionsWithLabels(
                index,
                """
                    iget-object v$answer, v$comment, ${idField.definingClass}->${idField.name}:${idField.type}
                    invoke-static { v$answer }, $EXTENSION_CLASS_DESCRIPTOR->commentFolded(Ljava/lang/String;)I
                    move-result v$answer
                    if-ltz v$answer, :boosts_own
                    goto :answered
                    :boosts_own
                    iget-boolean v$answer, v$comment, $owner->$CREATOR_BLOCKED_FIELD:Z
                    :answered
                    nop
                """,
            )
        }

        /*
         * Tildes prints no number under a comment nobody has voted on, while
         * Boost prints the 0 it was handed. The score is turned into text in
         * one place, so the extension gets to see it on the way past and blank
         * it, which it only does for comments that came from Tildes.
         *
         * Hooked right after `String.valueOf`, where the text is the number
         * and nothing else, so a score of zero reads as "0" exactly. The two
         * branches below it only fire on fields Boost never fills from Lemmy
         * JSON.
         */
        commentScoreFingerprint.method.apply {
            val valueOfIndex = indexOfFirstInstructionOrThrow {
                opcode == Opcode.INVOKE_STATIC &&
                    getReference<MethodReference>()?.let {
                        it.definingClass == "Ljava/lang/String;" &&
                            it.name == "valueOf" &&
                            it.parameterTypes.singleOrNull() == "J"
                    } == true
            }

            // Only the string is handed over. The score is a long, and the
            // `move-result-object` below reuses its low half for the result,
            // so naming the number here is a verifier error rather than a
            // wrong answer: it rejects the whole class, and the crash blames
            // a subclass of the one that was patched.
            val textRegister =
                getInstruction<OneRegisterInstruction>(valueOfIndex + 1).registerA

            addInstructions(
                valueOfIndex + 2,
                """
                    invoke-static { v$textRegister }, $EXTENSION_CLASS_DESCRIPTOR->scoreText(Ljava/lang/String;)Ljava/lang/String;
                    move-result-object v$textRegister
                """,
            )

            /*
             * And the middle dot beside it, which is a view rather than a
             * string: the byline is a score, a `TextView` reading `·` and a
             * time, laid out side by side, and nothing in the app ever sets
             * that one's visibility. So blanking the number left the dot
             * separating the time from nothing.
             *
             * Hooked after the `setText` this method ends its text on, where
             * the two registers the call used are the score view and the text
             * that went into it, and both are dead by the next instruction --
             * the score view is fetched again and the vote is read over them.
             * That is the whole reason for going after the call rather than
             * before it: the view is not in a register anywhere else.
             */
            val setTextIndex = indexOfFirstInstructionOrThrow {
                opcode == Opcode.INVOKE_VIRTUAL &&
                    getReference<MethodReference>()?.name == "setText"
            }
            val setText = getInstruction<FiveRegisterInstruction>(setTextIndex)

            addInstructions(
                setTextIndex + 1,
                "invoke-static { v${setText.registerC}, v${setText.registerD} }, " +
                    "$EXTENSION_CLASS_DESCRIPTOR->commentDot(Landroid/widget/TextView;Ljava/lang/CharSequence;)V",
            )
        }

        /*
         * A comment's labels, drawn in the byline rather than left in the body.
         *
         * They ride in the body as code spans, for want of a Lemmy field to put
         * them in, and a code span cannot be given a colour: the comment
         * renderer has no `ForegroundColorSpan` anywhere in it and no handler
         * for `<span>` or `<font>`. So a word the site draws as a coloured pill
         * read as something the author had typed.
         *
         * Hooked on the body's way into the renderer, which is the one place in
         * the bind where the text and the view drawing it are both in a
         * register. The extension draws the word into the byline slot Boost
         * paints its own `OP` and `M` marks in, and hands back the body with
         * the line taken off -- and hands it back whole where there is no such
         * slot to draw in, which leaves a word that reads rather than nothing
         * at all.
         *
         * **After Boost has finished with that slot, and that is why it is
         * here.** The byline is built and made visible two hundred instructions
         * earlier in the same method, and it is reset on every bind, so
         * anything written before that point is wiped and anything written
         * after it stands. Nothing in the app touches the view again.
         *
         * The call is found by what it takes -- a `TextView` and a `String` --
         * since both its class and its method are one letter after R8. It is
         * the only call in the bind with that pair, and the field it is handed
         * is read exactly once, so the two anchors confirm each other.
         */
        commentBindFingerprint.method.apply {
            val renderIndex = indexOfFirstInstructionOrThrow {
                opcode == Opcode.INVOKE_VIRTUAL &&
                    getReference<MethodReference>()?.let {
                        it.returnType == "V" &&
                            it.parameterTypes.map(CharSequence::toString) ==
                            RENDER_MARKDOWN_PARAMETERS
                    } == true
            }

            // The receiver, the view and the text, in that order. The last two
            // are what the extension needs, and both are dead or written again
            // on every path out of the call.
            val call = getInstruction<FiveRegisterInstruction>(renderIndex)

            addInstructions(
                renderIndex,
                """
                    invoke-static { v${call.registerD}, v${call.registerE} }, $EXTENSION_CLASS_DESCRIPTOR->commentLabel(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
                    move-result-object v${call.registerE}
                """,
            )
        }

        /*
         * And off the body the quote dialog offers, which is the same line
         * arriving somewhere the bind above never reaches.
         *
         * Tapping the comment at the head of a reply opens a dialog holding the
         * parent's body in a selectable box, and Quote puts `>` in front of
         * whatever is selected. It is filled from the model rather than from
         * what the renderer drew, so the label was still in it and a reply to an
         * exemplary comment opened with `` > `Exemplary` ``.
         *
         * Hooked on the `setText` that fills the box. The body reaches it in one
         * register on every path -- a comment's, a topic's, a message's and the
         * empty string all converge two instructions earlier -- and nothing
         * reads that register again, so the line comes off before the box is
         * drawn rather than after something has been selected out of it.
         */
        replyQuoteFingerprint.method.apply {
            val setTextIndex = indexOfFirstInstructionOrThrow {
                opcode == Opcode.INVOKE_VIRTUAL &&
                    getReference<MethodReference>()?.name == SET_TEXT
            }
            val setText = getInstruction<FiveRegisterInstruction>(setTextIndex)

            // The screen as well as the box, since the extension asks the site
            // for the source of the post the screen was opened over, and swaps
            // it in where the answer is not held already. The method's own
            // widest call is three registers, so this one fits the outgoing
            // window it was compiled with.
            addInstructions(
                setTextIndex,
                """
                    invoke-static { ${thisRegister()}, v${setText.registerC}, v${setText.registerD} }, $EXTENSION_CLASS_DESCRIPTOR->quotedBody(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
                    move-result-object v${setText.registerD}
                """,
            )
        }

        /*
         * And the Quote button on that dialog, which marked the first line of a
         * selection and left the rest of it looking like the replier's own
         * words.
         *
         * Boost builds the quote as one concatenation -- `"\n>"`, the
         * selection, `"\n\n"` -- so there is one marker however many lines were
         * selected. Markdown carries a blockquote over the lines directly under
         * it, which is why a one-paragraph parent came out right, and stops at
         * the first blank line, which is why a two-paragraph one did not.
         *
         * The concatenation is the seam: the extension is handed the same three
         * pieces and answers what should be inserted instead. That keeps
         * Boost's own marker and its own spacing, and changes only how many
         * lines the marker goes on. `Lemmy.quoted` has the rest.
         *
         * The helper being replaced joins three strings and is used all over
         * the app, so it is found by that shape inside this one method rather
         * than by name, and the call is replaced where it stands: the registers
         * it was compiled with are the three pieces, the `move-result-object`
         * under it is untouched, and the outgoing window is already three wide.
         */
        quoteBlockFingerprint.method.apply {
            val joined = indexOfFirstInstructionOrThrow {
                opcode == Opcode.INVOKE_STATIC &&
                    getReference<MethodReference>()?.let {
                        it.returnType == "Ljava/lang/String;" &&
                            it.parameterTypes.map(CharSequence::toString) == CONCAT_PARAMETERS
                    } == true
            }
            val call = getInstruction<FiveRegisterInstruction>(joined)

            replaceInstruction(
                joined,
                "invoke-static { v${call.registerC}, v${call.registerD}, v${call.registerE} }, " +
                    "$EXTENSION_CLASS_DESCRIPTOR->quoteBlock(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;",
            )
        }

        /*
         * **Select text**, which opens that same box off a row's menu rather
         * than off a composer, on a comment and on a topic alike.
         *
         * Nothing is written back from either, so this is the tidy end of the
         * three rather than the urgent one: what it saved is copying a fence
         * that had lost its language, and a comment's label line out of a
         * selection. Both are hooked on the `setText` filling the box, which is
         * the only one in each method, and both hand over the holder rather than
         * the post -- the extension finds the post on it by type, so neither
         * letter naming it has to be written down here.
         */
        listOf(commentSelectionFingerprint, topicSelectionFingerprint).forEach { selection ->
            selection.method.apply {
                val setTextIndex = indexOfFirstInstructionOrThrow {
                    opcode == Opcode.INVOKE_VIRTUAL &&
                        getReference<MethodReference>()?.name == SET_TEXT
                }
                val setText = getInstruction<FiveRegisterInstruction>(setTextIndex)

                addInstructions(
                    setTextIndex,
                    """
                        invoke-static { ${thisRegister()}, v${setText.registerC}, v${setText.registerD} }, $EXTENSION_CLASS_DESCRIPTOR->selectedBody(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
                        move-result-object v${setText.registerD}
                    """,
                )
            }
        }

        /*
         * And the source of the post itself, asked for as the composer opens.
         *
         * The edit box is filled from it, and the quote dialog above takes the
         * same answer without asking twice.
         *
         * Tildes keeps the source beside the HTML it renders and fills its own
         * edit box from the source. This end only ever had the HTML, and two
         * things have no mark left in it: a fence's language, spent by Pygments
         * before the page is written, and an author's backslash escapes. Both
         * were being written out of somebody's own words the first time they
         * fixed a typo, since a save writes the box back over the post.
         *
         * Hooked on the store of the flag saying this is an edit, which is the
         * last thing that block writes: the post and the box are both set above
         * it. Found by the extra's own name, which is Boost's own string and is
         * what every screen opening this one passes.
         *
         * **In front of the store rather than behind it**, and the flag is
         * handed over rather than read back off the screen. The instruction
         * after the store is where `if (getIntent() != null)` lands when there
         * is no intent, so an injection there is stepped over on that path,
         * while nothing can jump between an invoke and its `move-result`. It
         * also means one less single letter written down.
         *
         * The fetch is the extension's problem and it does it on a thread: the
         * box opens holding what it always held and takes the source when it
         * lands, or keeps what somebody typed in the meantime.
         */
        replyScreenFingerprint.method.apply {
            val extra = indexOfFirstInstructionOrThrow {
                opcode == Opcode.CONST_STRING &&
                    getReference<StringReference>()?.string == EDIT_INTENT_EXTRA
            }
            val stored = indexOfFirstInstructionOrThrow(extra) {
                opcode == Opcode.IPUT_BOOLEAN
            }
            if (isJumpedTo(stored)) {
                throw PatchException("$name jumps to where the edit flag is stored")
            }

            val store = getInstruction<TwoRegisterInstruction>(stored)

            addInstructions(
                stored,
                "invoke-static { v${store.registerB}, v${store.registerA} }, " +
                    "$EXTENSION_CLASS_DESCRIPTOR->composerSource(Ljava/lang/Object;Z)V",
            )
        }

        /*
         * Boost keeps a list of the listings that are its own rather than a
         * community, and left History out of it. That one omission is why the
         * marker sits over the tab, why the screen retitles itself after the
         * first row's community once the list loads, and why the tab offers to
         * be subscribed to. Adding History to the list is Boost's own answer to
         * all three, including the word: it already maps that marker to
         * `R.string.history` one branch further in.
         *
         * The list is a chain of string comparisons, so the extension is asked
         * first and Boost's own chain runs when it says no.
         */
        specialListingFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static { p0 }, $EXTENSION_CLASS_DESCRIPTOR->isSpecialListing(Ljava/lang/String;)Z
                    move-result v0
                    if-eqz v0, :boosts_own
                    return v0
                    :boosts_own
                    nop
                """,
            )
        }

        /*
         * Boost offers sixteen post sorts against Tildes' five orders. Hot,
         * Scaled and Controversial are a second, third and fourth `activity`,
         * and `Old` is worse than redundant: nothing on Tildes sorts
         * ascending, so it answers newest first.
         *
         * Hooked where the rows are handed to the view that draws them, rather
         * than where they are built. Four methods build sort rows, one per
         * model class the menu can be opened for, and hooking the two that
         * were easy to find left the feed's own menu whole. Every menu goes
         * through here, so the extension decides by the string a row is
         * labelled with rather than by the id it carries.
         *
         * The rows that stay are relabelled here too, in `MenuOption.e`, which
         * the view draws in front of the title resource beside it. That is the
         * only per-account answer available: resources are chosen when the
         * patch is applied, so a Lemmy account in the same app would otherwise
         * read `Scaled` as `Votes` and `Top` as `From…`.
         *
         * The same pass takes Downvote, Report and Cross-posts off the menus a
         * topic, a comment and a message carry, which are the rows Tildes has
         * nothing behind. They cost nothing extra: every menu already comes
         * through here, and a row is already matched by the string it carries.
         *
         * The list is filtered in place, which needs no register beyond the
         * one already holding it.
         */
        menuOptionsFingerprint.method.addInstructions(
            0,
            "invoke-static { p0, p1 }, " +
                "$EXTENSION_CLASS_DESCRIPTOR->trimMenu(Ljava/lang/Object;Ljava/util/List;)V",
        )

        /*
         * And the other end of the same class: a tap on a row.
         *
         * `trimMenu` puts one row into the app that Boost never built -- the
         * topic beside the link on a **Share title + link** -- and a row Boost
         * never built is one no switch in it has a case for. This is where that
         * row is acted on, one method before the screen that opened the menu
         * sees it.
         *
         * Nothing is taken away here. The call is added and the method carries
         * on, so Boost's own dispatch still runs, finds nothing to do with a
         * marker it does not know, and the dialog is dismissed after it exactly
         * as it always was. Every other row in the app is untouched by this.
         */
        menuTapFingerprint.method.addInstructions(
            0,
            "invoke-static { p0, p1 }, $EXTENSION_CLASS_DESCRIPTOR->menuRowTapped(Ljava/lang/Object;I)V",
        )

        /*
         * Which of those menus is the Groups page's own.
         *
         * Tildes has no group sort at all: `/groups` is one alphabetical page,
         * and the one number it publishes per group is an activity rate. Two
         * orders, and Boost offers eleven rows -- New, Old, and a Top submenu
         * of eight windows, every one of which means the same thing here.
         *
         * The rows cannot answer which screen asked for them. One builder makes
         * every sort menu in the app, eight screens call it, and the Groups
         * page and the site browser call it with the same arguments. So the
         * screen answers: the fragment behind all three of its tabs hands the
         * list to the extension on its way past, and `trimMenu` matches on that
         * object four instructions later.
         */
        communitiesMenuFingerprint.method.addInstructions(
            0,
            "invoke-static { p1 }, $EXTENSION_CLASS_DESCRIPTOR->groupSortMenu(Ljava/util/List;)V",
        )

        /*
         * The other half of the same thing: the word drawn over a sort where
         * there is no menu row to carry it. One method answers that for the
         * whole app -- the toolbar under a feed's name, the preference
         * summaries, the saved sorts screen and the widget -- with a string
         * resource per Lemmy sort.
         *
         * It matters most for the five rows the menu no longer offers, since
         * Boost keeps a sort per subscription and opens the front page on
         * whatever "Sort Home topics by" says, which is `Hot` out of the box.
         * The feed under it was always right, because the interceptor reads Hot
         * as `order=activity`, and now the label agrees.
         *
         * The extension is asked first and Boost's own chain runs when it has
         * nothing, which is every sort on every other instance. Two parameters
         * and four registers, so `v0` is a local rather than one of them.
         *
         * **The screen this is drawing on rides in on the same call**, which is
         * why the line under a feed's name is widened from here rather than
         * from a hook of its own. `p0` is the `Context`, and on a feed it is the
         * activity holding the toolbar -- everywhere else it is a preference
         * screen or a widget, where the view is not found and nothing happens.
         * It runs whenever that line is about to change, which is the only time
         * it could need the room.
         */
        sortNameFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static { p0 }, $EXTENSION_CLASS_DESCRIPTOR->widenToolbarSubtitle(Landroid/content/Context;)V
                    invoke-static { p1 }, $EXTENSION_CLASS_DESCRIPTOR->sortName(Ljava/lang/Object;)Ljava/lang/String;
                    move-result-object v0
                    if-eqz v0, :boosts_own
                    return-object v0
                    :boosts_own
                    nop
                """,
            )
        }

        /*
         * And the same again for a comment tree, which does not come through
         * that method at all. The line under **Comments** in a topic's toolbar
         * is written straight out of the fragment, from a string resource per
         * Lemmy comment sort, so the menu row could read "most votes" over a
         * toolbar still reading Top.
         *
         * The word is filtered where it is produced rather than answered ahead
         * of the method, because the method returns nothing: it hands what it
         * built to the activity above it.
         *
         * Which takes two calls rather than one, and the reason is register
         * allocation. Boost compiles the resource id into the same register the
         * sort arrived in and then the string over that, so by the time there
         * is a word to filter there is nothing left saying which sort it is
         * for. The only place the sort is still readable is the first
         * instruction, and the only place the word is is the last, so the
         * extension is told at one end and asked at the other. Neither point is
         * the target of a branch, where every place the id is loaded is.
         */
        commentSortNameFingerprint.method.apply {
            val stringIndex = indexOfFirstInstructionOrThrow {
                opcode == Opcode.INVOKE_VIRTUAL &&
                    getReference<MethodReference>()?.let {
                        it.name == "getString" &&
                            it.parameterTypes.toList() == listOf("I") &&
                            it.returnType == "Ljava/lang/String;"
                    } == true
            }

            // The register the word lands in, which is the one it is drawn from.
            val word = getInstruction<OneRegisterInstruction>(stringIndex + 1).registerA

            addInstructions(
                stringIndex + 2,
                """
                    invoke-static { v$word }, $EXTENSION_CLASS_DESCRIPTOR->commentSortName(Ljava/lang/String;)Ljava/lang/String;
                    move-result-object v$word
                """,
            )

            addInstructions(
                0,
                "invoke-static { p1 }, $EXTENSION_CLASS_DESCRIPTOR->namingCommentSort(Ljava/lang/Object;)V",
            )
        }

        /*
         * Boost offers a list of sites to sign in to and Tildes is not on it,
         * so adding the account means the custom-site step every time.
         *
         * The list looks like a resource. `R.array.default_instances` is what
         * the account screen's layout points its dropdown at, and nothing ever
         * draws it: no code in the app references that id, and `onCreate` calls
         * `setSimpleItems` with the hosts of a `Server[]` built in code, which
         * replaces the adapter the layout set up. Editing the array is a patch
         * that applies cleanly and changes nothing on screen.
         *
         * So the row goes into the `Server[]` instead, and this is where that
         * is assembled: the sites Boost has already been pointed at, then a
         * list it keeps in preferences merged in behind them. Hooked on the first of those,
         * before either of the others has been read, so the extension gets a
         * list nothing has been added to yet and the row lands at the top.
         */
        knownServersFingerprint.method.apply {
            val getAllIndex = indexOfFirstInstructionOrThrow {
                opcode == Opcode.INVOKE_VIRTUAL &&
                    getReference<MethodReference>()?.let {
                        it.definingClass == UNKNOWN_INSTANCES_CLASS && it.name == "getAll"
                    } == true
            }

            // Whichever register the list lands in.
            val listRegister = getInstruction<OneRegisterInstruction>(getAllIndex + 1).registerA

            addInstructions(
                getAllIndex + 2,
                "invoke-static { v$listRegister }, $EXTENSION_CLASS_DESCRIPTOR->offerTildes(Ljava/util/List;)V",
            )
        }

        /*
         * Two of a profile's tabs come off. **Uploads** lists what an account
         * has put on the instance's image host, which Tildes has not got, and
         * **About** is a karma panel over the groups an account moderates,
         * which Tildes has neither of. What a profile does say is already drawn
         * above the tabs.
         *
         * Boost keeps a key per tab beside the titles and dispatches on it, so
         * the extension drops a tab by name and the order carries no weight.
         * That is the only thing checked here: both keys are still in the
         * screen that builds them.
         */
        profileTabsFingerprint.method.let { screen ->
            val keys = screen.implementation!!.instructions
                .mapNotNull { it.getReference<StringReference>()?.string }
                .toSet()

            val missing = DROPPED_TAB_KEYS - keys
            if (missing.isNotEmpty()) {
                throw PatchException("No such profile tab: ${missing.sorted().joinToString()}")
            }
            if (SUBMITTED_TAB_KEY !in keys) {
                throw PatchException("A profile no longer opens on $SUBMITTED_TAB_KEY")
            }
        }

        /*
         * And here is where they come off, in the three methods the pager
         * answers with: how many tabs there are, what each is called, and what
         * goes in it. The extension is handed the pager itself along with the
         * number, since the keys are on the screen behind it and nothing else
         * in reach says which tab is which.
         */
        profileTabCountFingerprint.method.apply {
            val returnIndex = indexOfFirstInstructionOrThrow { opcode == Opcode.RETURN }
            val count = getInstruction<OneRegisterInstruction>(returnIndex).registerA

            addInstructions(
                returnIndex,
                """
                    invoke-static { p0, v$count }, $EXTENSION_CLASS_DESCRIPTOR->profileTabs(Ljava/lang/Object;I)I
                    move-result v$count
                """,
            )
        }

        /*
         * The other two are on the same class, told apart by what they answer:
         * a `CharSequence` is the tab's name and a `Fragment` is what is under
         * it. Both take the position and index an array of the screen's with
         * it, so both take the same step.
         *
         * **And the fragment one is asked twice.** The extension puts a tab in
         * front of Boost's own -- All posts, which Tildes opens a profile on --
         * by growing those two arrays rather than by stepping over them, so the
         * step above already lands on it and the key it is built with is
         * already `overview`. What the second hook does is mark the request that
         * tab is about to make, which is the one thing the key cannot carry: it
         * asks the site exactly what the Topics tab asks. See `profileTabBuilt`.
         *
         * At every return rather than at the head, because the mark goes on the
         * fragment and there is no fragment until there is one. Four of that
         * method's branches build something else entirely -- the media list, the
         * about panel, the two people lists -- and every one of them comes back
         * through here and is left alone for want of the key.
         */
        profileTabCountFingerprint.classDef.apply {
            val step = """
                invoke-static { p0, p1 }, $EXTENSION_CLASS_DESCRIPTOR->profileTab(Ljava/lang/Object;I)I
                move-result p1
            """

            fun tabMethod(answer: String) = methods.single {
                it.parameterTypes.map(CharSequence::toString) == listOf("I") &&
                    it.returnType == answer
            }

            tabMethod("Ljava/lang/CharSequence;").addInstructions(0, step)

            // The head insert goes last, so the returns are found at the
            // offsets they are actually at.
            tabMethod(FRAGMENT_CLASS).apply {
                beforeEveryObjectReturn(
                    "$EXTENSION_CLASS_DESCRIPTOR->profileTabBuilt(Ljava/lang/Object;)V",
                )
                addInstructions(0, step)
            }
        }

        /*
         * The three rows the toolbar dropdown over a feed still offered, and
         * the whole of what a guest's list holds.
         *
         * Boost's own hidden flag never reached that spinner. Its adapter reads
         * the screen's list of subscriptions on every bind and asks nothing
         * about the rows, so Local, All and Bookmarks were still in it after they
         * came off the drawer and the **Go to...** screen -- and Bookmarks there
         * opened the topics-only feed the drawer's row stopped opening.
         *
         * Cut from the list rather than from the rows, which is what keeps the
         * four things reading it in step: the spinner, the drawer's own
         * subscription rows, the two lookups that turn a feed into a position,
         * and the launcher shortcuts. The list is built fresh per rebuild and
         * handed on as the same object, so there is one owner and nothing else
         * holds an index into it.
         *
         * **On the base method rather than the home screen's override**, which
         * is the difference between one screen's list and every screen's. The
         * loader assigns the field and then calls this virtually, so the home
         * screen's override reaches the same method one call down and reads the
         * same object afterwards for its spinner and its shortcuts. Hooking the
         * override left every other screen -- a community, a profile, the inbox
         * -- with a raw list: their drawers still read right, since the rows are
         * skipped one at a time as well, but the list behind them was another
         * server's and the bottom bar's Home item indexes it.
         *
         * At the head, before the method hands it to the half that draws the
         * drawer. `p1` is `v10` of eleven registers, so a plain invoke reaches
         * it.
         */
        drawerListMethod().addInstructions(
            0,
            "invoke-static { p1 }, " +
                "$EXTENSION_CLASS_DESCRIPTOR->homeSubscriptions(Ljava/util/List;)V",
        )

        /*
         * The site's own pages, opened as the app's rather than in a browser.
         *
         * Every tildes.net address with a shape is answered a request later, by
         * `/resolve_object` reading a topic, a comment, a group or a person off
         * the path. The pages that are none of those have nothing to resolve into
         * -- Lemmy's answer there has four things in it and none of them is a
         * front page or a list of communities -- so they came back
         * `couldnt_find_object`, and Boost's fallback for that is the built-in
         * browser. The front page and `/groups` go through here instead, and the
         * extension holds the table.
         *
         * So it is answered a step earlier, in the router Boost runs before it
         * asks anything. That method already answers "did I handle this", which
         * is the whole of what the extension has to say, and the extension is
         * asked first: a false hands the address straight back, which is every
         * other address on every other site.
         *
         * **One hook covers both ways in.** The deep-link activity calls that
         * router itself, and a link tapped inside the app reaches the same method
         * one call further down, through the pair of "route it or browse it".
         *
         * `v0` is clobbered and the method's own first instruction sets it again,
         * so nothing downstream reads what this leaves there.
         */
        addressShapeFingerprint.method.addInstructionsWithLabels(
            0,
            """
                invoke-static/range { p0 .. p1 }, $EXTENSION_CLASS_DESCRIPTOR->openedSitePage(Landroid/content/Context;Ljava/lang/String;)Z
                move-result v0
                if-eqz v0, :boosts_own
                return v0
                :boosts_own
                nop
            """,
        )

        /*
         * And the sort button on the three tabs the trim leaves nothing in.
         *
         * A profile draws one menu on every tab -- a group filter, New, Old and
         * a submenu of six windows -- and Tildes has none of that on any tab.
         * `order` is the whole of what its own pages take, two of the six tabs
         * take one, and the other four take nothing beside a cursor. So the
         * menu comes down to five rows on Topics, two on Comments, the three
         * kind rows on Bookmarks, and **nothing at all** on All posts, Votes and
         * Ignored.
         *
         * An empty menu is not an absent one. `MenuView` draws whatever the list
         * holds and the dialog around it is shown either way, so the button
         * would open a sheet of padding -- a case Boost never has, since its own
         * builder always ends by adding the sorts.
         *
         * Hooked where the fragment inflates its one item rather than where the
         * activity inflates its nine, and injected in front of the single
         * `return-void` so the item exists to be taken off. `beforeTheOnlyReturn`
         * refuses a method that could branch there.
         */
        profileSortButtonFingerprint.method.beforeTheOnlyReturn(
            "invoke-static { p0, p1 }, " +
                "$EXTENSION_CLASS_DESCRIPTOR->profileSortButton(" +
                "Ljava/lang/Object;Landroid/view/Menu;)V",
        )

        /*
         * **View cross-posts**, off the toolbar menu inside a topic. Tildes has
         * no cross-posting: a topic lives in one group and moves between them
         * rather than being copied, so the row opens a list that is empty by
         * construction.
         *
         * The two rows in a topic's own menu, Cross-posts and Cross-post, come
         * off through `trimMenu` with the sorts. This one is an ordinary
         * Android menu item inflated from a resource, so that pass never sees
         * it.
         *
         * At the top of the method, where the menu is still in the last
         * parameter register: the `findItem` two instructions later reuses that
         * register for the item it found.
         */
        topicMenuFingerprint.method.addInstructions(
            0,
            "invoke-static { p1 }, $EXTENSION_CLASS_DESCRIPTOR->topicMenu(Landroid/view/Menu;)V",
        )

        /*
         * And the control that screen has no reason to hide on Tildes.
         *
         * Tagging is a permission a group hands out rather than something only
         * an author holds, and it is most of what the site's regulars do to a
         * topic. Boost has no idea any of that exists: everything that opens
         * the composer is gated on "the signed-in id equals the author's id",
         * because on Lemmy nobody but the author may touch a post at all.
         *
         * Two of those gates, and the same edit either side of them. The
         * toolbar's Edit item inside a topic is this one, and the Edit submenu on
         * a row's overflow is the next. The question underneath is left alone:
         * three other call sites read it as **not** mine, to decide what to
         * draw on somebody else's topic, and answering the method itself would
         * put a moderator's rows on every topic in the app.
         *
         * The extension is asked only where Boost already said no, and it
         * answers off the buttons Tildes drew on the page -- so a topic whose
         * page has never been read, and every account on every other instance,
         * keeps the control exactly where Boost put it.
         */
        val ownedByMe = classDefBy { it.type == SUBMISSION_MODEL_CLASS }
            .methods.single { it.isOwnershipPredicate() }
            .name
        topicMenuFingerprint.method.offerTagging(ownedByMe, "mayTag")
        submissionMenuFingerprint.method.offerTagging(ownedByMe, "mayTagRow")

        /*
         * The line under a profile's name reads "12 posts · 34 comments", off
         * the two counts a Lemmy person carries. Tildes publishes neither, so
         * the interceptor sends zero for both and every account on the site
         * reads "0 posts · 0 comments".
         *
         * The view is laid out gone and this write is the only thing that ever
         * reveals it, so returning early leaves the panel closed up rather than
         * holding a blank line. `v0` is the method's one local and is written
         * before it is read, so borrowing it costs no register.
         */
        profileStatsFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static {}, $EXTENSION_CLASS_DESCRIPTOR->hideProfileStats()Z
                    move-result v0
                    if-eqz v0, :boosts_own
                    return-void
                    :boosts_own
                    nop
                """,
            )
        }

        /*
         * And the wording, which is the last thing here that used to land on
         * every account in the app.
         *
         * Tildes' words ship as a second string table under a qualifier nothing
         * else uses, and this is where a screen is told to ask for it: the
         * context an activity attaches to carries the configuration, and the
         * configuration is what picks a resource. So the extension hands back
         * the same context with `mcc` set while the account is Tildes, and
         * hands back the one it was given otherwise.
         *
         * After AppCompat's delegate rather than before it. The delegate builds
         * its own configuration for night mode and locale, and a field set on
         * the way in can be lost in that rebuild, while one set on the way out
         * is what the activity keeps. So the hook goes on the result of the one
         * call in here that answers a `Context`.
         */
        attachBaseContextFingerprint.method.apply {
            val delegateIndex = indexOfFirstInstructionOrThrow {
                getReference<MethodReference>()?.returnType == "Landroid/content/Context;"
            }

            // Whichever register the delegate's answer lands in, which is the
            // one `invoke-super` is about to read.
            val context = getInstruction<OneRegisterInstruction>(delegateIndex + 1).registerA

            addInstructions(
                delegateIndex + 2,
                """
                    invoke-static { v$context }, $EXTENSION_CLASS_DESCRIPTOR->scopeWording(Landroid/content/Context;)Landroid/content/Context;
                    move-result-object v$context
                """,
            )
        }

        /*
         * Which comments count as new comes from Tildes now, rather than from
         * Boost's own watermark.
         *
         * Boost keeps the newest comment it saw last time you opened a topic,
         * in a preferences file, and calls anything published after that new.
         * That answers the same as Tildes until the two disagree about when
         * you last read the thread: reading it on the website moves Tildes'
         * visit and not Boost's watermark, and the app then highlights
         * comments the site no longer calls new while leaving the chains
         * around them folded. Tildes also never counts your own comments,
         * which a published-time comparison cannot express.
         *
         * The watermark cannot be corrected from here, because Boost reads it
         * before it stores the new one, so the value handed over is only used
         * on the visit after next. The predicate is the thing to replace.
         *
         * Boost's answer still stands for any comment this did not see, which
         * is everything on another instance.
         */
        commentIsNewFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    iget-object v0, p0, ${idField.definingClass}->${idField.name}:${idField.type}
                    invoke-static { v0 }, $EXTENSION_CLASS_DESCRIPTOR->commentNewState(Ljava/lang/String;)I
                    move-result v0
                    if-ltz v0, :boosts_own
                    if-eqz v0, :not_new
                    const/4 v0, 0x1
                    return v0
                    :not_new
                    const/4 v0, 0x0
                    return v0
                    :boosts_own
                    nop
                """,
            )
        }

        /*
         * Tildes votes one way and has no opposite, so the downvote button on a
         * topic and on a comment has never done anything: the interceptor
         * answers `downvotes: 0` and a tap on it reaches nothing.
         *
         * Hidden as it is built rather than as it is bound, because that is one
         * place instead of three -- a feed row, a comment row and the topic
         * screen each read it into a field of their own -- and because nothing
         * in the app ever sets its visibility, so once is enough.
         *
         * At the end of the constructor rather than the start: `this` is not a
         * verified reference until the super call has run, and there is nothing
         * else in here.
         */
        downvoteButtonFingerprint.method.atEveryReturn(
            "invoke-static { p0 }, $EXTENSION_CLASS_DESCRIPTOR->voteButton(Landroid/view/View;)V",
        )

        /*
         * Which field on Boost's post model holds the topic's id, checked here
         * rather than trusted. The composer reads it off the model Boost hands
         * it, to know whose tags to fill in, and it is a single letter, so the
         * check is that `SubmissionModel` still writes the id where the
         * extension looks.
         */
        postFromLemmyFingerprint.method.let { mapping ->
            val valueOf = mapping.indexOfFirstInstructionOrThrow {
                opcode == Opcode.INVOKE_STATIC &&
                    getReference<MethodReference>()?.let {
                        it.definingClass == "Ljava/lang/String;" && it.name == "valueOf"
                    } == true
            }
            val put = mapping.indexOfFirstInstructionOrThrow(valueOf) {
                opcode == Opcode.IPUT_OBJECT
            }
            val field = mapping.getInstruction(put).getReference<FieldReference>()!!

            if (field.name != TOPIC_ID_FIELD) {
                throw PatchException("A topic's id is no longer in ${field.name}")
            }
        }

        /*
         * The attach-image button on the markdown toolbar, hidden as the bar is
         * built. Boost draws one under the composer, under a comment reply and
         * under the message editor, and the button uploads to the instance's
         * own image host, which Tildes has not got.
         *
         * Straight after the bind rather than at the end of the constructor.
         * The buttons are inflated two instructions above it, so that is the
         * first point where there is anything to find, and the end of that
         * method is unreachable: it walks its own buttons in a loop that exits
         * by jumping to the `return-void`, so an injection before the return
         * sits after an unconditional `goto` and never runs. That is what this
         * hook did until 2026-08-15, silently.
         */
        formattingBarFingerprint.method.apply {
            val bindIndex = indexOfFirstInstructionOrThrow {
                opcode == Opcode.INVOKE_STATIC &&
                    getReference<MethodReference>()?.let {
                        it.definingClass == BUTTERKNIFE_CLASS && it.name == "bind"
                    } == true
            }

            addInstructions(
                afterTheResultOf(bindIndex),
                "invoke-static { p0 }, $EXTENSION_CLASS_DESCRIPTOR->formattingBar(Landroid/view/View;)V",
            )
        }

        /*
         * The bottom of a list, which Boost leaves under the system navigation
         * bar.
         *
         * Every screen here is edge to edge, and Boost applies the insets to
         * the sides of its content and to the top of its toolbar and nowhere
         * else. So a list is laid out to the bottom of the window with the
         * navigation bar over it, and the last row of a list that ends cannot
         * be scrolled clear.
         *
         * Hooked as the list is built rather than as each screen is, which is
         * one place against the eleven layouts that draw one, and nothing in the
         * app sets that padding afterwards.
         *
         * Straight after the super call rather than at the end. `this` is not a
         * verified reference until that has run, and the padding the layout
         * gave is set inside it, so it is the first instruction where both are
         * true. The end of this constructor would have been wrong: it ends on
         * one `return-void` that an `if-eqz` above it jumps to, so an injection
         * there runs on one path out of two.
         */
        feedListFingerprint.method.apply {
            val self = implementation!!.registerCount - parameters.size - 1
            val superCall = indexOfFirstInstructionOrThrow {
                opcode == Opcode.INVOKE_DIRECT &&
                    getReference<MethodReference>()?.name == "<init>" &&
                    (this as FiveRegisterInstruction).registerC == self
            }

            addInstructions(
                superCall + 1,
                "invoke-static { v$self }, $EXTENSION_CLASS_DESCRIPTOR->listInsets(Landroid/view/View;)V",
            )
        }

        /*
         * And the bottom of the drawer, which is under the same bar.
         *
         * The drawer ends on a Settings row with a light-mode button beside it,
         * and which view carries that row is a preference: pinned to a footer
         * along the bottom, or the last row of the drawer's own list, which is
         * the default. Padding the drawer's root covers both, and it is the view
         * Boost paints the drawer's background on, so the strip left behind the
         * bar is the drawer's own colour.
         *
         * Straight after the super call, for the reason the list above has:
         * `this` is not a verified reference until that has run. The rest of the
         * constructor only reads styled attributes and sets the scrim's own
         * inset listener, and neither is anything this touches.
         */
        drawerSliderFingerprint.method.apply {
            val self = implementation!!.registerCount - parameters.size - 1
            val superCall = indexOfFirstInstructionOrThrow {
                opcode == Opcode.INVOKE_DIRECT &&
                    getReference<MethodReference>()?.name == "<init>" &&
                    (this as FiveRegisterInstruction).registerC == self
            }

            addInstructions(
                superCall + 1,
                "invoke-static { v$self }, $EXTENSION_CLASS_DESCRIPTOR->drawerInsets(Landroid/view/View;)V",
            )
        }

        /*
         * The parent a single-comment screen was opened under, which Boost only
         * ever fills in from the inbox.
         *
         * It decides which of two screens gets drawn: with a parent, the thread
         * is asked for by parent and the comment gets a **Show context** row
         * over it; without, it is asked for by topic and the row cannot appear
         * at all -- see [commentParent] for why the two cannot be had together.
         * A link to a comment goes down the second path, because the resolver
         * takes the post and the comment off the answer and drops the path it
         * just read.
         *
         * At the head, where the three arguments are still where they arrived.
         * The comment goes in and the parent comes back, so Boost's own answer
         * is what a Lemmy account keeps.
         */
        commentParentFingerprint.method.addInstructions(
            0,
            """
                invoke-static { p2, p3 }, $EXTENSION_CLASS_DESCRIPTOR->$COMMENT_PARENT_HOOK
                move-result-object p3
            """,
        )

        /*
         * The unread badge, which nothing in the app redraws between resumes.
         *
         * The count is live in the extension -- Tildes prints it into the header
         * of every page it serves -- and `inboxTotal` hands it to the badge
         * whenever the badge is drawn. What was missing is the draw. Boost has
         * the event already: `DrawerActivity` registers for a local broadcast in
         * `onCreate` and its receiver repaints off the count object the app
         * holds, so one broadcast is enough and the number that lands is ours.
         *
         * **This is the one place a patch writes an extension method's body**
         * rather than calling one. Sending that broadcast means naming three
         * things no code compiled outside the app can name: the static the
         * counts live in, the field on it, and the method that stores one and
         * sends the event. All three are single letters after R8.
         *
         * None of the three is spelled out here either. The method is found by
         * the action string it broadcasts, and the two fields are read straight
         * out of that method's own body -- it opens by storing its argument into
         * exactly those two, so the `sget-object` and the `iput-object` at the
         * top of it are the references this needs.
         *
         * What goes in is the null check the app's own method does not do. `Z`
         * dereferences the static with nothing in front of it, and the receiver
         * then reads a count off whatever was stored, so a broadcast sent before
         * an account exists would take the app down rather than fail.
         *
         * The insert goes at the head of a `return-void`, so an extension whose
         * stub was never written does nothing at all.
         */
        inboxBroadcastFingerprint.method.let { sender ->
            val instructions = sender.implementation!!.instructions.toList()

            val holder = instructions.firstOrNull { it.opcode == Opcode.SGET_OBJECT }
                ?.getReference<FieldReference>()
                ?: throw PatchException("${sender.name} reads no static to broadcast about")
            val counts = instructions.firstOrNull { it.opcode == Opcode.IPUT_OBJECT }
                ?.getReference<FieldReference>()
                ?: throw PatchException("${sender.name} stores the counts nowhere")

            /*
             * The method itself rather than the static in front of it. A
             * `@JvmStatic` member of a companion compiles to two: a forwarder
             * on the outer class, which is what an injected `invoke-static`
             * reaches, and the real one on the companion, which is what the
             * extension's own Kotlin call reaches. Writing the forwarder would
             * have left the caller that matters running the empty one.
             *
             * Found by following the forwarder rather than by spelling the
             * companion out, and it throws if there is nothing to follow.
             */
            val extension = mutableClassDefBy(EXTENSION_CLASS_DESCRIPTOR)
            val forwarder = extension.methods.single { it.name == REPAINT_BADGE_STUB }
            val real = forwarder.implementation!!.instructions
                .mapNotNull { it.getReference<MethodReference>() }
                .singleOrNull { it.name == REPAINT_BADGE_STUB }
                ?: throw PatchException("$REPAINT_BADGE_STUB forwards nowhere")

            val stub = mutableClassDefBy(real.definingClass).methods.single {
                it.name == REPAINT_BADGE_STUB
            }

            // `this` where there is one, so the two parameters are the pair
            // after it. The second is there to be written into.
            val first = if (AccessFlags.STATIC.isSet(stub.accessFlags)) 0 else 1

            stub.addInstructionsWithLabels(
                0,
                """
                    sget-object p${first + 1}, $holder
                    if-eqz p${first + 1}, :nothing
                    iget-object p${first + 1}, p${first + 1}, $counts
                    if-eqz p${first + 1}, :nothing
                    invoke-static { p$first, p${first + 1} }, $sender
                    :nothing
                    return-void
                """,
            )
        }

        /*
         * The Moderators heading on a group's sidebar, which Tildes has nothing
         * to put under: the site is one server with one admin and a group is a
         * listing rather than something anyone runs.
         *
         * At the start of the binding, where the last parameter still holds the
         * sidebar's root. ButterKnife binds the moderators container last and
         * reuses that register for it, so the end of this method has the
         * container where the root was.
         */
        sidebarBindingFingerprint.method.addInstructions(
            0,
            "invoke-static { p2 }, $EXTENSION_CLASS_DESCRIPTOR->sidebarModerators(Landroid/view/View;)V",
        )

        /*
         * The Blocking section on the Filters & blocks screen, which is one
         * heading over one row opening a screen that can only ever be empty
         * here: a block is written into Boost's own muted list, so the three
         * tabs behind that row list what the server says is blocked, which on
         * this site is nothing.
         *
         * Straight after the inflate rather than at the end of the method.
         * There is nothing to find before `setPreferencesFromResource` has run,
         * and the end of it is a `return-void` that an `if-eqz` above jumps to,
         * which is the one shape `atEveryReturn` refuses -- an injection there
         * would be stepped over on the path that jumps.
         *
         * The inflate answers void, so nothing takes a result off it and the
         * call goes straight after.
         */
        filtersScreenFingerprint.method.apply {
            val inflate = indexOfFirstInstructionOrThrow {
                opcode == Opcode.INVOKE_VIRTUAL &&
                    getReference<MethodReference>()?.name == "setPreferencesFromResource"
            }

            addInstructions(
                inflate + 1,
                "invoke-static { p0 }, $EXTENSION_CLASS_DESCRIPTOR->filtersScreen(Ljava/lang/Object;)V",
            )
        }

        /*
         * The composer, at the end of the screen that draws it, where
         * ButterKnife has bound every field and the topic being edited has been
         * read out of the intent.
         *
         * Two kinds of thing come off it. The NSFW chip, since Tildes has no
         * such flag anywhere. And both image pickers, the one on the link field
         * and the one on the thumbnail field beside it, since each uploads to
         * the instance's own image host and Tildes has not got one. That second
         * field is the Tags input now: it is the one thing on the screen Boost
         * sends untouched and draws nowhere, which is the shape Tildes' tags
         * need, and the wording has already renamed it.
         */
        composerFingerprint.method.atEveryReturn(
            "invoke-static { p0 }, $EXTENSION_CLASS_DESCRIPTOR->composerFields(Landroid/app/Activity;)V",
        )

        /*
         * A draft on its way into Boost's own table, which is four columns --
         * Date, Parent, Text and User -- and holds the body and nothing else.
         * On Tildes a topic is also a title, a link, a set of tags and a group,
         * all four of them typed on the same screen, so a draft picked back up
         * arrived as text in an empty composer.
         *
         * The row is left exactly as Boost writes it and the rest is stored
         * beside it, under the same body the row is deduplicated on. So a draft
         * this never saw -- one written before the patch, or by a Lemmy account
         * in the same install -- still comes back the way it always did.
         *
         * At the head, since the context and the body are both parameters and
         * neither is written to before the first instruction reads the body. The
         * method answers void and takes four, so the two the extension wants are
         * p0 and p1.
         *
         * **And the answer goes back into p1**, which is what lets a topic with
         * no body be a draft at all. The table has one text column, this method
         * returns on its first instruction when that column would be empty, and
         * a Tildes link topic is a title and a URL with nothing typed under
         * them. So the extension says what the row carries -- the title, where
         * there is no body -- and the body itself is stored beside it. Every
         * read of the body here is a read of that register and every one of them
         * comes after this, the empty check included.
         */
        draftWriteFingerprint.method.addInstructions(
            0,
            """
                invoke-static { p0, p1 }, $EXTENSION_CLASS_DESCRIPTOR->$DRAFT_SAVED_HOOK
                move-result-object p1
            """,
        )

        /*
         * And the same draft picked back out of the dialog, where Boost puts
         * the body in the editor and stops.
         *
         * Not at the head of the row's click handler: the draft is an index
         * into a list there, and the formatting bar carrying the editor has not
         * been reached yet. Two instructions later both are in registers -- the
         * `check-cast` that makes the row a `Draft`, and the `iget-object` that
         * reads the bar off the callback -- and the branch deciding what to do
         * with the body has not run. So the call goes after whichever of those
         * two comes second, and both registers are still live.
         *
         * Found by the types rather than by position. `Draft` is the only thing
         * cast in that method and the bar is the only field of its type read in
         * it, and both classes keep their names.
         */
        draftPickFingerprint.method.apply {
            val row = indexOfFirstInstructionOrThrow {
                opcode == Opcode.CHECK_CAST &&
                    getReference<TypeReference>()?.type == DRAFT_ROW_CLASS
            }
            val bar = indexOfFirstInstructionOrThrow {
                opcode == Opcode.IGET_OBJECT &&
                    getReference<FieldReference>()?.type == FORMATTING_BAR_CLASS
            }

            val draftRegister = getInstruction<OneRegisterInstruction>(row).registerA
            val barRegister = getInstruction<OneRegisterInstruction>(bar).registerA
            if (draftRegister > 15 || barRegister > 15) {
                throw PatchException("the draft row is held above v15, out of reach of an invoke")
            }

            addInstructions(
                maxOf(row, bar) + 1,
                "invoke-static { v$barRegister, v$draftRegister }, " +
                    "$EXTENSION_CLASS_DESCRIPTOR->" +
                    "draftPicked(Ljava/lang/Object;Ljava/lang/Object;)V",
            )
        }

        /*
         * And the three places that refuse to keep a draft with an empty body,
         * which are what stand between a link topic and that row.
         *
         * All three ask `TextUtils.isEmpty` about the body and branch on the
         * answer, so all three take the same hook on the register the answer
         * lands in: the extension says the body is not empty while the screen is
         * the topic composer and the title, the link or the tags have something
         * in them. Nothing typed anywhere still reads as empty, and Boost's own
         * discard is right there.
         *
         * They are three because any one of them alone loses the draft. The
         * composer's X decides which of the two dialogs to show; the **Save** on
         * that dialog asks again about the body it captured when it was built;
         * and the **Save** inside the Drafts dialog asks about the editor.
         * Answering the first two and not the third leaves the feature working
         * from one button and not the other.
         */
        composerValidationFingerprint.method.apply {
            /*
             * Found by walking back from the dialog rather than forward from the
             * field, because the same method asks the same question of the link
             * and of the tags in its other arm, and `askSaveDraft` kept its name.
             */
            val ask = indexOfFirstInstructionOrThrow {
                opcode == Opcode.INVOKE_VIRTUAL &&
                    getReference<MethodReference>()?.name == ASK_SAVE_DRAFT
            }
            val empty = (ask - 1 downTo 0)
                .firstOrNull { getInstruction<Instruction>(it).asksIfEmpty() }
                ?: throw PatchException("nothing is asked to be empty before $ASK_SAVE_DRAFT")

            answerIsEmpty(empty, thisRegister())
        }

        draftDialogSaveFingerprint.method.apply {
            val empty = indexOfFirstInstructionOrThrow { asksIfEmpty() }
            /*
             * The composer is read off a field of the callback, one instruction
             * pair after the question, so the call goes after whichever of the
             * two comes second. Both registers are still live at the branch.
             */
            val screen = indexOfFirstInstructionOrThrow {
                opcode == Opcode.IGET_OBJECT &&
                    getReference<FieldReference>()?.type == POST_ACTIVITY_CLASS
            }

            answerIsEmpty(
                empty,
                "v" + getInstruction<OneRegisterInstruction>(screen).registerA,
                at = maxOf(empty + 2, screen + 1),
            )
        }

        draftBarSaveFingerprint.method.apply {
            /*
             * Here the screen is the formatting bar, which is a view, and the
             * extension takes the activity off its context. It is read at the
             * head and read again past the branch, which is what says the
             * register still holds it where the call goes.
             */
            val bar = indexOfFirstInstructionOrThrow {
                opcode == Opcode.IGET_OBJECT &&
                    getReference<FieldReference>()?.type == FORMATTING_BAR_CLASS
            }
            val empty = indexOfFirstInstructionOrThrow(bar) { asksIfEmpty() }

            answerIsEmpty(empty, "v" + getInstruction<OneRegisterInstruction>(bar).registerA)
        }

        /*
         * And the row that dialog draws, which was a body snippet with a date
         * under it and reads as the title now.
         *
         * A draft with no title stored beside it -- a comment reply, a message,
         * one written by a Lemmy account in the same install -- draws exactly
         * what it drew before, since the extension answers with the string it
         * was handed. The field is read once and set once, so the hook goes
         * between the two.
         */
        draftRowFingerprint.method.apply {
            val read = indexOfFirstInstructionOrThrow {
                opcode == Opcode.IGET_OBJECT &&
                    getReference<FieldReference>()?.let {
                        it.definingClass == DRAFT_ROW_CLASS && it.name == DRAFT_TEXT_FIELD
                    } == true
            }
            val text = getInstruction<OneRegisterInstruction>(read).registerA
            if (isJumpedTo(read + 1)) {
                throw PatchException("the draft row jumps past where its title would go")
            }

            addInstructions(
                read + 1,
                """
                    invoke-static { v$text }, $EXTENSION_CLASS_DESCRIPTOR->$DRAFT_ROW_HOOK
                    move-result-object v$text
                """,
            )
        }

        /*
         * The composer will not send anything until its thumbnail field parses
         * as a URL, and refuses with "Link not valid" when it does not. That
         * field is the tags here, so a pair of ordinary tags is exactly the
         * shape it rejects.
         *
         * The check is guarded by `TextUtils.isEmpty` on the field, so the
         * cheapest way past it is to answer that question rather than to
         * rewrite the branch: the extension says the field is empty while the
         * account is Tildes, the URL parse is skipped, and the value itself is
         * untouched on its way to the interceptor.
         *
         * The field is found by the ButterKnife name it keeps, and the question
         * by the first `isEmpty` asked of it.
         */
        composerValidationFingerprint.method.apply {
            val fieldIndex = indexOfFirstInstructionOrThrow {
                opcode == Opcode.IGET_OBJECT &&
                    getReference<FieldReference>()?.name == THUMBNAIL_FIELD
            }
            // The field is read once and trimmed in place, so the string stays
            // in the register the read landed in.
            val field = getInstruction<TwoRegisterInstruction>(fieldIndex).registerA

            val emptyIndex = indexOfFirstInstructionOrThrow(fieldIndex) {
                opcode == Opcode.INVOKE_STATIC &&
                    getReference<MethodReference>()?.let {
                        it.definingClass == TEXT_UTILS_CLASS && it.name == "isEmpty"
                    } == true &&
                    (this as FiveRegisterInstruction).registerC == field
            }
            val answer = getInstruction<OneRegisterInstruction>(emptyIndex + 1).registerA

            addInstructions(
                emptyIndex + 2,
                """
                    invoke-static { v$answer }, $EXTENSION_CLASS_DESCRIPTOR->thumbnailIsBlank(Z)Z
                    move-result v$answer
                """,
            )
        }

        /*
         * Tildes has no NSFW flag and does have an `nsfw` tag, which it calls an
         * important tag: always drawn in a listing, styled bold and red, and
         * carried by sub-tags too. So the interceptor reports the tag as Lemmy's
         * boolean and Boost's badge, blur and NSFW settings all read something
         * true.
         *
         * What cannot come across is the filtering. Boost drops every NSFW post
         * from a listing unless its "Show NSFW" preference is on, and that is
         * off out of the box, while tildes.net lists those topics for everyone.
         * A truthful flag would quietly shorten every feed.
         *
         * Two places filter, and each reads a boolean into a register just
         * before testing the flag, so both take the same hook on that register.
         * The field itself is read off `SubmissionModel.l(PostView)` rather than
         * named, since it is a single letter.
         */
        /*
         * Tildes' other important tag, drawn in every listing the way `nsfw`
         * is, and the one Lemmy has no field for at all. So a feed said nothing
         * about a topic the site marks in every row: the warning the
         * interceptor puts in the body is markdown, and a row draws a truncated
         * preview rather than markdown -- and a link topic has no body to
         * preview.
         *
         * Boost has the field already, inherited from its Reddit ancestry along
         * with everything a row hangs off it: a **Spoiler** badge over the
         * title, a red **SPOILER** in the line beneath, and a view type that
         * leaves a video alone. Nothing on the Lemmy path ever writes it -- the
         * only writers in the app are the parcel and four mark-spoiler
         * callbacks -- so it is free the way the composer's thumbnail input
         * was.
         *
         * Filled where a post is copied off the answer, rather than at each of
         * the five places a row reads it, and on the model rather than in the
         * JSON, since there is no Lemmy field to put it in.
         */
        postViewFromLemmyFingerprint.method.apply {
            val built = indexOfFirstInstructionOrThrow { opcode == Opcode.RETURN_OBJECT }
            val model = getInstruction<OneRegisterInstruction>(built).registerA

            addInstructions(
                built,
                """
                    invoke-static { v$model }, $EXTENSION_CLASS_DESCRIPTOR->spoilerRow(Ljava/lang/Object;)V
                    invoke-static { v$model }, $EXTENSION_CLASS_DESCRIPTOR->voteClosedTopic(Ljava/lang/Object;)V
                """,
            )
        }

        /*
         * The vote Tildes would refuse, taken off before it is offered.
         *
         * The site closes voting 30 days after a topic or a comment is posted,
         * refuses it on your own posts and refuses it on removed ones, and
         * draws no vote button in any of those cases. Boost votes
         * optimistically -- the score moves and the button fills before the
         * request goes out -- and the failure path throws the error away, so a
         * refused vote read as counted until the next refresh.
         *
         * Nothing new is drawn for it: `PublicContributionModel.n` is Reddit's
         * archived flag, read before every vote in the app and never written on
         * the Lemmy path, so a model carrying it toasts instead of voting.
         *
         * Two seams because there are two models, and the comment one is here
         * rather than beside the topic's since it is a different class.
         */
        commentViewFromLemmyFingerprint.method.apply {
            val built = indexOfFirstInstructionOrThrow { opcode == Opcode.RETURN_OBJECT }
            val model = getInstruction<OneRegisterInstruction>(built).registerA

            addInstructions(
                built,
                "invoke-static { v$model }, " +
                    "$EXTENSION_CLASS_DESCRIPTOR->voteClosedComment(Ljava/lang/Object;)V",
            )
        }

        /*
         * And the reply that flag was refusing along with the vote.
         *
         * Boost inherited the flag from Reddit, where an archived post closes
         * its votes and its comments together, so it reads the one field on
         * both paths. Tildes ties nothing together: its topic ACL denies `vote`
         * to the author and past the 30-day window, and denies `comment` only
         * on a removed topic, a locked one, or a superseded scheduler post. So
         * the reply icon on a topic of your own was toasting **Tildes is not
         * taking votes on this** at the author trying to answer their own
         * thread, and the same on your own comments.
         *
         * One seam covers all of it. The comment's reply icon, the topic's
         * toolbar row and the reply icon in the floating menu all funnel into
         * `CommentsFragment.q1`, and that method holds the only read of the
         * flag in the class. Answering it there leaves the five vote sites
         * reading their own copy, so a vote Tildes would refuse is still
         * refused.
         *
         * **The gate Tildes does have is a few lines further down the same
         * method**, on Lemmy's `locked`, and it is narrowed rather than removed
         * by the block under this one.
         */
        replyGateFingerprint.method.apply {
            val test = indexOfFirstInstructionOrThrow {
                opcode == Opcode.IGET_BOOLEAN &&
                    getReference<FieldReference>()?.let {
                        it.definingClass == PUBLIC_CONTRIBUTION_CLASS && it.name == ARCHIVED_FIELD
                    } == true
            }
            val answer = getInstruction<OneRegisterInstruction>(test).registerA

            addInstructions(
                test + 1,
                """
                    invoke-static { v$answer }, $EXTENSION_CLASS_DESCRIPTOR->replyClosed(Z)Z
                    move-result v$answer
                """,
            )

            /*
             * And the gate Tildes does have, which the comment above used to
             * say was left alone. It is left alone in the sense that a locked
             * topic still closes, and narrowed in the one that matters:
             *
             * ```java
             * if ((submissionModel.o || publicContributionModel.o) && !submissionModel.r) {
             * ```
             *
             * Both halves read `locked` off the topic and off whatever the
             * reply was started from, so a topic closed to comments closed the
             * replies to its comments with it. Tildes closes the two
             * separately: the topic ACL denies `comment`, which is the box for
             * a new top-level one, while a comment's ACL grants `reply` unless
             * the comment is removed or the topic is *locked*. A removed topic
             * is not a locked one.
             *
             * Both reads are hooked rather than the topic's alone. Each is
             * answered from the contribution in `p2`, so the two agree and
             * which one the `||` reaches first stops mattering.
             */
            val locked = implementation!!.instructions.toList().indices.filter { at ->
                getInstruction(at).let {
                    it.opcode == Opcode.IGET_BOOLEAN &&
                        it.getReference<FieldReference>()?.let { field ->
                            field.definingClass == PUBLIC_CONTRIBUTION_CLASS &&
                                field.name == LOCKED_FIELD
                        } == true
                }
            }

            if (locked.size != REPLY_GATE_LOCKED_READS) {
                throw PatchException("the reply gate reads locked ${locked.size} times")
            }

            // Backwards, so each insert leaves the one before it where it was.
            locked.asReversed().forEach { at ->
                val read = getInstruction<OneRegisterInstruction>(at).registerA
                addInstructions(
                    at + 1,
                    """
                        invoke-static { v$read, p2 }, $EXTENSION_CLASS_DESCRIPTOR->replyLocked(ZLjava/lang/Object;)Z
                        move-result v$read
                    """,
                )
            }
        }

        val nsfwField = postViewFromLemmyFingerprint.method.let { mapping ->
            val getNsfw = mapping.indexOfFirstInstructionOrThrow {
                opcode == Opcode.INVOKE_VIRTUAL &&
                    getReference<MethodReference>()?.name == "getNsfw"
            }
            val put = mapping.indexOfFirstInstructionOrThrow(getNsfw) {
                opcode == Opcode.IPUT_BOOLEAN
            }
            mapping.getInstruction(put).getReference<FieldReference>()!!
        }

        listOf(listingFilterFingerprint, profileFilterFingerprint).forEach { fingerprint ->
            fingerprint.method.apply {
                // The read of the flag, and the answer this overrides is
                // whichever register was filled just before it.
                val test = indexOfFirstInstructionOrThrow {
                    opcode == Opcode.IGET_BOOLEAN &&
                        getReference<FieldReference>() == nsfwField
                }
                val source = (test - 1 downTo 0).firstOrNull {
                    val opcode = getInstruction(it).opcode
                    opcode == Opcode.SGET_BOOLEAN || opcode == Opcode.MOVE_RESULT
                } ?: throw PatchException("$name tests the flag with nothing to answer for it")

                val answer = getInstruction<OneRegisterInstruction>(source).registerA

                addInstructions(
                    source + 1,
                    """
                        invoke-static { v$answer }, $EXTENSION_CLASS_DESCRIPTOR->showNsfw(Z)Z
                        move-result v$answer
                    """,
                )
            }
        }

        /*
         * The drawer's Bookmarks row, which opened the wrong Bookmarks.
         *
         * Tildes keeps one `/bookmarks` page with a topic tab and a comment tab
         * on it, and Boost has two screens that both claim to be it: this row,
         * which opens an ordinary submission feed, and the profile's Bookmarks
         * tab. Only the second can draw a comment -- the feed casts every row it
         * is handed to a post -- so the row goes there now and there is one
         * Bookmarks screen again.
         *
         * **The tap is taken at the drawer's one funnel**, which is the method
         * every row in it comes through on its way into the app. The obvious
         * place is the switch underneath, and it is the wrong one: the home
         * screen overrides the method holding that switch and answers this row
         * itself, without ever starting anything, so a hook down there would
         * miss the common case entirely.
         *
         * The funnel ignores its `View`, which is where the answer goes -- the
         * method carries no register that is not a parameter, and this is the
         * one parameter nothing reads. An assumption test says so.
         */
        drawerRowsFingerprint.classDef.apply {
            // `parameterTypes` holds `CharSequence`, not `String`, so a bare
            // comparison against a literal matches nothing at all.
            val funnel = methods.single { method ->
                method.returnType == "Z" &&
                    method.parameterTypes.map(CharSequence::toString)
                        .let { it.size == 2 && it.first() == "Landroid/view/View;" }
            }

            funnel.addInstructionsWithLabels(
                0,
                """
                    invoke-static/range { p0 .. p2 }, $EXTENSION_CLASS_DESCRIPTOR->drawerBookmarks(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z
                    move-result p1
                    if-eqz p1, :boosts
                    const/4 p1, 0x1
                    return p1
                    :boosts
                    nop
                """,
            )
        }

        /*
         * And the tab it lands on, which the profile has never been able to be
         * told.
         *
         * That screen reads one extra, the person, and opens on the first tab
         * always. So the row above puts a tab key in the intent and this reads
         * it back, after the tabs have been wired to the pager -- before that
         * there is nothing to select.
         *
         * By key rather than by index, because the index is not Boost's any
         * more: `profileTabs` and `profileTab` take About and Uploads out of
         * that screen on a Tildes account, so the Bookmarks tab is the third of
         * seven to Boost and the third of five as drawn.
         */
        // Looked up in the class rather than fingerprinted, since `parameters`
        // is not an exact match and this screen keeps its name. The method is
        // told from its neighbours by the wiring it does.
        val profileScreen = mutableClassDefBy(USER_ACTIVITY_CLASS).methods.filter { method ->
            method.returnType == "V" &&
                method.parameterTypes.map(CharSequence::toString) ==
                listOf("Landroid/os/Bundle;") &&
                method.wires(TABS_TO_PAGER)
        }
        if (profileScreen.size != 1) {
            throw PatchException("the profile screen wires its tabs in ${profileScreen.size} places")
        }
        profileScreen.single().apply {
            val wired = indexOfFirstInstructionOrThrow {
                getReference<MethodReference>()?.name == TABS_TO_PAGER
            }

            // `/range`, because this method declares eighteen registers and so
            // `p0` is `v16`. A plain `invoke` addresses v0 to v15 and nothing
            // above, and the assembler answers an empty list rather than an
            // error when asked for one it cannot write -- which arrives as
            // "Collection is empty" from somewhere else entirely.
            addInstructions(
                wired + 1,
                "invoke-static/range { p0 .. p0 }, " +
                    "$EXTENSION_CLASS_DESCRIPTOR->profileOpensOn(Ljava/lang/Object;)V",
            )
        }

        /*
         * The comments on a bookmarks page, which Boost has been fetching and
         * throwing away.
         *
         * Tildes bookmarks a comment as readily as a topic, and `/bookmarks`
         * has a tab for each. The interceptor reads both and answers with
         * Lemmy's `posts` and `comments` arrays together, which is what a
         * profile response carries there. Boost then pages one list at a time:
         * a Topics tab through the paginator this method belongs to and a
         * Comments tab through its twin, both over the same response -- and the
         * Bookmarks tab is wired to the first. So the second read was paid for
         * on every page and drawn nowhere.
         *
         * Nothing downstream has to change for them to be drawn. The list
         * behind the profile's own screen is declared as contributions rather
         * than posts, and its adapter already tells a comment from a topic and
         * has a holder for each, which is how the Comments tab draws at all.
         *
         * **This is not where they are added, though**, and the reason cost a
         * crash. That paginator is not the profile tab's alone: the drawer's
         * Bookmarks row opens a submission feed that pages through the very
         * same class, and that screen casts every row it is handed to a post.
         * A comment in the list there is a `ClassCastException` before anything
         * is drawn. So this end only reads the comments off the response, which
         * is the one place they exist, and the other end decides whether the
         * screen asking can draw them.
         *
         * Which tab it is is asked of the paginator's own query map, where
         * `saved_only` is spelt out, rather than of a field letter that could
         * quietly move.
         */
        personPostsPaginatorFingerprint.method.addInstructions(
            0,
            "invoke-static { p0, p1 }, " +
                "$EXTENSION_CLASS_DESCRIPTOR->bookmarkedComments(Ljava/lang/Object;Ljava/lang/Object;)V",
        )

        /*
         * And the other end, which is the profile list taking a page.
         *
         * Two methods on that fragment take one -- one appends and one replaces
         * -- and both hand it straight to the filter above before anything else
         * happens. So the comments go on the page as it arrives and ride
         * through that filter with the topics, which passes anything that is
         * not a post through untouched.
         *
         * They are found by the filter they call rather than by their names,
         * which are two letters between them. The video subclass overrides the
         * replacing one and calls `super`, so both of its paths come through
         * here as well.
         *
         * **At the head of each rather than at the filter's own return.** That
         * return is what the filter's loop jumps to when it runs out, so an
         * insert in front of it is code the jump steps over -- assembling,
         * verifying and running exactly as the method did before. It is the
         * shape that shipped once already on the formatting bar.
         */
        profileFilterFingerprint.classDef.apply {
            val filter = profileFilterFingerprint.method
            val takesAPage = methods.filter { method ->
                method.implementation?.instructions?.toList().orEmpty().any {
                    it.getReference<MethodReference>()
                        ?.let { call ->
                            call.name == filter.name && call.definingClass == filter.definingClass
                        } == true
                }
            }

            if (takesAPage.size != 2) {
                throw PatchException(
                    "the profile list takes a page in ${takesAPage.size} places, not two",
                )
            }

            takesAPage.forEach {
                it.addInstructions(
                    0,
                    "invoke-static { p0, p1 }, " +
                        "$EXTENSION_CLASS_DESCRIPTOR->" +
                        "addBookmarkedComments(Ljava/lang/Object;Ljava/util/ArrayList;)V",
                )
            }
        }

        /*
         * The Local tab on the Groups page, which is All under another name.
         * Tildes federates with nothing, so the instance's own groups and every
         * group there is are one list, and the interceptor has been answering
         * both from the same place since the first day.
         *
         * The pager keeps its five titles in one array and its five kinds of
         * fragment in another, takes the position as the index into both, and
         * says it has three of them unless the site is PieFed. So a tab comes
         * off by answering the count one lower and stepping over the position,
         * which is three hooks on the one class rather than a rewrite of any of
         * them.
         *
         * The other two methods are read off the class the fragment one matched
         * on, since none of the three has a name worth naming and they are told
         * apart by their signatures: the count takes nothing, the title answers
         * a `CharSequence`, and the fragment is the one the fingerprint found.
         */
        communitiesPagerFingerprint.classDef.apply {
            val step = """
                invoke-static { p1 }, $EXTENSION_CLASS_DESCRIPTOR->groupTab(I)I
                move-result p1
            """

            val count = methods.single {
                it.parameterTypes.isEmpty() && it.returnType == "I"
            }
            val title = methods.single {
                it.parameterTypes.map(CharSequence::toString) == listOf("I") &&
                    it.returnType == "Ljava/lang/CharSequence;"
            }

            count.atEveryValueReturn(
                "$EXTENSION_CLASS_DESCRIPTOR->groupTabs(I)I",
            )
            title.addInstructions(0, step)
            communitiesPagerFingerprint.method.addInstructions(0, step)
        }

        /*
         * The line under a group's name in its info panel, which Boost draws as
         * a handle where Reddit drew a count.
         *
         * `sidebar_subscribers_textview` said **1,079,925 members · 0 online**
         * on the Reddit ancestor and says `!tech@tildes.net` here, which is the
         * name one line above it with an instance on the end. Tildes publishes a
         * subscriber count per group and nothing else about who is there, so
         * one number goes back and the site's own noun with it.
         *
         * The handle's builder is left alone. Nine call sites reach it and two
         * pass the same `"!"`, the other being the collapsing header, whose
         * neighbour already draws the count. So the hook goes on the one result
         * rather than on the thing producing it, which is a `SpannableString`
         * on its way into a `TextView` with nothing in between.
         */
        sidebarSubscribersFingerprint.method.apply {
            val built = indexOfFirstInstructionOrThrow {
                opcode == Opcode.INVOKE_STATIC &&
                    getReference<MethodReference>()?.returnType == "Landroid/text/SpannableString;"
            }
            val kept = getInstruction(built + 1)
            if (kept.opcode != Opcode.MOVE_RESULT_OBJECT) {
                throw PatchException("the handle is not kept, it is $kept")
            }

            val handle = (kept as OneRegisterInstruction).registerA
            if (handle > 15) throw PatchException("the handle is in v$handle")

            addInstructions(
                built + 2,
                """
                    invoke-static { v$handle }, $EXTENSION_CLASS_DESCRIPTOR->sidebarSubscribers(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
                    move-result-object v$handle
                """,
            )
        }

        /*
         * And the same tab in the drawer, which is a row rather than a page and
         * comes off in the one place it is decided.
         *
         * Every row there is behind a switch under Settings, read straight out
         * of the preferences as the drawer is built, so the extension answers
         * that question instead of the preference. Boost's own answer is handed
         * in, which is what leaves a Lemmy account's switch working and leaves
         * the switch itself on the settings screen either way.
         */
        /*
         * Two rows rather than one, and the second is the reason to say so.
         * All sits eight lines under Local in the same method, behind a switch
         * of its own, and it means the same listing here: `type_` never reaches
         * a request, so All and Home both send `/` and draw your subscriptions.
         *
         * Both were meant to come off on the first pass and only the pair among
         * the *subscriptions* did, since those are rows in Boost's own database
         * and come off somewhere else entirely. So the drawer kept an All at
         * the top while the list under it had none.
         *
         * Each key is located again after the one before it has gone in, so
         * neither insertion is working from an index the other moved.
         */
        drawerRowsFingerprint.method.apply {
            listOf(
                DRAWER_ALL_PREF to "drawerAllRow",
                DRAWER_LOCAL_PREF to "drawerLocalRow",
            ).forEach { (key, hook) ->
                val keyIndex = indexOfFirstInstructionOrThrow {
                    getReference<StringReference>()?.string == key
                }
                val readIndex = indexOfFirstInstructionOrThrow(keyIndex) {
                    opcode == Opcode.INVOKE_INTERFACE &&
                        getReference<MethodReference>()?.name == "getBoolean"
                }
                val shown = getInstruction<OneRegisterInstruction>(readIndex + 1).registerA

                addInstructions(
                    readIndex + 2,
                    """
                        invoke-static { v$shown }, $EXTENSION_CLASS_DESCRIPTOR->$hook(Z)Z
                        move-result v$shown
                    """,
                )
            }
        }

        /*
         * Which account the drawer is about to be built for.
         *
         * Everything below reads a flag written by every `/api/v3` call, which
         * says whose request went out last. That is the only answer a view
         * built before it fetches anything can have, and it costs nothing until
         * an account switch: the drawer is rebuilt as the accounts change, and
         * that is before anything has been asked of the new instance, so it is
         * built against the account you just left.
         *
         * Boost loads a user's subscriptions out of its own database on their
         * way into that drawer, which is the one place the account is in hand
         * before a screen is drawn. So the flag is written there as well, off
         * the account this is loading them for.
         */
        subscriptionListFingerprint.method.addInstructions(
            0,
            "invoke-static { p0 }, $EXTENSION_CLASS_DESCRIPTOR->subscriptionsFor(Ljava/lang/Object;)V",
        )

        /*
         * And the screen again, once that account has settled.
         *
         * Boost swaps its own account between the two halves of a user refresh:
         * the fifteen rows are built first and the subscriptions after, and the
         * account changes in between. So everything decided in the first half
         * is decided against the account being left, and nothing inside it can
         * answer otherwise -- the log said so to five milliseconds, after two
         * goes at reasoning about it said otherwise.
         *
         * The drawer's rows are one thing decided there and **the wording is
         * the other**, and that one no refresh can repair: every string comes
         * from the configuration the screen was attached with, so a drawer
         * rebuilt for a new account keeps Groups and Bookmarks until something
         * attaches it again. Running the refresh twice fixed the rows and left
         * the words.
         *
         * So the screen is what starts again. `Activity.recreate` takes
         * everything decided as a screen is built with it -- the words, both
         * Local rows, the tabs on the Groups page -- and it is a framework
         * method, which is the one call in here nothing can rename.
         *
         * It runs at most once per switch: the extension answers true and then
         * forgets, and the screen that comes back writes the answer again, by
         * which time the two agree.
         */
        refreshUserFingerprint.method.apply {
            val body = implementation!!
            // v0 has to be free at the return, and p0 still has to be `this`.
            if (body.registerCount - parameterTypes.size < 2) {
                throw PatchException("$name has no spare register to answer through")
            }

            val returns = body.instructions.toList().withIndex()
                .filter { (_, instruction) -> instruction.opcode == Opcode.RETURN_VOID }
                .map { (index, _) -> index }
            if (returns.size != 1) {
                throw PatchException("$name returns ${returns.size} ways")
            }

            addInstructionsWithLabels(
                returns.single(),
                """
                    invoke-static { }, $EXTENSION_CLASS_DESCRIPTOR->builtForOtherAccount()Z
                    move-result v0
                    if-eqz v0, :settled
                    invoke-virtual { p0 }, Landroid/app/Activity;->recreate()V
                    :settled
                    nop
                """,
            )
        }

        /*
         * And the second Local row, which the first one never reached.
         *
         * Under those fifteen switches the drawer lists your subscriptions,
         * and Boost puts Subscribed, Local, All and Bookmarks among them as
         * subscriptions of their own. Those four are rows in the app's own
         * database rather than preferences, seeded once per account under a
         * marker for a name, so nothing about them goes through a switch.
         *
         * Answered through Boost's own skip rather than around it. The loop
         * that turns the list into drawer rows already tests each one against
         * a per-account **hidden** flag -- what the Subscriptions editor writes
         * when you hide a row -- and honours it while the list behind it keeps
         * every entry. So the flag is handed to the extension with the row it
         * is about, and comes back with one more row hidden.
         *
         * That matters for more than tidiness: a drawer row is resolved back
         * to a subscription by its **position in that list**, and the toolbar
         * spinner and the launcher shortcuts read the same list. Dropping an
         * entry would move all three. Hiding a row moves nothing.
         *
         * The method is found on the same class as the switches above, since
         * it is the only one there taking a list, and the read is found by the
         * class it is on rather than by the field's name: the loop reads two
         * booleans off that model and the first is the one every row goes
         * through.
         */
        drawerListMethod().apply {
            val hiddenIndex = indexOfFirstInstructionOrThrow {
                opcode == Opcode.IGET_BOOLEAN &&
                    getReference<FieldReference>()?.definingClass == SUBSCRIPTION_VIEW_MODEL_CLASS
            }
            val read = getInstruction<TwoRegisterInstruction>(hiddenIndex)
            val hook = SUBSCRIPTION_HIDDEN_HOOK

            addInstructions(
                hiddenIndex + 1,
                """
                    invoke-static { v${read.registerA}, v${read.registerB} }, $EXTENSION_CLASS_DESCRIPTOR->$hook
                    move-result v${read.registerA}
                """,
            )
        }

        /*
         * And the same row on the **Go to...** screen, which draws the same
         * subscription list with a filter over it and reads the same hidden
         * flag to decide what to skip. Two screens, one answer.
         *
         * Found by the method that builds one row rather than by the loop that
         * calls it, since that is where the read is: the loop hands each
         * subscription over and this is what tests it.
         */
        goToRowFingerprint.method.apply {
            val hiddenIndex = indexOfFirstInstructionOrThrow {
                opcode == Opcode.IGET_BOOLEAN &&
                    getReference<FieldReference>()?.definingClass == SUBSCRIPTION_VIEW_MODEL_CLASS
            }
            val read = getInstruction<TwoRegisterInstruction>(hiddenIndex)

            addInstructions(
                hiddenIndex + 1,
                """
                    invoke-static { v${read.registerA}, v${read.registerB} }, $EXTENSION_CLASS_DESCRIPTOR->$SUBSCRIPTION_HIDDEN_HOOK
                    move-result v${read.registerA}
                """,
            )

        }

        /*
         * And the list that screen draws those rows from, which is its own.
         *
         * **Go to...** asks the app for the subscriptions again in its own
         * `onCreate` rather than taking the list the home screen already built,
         * so the rows a guest is given -- the front page, and the groups the
         * site gives somebody with no account -- reach the drawer and the
         * toolbar spinner and stop there. This is the same addition on the
         * other screen's copy.
         *
         * At the head, before the loop reads the size it is about to count
         * off, and it is also what the typed filter reads afterwards: the
         * screen keeps the list it was handed, so a row added here is a row
         * that can be searched for.
         */
        goToListFingerprint.method.addInstructions(
            0,
            "invoke-static { p1 }, " +
                "$EXTENSION_CLASS_DESCRIPTOR->goToSubscriptions(Ljava/util/List;)V",
        )

        /*
         * And the third screen the same four rows are drawn on, which is the
         * one the hidden flag is *set* on.
         *
         * **Edit subscriptions** is left out of that flag on purpose: it is
         * where you hide a row, so it has to say what the flag says. Which left
         * Local and All listed there and nowhere else, offering to hide two
         * rows that are already gone from every screen that would draw them.
         *
         * So they come out of the list instead, one method further back. The
         * screen reads its rows out of the database itself rather than through
         * the loader the other two share -- so nothing hooked for them reaches
         * it -- and everything it does afterwards is an index into the list it
         * was handed: the adapter counts off it, a tap resolves a row by
         * position in it, and the reorder writes it back. Taking a row out
         * before any of that keeps all three agreeing with each other.
         *
         * What the reorder then does not renumber is the two rows themselves,
         * which keep the order they were seeded with and stay where they always
         * sat, ahead of everything. Nothing draws them to notice.
         *
         * The list is filtered in place, which needs no register beyond the
         * one already holding it.
         */
        subscriptionEditorFingerprint.method.addInstructions(
            0,
            "invoke-static { p1 }, $EXTENSION_CLASS_DESCRIPTOR->editableSubscriptions(Ljava/util/List;)V",
        )

        /*
         * A person is a name on Tildes, with nothing after it.
         *
         * Boost writes a name as `name@instance` wherever it is not sure the
         * account is local, and it decides that separately in two places. What
         * a byline **draws** checks the host against the one signed in to and
         * leaves it off when they match, so a Tildes profile reads `Deimos`.
         * What the app **compares** does not check: the same person answers
         * `Deimos@tildes.net` there, off the actor URL, for local and remote
         * alike.
         *
         * That gap is why muting somebody by hand never worked. You read
         * `Deimos` on the row, typed `Deimos` into **Muted Users**, and the
         * filter then asked whether `Deimos@tildes.net` equals it. Nothing
         * matched, on any account, and Boost's own Mute… row worked only
         * because it wrote the long form and compared the long form.
         *
         * Tildes federates with nothing, so the host says nothing about anyone:
         * every account on it is local. Both methods answer the bare name here,
         * which leaves the mute list, the Mute… row, the filter and every byline
         * agreeing, and reads the way the site does.
         *
         * Two methods rather than one, and neither has a name left, so they are
         * found by their shape on a class that keeps its own: the only two
         * taking nothing and answering a String.
         *
         * Answered at the head rather than rewritten at each return, because
         * R8 gave both of them one shared return that the short branch jumps
         * to, and an insert in front of a return something jumps to is
         * unreachable. The extension answers null on anything that is not a
         * Tildes account, and Boost's own code runs from there untouched.
         */
        mutableClassDefBy(PERSON_MODEL_CLASS).methods
            .filter { it.returnType == "Ljava/lang/String;" && it.parameterTypes.isEmpty() }
            .also {
                if (it.size != PERSON_NAME_METHODS) {
                    throw PatchException(
                        "PersonModel names itself ${it.size} ways, not $PERSON_NAME_METHODS",
                    )
                }
            }
            .forEach { method ->
                // `v0` is a local rather than a parameter only if the method
                // declares one, and both of these do -- they build a string.
                // Neither takes an argument, so `p0` is the model.
                if (method.implementation!!.registerCount < 2) {
                    throw PatchException("${method.name} has no register to answer through")
                }
                method.addInstructionsWithLabels(
                    0,
                    """
                        invoke-static { p0 }, $EXTENSION_CLASS_DESCRIPTOR->personName(Ljava/lang/Object;)Ljava/lang/String;
                        move-result-object v0
                        if-eqz v0, :boosts_own
                        return-object v0
                        :boosts_own
                        nop
                    """,
                )
            }

        /*
         * And a group as Tildes spells it, which is the same gap one model
         * over.
         *
         * The one method that names a topic's group for comparing answers
         * `comp@tildes.net`, where the site and every other line in the app say
         * `~comp`. So a group typed into **Muted Communities** never matched
         * one, exactly as a name typed into Muted Users never did.
         *
         * Rewritten at the return rather than answered at the head, which is
         * what the two naming methods on a person needed: this one is a single
         * concatenation with nothing to jump to, so the value is in a register
         * by then and needs no field read to find it.
         */
        communityHandleFingerprint.method.atEveryObjectReturn(
            "$EXTENSION_CLASS_DESCRIPTOR->groupHandle(Ljava/lang/String;)Ljava/lang/String;",
        )

        /*
         * The address a comment is shared by, which was one Tildes has never
         * had.
         *
         * Boost builds `<instance>/comment/<id>`, which is a Lemmy route: the
         * site answers 404 for it, and the number in it is one the interceptor
         * invented. So **Share link**, **Copy link** and a long-pressed comment
         * all handed over an address that could not resolve, on every comment
         * since the first day.
         *
         * The real one is already on the model -- Tildes' own permalink, the
         * topic's address with `#comment-<id36>` after it -- so the answer is a
         * field away rather than a request away. `commentLink` finds it by its
         * shape, the way a person's name is found, since the fields here are
         * single letters.
         *
         * Answered at the head, which is also the only place the model is in
         * hand: the value this replaces is built from two other fields and
         * cannot be turned back into a comment.
         */
        commentLinkFingerprint.method.apply {
            if (implementation!!.registerCount < 2) {
                throw PatchException("$name has no register to answer through")
            }
            addInstructionsWithLabels(
                0,
                """
                    invoke-static { p0 }, $EXTENSION_CLASS_DESCRIPTOR->commentLink(Ljava/lang/Object;)Ljava/lang/String;
                    move-result-object v0
                    if-eqz v0, :boosts_own
                    return-object v0
                    :boosts_own
                    nop
                """,
            )
        }

        /*
         * A shared link, in Tildes' own short form.
         *
         * The site prints one on every topic page -- `tild.es/1vlp` under
         * **Short link** -- where the group and the slug in front of the id36
         * are there to be read rather than to be resolved. So the address that
         * leaves the app is a line rather than a paragraph.
         *
         * Hooked where every share in the app ends up rather than at the rows
         * that start one. Thirteen callers reach this method, and by the time
         * they do the address is a string among others: **Share title + link**
         * has already built the title, a dash and the URL into one, and no
         * field holds the URL alone any more. So the text is rewritten and the
         * thirteen are left alone, the way the sort menus are trimmed at the
         * view rather than at their four builders.
         *
         * The third parameter is the text. It is written back over itself,
         * which needs no register beyond the one it arrives in, and a link that
         * is not a topic's comes back exactly as it went in.
         */
        shareTextFingerprint.method.addInstructions(
            0,
            """
                invoke-static { p2 }, $EXTENSION_CLASS_DESCRIPTOR->sharedText(Ljava/lang/String;)Ljava/lang/String;
                move-result-object p2
            """,
        )

        /*
         * And the same address on the clipboard, under a stricter rule.
         *
         * **Copy link** and **Copy permalink** hand over an address and nothing
         * else. **Copy text** hands over a post, where a topic link is the
         * writer's rather than the app's, so only a string that is a whole
         * address is rewritten there. `copiedText` is where that is decided.
         *
         * One method reaches the clipboard from every Copy row in the app, and
         * it is the only mention of `ClipboardManager` in it. The second
         * parameter is the text, written back over itself.
         */
        clipboardFingerprint.method.addInstructions(
            0,
            """
                invoke-static { p1 }, $EXTENSION_CLASS_DESCRIPTOR->copiedText(Ljava/lang/String;)Ljava/lang/String;
                move-result-object p1
            """,
        )

        /*
         * Pull to refresh, which is the one fetch a person asked for rather
         * than one the app decided on.
         *
         * A page is cached for 30 seconds, which is right for everything the
         * app does by itself and wrong for a gesture that means "something
         * changed, show me". So the gesture reads past the cache for a few
         * seconds, and the two limits the site actually cares about -- 700 ms
         * between requests, and joining a fetch already in flight -- are left
         * alone.
         *
         * Hooked at every class that listens for the gesture rather than at the
         * `SwipeRefreshLayout` keeps its name, since a layout file names
         * it, while the interface inside it is `SwipeRefreshLayout$f` and
         * its one method is `a`. So both are found by shape -- the only
         * inner type of that class which is an interface with a single void
         * method taking nothing -- and the implementations by whether they
         * carry it. Which reaches the ones with no name of their own, and
         * that is where the topic screen's lives: `kh.v`, whose `a()` calls
         * `CommentsFragment.g1()`.
         */
        val refreshListener = classDefBy { klass ->
            klass.type.startsWith(SWIPE_REFRESH_INNER) &&
                klass.methods.singleOrNull()?.let {
                    it.parameters.isEmpty() && it.returnType == "V" &&
                        it.implementation == null
                } == true
        }
        val onRefresh = refreshListener.methods.single().name

        val listeners = mutableListOf<String>()
        classDefForEach { klass ->
            if (refreshListener.type in klass.interfaces) listeners += klass.type
        }
        if (listeners.size < REFRESH_LISTENERS) {
            throw PatchException(
                "only ${listeners.size} classes listen for a pull to refresh",
            )
        }
        listeners.forEach { type ->
            mutableClassDefBy(type).methods
                .filter { it.name == onRefresh && it.parameters.isEmpty() }
                .forEach {
                    it.addInstructions(
                        0,
                        "invoke-static { }, $EXTENSION_CLASS_DESCRIPTOR->pulledToRefresh()V",
                    )
                }
        }

        /*
         * What the topic screen keeps when it refreshes.
         *
         * Boost copies the vote and the bookmark off the model already on
         * screen onto the freshly fetched one, so that a slow refresh cannot
         * undo something just tapped. The cost is that neither can ever change
         * from anywhere else: a vote cast in a browser is answered, parsed,
         * handed over and then overwritten with what the screen already had.
         *
         * Both copies are the same shape -- read a field off one model, write
         * the same field onto the other -- so they are found as a pair rather
         * than by naming two single-letter fields, and the field's type says
         * which of the two hooks it takes.
         */
        // Found in the class rather than by a fingerprint, and by its whole
        // signature. `parameters` on a fingerprint is not the exact match it
        // reads as: asking for these four also matched `o0(int,
        // SubmissionModel)` on this same class in 1.0.31, where the method
        // wanted is `r0`. A fingerprint also keeps whatever it matched, so a
        // second apply in one process hands back the first APK's method, which
        // is what made that look like a release-specific quirk.
        mutableClassDefBy(COMMENTS_FRAGMENT_CLASS).methods.single { method ->
            method.returnType == "V" &&
                method.parameterTypes.map(CharSequence::toString) == REFRESH_PARAMETERS
        }.apply {
            val instructions = implementation!!.instructions.toList()
            val copies = instructions.indices.filter { at ->
                at > 0 && instructions[at].opcode in COPY_WRITES &&
                    instructions[at - 1].opcode in COPY_READS &&
                    instructions[at].fieldKey() != null &&
                    instructions[at].fieldKey() == instructions[at - 1].fieldKey()
            }

            if (copies.size != TOPIC_CARRIED_OVER) {
                throw PatchException("the refresh carries ${copies.size} fields over")
            }

            // Backwards, so each insert leaves the one before it where it was.
            copies.asReversed().forEach { at ->
                val write = getInstruction<TwoRegisterInstruction>(at)
                val value = write.registerA
                val model = write.registerB
                val hook = if (getInstruction(at).opcode == Opcode.IPUT_BOOLEAN) {
                    "bookmarkAfterRefresh(ZLjava/lang/Object;)Z"
                } else {
                    "voteAfterRefresh(ILjava/lang/Object;)I"
                }

                addInstructions(
                    at,
                    """
                        invoke-static { v$value, v$model }, $EXTENSION_CLASS_DESCRIPTOR->$hook
                        move-result v$value
                    """,
                )
            }
        }

        /*
         * The account editor, which the edit chip on your own profile opens.
         *
         * Tildes has one editable thing about an account, the bio at
         * `/settings/bio`, against an avatar, a banner, a display name, an
         * email and eight switches here. So the screen comes down to the one
         * field the interceptor can answer for, and the save behind it writes
         * that field and drops the rest.
         *
         * Straight after the bind, where the root is still in a register and
         * every field is filled. Boost trims this same screen a few lines
         * further down when the server is PieFed, which is the shape being
         * followed, and the bind is the anchor rather than the end of the
         * method for the reason [formattingBarFingerprint] gives.
         *
         * The root arrives in the second register of the bind, since
         * ButterKnife takes the target and the view it was inflated into.
         */
        accountScreenFingerprint.method.apply {
            val bindIndex = indexOfFirstInstructionOrThrow {
                opcode == Opcode.INVOKE_STATIC &&
                    getReference<MethodReference>()?.let {
                        it.definingClass == BUTTERKNIFE_CLASS && it.name == "bind"
                    } == true
            }
            val root = getInstruction<FiveRegisterInstruction>(bindIndex).registerD

            addInstructions(
                afterTheResultOf(bindIndex),
                "invoke-static { v$root }, " +
                    "$EXTENSION_CLASS_DESCRIPTOR->accountScreen(Landroid/view/View;)V",
            )
        }

        /*
         * And what that save toasts, which is `R.string.saved` -- **Bookmarks**
         * on a Tildes account, since saving is bookmarking in the ten other
         * places Boost uses the word and the wording table says so.
         *
         * The row in the drawer and the title over the bookmarks listing both
         * want that word, so the string stays as it is and this one call gets
         * a different id handed to it. Which is the same trick the sort names
         * ride on, one step earlier: the word is chosen per account rather than
         * per install, and a Lemmy account gets the id Boost passed.
         *
         * The id is the second argument of the `makeText` taking one, which is
         * the success toast. The failure beside it passes a `CharSequence`
         * built from the exception, so the two are told apart by signature.
         */
        accountSavedToastFingerprint.method.apply {
            val toastIndex = indexOfFirstInstructionOrThrow {
                opcode == Opcode.INVOKE_STATIC &&
                    getReference<MethodReference>()?.let {
                        it.definingClass == TOAST_CLASS && it.name == "makeText" &&
                            it.parameterTypes.map(CharSequence::toString) ==
                            listOf("Landroid/content/Context;", "I", "I")
                    } == true
            }
            val word = getInstruction<FiveRegisterInstruction>(toastIndex).registerD

            addInstructions(
                toastIndex,
                """
                    invoke-static { v$word }, $EXTENSION_CLASS_DESCRIPTOR->savedWord(I)I
                    move-result v$word
                """,
            )
        }

        /*
         * A topic's tags, drawn under its body as something to press.
         *
         * They ride in the body as code spans, for want of a Lemmy field to put
         * them in, and a code span is as far as markdown goes: it cannot be a
         * chip and it cannot be given a colour. So the hook draws them itself,
         * in the same pill the composer's tag suggestions are drawn in, and
         * takes the line off the body it drew them from.
         *
         * At the head of the one method that binds a post to a view, where the
         * holder and the model are both in hand and neither has been read yet.
         * The extension decides which screen it is on by which body view the
         * holder has, and a listing row -- which has the other one -- is left
         * exactly as it was.
         *
         * The parameters are at v25 and v26 of 31 registers, so this is the
         * range form. Nothing is saved around it: the method's own first three
         * instructions write v0, v1 and v2 before reading anything.
         */
        submissionBindFingerprint.method.addInstructions(
            0,
            """
                invoke-static/range { p0 .. p1 }, $EXTENSION_CLASS_DESCRIPTOR->tagPills(Ljava/lang/Object;Ljava/lang/Object;)V
            """,
        )

        /*
         * Tildes' own icon for the site a link topic points at, in front of the
         * domain Boost already prints after the title.
         *
         * The site hosts one per domain and draws it beside every link row, and
         * it is the fastest thing to read in a listing. The badge goes where the
         * site puts it rather than in the thumbnail square, which is 65dp to
         * 110dp of CenterCrop and would blow a 32-pixel logo up sevenfold --
         * 32x32 is the biggest file Tildes has, and it is already the 2x asset
         * for the 16 pixels a browser draws it at.
         *
         * After the `setText` that just drew a domain, where the view and the
         * model are both in a register: the call's own first register is the
         * title, and `p1` is still the model there. The other `setText` in the
         * method is the branch for a topic with no link, which has no domain to
         * badge and is left alone.
         */
        submissionTitleFingerprint.method.apply {
            val setTextIndex = indexOfFirstInstructionOrThrow {
                opcode == Opcode.INVOKE_VIRTUAL &&
                    getReference<MethodReference>()?.name == "setText"
            }
            val title = getInstruction<FiveRegisterInstruction>(setTextIndex).registerC

            addInstructions(
                setTextIndex + 1,
                "invoke-static { v$title, p1 }, " +
                    "$EXTENSION_CLASS_DESCRIPTOR->siteIcon(Landroid/widget/TextView;Ljava/lang/Object;)V",
            )
        }

        /*
         * And the grey chain-link tile that square was drawing instead.
         *
         * Tildes hosts no thumbnails, so every link row in the feed drew
         * `R.drawable.link` -- the same picture on every row, taking 75dp to say
         * "this is a link" where the row says it in words underneath. The
         * extension answers nothing, which sends Boost down the path it already
         * takes for a topic with no link at all: the square is hidden and the
         * title gets the width.
         *
         * At the one call that loads that square, found by what it takes rather
         * than by its name -- a URL and the image loader -- since the name is a
         * letter and the loader is a renamed library class. The register holding
         * the URL is read off the call itself and written back over.
         */
        submissionBindFingerprint.method.apply {
            val loadIndex = indexOfFirstInstructionOrThrow {
                opcode == Opcode.INVOKE_VIRTUAL &&
                    getReference<MethodReference>()?.let {
                        it.definingClass == SUBMISSION_VIEW_HOLDER_CLASS &&
                            it.returnType == "V" &&
                            it.parameterTypes.size == 2 &&
                            it.parameterTypes.first() == "Ljava/lang/String;"
                    } == true
            }
            val url = getInstruction<FiveRegisterInstruction>(loadIndex).registerD

            addInstructions(
                loadIndex,
                """
                    invoke-static { v$url }, $EXTENSION_CLASS_DESCRIPTOR->rowThumbnail(Ljava/lang/String;)Ljava/lang/String;
                    move-result-object v$url
                """,
            )
        }

        /*
         * The front page, which Tildes calls **Home** and Boost calls
         * Subscribed.
         *
         * The site's own sidebar on `/` says Home over "The home page shows
         * topics from all the groups on Tildes", and that is the listing
         * Boost's `!subscribed` row opens. The word is on the drawer's top row,
         * on both halves of the toolbar spinner over a feed, on the **Go
         * to...** screen, on the launcher shortcuts and in the toolbar title
         * once the feed is open.
         *
         * **The wording patch cannot carry this one**, which is the only time
         * that has come up. All of those go through `R.string.subscribed`, and
         * so does the **first tab on the Groups page**, where it names the
         * groups you follow rather than a feed -- rewriting the string there
         * would leave a strip reading Home | All over two lists of groups. So
         * the edit is here instead, at the one method that turns a marker into
         * a word, which the Groups page does not go through.
         *
         * At the head, where `v0` is free: the method's own first instruction
         * writes it before reading it. The extension answers null for every
         * listing but this one, and null falls through to Boost's own words.
         */
        listingNameFingerprint.method.addInstructionsWithLabels(
            0,
            """
                invoke-static { p1 }, $EXTENSION_CLASS_DESCRIPTOR->listingName(Ljava/lang/Object;)Ljava/lang/String;
                move-result-object v0
                if-eqz v0, :boosts_own
                return-object v0
                :boosts_own
                nop
            """,
        )

        /*
         * The search screen's fourth tab, which asks for a tag.
         *
         * Tildes searches topics and nothing else, so Boost's Comments tab had
         * no answer to give and drew an empty list whatever was typed. What the
         * site does have is a listing filtered by tag, at `?tag=`, and no way in
         * but pressing one under a topic. So the tab that could not work becomes
         * the way to ask for a tag by name.
         *
         * **Two edits, and the request is not one of them.** The tab keeps its
         * own paginator and its own `type_=Comments`, which is what lets the
         * interceptor tell it from the Posts tab beside it with nothing marked
         * or remembered in between. Only what comes back changes.
         *
         * The first is the answer. `getComments` says which of the four
         * paginators this is, and the extension reads the topics out of `posts`
         * instead. Nothing downstream needed telling: the list travels with its
         * type erased into an adapter that picks a row by asking what each item
         * is, so a topic among comments draws as a topic.
         *
         * The second is the word over it, since a tab reading Comments above a
         * list of topics is worse than either. `pref_header_comments` is also
         * the Comments heading in Boost's own settings, so the wording table
         * cannot carry it -- the same reason the front page's word is answered
         * in code, and the same shape of answer.
         *
         * Both at the head, where `v0` is free: each method's own first
         * instruction writes it before reading it. Null falls through to Boost.
         */
        searchCommentResultsFingerprint.method.addInstructionsWithLabels(
            0,
            """
                invoke-static { p1 }, $EXTENSION_CLASS_DESCRIPTOR->tagResults(Ljava/lang/Object;)Ljava/util/ArrayList;
                move-result-object v0
                if-eqz v0, :boosts_own
                return-object v0
                :boosts_own
                nop
            """,
        )

        searchTabNameFingerprint.method.addInstructionsWithLabels(
            0,
            """
                invoke-static { p1 }, $EXTENSION_CLASS_DESCRIPTOR->searchTabName(I)Ljava/lang/String;
                move-result-object v0
                if-eqz v0, :boosts_own
                return-object v0
                :boosts_own
                nop
            """,
        )

        /*
         * The Votes tab, sent down the route that can carry a comment.
         *
         * Tildes' `/votes` has a topic tab and a comment tab, the same as
         * `/bookmarks`, and Boost draws only the topics -- not because of what
         * the interceptor answers but because of which paginator that tab uses.
         * It asks `post/list` with `liked_only` and reads `getPosts()` off a
         * `GetPostsResponse`, which has no field a comment could arrive in. The
         * tab beside it asks `user` and gets both of Lemmy's arrays.
         *
         * So the word is what is edited, at the one comparison that picks
         * between the two. Everything downstream already exists: the tab marks
         * its request the way All posts does, the interceptor reads both halves
         * of `/votes`, and `addBookmarkedComments` puts them on the page.
         *
         * **`disliked` is left where it is**, which is why this goes on the one
         * comparison rather than on the branch. That tab is `/ignored_topics`
         * and has no comment half at all.
         *
         * The first `"liked"` in the method is that comparison. The two after
         * it are inside the branch this one guards, filling in the paginator's
         * own two booleans, and are dead once it is not taken.
         */
        profilePaginatorFingerprint.method.apply {
            val likedAt = indexOfFirstInstructionOrThrow {
                getReference<StringReference>()?.string == LIKED_TAB_KEY
            }
            val equals = getInstruction(likedAt + 1)
            if ((equals.getReference<MethodReference>())?.name != "equals") {
                throw PatchException("$LIKED_TAB_KEY is not compared where the branch is")
            }

            val answerAt = indexOfFirstInstructionOrThrow(likedAt) {
                opcode == Opcode.MOVE_RESULT
            }
            val answer = getInstruction<OneRegisterInstruction>(answerAt).registerA
            if (answer > 15) throw PatchException("the tab answer is in v$answer")

            // This one goes into the middle of a method rather than at a head
            // or a return, so it is the one place a branch could land on the
            // injection instead of on what it was injected in front of.
            if (isJumpedTo(answerAt + 1)) {
                throw PatchException("$name jumps to where the tab answer is read")
            }

            addInstructions(
                answerAt + 1,
                """
                    invoke-static { v$answer }, $EXTENSION_CLASS_DESCRIPTOR->likedTakesPostList(Z)Z
                    move-result v$answer
                """,
            )
        }

        /*
         * Which kind the Bookmarks tab is showing, read where it is decided.
         *
         * Tildes keeps `/bookmarks` as two tabs, topics and comments, and Boost
         * keeps the same choice as a filter on the presenter behind the tab --
         * `only_posts`, `only_comments`, or nothing at all for both, which is a
         * list Tildes never draws. The strip inside that tab is what writes it,
         * and this is where the app reads it back: the head of the one method
         * that builds a paginator, which runs on every page of every profile
         * tab.
         *
         * Two things happen there and both want this point rather than a later
         * one. **A tab opening with no filter gets topics**, which is the site's
         * own first tab, and it has to be set before the paginator is chosen or
         * the first page comes back merged and the strip would have to throw it
         * away. And **the interceptor is told which half to fetch**, which is
         * the one thing the request itself cannot say: `only_posts` and no
         * filter build the identical query, so without this the comment half of
         * `/bookmarks` was fetched and dropped on every load.
         *
         * `p0` is the presenter and `p1` is append-or-reload, and only the
         * first is wanted: what is being asked is which kind, not which page.
         */
        profilePaginatorFingerprint.method.addInstructions(
            0,
            "invoke-static { p0 }, " +
                "$EXTENSION_CLASS_DESCRIPTOR->profileListLoading(Ljava/lang/Object;)V",
        )

        /*
         * `~text~` and `^text^`, which Boost reads as subscript and
         * superscript and Tildes does not read as anything.
         *
         * The rewrite is one Markwon plugin, it runs on the whole body at once
         * before a character of it is parsed, and it skips nothing -- not code
         * spans, not fenced blocks, not the address inside a link. A group is
         * `~group` and this site puts those in ordinary sentences, so two group
         * mentions on one line is two tildes, and the second closes what the
         * first opened. `PITFALLS.md` has what that did to a link.
         *
         * Tildes writes both characters through as themselves, so leaving the
         * body alone is what draws what the site drew. It has `<sub>` and
         * `<sup>` in its allowed tags, though only as HTML somebody typed --
         * cmark-gfm has no syntax for either, so there is no `~x~` on this site
         * to lose.
         *
         * The early return goes at the head, where `v0` is free: the method's
         * own first instruction writes it before reading it.
         */
        scriptRewriteFingerprint.method.addInstructionsWithLabels(
            0,
            """
                invoke-static { }, $EXTENSION_CLASS_DESCRIPTOR->scriptMarkup()Z
                move-result v0
                if-nez v0, :boosts_own
                return-object p1
                :boosts_own
                nop
            """,
        )

        /*
         * A wiki page, which Tildes has for most of its groups and Boost has a
         * screen for already. The screen came from Boost's Reddit ancestor and
         * only half of it survived: the Activity is in the manifest and the
         * layout is whole, while the presenter that fetched a page was shrunk
         * away with the rest of the Reddit API. What is left starts a spinner
         * that never stops over a text view nothing fills.
         *
         * So both halves are put back. This one is the way in, at the head of
         * the method every tapped link goes through, and the extension answers
         * whether it took the link. A wiki link on tildes.net is taken and
         * everything else falls through to Boost's own routing, which is what
         * leaves an ordinary link opening exactly as it did.
         *
         * **A tag link is asked about at the same head**, and the same way: the
         * tags under a topic's body are links to tildes.net's own filtered
         * listings now, and `openTag` opens one on the screen Boost draws a
         * community on. **And a group with its subgroups after it**, which is
         * the row this patch adds to a group's own sidebar and the same kind of
         * filtered listing. No two of the three can answer yes -- a wiki page, a
         * tag listing and `?all_subgroups=true` are different URLs -- so the
         * order between them is only the order they read in.
         *
         * The parameters arrive above v15 in a method this size, so the calls
         * are the range form. `v0` is free to clobber: the method's own first
         * instruction writes it before reading it.
         */
        linkRouterFingerprint.method.addInstructionsWithLabels(
            0,
            """
                invoke-static/range { p0 .. p1 }, $EXTENSION_CLASS_DESCRIPTOR->openWiki(Landroid/content/Context;Ljava/lang/String;)Z
                move-result v0
                if-nez v0, :taken
                invoke-static/range { p0 .. p1 }, $EXTENSION_CLASS_DESCRIPTOR->openTag(Landroid/content/Context;Ljava/lang/String;)Z
                move-result v0
                if-nez v0, :taken
                invoke-static/range { p0 .. p1 }, $EXTENSION_CLASS_DESCRIPTOR->openSubgroups(Landroid/content/Context;Ljava/lang/String;)Z
                move-result v0
                if-eqz v0, :boosts_own
                :taken
                return-void
                :boosts_own
                nop
            """,
        )

        /*
         * And **Open in browser** on one of the site's own addresses, which
         * landed back in the app.
         *
         * The row is in the dialog **Permalink** opens, and a long-pressed link
         * opens the same one. It calls the method that reads the browser
         * preference, and two of that preference's three answers are an
         * `ACTION_VIEW` intent -- a Custom Tab is one with extras on it, and it
         * is the default. `tildesAddressesPatch` puts both of the site's hosts
         * in the manifest, so with the phone set to let Boost have those links
         * the intent came straight back: the deep-link activity read the
         * address and opened the comment the dialog was shown over.
         *
         * So the call is asked first. The extension opens the built-in browser
         * for a tildes.net address and answers null, and anything else comes
         * back as it went in for Boost's own call to take -- which is the
         * instruction below, kept rather than rewritten, so a link to any other
         * site opens exactly as it did.
         *
         * **Not the method itself, which is why this is here rather than at its
         * head.** A link *tapped* in a body reaches the same method through the
         * pair of "route it or browse it", and there the bounce is what opens it
         * in the app: none of the four Lemmy shapes matches a Tildes path, so
         * the address falls out to this browser call and comes back through the
         * manifest. A hook one method along would open a topic in a WebView.
         *
         * Two calls in here go to that class with a context and an address. One
         * is the tapped-link router the hook above already sits at, and this is
         * the other. `v0` holds the address and the next instruction writes it
         * again, so writing the answer back over it costs no register -- which
         * matters, since a method this size has none to spare.
         */
        openLinkDialogFingerprint.method.apply {
            val navigation = linkRouterFingerprint.classDef.type
            val router = linkRouterFingerprint.method.name

            val instructions = implementation!!.instructions.toList()
            val browserCalls = instructions.indices.filter { at ->
                instructions[at].opcode == Opcode.INVOKE_STATIC &&
                    instructions[at].getReference<MethodReference>()?.let {
                        it.definingClass == navigation &&
                            it.returnType == "V" &&
                            it.name != router &&
                            it.parameterTypes.map(CharSequence::toString) ==
                            listOf("Landroid/content/Context;", "Ljava/lang/String;")
                    } == true
            }

            val at = browserCalls.singleOrNull()
                ?: throw PatchException(
                    "${browserCalls.size} browser calls in $name rather than one",
                )

            val call = getInstruction<FiveRegisterInstruction>(at)
            val context = call.registerC
            val address = call.registerD
            val browse = call.getReference<MethodReference>()
                ?: throw PatchException("$name calls the browser through nothing")

            addInstructionsWithLabels(
                at,
                """
                    invoke-static { v$context, v$address }, $EXTENSION_CLASS_DESCRIPTOR->browserFor(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
                    move-result-object v$address
                    if-eqz v$address, :opened
                    invoke-static { v$context, v$address }, ${browse.definingClass}->${browse.name}(Landroid/content/Context;Ljava/lang/String;)V
                    :opened
                    nop
                """,
            )

            // The five above go in front of it, so Boost's own call is the sixth
            // and it is the copy inside them that runs now.
            removeInstruction(at + 5)
        }

        /*
         * And the other half, where that screen hands back the view it just
         * inflated. The fragment carries the group and the page it was started
         * for, the root carries the text view to fill, and the extension does
         * the fetch on a thread of its own.
         *
         * At the `return-object` rather than at the head, since the root is
         * what the method builds and the extension needs it bound.
         */
        wikiFragmentFingerprint.method.apply {
            val returns = implementation!!.instructions
                .withIndex()
                .filter { (_, instruction) -> instruction.opcode == Opcode.RETURN_OBJECT }
                .map { (index, _) -> index }

            if (returns.size != 1) {
                throw PatchException("the wiki screen has ${returns.size} views to hook")
            }

            val root = getInstruction<OneRegisterInstruction>(returns.single()).registerA
            if (root > 15) throw PatchException("the wiki root is in v$root")

            addInstructions(
                returns.single(),
                "invoke-static { p0, v$root }, " +
                    "$EXTENSION_CLASS_DESCRIPTOR->wikiPage(Ljava/lang/Object;Landroid/view/View;)V",
            )
        }

        /*
         * The unread badge, which was an hour behind whatever Tildes said.
         *
         * `/user/unread_count` has exactly one caller in the whole app: a
         * WorkManager job on a **sixty-minute** period. Nothing in the app ever
         * asks -- not a screen being built, not a tab being switched, not a
         * feed being pulled down. So a notification arriving on the site turned
         * up in Boost when that job next ran and its Android notification
         * arrived, and refreshing the front page until then did nothing at all,
         * which is the bug this answers.
         *
         * Every badge in the app is drawn from one method: `InboxCount.a()`,
         * which adds the three numbers that job last stored. The interceptor
         * reads what is waiting off the header of **every page** Tildes serves
         * (see `Tildes.unreadCounts`), so the number is already here and fresh;
         * this is what puts it on the screen instead of the stored one.
         *
         * **The class is taken off the signature rather than named.** It is two
         * letters after R8 and nothing about it survives a release, so it is
         * whatever the method that asks for the counts hands back, and the
         * accessor is its only method taking nothing and answering an `int`.
         *
         * A screen resuming is what repaints it -- the drawer redraws the badge
         * in `onResume` and on a broadcast the interceptor cannot send -- so
         * the number lands on the next screen rather than under the finger that
         * pulled. `pj.i0.Z`, which is the broadcast, is the seam if that turns
         * out not to be soon enough.
         */
        mutableClassDefBy(unreadCountFingerprint.method.returnType)
            .methods.single { it.parameterTypes.isEmpty() && it.returnType == "I" }
            .addInstructionsWithLabels(
                0,
                """
                    invoke-static { }, $EXTENSION_CLASS_DESCRIPTOR->inboxTotal()I
                    move-result v0
                    if-ltz v0, :boosts_own
                    return v0
                    :boosts_own
                    nop
                """,
            )
    }
}

/**
 * Which field an instruction reads or writes, as a string, so a copy can be
 * recognised by the pair around it without comparing two reference objects
 * that need not be the same kind of thing.
 */
private fun Instruction.fieldKey(): String? =
    ((this as? ReferenceInstruction)?.reference as? FieldReference)
        ?.let { it.definingClass + "." + it.name }

/** What the method putting a refreshed topic on screen takes. */
private val REFRESH_PARAMETERS = listOf(
    SUBMISSION_MODEL_CLASS,
    "Ljava/util/ArrayList;",
    "Z",
    "I",
)

/** The two things the topic screen carries over a refresh: a vote and a bookmark. */
private const val TOPIC_CARRIED_OVER = 2

/**
 * The two reads of `locked` in the reply gate: the topic's, then the one the
 * reply was started from. Pinned so a release that adds a third says so here
 * rather than leaving one of them unhooked and half the gate behaving as it did.
 */
private const val REPLY_GATE_LOCKED_READS = 2

/**
 * The hook both subscription lists go through: the drawer's rows and the
 * **Go to...** screen's. Each reads the same hidden flag off the same model,
 * and each gets the same answer back with one more row hidden.
 */
private const val SUBSCRIPTION_HIDDEN_HOOK = "subscriptionHidden(ZLjava/lang/Object;)Z"

/** What a field copy looks like: one of these, straight after one of [COPY_READS]. */
private val COPY_WRITES = setOf(Opcode.IPUT, Opcode.IPUT_BOOLEAN)

private val COPY_READS = setOf(Opcode.IGET, Opcode.IGET_BOOLEAN)

/**
 * How many classes have to listen for a pull to refresh before the hook is
 * believed. Ten of Boost's own screens implement it and the topic screen's
 * listener is an eleventh with no name of its own, so a number well under that
 * means the interface was found and the implementations were not.
 */
private const val REFRESH_LISTENERS = 8

/**
 * Where an injection goes after the call at [index]: past its `move-result`
 * where it has one, and straight after the call where it does not.
 *
 * A `move-result` is not an instruction that can stand on its own. It reads the
 * result register the call before it left behind, so anything put between the
 * two orphans it, and the verifier rejects the whole class at load with
 * `copyRes1 v4 <- result0 type=Conflict`. That is a crash on opening the screen
 * rather than a screen that looks wrong, and it assembles cleanly: the account
 * editor shipped that way once, because `ButterKnife.bind` answers with the
 * unbinder that screen keeps while the one under the markdown toolbar throws
 * its answer away.
 */
private fun MutableMethod.afterTheResultOf(index: Int): Int =
    if (getInstruction(index + 1).opcode in MOVE_RESULTS) index + 2 else index + 1

/** The three ways a call's answer is taken out of the result register. */
private val MOVE_RESULTS = setOf(
    Opcode.MOVE_RESULT,
    Opcode.MOVE_RESULT_WIDE,
    Opcode.MOVE_RESULT_OBJECT,
)

/**
 * Adds Tildes' own answer beside Boost's to "may this account edit this topic".
 *
 * Boost asks the model, gets "the author is me", and skips a block when the
 * answer is no. This leaves that call and that answer alone and puts a second
 * question in front of the jump: where Boost said yes, nothing runs at all, and
 * where it said no the extension gets to say whether Tildes drew a **Tag**
 * button on the page. So the worst this can do to an account it has nothing to
 * say about is cost it four instructions.
 *
 * **The model has to be read twice.** Both call sites load it into the register
 * the answer then lands in, so by the time the jump is reached the model is
 * gone -- which is why [ownTopicGuards] insists on the `iget-object` in front:
 * it is where the field to read again comes from. Reading it back into that
 * same register costs none of its own, and the verifier is happy because the
 * two paths meet as one boolean, the same shape the comment fold is written in.
 *
 * The refusal is [atEveryReturn]'s: an injection in front of an instruction
 * something jumps to is silently skipped, so a jump landing on the `if` would
 * leave this assembling, verifying and doing nothing.
 */
private fun MutableMethod.offerTagging(ownedByMe: String, hook: String) {
    val guard = ownTopicGuards(ownedByMe).singleOrNull()
        ?: throw PatchException(
            "$name does not ask $ownedByMe who wrote it exactly once: " +
                implementation!!.instructions.joinToString(" ") { it.opcode.name },
        )

    val load = getInstruction<Instruction22c>(guard.load)
    val field = load.getReference<FieldReference>()!!
    val owner = load.registerB
    val answer = getInstruction<OneRegisterInstruction>(guard.ask + 1).registerA

    // `iget-object` and `invoke-static` both take four-bit registers, so a
    // method that had spilled these past v15 would need the range form and a
    // move. Neither does today, and a release where one did would fail here
    // rather than assemble something that reads the wrong register.
    if (owner > 15 || answer > 15) {
        throw PatchException("$name keeps the topic in v$owner and the answer in v$answer")
    }

    val instructions = implementation!!.instructions.toList()
    val offsets = mutableListOf<Int>()
    instructions.fold(0) { offset, instruction ->
        offsets.add(offset)
        offset + instruction.codeUnits
    }
    val targets = instructions.withIndex()
        .mapNotNull { (index, instruction) ->
            (instruction as? OffsetInstruction)?.let { offsets[index] + it.codeOffset }
        }
        .toSet()
    if (offsets[guard.ask + 2] in targets) {
        throw PatchException("$name jumps to the guard this would inject before")
    }

    addInstructionsWithLabels(
        guard.ask + 2,
        """
            if-nez v$answer, :boosts_own
            iget-object v$answer, v$owner, ${field.definingClass}->${field.name}:${field.type}
            invoke-static { v$answer }, $EXTENSION_CLASS_DESCRIPTOR->$hook(Ljava/lang/Object;)Z
            move-result v$answer
            :boosts_own
            nop
        """,
    )
}

/**
 * Injects at every `return-void` a method has, backwards so each insert leaves
 * the ones still to come where they were measured.
 *
 * Two of the hooks above want the end of a method rather than the start, and
 * one of those methods has more than one end: `PostActivity.onCreate` returns
 * early when its ViewModel cannot be built. Hooking the first return alone is a
 * hook that never fires on the path that matters, and that failure is silent.
 *
 * **A return that something jumps to cannot be hooked this way**, which is the
 * check below and the reason it is there. An insert goes in front of the
 * `return-void` while a branch keeps pointing at the `return-void` itself, so
 * the jump lands past the injection: on a loop that exits by jumping to the
 * end, the hook is unreachable and the method assembles, verifies and runs
 * exactly as it did before. `FormattingBar` was that shape and the
 * attach-image button was never hidden. So this refuses rather than answering
 * silently, and a method of that shape wants a point above it that every path
 * goes through.
 */
private fun MutableMethod.atEveryReturn(smali: String) {
    val instructions = implementation!!.instructions.toList()
    val (offsets, targets) = branches()

    val returns = instructions.withIndex()
        .filter { (_, instruction) -> instruction.opcode == Opcode.RETURN_VOID }
        .map { (index, _) -> index }

    if (returns.isEmpty()) throw PatchException("$name has no return to hook")

    returns.firstOrNull { offsets[it] in targets }?.let {
        throw PatchException("$name jumps to the return this would inject before")
    }

    returns.asReversed().forEach { index -> addInstructions(index, smali) }
}

/**
 * The same for a method answering an object, which is a different opcode and a
 * different `move-result`.
 *
 * Carries [atEveryReturn]'s refusal with it: a `return` something jumps to
 * cannot be hooked by inserting in front of it, since the jump lands past what
 * was inserted and the method answers exactly as it did before. Both methods
 * that name a person are that shape, which is why they are answered at the head
 * instead.
 */
private fun MutableMethod.atEveryObjectReturn(hook: String) {
    val instructions = implementation!!.instructions.toList()

    val offsets = mutableListOf<Int>()
    instructions.fold(0) { offset, instruction ->
        offsets.add(offset)
        offset + instruction.codeUnits
    }
    val targets = instructions.withIndex()
        .mapNotNull { (index, instruction) ->
            (instruction as? OffsetInstruction)?.let { offsets[index] + it.codeOffset }
        }
        .toSet()

    val returns = instructions.withIndex()
        .filter { (_, instruction) -> instruction.opcode == Opcode.RETURN_OBJECT }
        .map { (index, _) -> index }

    if (returns.isEmpty()) throw PatchException("$name has no object to hook")

    returns.firstOrNull { offsets[it] in targets }?.let {
        throw PatchException("$name jumps to the return this would inject before")
    }

    returns.asReversed().forEach { index ->
        val value = getInstruction<OneRegisterInstruction>(index).registerA
        addInstructions(
            index,
            """
                invoke-static { v$value }, $hook
                move-result-object v$value
            """,
        )
    }
}

/**
 * Rewrites the value at every `return` a method has, by handing it to [hook] and
 * returning what comes back.
 *
 * Backwards, like [atEveryReturn], so each insert leaves the ones still to come
 * where they were measured. The one method this is for answers the number of
 * tabs on the Groups page with a `return` per branch rather than one at the end.
 */
private fun MutableMethod.atEveryValueReturn(hook: String) {
    val returns = implementation!!.instructions
        .withIndex()
        .filter { (_, instruction) -> instruction.opcode == Opcode.RETURN }
        .map { (index, _) -> index }

    if (returns.isEmpty()) throw PatchException("$name has no value to hook")
    returns.asReversed().forEach { index ->
        val value = getInstruction<OneRegisterInstruction>(index).registerA
        addInstructions(
            index,
            """
                invoke-static { v$value }, $hook
                move-result v$value
            """,
        )
    }
}

/**
 * Shows [hook] whatever a method is about to hand back, without letting it
 * change it: the hook is passed the object and answers nothing.
 *
 * The other way round from [atEveryObjectReturn], which rewrites the value, and
 * the reason is the type. A hook that replaced the value would have to declare
 * the method's own return type to satisfy the verifier, and this one is handed
 * a fragment class the extension cannot name.
 *
 * Backwards, like the rest, so each insert leaves the ones still to come where
 * they were measured. `/range` because the value is in whatever register the
 * method left it in, and a plain `invoke` addresses only the first sixteen.
 */
/**
 * Where every instruction in the method starts, and every offset something
 * branches to.
 *
 * An injection is only safe at a point nothing jumps to. Otherwise the branch
 * keeps pointing at the offset the original instruction moved to, the jump
 * lands past what was injected, and the method assembles, verifies and runs
 * exactly as it did before -- which is a hook that never fires and says
 * nothing. `PITFALLS.md` has the one that shipped that way.
 *
 * Offsets rather than indices, because that is what a branch carries.
 */
private fun MutableMethod.branches(): Pair<List<Int>, Set<Int>> {
    val instructions = implementation!!.instructions.toList()

    val offsets = mutableListOf<Int>()
    instructions.fold(0) { offset, instruction ->
        offsets.add(offset)
        offset + instruction.codeUnits
    }
    val targets = instructions.withIndex()
        .mapNotNull { (index, instruction) ->
            (instruction as? OffsetInstruction)?.let { offsets[index] + it.codeOffset }
        }
        .toSet()

    return offsets to targets
}

/** Whether anything in the method branches to the instruction at [index]. */
private fun MutableMethod.isJumpedTo(index: Int): Boolean {
    val (offsets, targets) = branches()
    return offsets[index] in targets
}

/** Whether an instruction is the app asking `TextUtils` if something is empty. */
private fun Instruction.asksIfEmpty(): Boolean =
    opcode == Opcode.INVOKE_STATIC &&
        getReference<MethodReference>()?.let {
            it.definingClass == TEXT_UTILS_CLASS && it.name == "isEmpty"
        } == true

/**
 * Answers one of those, by handing Boost's answer and the screen it was asked on
 * to the extension and branching on what comes back.
 *
 * The answer's own register is reused, so the branch under it is untouched and
 * nothing else in the method can tell. [at] is where the call goes, and it
 * defaults to straight past the `move-result` -- the one caller that passes it
 * has the screen to read out of a field first.
 */
private fun MutableMethod.answerIsEmpty(empty: Int, screen: String, at: Int = empty + 2) {
    val result = getInstruction(empty + 1)
    if (result.opcode !in MOVE_RESULTS) {
        throw PatchException("$name throws away whether the body was empty")
    }
    if (isJumpedTo(at)) throw PatchException("$name jumps past where the answer would go")

    val answer = (result as OneRegisterInstruction).registerA
    // Where the call goes later than the answer arrives, nothing in between may
    // have written over it, or the hook would be handed something else.
    if ((empty + 2 until at).any { getInstruction<OneRegisterInstruction>(it).registerA == answer }) {
        throw PatchException("$name writes over whether the body was empty")
    }

    addInstructions(
        at,
        """
            invoke-static { v$answer, $screen }, $EXTENSION_CLASS_DESCRIPTOR->$BODY_IS_BLANK_HOOK
            move-result v$answer
        """,
    )
}

/**
 * The register holding `this`, for a hook that needs the screen it is standing
 * on.
 *
 * A plain `invoke-static` names v0 to v15 and nothing above, and the assembler
 * answers an empty instruction list rather than an error when it is handed
 * something wider. Wide parameters take two registers each, so the count is
 * built rather than taken off the parameter list. See PITFALLS.md.
 */
private fun MutableMethod.thisRegister(): String {
    val incoming = parameterTypes.sumOf { if (it == "J" || it == "D") 2 else 1 } + 1
    val register = implementation!!.registerCount - incoming
    if (register > 15) throw PatchException("$name holds itself in v$register, out of reach")
    return "v$register"
}

/** What a draft hook is called on the extension, and what it answers. */
private const val DRAFT_SAVED_HOOK =
    "draftSaved(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;"

private const val DRAFT_ROW_HOOK = "draftRow(Ljava/lang/String;)Ljava/lang/String;"

/**
 * The one all three empty-body questions go through, since all three are the
 * same question about the same screen.
 */
private const val BODY_IS_BLANK_HOOK = "bodyIsBlank(ZLjava/lang/Object;)Z"

/**
 * Just before the one `return-void` a straight-line method ends on.
 *
 * An injection in front of a return something jumps to is unreachable and looks
 * fine otherwise, so both halves are checked rather than assumed: one way out,
 * and nothing branching to it. See `PITFALLS.md`.
 */
private fun MutableMethod.beforeTheOnlyReturn(hook: String) {
    val returns = implementation!!.instructions
        .withIndex()
        .filter { (_, instruction) -> instruction.opcode == Opcode.RETURN_VOID }
        .map { (index, _) -> index }

    val index = returns.singleOrNull()
        ?: throw PatchException("$name comes back ${returns.size} ways")
    if (isJumpedTo(index)) throw PatchException("$name branches to its own return")
    addInstructions(index, hook)
}

private fun MutableMethod.beforeEveryObjectReturn(hook: String) {
    val returns = implementation!!.instructions
        .withIndex()
        .filter { (_, instruction) -> instruction.opcode == Opcode.RETURN_OBJECT }
        .map { (index, _) -> index }

    if (returns.isEmpty()) throw PatchException("$name hands nothing back")
    returns.asReversed().forEach { index ->
        val value = getInstruction<OneRegisterInstruction>(index).registerA
        addInstructions(index, "invoke-static/range { v$value .. v$value }, $hook")
    }
}
