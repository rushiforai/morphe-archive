# Swipe-up fix — session handoff notes

> **SOLVED.** A runtime stack trace (temporary redirect of every `showSoftInput` /
> `requestFocus` call site to a logging wrapper) showed the real path:
> `ReelViewGroup.onTouchEvent → GestureDetector → 07ZW/0B8k.onScroll → 0B8P.GOW`
> (the swipe-up dispatcher that fans out over a listener Set) `→ 0Bs2.GOW → 0Bs2.GdW →`
> coroutine `→ 0C7h.emit → 0ATK.A0E → requestFocus + 08lq.A0t → showSoftInput`.
> 0Bs2 (the viewer controller) was never gated. The fix is one entry guard on
> `0B8P.GOW` returning false (StorySwipeUpFingerprint in CommentsAndScrollPatch).
> Verified on device: no keyboard/reply bar/emoji on photo + video stories, toggle
> off restores stock, tap on the reply bar still opens the keyboard, no crashes.
> Everything below is the history of the hunt.

Working notes for the next session working on Piko #2134 (kill the story-viewer
swipe-up gesture). Untracked on purpose — do not commit without asking.
Everything below was verified against Instagram 453.0.0.55.79 on the test phone.

## Mission

Kill the swipe-up gesture in the story viewer (it opens the reply composer,
quick-reaction emoji bar and keyboard; users hit it by accident instead of
left/right). Toggle: `block_story_swipe_up`, was on by default, Blocked surfaces,
lockable. The full feature (toggle + 5 layered hooks) is implemented and works
EXCEPT the keyboard — commit `5cdaeaa` has it; `65647bd` parked it because a
keyboard with no visible input target is worse than stock. Restore with
`git revert 65647bd` (or cherry-pick) once the keyboard is solved.

## Environment

- Phone: Xiaomi M2102K1G, Android 13, arm64. Wireless adb: just run `adb devices`
  (mdns auto-connect, shows as `adb-d6f85095-eMo9pC._adb-tls-connect._tcp`).
- Installed on phone: `com.instagram.android.oxbow` (the clone, currently the
  REVERTED build = stock story behavior), logged in, sits beside the user's real
  Morphe-patched 452 (`com.instagram.android` — never touch).
- Build+install loop (env vars are REQUIRED for gradle):
  ```sh
  cd /home/ezflow/coding/oxbow
  export ANDROID_HOME=$HOME/Android/Sdk GITHUB_ACTOR="$(gh api user --jq .login)" GITHUB_TOKEN="$(gh auth token)"
  ./build.sh com.instagram.android_453*.apkm --clone   # 16 "INFO: Applied" = ok
  adb install -r oxbow-clone.apk
  adb logcat -c && adb shell monkey -p com.instagram.android.oxbow -c android.intent.category.LAUNCHER 1
  ```
  GOTCHA: after editing `Scroll.java` (extension), the mpp can package a STALE
  extension dex. If a new extension method throws NoSuchMethodError on device,
  run `./gradlew :extensions:extension:compileReleaseJavaWithJavac :patches:build`
  and verify the mpp before installing:
  `unzip -p patches/build/libs/patches-1.0.1.mpp extensions/extension.mpe | strings | grep <newMethodName>`
- Decompile for static work (~2.5 min, /tmp does not survive reboots):
  ```sh
  java -jar tools/APKEditor-1.4.9.jar d -i build/merged/com.instagram.android_453*.apk -o /tmp/dec453 -no-dex-debug -res-dir res
  ```
  (build/merged contains the APKEditor-merged 453 apk; build.sh recreates it.)
- Method dumper (prints smali-level instructions with registers straight from an
  apk — dexlib2 from the morphe jar, single-file java): `/tmp/DumpA02.java`.
  Usage: `java -cp tools/morphe-desktop-1.18.1-all.jar /tmp/DumpA02.java <apk> "LX/...;" "<method>" <from> <to>`.
  If /tmp is gone, the full source is appended at the bottom of this file.
