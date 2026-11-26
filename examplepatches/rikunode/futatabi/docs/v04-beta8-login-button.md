# Board login button (3.1.1 ARM64)

The patch preserves the original catalog AppBar and its IconButton. It depends on Local board bridge and is enabled by default.

## Verified original paths

- CatalogAppBar::build: 0x86cf0c watches actuallyDisableRewardButtonProvider; 0x86cf10 skips the button on true. SVG load at 0x86cf78. Original tap closure at 0x86dfb8 calls showDialog at 0x86e008.
- The old visibility provider callback at 0x86e070 uses ProviderElementBase.watch at 0x86e0bc. The replacement watches openingCatalogUrlProvider via the existing getter 0x932f08 and keeps the same watch call site.
- The original client uses 0x25a0 for the current board provider; the AppBar already watches this provider with type arguments at PP+0xa70. The existing String comparison code at 0x446e58 confirms class IDs 94/95, tagged length at +7 and code units at +15.
- The click replaces the existing showDialog call at 0x86e008 with myLaunchUrl at 0x73b50c, retaining the frame, call position and valid tagged stack arguments. It uses the existing relative asset string assets/images/ad.svg as a reserved signal. The stock AppBar is the only identified original load of this string.
- myLaunchUrl with false and the two-argument descriptor follows the non-HTTP relative-URI path to URL launcher. The Pigeon launchUrl channel dispatches to Lh6/i;.e(String,Map). The injected native helper consumes just the reserved signal; all other URLs continue through the original method.
- The helper starts FutatabiHomeActivity explicitly, only from the focused MainActivity on its main thread. It does not authenticate or submit anything itself. The Google ads channel is not modified.
- This is not a new platform channel. The relative asset-path signal is reserved in the existing URL launcher, so that exact string is no longer sent to the external browser.
- Hash checks accept only the verified stock library or its exact banner-only output. The banner patch accepts only stock or the exact login-only output. Unknown input fails closed.

## Assembler source

Assembled with clang targeting aarch64-linux-gnu and ld.lld. PP=x27, Dart SP=x15, THR=x26, heap=x28, NULL=x22. The existing executable PT_LOAD maps these virtual addresses directly to file offsets. The two replaced regions are 208 bytes and 48 bytes.

```asm
.section .text.provider,"ax"
provider_patch:
 b provider_get
prefix:
 .ascii "http://127.0.0.1:18765/"
 .balign 4,0
 .org 0x1c
provider_get:
 bl opening_getter
 ldr x16,[x27,#0xa70]
 ldr x30,[x29,#0x10]
 stp x30,x16,[x15,#8]
 str x0,[x15]
 ldr x4,[x27,#0x58]
 bl provider_watch
 tbz x0,#0,hide
 ldur w1,[x0,#-1]
 ubfx w1,w1,#12,#20
 sub w1,w1,#94
 cmp w1,#1
 b.hi hide
 ldur w2,[x0,#7]
 cmp w2,#60
 b.ne hide
 add x0,x0,#15
 add w1,w1,#1
 adr x2,prefix
 mov w3,#30
loop:
 ldrb w4,[x0]
 tbz w1,#1,compare
 ldrh w4,[x0]
compare:
 cmp w3,#7
 b.ne match
 adr x2,suffix
 cmp w4,#109
 b.ne match
 add x2,x2,#7
match:
 ldrb w5,[x2],#1
 cmp w4,w5
 b.ne hide
 add x0,x0,x1
 subs w3,w3,#1
 b.ne loop
 add x0,x22,#0x30
 b done
hide:
 add x0,x22,#0x20
done:
 mov x15,x29
 ldp x29,x30,[x15],#16
 ret
suffix:
 .ascii "aimoge/mebuki/"
 .balign 4,0
 .org 0xd0

.section .text.tap,"ax"
tap_patch:
 ldur w0,[x1,#0xf]
 add x0,x0,x28,lsl #32
 stur x0,[x29,#-8]
 stp x22,x22,[x15,#8]
 str x0,[x15]
 add x1,x27,#0x18,lsl #12
 ldr x1,[x1,#0xa70]
 add x2,x22,#0x30
 ldr x4,[x27,#0xa0]
 nop
 nop
 bl launch_helper
```

Linker script:

```ld
SECTIONS {
 .text.tap 0x86dfdc : { *(.text.tap) }
 .text.provider 0x86e088 : { *(.text.provider) }
 opening_getter = 0x932f08;
 provider_watch = 0x6fc984;
 launch_helper = 0x73b50c;
}
```

## Evidence

- Stock: dd542fe3af5f266096e07f823da3880d3a6e7c771aa80afe6324137e63c5041a
- Banner-only: f46c85060c997990099d8a6848d119680346bccd84371d7e34c45ac66e18a5b0
- Login-only output APK: e6b90f17ae6ab4d9424d12e450f66ca14ce4b203fde6c70b4b6ee99dbd563efd
- All-seven output APK library: a076ce46ff02e598d1e8c183ef8306ce447ec1f5117e2198bcad379bd07ec5d7
- Output SVG: 233 bytes, 424a063f6ffb8072b6b5bba35e69f29ee3931f715fd6e91dd0f77d69479b76f8.
- AOT CPU gate: `python tests/verify_board_login_aot.py <verified-merged-apk>` (test-only dependency unicorn==2.1.4). 30 visibility cases, including both Dart string encodings, wrong boards, lookalike URLs, null and invalid class; one tap call/argument/frame-restoration test. Actual instruction bytes executed with getter/watch/launch calls mocked.
- Host Java dispatcher gate: 11 scenarios with Android stubs, including normal URL fall-through, wrong activity, null, no focus, destroyed/finishing, non-main-thread, launch failure and explicit Home launch.
- Morphe patcher: login-only selection and all seven named patches PASS. One-byte modified library rejected with PatchException; no output APK. Output aapt and classes3.dex read-back PASS.
- Real Flutter rendering, Riverpod rebuild timing, Dart asynchronous URL dispatch, and Android window focus/Activity transition have not been executed on a device. These are owner verification items, not claimed runtime PASS.