- Screenshots: `adb exec-out screencap -p > /tmp/x.png` then Read. Story tray
  avatars sit at y≈444; stories advance by tapping right side (950,1150);
  Oxbow settings = long-press Messages tab (hold 403,2297 ~1s), Done = (777,2256).
  BEWARE: (324,2186) is the permanent-lock button on the settings page — never tap.
- The IME log line that fires when the keyboard opens:
  `InputMethodManager: showSoftInput() view=IgEditText{... app:id/reel_viewer_message_composer_text ...}`

## What the swipe-up does (453 architecture)

- Story viewer = `Linstagram/features/stories/fragment/ReelViewerFragment;`
  (named path, 52k lines). Implements `LX/0mft` (drag listener): FRR (start),
  FRp (per-frame — drives the reply-bar height from the drag spring), FRx
  (drag release — dismiss/dispatch), FSF (fling — down-dismiss), GHt, GVF.
- Drag spring: `X/0C59` (+ `X/0CnJ` pinch subclass). Spring Y = reply-bar height
  in px while dragging up (POSITIVE, not signed).
- `X/0CwQ` = dismiss/peek controller (thresholds A00/A01/A05, flags A02/A03).
- `X/0QE2` = drag-release data (A00 x-spring, A01 y-spring, A05 y-velocity...).
- `X/0B8L` per-story drag state; `X/0C4m` reply config; `X/0ATK` composer
  controller (field A00 = the composer IgEditText; constructor calls
  setShowSoftInputOnFocus(false); A0F(Z) expands); `X/0ATR` bar holder
  (A06(Z) expand/collapse, A04 emoji-reveal animation); `X/0MfU` reaction
  coordinator (GbV/GbW); `X/02OY` static funnel — **A06(02OY,Z)V opens the
  composer** (gated — keyboard still appeared); `X/02Oq` bar drag state;
  `X/0KEj` the BAR's OnTouchListener (avatar-drag reaction gesture; its
  ACTION_UP calls 02OY.A06 — gated; media-area swipes never hit it).
- `X/07V3` composer-bar binder: attaches to the story media view
  `setOnTouchListener(new 02N1(new GestureDetector(ctx, new 0KjY(...))))` where
  the 0KjY gesture listener fires lambdas `0KUz` tags **0x0b** (collapse?) and
  **0x0c** (requestFocus + `imm.showSoftInput(editText, 1)` — the keyboard).
- Delegates (one per story type): `0Bz0` = ReelViewerItemDelegateImpl (photo
  stories; GOW = swipe-up handler, contains "swipe_up" ×3, analytics origin
  string "ReelViewerItemDelegateImpl"), 0BzR/0BzS/0Byx/0By2/0MhW = other types
  (their GOWs just forward via interface `LX/0NbG;->GOW`). Family interface:
  `LX/0NfH`. `0Bs2` (38k lines) is the stories dashboard/tray controller — its
  own GOW logs "story_swipe_up".
- Keyboard helpers: `X/08lq.A0Y(View)` = imm.toggleSoftInput (NOT called by
  ReelViewerFragment), `X/08lq.A0Z(View)` = requestFocus (called from A1E —
  lifecycle cleanup — and EJd).
- IME lambda: `X/0KUz` = Function0 switch-lambda, 43 instantiation sites; tag
  **0x0c** branch = requestFocus + imm.showSoftInput(editText, 1) for the
  composer (07V3 creates tags 0x0b and 0x0c). GATED — keyboard still appeared,
  so the swipe-up keyboard does NOT go through it.
- Composer/reaction view ids: reel_viewer_message_composer_container
  0x7f0b350d, reel_viewer_message_composer 0x7f0b350a,
  reel_viewer_message_composer_text 0x7f0b351b (IgEditText),
  reel_reaction_toolbar 0x7f0b34c0. Video/reel-share stories use
  `message_composer_container` + `composer_text` (different instances live in
  the pager — one per story page! findViewById(root) only returns the first).

## What was tried on device (each: built, installed, swiped up on a story)

1. FRx entry guard `if (dragY < 0) return` — no-op. Spring Y is the bar height
   (positive when dragging up).
2. FRx zeroing of QE2.A01 at entry — keyboard still opened. Either FRx is not
   the composer release decider, or thresholds are compared differently.
3. FRp skip (whole per-frame driver) — keyboard still opened.
4. 0KEj.onTouch: skip the 02OY.A06 call — irrelevant for media swipes (the bar
   listener never fires; media-area swipes go elsewhere).
5. 0Bz0.GOW swallow (return true at entry) — WORKED for video stories
   (sabella11: nothing happened) — photo stories (rajka, elvedin_si) still
   opened the keyboard. Only one delegate class was gated; the family members
   (0BzR/0BzS/0Byx/0By2/0MhW) forward via `0NbG.GOW`.
6. 02OY.A06 entry gate (the composer-open funnel) — keyboard still opened.
7. EJd gate (composer focus helper) — keyboard still opened.
8. 0KUz tag-0x0c branch gate (skip requestFocus+showSoftInput) — keyboard still
   opened. So the IME request happens OUTSIDE 0KUz.
9. View layer (current, kept in 65647bd? no — reverted): GlobalLayout tree-walk
   hiding reel_viewer_message_composer_container / message_composer_container /
   reel_viewer_message_composer / reel_reaction_toolbar + making both composer
   edit texts unfocusable. The bar and emoji row DID disappear; the keyboard
   still appeared. Android's imm.showSoftInput binds by window token — view
   visibility/focusability does not stop it.

⇒ Conclusion: the swipe-up keyboard is requested through a path none of the
  above cover. The IME dumpsys showed the served editor IS
  reel_viewer_message_composer_text (0x7f0b351b).

## Next steps (ordered by promise)

1. **Runtime stack capture.** Patch `com.instagram.common.ui.base.IgEditText`
   (named, stable class) — in `onFocusChanged`/`onCheckIsTextEditor`/or simply
   `onAttachedToWindow`, when `Config.isStorySwipeUpBlocked()` is true, log
   `Log.i("OxbowTrace", "ime", new Throwable())`. Install a --debug build, open
   a story, swipe up, read the stack from logcat — it names the exact caller
   chain of the focus/IME request. This is the decisive step; everything above
   was guessing the caller from smali.
2. Check `TextView;->setShowSoftInputOnFocus(Z)V` call sites with `const/4 ..., 0x1`
   near story classes — the swipe handler may re-enable IME-on-focus then focus.
3. `LX/0KjY` (the media-view GestureDetector listener created in 07V3.A01) —
   find its swipe-up branch and gate the lambda invocation there (not 0KUz).
4. If the caller turns out to be the fragment itself: gate the fragment method
   that calls it (ReelViewerFragment methods are findable via the named class
   + the action-string anchors listed above).

## Constraints reminder

- Internal packages stay com.feurstagram.*; don't rename.
- Don't break: swipe-down dismiss, tap-to-advance, left/right navigation,
  tap on the Send-message bar (ideally tap-reply survives; if impossible,
  say so and let the toggle hide replies entirely — but ASK the user first).
- Every hook must be toggle-gated (Config.isStorySwipeUpBlocked) and the
  toggle belongs in Blocked surfaces, lockable (block_ prefix gives that).
- Verify every hook at byte level in the built APK with DumpA02 before
  declaring it works, and then on the phone — "applied" has repeatedly meant
  nothing here (dead stores, wrong overloads, silent register drops).

## DumpA02.java (recreate at /tmp/DumpA02.java if missing)

See next message in the session history, or rewrite: it opens the apk zip,
iterates classes*.dex, dexlib2-loads each, finds classDef by type, lists the
named method's instructions (index, opcode, registers, reference).
Key imports are com.android.tools.smali.dexlib2.* from the morphe jar;
run with `java -cp tools/morphe-desktop-1.18.1-all.jar DumpA02.java ...`.

## DumpA02.java full source (copy to /tmp/DumpA02.java)

```java
import com.android.tools.smali.dexlib2.Opcodes;
import com.android.tools.smali.dexlib2.DexFileFactory;
import com.android.tools.smali.dexlib2.iface.DexFile;
import com.android.tools.smali.dexlib2.iface.ClassDef;
import com.android.tools.smali.dexlib2.iface.Method;
import com.android.tools.smali.dexlib2.iface.instruction.Instruction;
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction;
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction;
import java.io.File;
import java.util.zip.ZipFile;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;

public class DumpA02 {
    public static void main(String[] a) throws Exception {
        String apk = a[0];
        String clsName = a[1];
        String mName = a[2];
        int from = Integer.parseInt(a[3]);
        int to = a.length > 4 ? Integer.parseInt(a[4]) : Integer.MAX_VALUE;
        ZipFile zf = new ZipFile(new File(apk));
        List<java.util.zip.ZipEntry> list = new ArrayList<>();
        java.util.Enumeration<? extends java.util.zip.ZipEntry> en = zf.entries();
        while (en.hasMoreElements()) {
            var e = en.nextElement();
            if (e.getName().matches("classes.*\\.dex")) list.add(e);
        }
        for (var entry : list) {
            File tmp = File.createTempFile("dexdumpx", ".dex");
            try (var in = zf.getInputStream(entry); var out = new FileOutputStream(tmp)) {
                in.transferTo(out);
            }
            DexFile dex;
            try { dex = DexFileFactory.loadDexFile(tmp, Opcodes.getDefault()); }
            catch (Throwable t) { tmp.delete(); continue; }
            ClassDef cls = null;
            for (ClassDef c : dex.getClasses()) { if (c.getType().equals(clsName)) { cls = c; break; } }
            if (cls == null) { tmp.delete(); continue; }
            System.out.println("class " + clsName + " found in " + entry.getName());
            for (Method m : cls.getMethods()) {
                if (!m.getName().equals(mName)) continue;
                List<Instruction> insns = new ArrayList<>();
                for (Instruction insn : m.getImplementation().getInstructions()) insns.add(insn);
                int n = insns.size();
                System.out.println(mName + " insns=" + n + " range " + from + ".." + Math.min(n, to));
                for (int i = from; i < Math.min(n, to); i++) {
                    Instruction insn = insns.get(i);
                    String regs = "";
                    if (insn instanceof OneRegisterInstruction) regs = "v" + ((OneRegisterInstruction) insn).getRegisterA();
                    else if (insn instanceof TwoRegisterInstruction) regs = "v" + ((TwoRegisterInstruction) insn).getRegisterA() + ",v" + ((TwoRegisterInstruction) insn).getRegisterB();
                    else if (insn instanceof FiveRegisterInstruction) {
                        FiveRegisterInstruction f = (FiveRegisterInstruction) insn;
                        int[] rr = {f.getRegisterC(), f.getRegisterD(), f.getRegisterE(), f.getRegisterF(), f.getRegisterG()};
                        StringBuilder sb = new StringBuilder();
                        for (int r = 0; r < f.getRegisterCount(); r++) sb.append("v").append(rr[r]).append(" ");
                        regs = sb.toString();
                    } else if (insn instanceof RegisterRangeInstruction) {
                        var rr = (RegisterRangeInstruction) insn;
                        regs = "v" + rr.getStartRegister() + "..v" + (rr.getStartRegister() + rr.getRegisterCount() - 1);
                    }
                    String ref = "";
                    try { ref = ((ReferenceInstruction) insn).getReference().toString(); } catch (Throwable t2) {}
                    System.out.printf("%5d %-16s %-16s %s%n", i, insn.getOpcode().name(), regs, ref);
                }
            }
            tmp.delete();
            System.exit(0);
        }
        System.out.println("class not found");
    }
}
```
