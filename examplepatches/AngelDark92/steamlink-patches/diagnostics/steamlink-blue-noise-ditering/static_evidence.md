# Static evidence from the supplied decoded Steam Link APK

This report concerns the user-supplied ZIP only. It is not a claim about an untouched store APK, nor a runtime trace from a headset. No Android/XR device was connected or tested.

## Identity

- Archive metadata: versionName `2.0.20`, versionCode `5001712` (from `apktool.yml`).
- Package: `com.valvesoftware.steamlinkvr`.
- Native VR entry point: `android.app.NativeActivity`, `android.app.lib_name=vrlink_scene` (from `AndroidManifest.xml`).
- Native library: `lib/arm64-v8a/libvrlink_scene.so`.
- ELF architecture: AArch64. Dynamic C++ symbols and embedded GLSL are present; this is not original C++ source.
- Library length: 2221072 bytes.
- Library SHA-256: `80b62797c7e26d6b67b0cca00693b076a336bdb48ebc1383a16cccb1616ed495`.
- ZIP SHA-256: `3075ac8da0dd94395cec23477cb1d6534b6076b513db331e8433f73260d7ac05`.

Instruction addresses below are ELF virtual addresses relative to the module's load bias, not absolute process addresses. String offsets are file offsets. They are specific to this exact library. Disassembler labels for unnamed internal functions can inherit the preceding symbol's name; the report does not adopt those misleading labels as function identities.

## Principal findings

1. `QSVLRendererXR::SetupSwapchains` requests `0x8C43` for BOTH base and foveated per-eye swapchains. Khronos defines this value as `GL_SRGB8_ALPHA8`. Check actual creation success and arguments on the headset before relying on this path.
2. `QSVLRendererXR::FlipFrame` imports decoder hardware buffers through EGL and calls `SRGBCorrectionPass::RenderSpecific` for left/base, left/fovea, right/base, and right/fovea. The drawing routine attaches the supplied texture directly to the framebuffer.
3. `FlipFrame` calls `glDisable(0x8DB9)` before these draws and `glEnable(0x8DB9)` afterward. In GLES, the applicable control requires `GL_EXT_sRGB_write_control`; check support, GL errors, and state on-device.
4. The embedded fragment prefix uses `precision mediump float` and no explicit precision on `samplerExternalOES`. It contains a commented-out additive dither line, followed by fade multiplication. There is also a colour matrix; preserve it for the dither-only experiment rather than assuming it is stock or correct.
5. The prefix is copied with an explicit length of `0x43F` (1087 bytes), then a base or foveal suffix is appended. It is NOT a standalone fragment shader.
6. A remote-value handler reads shader text, logs `Loading shader ID`, and can replace both video shader objects through `Shader::ReloadWhenReady`. Patching only the embedded prefix is not a reliable live-stream modification.
7. Dispatch table at file offset `0xAD6C7`: ID 0 -> background-unimplemented branch; ID 1 -> correction-pass member +0x28 (fovea); ID 2 -> member +0x20 (base); ID 3 -> another scene object. Labels here follow the member uses in `RenderSpecific`; confirm IDs in actual connection logs.
8. The decoder requests `AIMAGE_FORMAT_PRIVATE` / GPU sampled-image usage. This does not establish decoded precision. Do not change it to RGBA8888 as a dither implementation.

## Embedded shader prefix (file offset 0x9B4B8, 1087 bytes)

```glsl
#version 300 es
        #extension GL_OES_EGL_image_external_essl3 : enable
        precision mediump float;

		in vec2 uvmask;
        in vec2 uv;
        out vec4 color;

        const float DIV12 = 1. / 12.92;
        const float DIV1 = 1. / 1.055;
        const float THRESHOLD = 0.04045;
        const vec3 GAMMA = vec3(2.4);

        layout(location = 2) uniform samplerExternalOES tex0;
		layout(location = 3) uniform float fFadeAmount;
		layout(location = 4) uniform vec3 UniReserved1;
		layout(location = 5) uniform vec4 UniReserved2;
		layout(location = 6) uniform vec4 UniDitherOffsets;

        void main()
        {
            vec2 realUv = vec2(uv.x, uv.y);

            color = texture(tex0, realUv);
			mat3 _valve1_d2020d709 = mat3(
				1.04988847,  0.05442289,  0.00393458,
				-0.04433306, 0.96052738, 0.01122383,
				-0.005557,   -0.01509698,  0.98628952 );
			color.rgb = _valve1_d2020d709 * color.rgb;
			//color.rgb += fract(UniDitherOffsets.a * .43 + UniDitherOffsets.rgb + gl_FragCoord.x * 1.67 + gl_FragCoord.y * 1.127 ) * .00292;
			color.rgb *= fFadeAmount;

```

## Base suffix, file offset 0x9D23D

```glsl

			color.a = 1.0;
        }

```

## Foveal suffix, file offset 0xA6582

```glsl

            vec2 placeInSection = fract(uvmask * vec2( 1.0, 4.0 ));
            vec2 distCenter = abs( placeInSection - 0.5 );
			float powv = 10.0;
			float edgecurve = 1.5;
			color.a = pow( 1.05 - (pow( distCenter.y*2.0, powv ) + pow( distCenter.x*2.0, powv )) * 1.06, edgecurve );
    }
    
```

## Relevant disassembly

### S1 — correction-pass constructor; two shader objects

```text
   f13f4:      	stp	x29, x30, [sp, #-0x50]!
   f13f8:      	str	x25, [sp, #0x10]
   f13fc:      	mov	x29, sp
   f1400:      	stp	x24, x23, [sp, #0x20]
   f1404:      	stp	x22, x21, [sp, #0x30]
   f1408:      	stp	x20, x19, [sp, #0x40]
   f140c:      	movi	v0.2d, #0000000000000000
   f1410:      	mov	x19, x0
   f1414:      	mov	w8, #0x3f800000         // =1065353216
   f1418:      	stp	xzr, xzr, [x0]
   f141c:      	mov	x21, x0
   f1420:      	fmov	v1.2s, #1.00000000
   f1424:      	mov	x23, x0
   f1428:      	movi	v2.2s, #0x6, lsl #8
   f142c:      	stp	q0, q0, [x0, #0x30]
   f1430:      	mov	x20, x0
   f1434:      	stur	q0, [x0, #0x49]
   f1438:      	str	q0, [x19, #0x20]!
   f143c:      	str	w8, [x0, #0x18]
   f1440:      	ldp	x8, x9, [x1]
   f1444:      	strb	wzr, [x0, #0x1c]
   f1448:      	str	d1, [x0, #0x10]
   f144c:      	str	x8, [x21, #0x60]!
   f1450:      	adrp	x8, 0x97000
   f1454:      	str	x9, [x0, #0x68]
   f1458:      	stp	xzr, xzr, [x1]
   f145c:      	str	q0, [x23, #0x70]!
   f1460:      	ldr	q1, [x8, #0x4f0]
   f1464:      	sub	x22, x23, #0x48
   f1468:      	stp	q0, q0, [x23, #0x40]
   f146c:      	stp	q0, q0, [x23, #0x20]
   f1470:      	str	q0, [x23, #0x10]
   f1474:      	str	q1, [x23, #0xd0]
   f1478:      	str	xzr, [x23, #0x60]
   f147c:      	str	d2, [x23, #0xe0]
   f1480:      	strh	wzr, [x23, #0xe8]
   f1484:      	mov	w0, #0x90               // =144
   f1488:      	bl	0x208960 <_Znwm@plt>
   f148c:      	mov	x24, x0
   f1490:      	adrp	x1, 0x21f000
   f1494:      	add	x1, x1, #0xbe0
   f1498:      	add	x2, x1, #0x38
   f149c:      	bl	0x208980 <_ZN6ShaderC1ERKNSt6__ndk112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEES8_@plt>
   f14a0:      	ldr	x25, [x19]
   f14a4:      	str	x24, [x19]
   f14a8:      	cbz	x25, 0xf14bc
   f14ac:      	mov	x0, x25
   f14b0:      	bl	0x208990 <_ZN6ShaderD1Ev@plt>
   f14b4:      	mov	x0, x25
   f14b8:      	bl	0x208900 <_ZdlPv@plt>
   f14bc:      	mov	w0, #0x90               // =144
   f14c0:      	bl	0x208960 <_Znwm@plt>
   f14c4:      	mov	x24, x0
   f14c8:      	adrp	x1, 0x21f000
   f14cc:      	add	x1, x1, #0xbc0
   f14d0:      	add	x2, x1, #0x70
   f14d4:      	bl	0x208980 <_ZN6ShaderC1ERKNSt6__ndk112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEES8_@plt>
   f14d8:      	ldr	x25, [x22]
   f14dc:      	str	x24, [x22]
   f14e0:      	cbz	x25, 0xf14f4
   f14e4:      	mov	x0, x25
   f14e8:      	bl	0x208990 <_ZN6ShaderD1Ev@plt>
   f14ec:      	mov	x0, x25
   f14f0:      	bl	0x208900 <_ZdlPv@plt>
   f14f4:      	ldr	x0, [x19]
   f14f8:      	bl	0x2089a0 <_ZN6Shader10LinkShaderEv@plt>
   f14fc:      	ldr	x0, [x22]
   f1500:      	bl	0x2089a0 <_ZN6Shader10LinkShaderEv@plt>
   f1504:      	add	x8, x20, #0x58
```

### S2 — static shader assembly; fixed prefix length and two suffixes

```text
   f1f78:      	mov	w0, #0x440              // =1088
   f1f7c:      	bl	0x208960 <_Znwm@plt>
   f1f80:      	adrp	x8, 0x97000
   f1f84:      	adrp	x1, 0x9b000 <typeinfo name for PanelPositionerPoint+0x3606>
   f1f88:      	add	x1, x1, #0x4b8
   f1f8c:      	mov	w2, #0x43f              // =1087
   f1f90:      	mov	x22, x0
   f1f94:      	ldr	q0, [x8, #0x460]
   f1f98:      	str	q0, [x19, #0x40]!
   f1f9c:      	str	x0, [x19, #0x10]
   f1fa0:      	bl	0x208940 <memcpy@plt>
   f1fa4:      	mov	x0, x21
   f1fa8:      	mov	x1, x19
   f1fac:      	mov	x2, x20
   f1fb0:      	strb	wzr, [x22, #0x43f]
   f1fb4:      	bl	0x208840 <__cxa_atexit@plt>
   f1fb8:      	add	x22, x19, #0x18
   f1fbc:      	adrp	x1, 0x9d000 <typeinfo name for PanelPositionerPoint+0x5606>
   f1fc0:      	add	x1, x1, #0x23d
   f1fc4:      	mov	x8, x22
   f1fc8:      	mov	x0, x19
   f1fcc:      	bl	0xf12f4 <PanelPositionerPoint::~PanelPositionerPoint()+0x4>
   f1fd0:      	mov	x0, x21
   f1fd4:      	mov	x1, x22
   f1fd8:      	mov	x2, x20
   f1fdc:      	bl	0x208840 <__cxa_atexit@plt>
   f1fe0:      	add	x22, x19, #0x30
   f1fe4:      	adrp	x1, 0xa6000 <typeinfo name for PanelPositionerPoint+0xe606>
   f1fe8:      	add	x1, x1, #0x582
   f1fec:      	mov	x8, x22
   f1ff0:      	mov	x0, x19
   f1ff4:      	bl	0xf12f4 <PanelPositionerPoint::~PanelPositionerPoint()+0x4>
   f1ff8:      	mov	x0, x21
   f1ffc:      	mov	x1, x22
   f2000:      	mov	x2, x20
   f2004:      	ldr	x23, [sp, #0x10]
   f2008:      	ldp	x20, x19, [sp, #0x30]
   f200c:      	ldp	x22, x21, [sp, #0x20]
   f2010:      	ldp	x29, x30, [sp], #0x40
   f2014:      	b	0x208840 <__cxa_atexit@plt>
```

### S3 — preparation; hot reload and replace blending

```text
   f1830:      	stp	x29, x30, [sp, #-0x20]!
   f1834:      	str	x19, [sp, #0x10]
   f1838:      	mov	x29, sp
   f183c:      	mov	x19, x0
   f1840:      	ldr	x0, [x0, #0x28]
   f1844:      	bl	0x208a70 <_ZN6Shader11CheckReloadEv@plt>
   f1848:      	cbnz	w0, 0xf1858 <SRGBCorrectionPass::RenderSpecificPrep()+0x28>
   f184c:      	ldr	x0, [x19, #0x20]
   f1850:      	bl	0x208a70 <_ZN6Shader11CheckReloadEv@plt>
   f1854:      	cbz	w0, 0xf1864 <SRGBCorrectionPass::RenderSpecificPrep()+0x34>
   f1858:      	add	x8, x19, #0x58
   f185c:      	mov	w9, #0x1                // =1
   f1860:      	stlrb	w9, [x8]
   f1864:      	add	x8, x19, #0x58
   f1868:      	ldarb	w8, [x8]
   f186c:      	tbz	w8, #0x0, 0xf1878 <SRGBCorrectionPass::RenderSpecificPrep()+0x48>
   f1870:      	mov	x0, x19
   f1874:      	bl	0x208a80 <_ZN18SRGBCorrectionPass20UpdateShaderUniformsEv@plt>
   f1878:      	mov	w0, #0xc11              // =3089
   f187c:      	bl	0x208a90 <glDisable@plt>
   f1880:      	adrp	x0, 0x9c000 <typeinfo name for PanelPositionerPoint+0x4606>
   f1884:      	mov	w1, #0xb2               // =178
   f1888:      	add	x0, x0, #0x9ea
   f188c:      	bl	0xf1628
   f1890:      	mov	w0, #0xb44              // =2884
   f1894:      	bl	0x208a90 <glDisable@plt>
   f1898:      	adrp	x0, 0x9c000 <typeinfo name for PanelPositionerPoint+0x4606>
   f189c:      	mov	w1, #0xb3               // =179
   f18a0:      	add	x0, x0, #0xa07
   f18a4:      	bl	0xf1628
   f18a8:      	mov	w0, #0xbe2              // =3042
   f18ac:      	bl	0x208aa0 <glEnable@plt>
   f18b0:      	adrp	x0, 0xa3000 <typeinfo name for PanelPositionerPoint+0xb606>
   f18b4:      	mov	w1, #0xb4               // =180
   f18b8:      	add	x0, x0, #0x671
   f18bc:      	bl	0xf1628
   f18c0:      	mov	w0, #0x1                // =1
   f18c4:      	mov	w1, wzr
   f18c8:      	mov	w2, #0x1                // =1
   f18cc:      	mov	w3, wzr
   f18d0:      	bl	0x208ab0 <glBlendFuncSeparate@plt>
   f18d4:      	adrp	x0, 0x97000
   f18d8:      	mov	w1, #0xb5               // =181
   f18dc:      	add	x0, x0, #0xa18
   f18e0:      	bl	0xf1628
   f18e4:      	mov	w0, #0x84c0             // =33984
   f18e8:      	bl	0x208ac0 <glActiveTexture@plt>
   f18ec:      	adrp	x0, 0xa4000 <typeinfo name for PanelPositionerPoint+0xc606>
   f18f0:      	mov	w1, #0xb6               // =182
   f18f4:      	add	x0, x0, #0x7d9
   f18f8:      	bl	0xf1628
   f18fc:      	ldr	x8, [x19, #0x60]
   f1900:      	ldp	w1, w0, [x8, #0xc]
   f1904:      	bl	0x208ad0 <glBindTexture@plt>
   f1908:      	adrp	x0, 0x9a000 <typeinfo name for PanelPositionerPoint+0x2606>
   f190c:      	mov	w1, #0xb8               // =184
   f1910:      	add	x0, x0, #0x99a
   f1914:      	bl	0xf1628
   f1918:      	ldr	s0, [x19, #0x14c]
   f191c:      	fmov	s1, #1.00000000
   f1920:      	mov	w8, #0x44800000         // =1149239296
   f1924:      	movi	d2, #0000000000000000
   f1928:      	fadd	s0, s0, s1
   f192c:      	fmov	s1, w8
   f1930:      	fcmp	s0, s1
   f1934:      	fcsel	s0, s0, s2, lt
   f1938:      	str	s0, [x19, #0x14c]
   f193c:      	ldr	x19, [sp, #0x10]
   f1940:      	ldp	x29, x30, [sp], #0x20
   f1944:      	ret
```

### S4 — RenderSpecific; output texture and distinct base/fovea paths

```text
   f1af4:      	stp	x29, x30, [sp, #-0x30]!
   f1af8:      	stp	x22, x21, [sp, #0x10]
   f1afc:      	mov	x29, sp
   f1b00:      	stp	x20, x19, [sp, #0x20]
   f1b04:      	mov	w21, w2
   f1b08:      	mov	w20, w1
   f1b0c:      	and	x8, x21, #0x1
   f1b10:      	mov	x19, x0
   f1b14:      	mov	w22, w3
   f1b18:      	add	x8, x0, x8, lsl #2
   f1b1c:      	mov	w0, #0x8ca9             // =36009
   f1b20:      	ldr	w1, [x8, #0x70]
   f1b24:      	bl	0x208b30 <glBindFramebuffer@plt>
   f1b28:      	adrp	x0, 0xa9000 <typeinfo name for PanelPositionerPoint+0x11606>
   f1b2c:      	mov	w1, #0xc1               // =193
   f1b30:      	add	x0, x0, #0xb37
   f1b34:      	bl	0xf1628
   f1b38:      	mov	w0, #0x8ca9             // =36009
   f1b3c:      	mov	w1, #0x8ce0             // =36064
   f1b40:      	mov	w2, #0xde1              // =3553
   f1b44:      	mov	w3, w22
   f1b48:      	mov	w4, wzr
   f1b4c:      	bl	0x208b40 <glFramebufferTexture2D@plt>
   f1b50:      	adrp	x0, 0x98000 <typeinfo name for PanelPositionerPoint+0x606>
   f1b54:      	mov	w1, #0xc7               // =199
   f1b58:      	add	x0, x0, #0x5f2
   f1b5c:      	bl	0xf1628
   f1b60:      	movi	d0, #0000000000000000
   f1b64:      	movi	d1, #0000000000000000
   f1b68:      	movi	d2, #0000000000000000
   f1b6c:      	movi	d3, #0000000000000000
   f1b70:      	bl	0x208b50 <glClearColor@plt>
   f1b74:      	mov	w0, #0x4000             // =16384
   f1b78:      	bl	0x208b60 <glClear@plt>
   f1b7c:      	ldr	x0, [x19, #0x28]
   f1b80:      	ldrb	w8, [x0, #0x34]
   f1b84:      	cbz	w8, 0xf1c60 <SRGBCorrectionPass::RenderSpecific(int, bool, unsigned int)+0x16c>
   f1b88:      	tbz	w21, #0x0, 0xf1c60 <SRGBCorrectionPass::RenderSpecific(int, bool, unsigned int)+0x16c>
   f1b8c:      	ldr	w8, [x19, #0x15c]
   f1b90:      	cmp	w8, #0x2
   f1b94:      	b.eq	0xf1c60 <SRGBCorrectionPass::RenderSpecific(int, bool, unsigned int)+0x16c>
   f1b98:      	bl	0x208ae0 <_ZNK6Shader10BindShaderEv@plt>
   f1b9c:      	mov	x0, x19
   f1ba0:      	ldr	x22, [x19, #0x28]
   f1ba4:      	bl	0x2088a0 <_ZN5Fader20GetCurrentFadeAmountEv@plt>
   f1ba8:      	mov	x0, x22
   f1bac:      	mov	w1, #0x3                // =3
   f1bb0:      	bl	0x208b70 <_ZN6Shader13SetUniformL1fEif@plt>
   f1bb4:      	ldrb	w8, [x19, #0x158]
   f1bb8:      	cbz	w8, 0xf1bcc <SRGBCorrectionPass::RenderSpecific(int, bool, unsigned int)+0xd8>
   f1bbc:      	ldr	x0, [x19, #0x20]
   f1bc0:      	add	x2, x19, #0x140
   f1bc4:      	mov	w1, #0x6                // =6
   f1bc8:      	bl	0x208b00 <_ZN6Shader15SetUniformLVec4EiPKf@plt>
   f1bcc:      	scvtf	s0, w20
   f1bd0:      	ldr	x0, [x19, #0x28]
   f1bd4:      	mov	w1, #0xc                // =12
   f1bd8:      	fadd	s0, s0, s0
   f1bdc:      	bl	0x208b70 <_ZN6Shader13SetUniformL1fEif@plt>
   f1be0:      	adrp	x0, 0xab000 <typeinfo name for PanelPositionerPoint+0x13606>
   f1be4:      	mov	w1, #0xd8               // =216
   f1be8:      	add	x0, x0, #0x247
   f1bec:      	bl	0xf1628
   f1bf0:      	ldr	s0, [x19, #0x15c]
   f1bf4:      	mov	w1, #0xd                // =13
   f1bf8:      	ldr	x0, [x19, #0x28]
   f1bfc:      	scvtf	s0, s0
   f1c00:      	bl	0x208b70 <_ZN6Shader13SetUniformL1fEif@plt>
   f1c04:      	adrp	x0, 0x98000 <typeinfo name for PanelPositionerPoint+0x606>
   f1c08:      	mov	w1, #0xd9               // =217
   f1c0c:      	add	x0, x0, #0x650
   f1c10:      	bl	0xf1628
   f1c14:      	ldr	w2, [x19, #0x150]
   f1c18:      	mov	w0, wzr
   f1c1c:      	ldr	w3, [x19, #0x154]
   f1c20:      	mov	w1, wzr
   f1c24:      	bl	0x208b80 <glViewport@plt>
   f1c28:      	adrp	x0, 0xa7000 <typeinfo name for PanelPositionerPoint+0xf606>
   f1c2c:      	mov	w1, #0xdd               // =221
   f1c30:      	add	x0, x0, #0x309
   f1c34:      	bl	0xf1628
   f1c38:      	mov	w0, #0x5                // =5
   f1c3c:      	mov	w1, wzr
   f1c40:      	mov	w2, #0x4                // =4
   f1c44:      	bl	0x208b90 <glDrawArrays@plt>
   f1c48:      	adrp	x0, 0x98000 <typeinfo name for PanelPositionerPoint+0x606>
   f1c4c:      	mov	w1, #0xde               // =222
   f1c50:      	add	x0, x0, #0xe70
   f1c54:      	bl	0xf1628
   f1c58:      	ldr	x0, [x19, #0x28]
   f1c5c:      	bl	0x208b10 <_ZN6Shader12UnbindShaderEv@plt>
   f1c60:      	ldr	x0, [x19, #0x20]
   f1c64:      	ldrb	w8, [x0, #0x34]
   f1c68:      	cbz	w8, 0xf1d4c <SRGBCorrectionPass::RenderSpecific(int, bool, unsigned int)+0x258>
   f1c6c:      	tbnz	w21, #0x0, 0xf1d4c <SRGBCorrectionPass::RenderSpecific(int, bool, unsigned int)+0x258>
   f1c70:      	bl	0x208ae0 <_ZNK6Shader10BindShaderEv@plt>
   f1c74:      	mov	x0, x19
   f1c78:      	ldr	x21, [x19, #0x20]
   f1c7c:      	bl	0x2088a0 <_ZN5Fader20GetCurrentFadeAmountEv@plt>
   f1c80:      	mov	x0, x21
   f1c84:      	mov	w1, #0x3                // =3
   f1c88:      	bl	0x208b70 <_ZN6Shader13SetUniformL1fEif@plt>
   f1c8c:      	ldrb	w8, [x19, #0x159]
   f1c90:      	cbz	w8, 0xf1ca4 <SRGBCorrectionPass::RenderSpecific(int, bool, unsigned int)+0x1b0>
   f1c94:      	ldr	x0, [x19, #0x20]
   f1c98:      	add	x2, x19, #0x140
   f1c9c:      	mov	w1, #0x6                // =6
   f1ca0:      	bl	0x208b00 <_ZN6Shader15SetUniformLVec4EiPKf@plt>
   f1ca4:      	scvtf	s0, w20
   f1ca8:      	fmov	s1, #1.00000000
   f1cac:      	fmov	s2, #2.00000000
   f1cb0:      	ldr	x0, [x19, #0x20]
   f1cb4:      	mov	w1, #0xc                // =12
   f1cb8:      	fmadd	s0, s0, s2, s1
   f1cbc:      	bl	0x208b70 <_ZN6Shader13SetUniformL1fEif@plt>
   f1cc0:      	adrp	x0, 0x97000
   f1cc4:      	mov	w1, #0xea               // =234
   f1cc8:      	add	x0, x0, #0xa50
   f1ccc:      	bl	0xf1628
   f1cd0:      	ldr	s0, [x19, #0x15c]
   f1cd4:      	mov	w1, #0xd                // =13
   f1cd8:      	ldr	x0, [x19, #0x20]
   f1cdc:      	scvtf	s0, s0
   f1ce0:      	bl	0x208b70 <_ZN6Shader13SetUniformL1fEif@plt>
   f1ce4:      	adrp	x0, 0xa8000 <typeinfo name for PanelPositionerPoint+0x10606>
   f1ce8:      	mov	w1, #0xeb               // =235
   f1cec:      	add	x0, x0, #0x5c7
   f1cf0:      	bl	0xf1628
   f1cf4:      	ldr	w2, [x19, #0x150]
   f1cf8:      	mov	w0, wzr
   f1cfc:      	ldr	w3, [x19, #0x154]
   f1d00:      	mov	w1, wzr
   f1d04:      	bl	0x208b80 <glViewport@plt>
   f1d08:      	adrp	x0, 0xa7000 <typeinfo name for PanelPositionerPoint+0xf606>
   f1d0c:      	mov	w1, #0xef               // =239
   f1d10:      	add	x0, x0, #0x309
   f1d14:      	bl	0xf1628
   f1d18:      	mov	w0, #0x5                // =5
   f1d1c:      	mov	w1, wzr
   f1d20:      	mov	w2, #0x4                // =4
   f1d24:      	bl	0x208b90 <glDrawArrays@plt>
   f1d28:      	adrp	x0, 0x98000 <typeinfo name for PanelPositionerPoint+0x606>
   f1d2c:      	mov	w1, #0xf0               // =240
   f1d30:      	add	x0, x0, #0xe70
   f1d34:      	bl	0xf1628
   f1d38:      	ldr	x0, [x19, #0x20]
   f1d3c:      	ldp	x20, x19, [sp, #0x20]
   f1d40:      	ldp	x22, x21, [sp, #0x10]
   f1d44:      	ldp	x29, x30, [sp], #0x30
   f1d48:      	b	0x208b10 <_ZN6Shader12UnbindShaderEv@plt>
   f1d4c:      	ldp	x20, x19, [sp, #0x20]
   f1d50:      	ldp	x22, x21, [sp, #0x10]
   f1d54:      	ldp	x29, x30, [sp], #0x30
   f1d58:      	ret
```

### S5 — sRGB swapchain requests

```text
  10a9a8:      	ldr	x8, [x20, #0x1128]
  10a9ac:      	mov	w9, #0x28               // =40
  10a9b0:      	stp	w22, w21, [sp, #0x28]
  10a9b4:      	add	x1, sp, #0x28
  10a9b8:      	mov	x0, x20
  10a9bc:      	mov	x2, x28
  10a9c0:      	madd	x8, x23, x9, x8
  10a9c4:      	mov	w9, #0x8c43             // =35907
  10a9c8:      	str	x9, [sp, #0x30]
  10a9cc:      	ldr	w8, [x8, #0x20]
  10a9d0:      	str	w8, [sp, #0x38]
  10a9d4:      	bl	0x208dc0 <_Z18XRQCreateSwapchainRK10XRQContextRK16XRQSwapchainInfoR12XRQSwapchain@plt>
  10a9d8:      	tbz	w0, #0x0, 0x10ac50 <QSVLRendererXR::SetupSwapchains(XRQContext const&, unsigned int, unsigned int, AtlasMode)+0x34c>
  10a9dc:      	mov	w8, #0x60               // =96
  10a9e0:      	mov	w9, #0x1818             // =6168
  10a9e4:      	mov	x0, x20
  10a9e8:      	mov	x1, x28
  10a9ec:      	madd	x8, x23, x8, x19
  10a9f0:      	add	x2, x8, x9
  10a9f4:      	bl	0x208dd0 <_Z28XRQCreateProjectionViewLayerRK10XRQContextRK12XRQSwapchainR32XrCompositionLayerProjectionView@plt>
  10a9f8:      	madd	x8, x23, x24, x19
  10a9fc:      	mov	w9, #0x1728             // =5928
  10aa00:      	add	x28, x8, x9
  10aa04:      	ldr	x0, [x8, #0x1728]
  10aa08:      	cbz	x0, 0x10aa18 <QSVLRendererXR::SetupSwapchains(XRQContext const&, unsigned int, unsigned int, AtlasMode)+0x114>
  10aa0c:      	bl	0x20a5d0 <xrDestroySwapchain@plt>
  10aa10:      	tbnz	w0, #0x1f, 0x10aac0 <QSVLRendererXR::SetupSwapchains(XRQContext const&, unsigned int, unsigned int, AtlasMode)+0x1bc>
  10aa14:      	str	xzr, [x28]
  10aa18:      	ldr	x8, [x20, #0x1128]
  10aa1c:      	mov	w9, #0x28               // =40
  10aa20:      	stp	w22, w21, [sp, #0x28]
  10aa24:      	add	x1, sp, #0x28
  10aa28:      	mov	x0, x20
  10aa2c:      	mov	x2, x28
  10aa30:      	madd	x8, x23, x9, x8
  10aa34:      	mov	w9, #0x8c43             // =35907
  10aa38:      	str	x9, [sp, #0x30]
  10aa3c:      	ldr	w8, [x8, #0x20]
  10aa40:      	str	w8, [sp, #0x38]
  10aa44:      	bl	0x208dc0 <_Z18XRQCreateSwapchainRK10XRQContextRK16XRQSwapchainInfoR12XRQSwapchain@plt>
```

### S6 — external decoder image import

```text
  10afb8:      	bl	0x20a120 <_ZNSt6__ndk17promiseIbED2Ev@plt>
  10afbc:      	ldr	x0, [sp, #0x28]
  10afc0:      	add	x1, sp, #0x18
  10afc4:      	str	xzr, [sp, #0x18]
  10afc8:      	bl	0x20a5e0 <AImage_getHardwareBuffer@plt>
  10afcc:      	cbnz	w0, 0x10ae2c <QSVLRendererXR::FlipFrame(XRQContext const&, long*, long)+0x114>
  10afd0:      	ldr	x0, [sp, #0x18]
  10afd4:      	bl	0x20a5f0 <AHardwareBuffer_acquire@plt>
  10afd8:      	ldr	x0, [sp, #0x18]
  10afdc:      	cbz	x0, 0x10b108 <QSVLRendererXR::FlipFrame(XRQContext const&, long*, long)+0x3f0>
  10afe0:      	bl	0x20a600 <eglGetNativeClientBufferANDROID@plt>
  10afe4:      	cbz	x0, 0x10b114 <QSVLRendererXR::FlipFrame(XRQContext const&, long*, long)+0x3fc>
  10afe8:      	adrp	x8, 0x21a000
  10afec:      	mov	x3, x0
  10aff0:      	mov	x1, xzr
  10aff4:      	mov	w2, #0x3140             // =12608
  10aff8:      	mov	x4, xzr
  10affc:      	ldr	x8, [x8, #0xf8]
  10b000:      	ldr	x0, [x8]
  10b004:      	bl	0x20a610 <eglCreateImageKHR@plt>
  10b008:      	cbz	x0, 0x10b120 <QSVLRendererXR::FlipFrame(XRQContext const&, long*, long)+0x408>
  10b00c:      	ldr	x8, [x19, #0x18]
  10b010:      	mov	x26, x0
  10b014:      	ldr	w1, [sp, #0x30]
  10b018:      	ldr	x8, [x8, #0x140]
  10b01c:      	ldr	x0, [x8, #0x10]
```

### S7 — disable framebuffer sRGB, four eye/layer draws, restore

```text
  10b534:      	mov	w0, #0x8db9             // =36281
  10b538:      	bl	0x208a90 <glDisable@plt>
  10b53c:      	adrp	x0, 0xa3000 <typeinfo name for PanelPositionerPoint+0xb606>
  10b540:      	mov	w1, #0x279              // =633
  10b544:      	add	x0, x0, #0xec3
  10b548:      	bl	0x10b7ec <QSVLRendererXR::FlipFrame(XRQContext const&, long*, long)+0xad4>
  10b54c:      	ldr	x8, [x19, #0x15a8]
  10b550:      	add	x22, x8, #0x30
  10b554:      	mov	x0, x22
  10b558:      	bl	0x208a40 <_ZNSt6__ndk15mutex4lockEv@plt>
  10b55c:      	ldr	x0, [x19, #0x15a8]
  10b560:      	bl	0x208a60 <_ZN18SRGBCorrectionPass18RenderSpecificPrepEv@plt>
  10b564:      	ldr	x28, [sp, #0x8]
  10b568:      	mov	w8, #0x1638             // =5688
  10b56c:      	add	x1, x19, x8
  10b570:      	add	x0, sp, #0x50
  10b574:      	bl	0x208e10 <_ZN28XRQAcquireSwapchainImageRAIIC1ERK12XRQSwapchain@plt>
  10b578:      	adrp	x21, 0x21a000
  10b57c:      	ldr	x21, [x21, #0xf8]
  10b580:      	ldr	x23, [x19, #0x15a8]
  10b584:      	add	x0, sp, #0x50
  10b588:      	bl	0x208e20 <_ZNK28XRQAcquireSwapchainImageRAII21GetAcquiredImageIndexEv@plt>
  10b58c:      	ldr	w8, [x0]
  10b590:      	mov	w10, #0x18              // =24
  10b594:      	ldr	x9, [x19, #0x1690]
  10b598:      	nop
  10b59c:      	madd	x8, x8, x10, x9
  10b5a0:      	ldr	w3, [x8, #0x10]
  10b5a4:      	mov	x0, x23
  10b5a8:      	mov	w1, wzr
  10b5ac:      	mov	w2, wzr
  10b5b0:      	bl	0x208b20 <_ZN18SRGBCorrectionPass14RenderSpecificEibj@plt>
  10b5b4:      	mov	w8, #0x1818             // =6168
  10b5b8:      	mov	x0, x20
  10b5bc:      	add	x1, x19, x8
  10b5c0:      	bl	0x10b950 <QSVLRendererXR::FlipFrame(XRQContext const&, long*, long)+0xc38>
  10b5c4:      	add	x0, sp, #0x50
  10b5c8:      	bl	0x208e40 <_ZN28XRQAcquireSwapchainImageRAIID1Ev@plt>
  10b5cc:      	mov	w8, #0x1728             // =5928
  10b5d0:      	add	x1, x19, x8
  10b5d4:      	add	x0, sp, #0x50
  10b5d8:      	bl	0x208e10 <_ZN28XRQAcquireSwapchainImageRAIIC1ERK12XRQSwapchain@plt>
  10b5dc:      	ldr	x23, [x19, #0x15a8]
  10b5e0:      	add	x0, sp, #0x50
  10b5e4:      	bl	0x208e20 <_ZNK28XRQAcquireSwapchainImageRAII21GetAcquiredImageIndexEv@plt>
  10b5e8:      	ldr	w8, [x0]
  10b5ec:      	mov	w10, #0x18              // =24
  10b5f0:      	ldr	x9, [x19, #0x1780]
  10b5f4:      	nop
  10b5f8:      	madd	x8, x8, x10, x9
  10b5fc:      	ldr	w3, [x8, #0x10]
  10b600:      	mov	x0, x23
  10b604:      	mov	w1, wzr
  10b608:      	mov	w2, #0x1                // =1
  10b60c:      	bl	0x208b20 <_ZN18SRGBCorrectionPass14RenderSpecificEibj@plt>
  10b610:      	mov	w8, #0x18d8             // =6360
  10b614:      	mov	x0, x20
  10b618:      	add	x1, x19, x8
  10b61c:      	bl	0x10b950 <QSVLRendererXR::FlipFrame(XRQContext const&, long*, long)+0xc38>
  10b620:      	add	x0, sp, #0x50
  10b624:      	bl	0x208e40 <_ZN28XRQAcquireSwapchainImageRAIID1Ev@plt>
  10b628:      	mov	w8, #0x16b0             // =5808
  10b62c:      	add	x1, x19, x8
  10b630:      	add	x0, sp, #0x50
  10b634:      	bl	0x208e10 <_ZN28XRQAcquireSwapchainImageRAIIC1ERK12XRQSwapchain@plt>
  10b638:      	ldr	x23, [x19, #0x15a8]
  10b63c:      	add	x0, sp, #0x50
  10b640:      	bl	0x208e20 <_ZNK28XRQAcquireSwapchainImageRAII21GetAcquiredImageIndexEv@plt>
  10b644:      	ldr	w8, [x0]
  10b648:      	mov	w10, #0x18              // =24
  10b64c:      	ldr	x9, [x19, #0x1708]
  10b650:      	nop
  10b654:      	madd	x8, x8, x10, x9
  10b658:      	ldr	w3, [x8, #0x10]
  10b65c:      	mov	x0, x23
  10b660:      	mov	w1, #0x1                // =1
  10b664:      	mov	w2, wzr
  10b668:      	bl	0x208b20 <_ZN18SRGBCorrectionPass14RenderSpecificEibj@plt>
  10b66c:      	mov	w8, #0x1878             // =6264
  10b670:      	mov	x0, x20
  10b674:      	add	x1, x19, x8
  10b678:      	bl	0x10b950 <QSVLRendererXR::FlipFrame(XRQContext const&, long*, long)+0xc38>
  10b67c:      	add	x0, sp, #0x50
  10b680:      	bl	0x208e40 <_ZN28XRQAcquireSwapchainImageRAIID1Ev@plt>
  10b684:      	mov	w8, #0x17a0             // =6048
  10b688:      	add	x1, x19, x8
  10b68c:      	add	x0, sp, #0x50
  10b690:      	bl	0x208e10 <_ZN28XRQAcquireSwapchainImageRAIIC1ERK12XRQSwapchain@plt>
  10b694:      	ldr	x23, [x19, #0x15a8]
  10b698:      	add	x0, sp, #0x50
  10b69c:      	bl	0x208e20 <_ZNK28XRQAcquireSwapchainImageRAII21GetAcquiredImageIndexEv@plt>
  10b6a0:      	ldr	w8, [x0]
  10b6a4:      	mov	w10, #0x18              // =24
  10b6a8:      	ldr	x9, [x19, #0x17f8]
  10b6ac:      	nop
  10b6b0:      	madd	x8, x8, x10, x9
  10b6b4:      	ldr	w3, [x8, #0x10]
  10b6b8:      	mov	x0, x23
  10b6bc:      	mov	w1, #0x1                // =1
  10b6c0:      	mov	w2, #0x1                // =1
  10b6c4:      	bl	0x208b20 <_ZN18SRGBCorrectionPass14RenderSpecificEibj@plt>
  10b6c8:      	mov	w8, #0x1938             // =6456
  10b6cc:      	mov	x0, x20
  10b6d0:      	add	x1, x19, x8
  10b6d4:      	bl	0x10b950 <QSVLRendererXR::FlipFrame(XRQContext const&, long*, long)+0xc38>
  10b6d8:      	add	x0, sp, #0x50
  10b6dc:      	bl	0x208e40 <_ZN28XRQAcquireSwapchainImageRAIID1Ev@plt>
  10b6e0:      	ldr	x0, [x21]
  10b6e4:      	mov	x1, x24
  10b6e8:      	bl	0x20a650 <eglDestroyImageKHR@plt>
  10b6ec:      	adrp	x0, 0xa8000 <typeinfo name for PanelPositionerPoint+0x10606>
  10b6f0:      	mov	w1, #0x290              // =656
  10b6f4:      	add	x0, x0, #0x7aa
  10b6f8:      	bl	0x10b7ec <QSVLRendererXR::FlipFrame(XRQContext const&, long*, long)+0xad4>
  10b6fc:      	mov	w0, #0x8db9             // =36281
  10b700:      	bl	0x208aa0 <glEnable@plt>
  10b704:      	adrp	x0, 0xa5000 <typeinfo name for PanelPositionerPoint+0xd606>
  10b708:      	mov	w1, #0x291              // =657
  10b70c:      	add	x0, x0, #0x2cc
  10b710:      	bl	0x10b7ec <QSVLRendererXR::FlipFrame(XRQContext const&, long*, long)+0xad4>
```

### S8 — host shader-push handler and reload dispatch

```text
   fc250:      	bl	0x2093c0 <_ZN20ValueTransportSystem14GetRemoteValueE16ValueTransportIDPvj@plt>
   fc254:      	ldp	w8, w2, [sp, #0x38]
   fc258:      	mov	w4, w0
   fc25c:      	cmp	w0, #0x18
   fc260:      	b.ge	0xfc2a0
   fc264:      	adrp	x0, 0x9d000 <typeinfo name for PanelPositionerPoint+0x5606>
   fc268:      	mov	w1, w8
   fc26c:      	add	x0, x0, #0xe3c
   fc270:      	mov	w3, #0x18               // =24
   fc274:      	bl	0x208d80 <_Z3LogPKcz@plt>
   fc278:      	ldr	x8, [x20, #0x28]
   fc27c:      	ldur	x9, [x29, #-0x8]
   fc280:      	cmp	x8, x9
   fc284:      	b.ne	0xfc3f4
   fc288:      	add	sp, sp, #0x10, lsl #12  // =0x10000
   fc28c:      	add	sp, sp, #0x50
   fc290:      	ldp	x20, x19, [sp, #0x20]
   fc294:      	ldp	x28, x21, [sp, #0x10]
   fc298:      	ldp	x29, x30, [sp], #0x30
   fc29c:      	ret
   fc2a0:      	add	w9, w2, w8
   fc2a4:      	cmp	w9, #0x10, lsl #12      // =0x10000
   fc2a8:      	b.hi	0xfc264
   fc2ac:      	add	w9, w9, #0x18
   fc2b0:      	cmp	w4, w9
   fc2b4:      	b.lo	0xfc264
   fc2b8:      	add	x19, sp, #0x30
   fc2bc:      	stp	xzr, xzr, [sp, #0x18]
   fc2c0:      	add	x1, x19, #0x18
   fc2c4:      	str	xzr, [sp, #0x28]
   fc2c8:      	stp	xzr, xzr, [sp]
   fc2cc:      	str	xzr, [sp, #0x10]
   fc2d0:      	add	x0, sp, #0x18
   fc2d4:      	mov	x2, x8
   fc2d8:      	bl	0x208950 <_ZNSt6__ndk112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendEPKcm@plt>
   fc2dc:      	ldp	w8, w2, [sp, #0x38]
   fc2e0:      	add	x8, x19, x8
   fc2e4:      	add	x1, x8, #0x18
   fc2e8:      	mov	x0, sp
   fc2ec:      	bl	0x208950 <_ZNSt6__ndk112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEE6appendEPKcm@plt>
   fc2f0:      	ldp	w1, w2, [sp, #0x34]
   fc2f4:      	ldr	w3, [sp, #0x3c]
   fc2f8:      	adrp	x0, 0x9d000 <typeinfo name for PanelPositionerPoint+0x5606>
   fc2fc:      	add	x0, x0, #0xe72
   fc300:      	bl	0x208d80 <_Z3LogPKcz@plt>
   fc304:      	ldr	w8, [sp, #0x34]
   fc308:      	cmp	w8, #0x3
   fc30c:      	b.hi	0xfc3d0
   fc310:      	adrp	x9, 0xad000 <typeinfo name for PanelPositionerPoint+0x15606>
   fc314:      	add	x9, x9, #0x6c7
   fc318:      	adr	x10, 0xfc328
   fc31c:      	ldrb	w11, [x9, x8]
   fc320:      	add	x10, x10, x11, lsl #2
   fc324:      	br	x10
   fc328:      	adrp	x1, 0x9f000 <typeinfo name for PanelPositionerPoint+0x7606>
   fc32c:      	mov	w0, #0x1                // =1
   fc330:      	add	x1, x1, #0xd3d
   fc334:      	bl	0x208a00 <_Z3Log9ELogLevelPKcz@plt>
   fc338:      	b	0xfc3d0
   fc33c:      	adrp	x1, 0x21a000
   fc340:      	adrp	x2, 0x21a000
   fc344:      	ldr	x0, [x21, #0x138]
   fc348:      	mov	x3, xzr
   fc34c:      	ldr	x1, [x1]
   fc350:      	ldr	x2, [x2, #0x8]
   fc354:      	bl	0x209a10 <__dynamic_cast@plt>
   fc358:      	ldr	x8, [x0, #0x15a8]
   fc35c:      	ldr	x0, [x8, #0x20]
   fc360:      	add	x1, sp, #0x18
   fc364:      	mov	x2, sp
   fc368:      	bl	0x208e70 <_ZN6Shader15ReloadWhenReadyERKNSt6__ndk112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEES8_@plt>
   fc36c:      	b	0xfc3d0
   fc370:      	adrp	x1, 0x21a000
   fc374:      	adrp	x2, 0x21a000
   fc378:      	ldr	x0, [x21, #0x138]
   fc37c:      	mov	x3, xzr
   fc380:      	ldr	x1, [x1]
   fc384:      	ldr	x2, [x2, #0x8]
   fc388:      	bl	0x209a10 <__dynamic_cast@plt>
   fc38c:      	ldr	x8, [x0, #0x15a8]
   fc390:      	ldr	x0, [x8, #0x28]
   fc394:      	add	x1, sp, #0x18
   fc398:      	mov	x2, sp
   fc39c:      	bl	0x208e70 <_ZN6Shader15ReloadWhenReadyERKNSt6__ndk112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEES8_@plt>
   fc3a0:      	b	0xfc3d0
   fc3a4:      	ldr	x8, [x21, #0x3f08]
   fc3a8:      	cbz	x8, 0xfc3d0
   fc3ac:      	ldr	x8, [x8]
   fc3b0:      	cbz	x8, 0xfc3d0
   fc3b4:      	ldr	x8, [x8]
   fc3b8:      	cbz	x8, 0xfc3d0
   fc3bc:      	ldr	x0, [x8]
   fc3c0:      	cbz	x0, 0xfc3d0
   fc3c4:      	add	x1, sp, #0x18
   fc3c8:      	mov	x2, sp
   fc3cc:      	bl	0x208e70 <_ZN6Shader15ReloadWhenReadyERKNSt6__ndk112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEES8_@plt>
```

### S9 — common shader compilation path

```text
  150d90:      	sub	sp, sp, #0x60
  150d94:      	stp	x29, x30, [sp, #0x20]
  150d98:      	add	x29, sp, #0x20
  150d9c:      	str	x23, [sp, #0x30]
  150da0:      	stp	x22, x21, [sp, #0x40]
  150da4:      	stp	x20, x19, [sp, #0x50]
  150da8:      	mrs	x23, TPIDR_EL0
  150dac:      	mov	x19, x1
  150db0:      	ldr	x8, [x23, #0x28]
  150db4:      	stur	x8, [x29, #-0x8]
  150db8:      	bl	0x20c550 <glCreateShader@plt>
  150dbc:      	ldrb	w8, [x19]
  150dc0:      	add	x2, sp, #0x10
  150dc4:      	ldr	x9, [x19, #0x10]
  150dc8:      	mov	w1, #0x1                // =1
  150dcc:      	mov	x3, xzr
  150dd0:      	tst	w8, #0x1
  150dd4:      	csinc	x8, x9, x19, ne
  150dd8:      	mov	w19, w0
  150ddc:      	str	x8, [sp, #0x10]
  150de0:      	bl	0x20c560 <glShaderSource@plt>
  150de4:      	adrp	x0, 0xa2000 <typeinfo name for PanelPositionerPoint+0xa606>
  150de8:      	mov	w1, #0x5c               // =92
  150dec:      	add	x0, x0, #0x81
  150df0:      	bl	0x150ae4
  150df4:      	mov	w0, w19
  150df8:      	str	xzr, [sp, #0x8]
  150dfc:      	bl	0x20c570 <glCompileShader@plt>
  150e00:      	adrp	x0, 0xa2000 <typeinfo name for PanelPositionerPoint+0xa606>
```

### S10 — shader reload uses same compiler

```text
  1511c8:      	ldr	w0, [x20, #0x30]
  1511cc:      	bl	0x20c610 <glDeleteProgram@plt>
  1511d0:      	adrp	x0, 0x9e000 <typeinfo name for PanelPositionerPoint+0x6606>
  1511d4:      	mov	w1, #0xb0               // =176
  1511d8:      	add	x0, x0, #0x426
  1511dc:      	bl	0x150ae4
  1511e0:      	mov	w0, #0x8b31             // =35633
  1511e4:      	mov	x1, x21
  1511e8:      	bl	0x150d90
  1511ec:      	str	w0, [x20, #0x28]
  1511f0:      	mov	w0, #0x8b30             // =35632
  1511f4:      	mov	x1, x22
  1511f8:      	bl	0x150d90
  1511fc:      	str	w0, [x20, #0x2c]
```

### S11 — decoder image-reader configuration

```text
   fd4ac:      	add	x5, x19, #0x30
   fd4b0:      	mov	w0, #0x1                // =1
   fd4b4:      	mov	w1, #0x1                // =1
   fd4b8:      	mov	w2, #0x22               // =34
   fd4bc:      	mov	w3, #0x100              // =256
   fd4c0:      	mov	w4, #0x14               // =20
   fd4c4:      	bl	0x209ae0 <AImageReader_newWithUsage@plt>
```

## Validation performed

`test_quantizer.py` checks the proposed quantizer's endpoints, exact code preservation, quarter-code mean, finite-threshold mean-error bound, neutral RGB and clamping.
The proposed helper compiled and linked inside a standalone GLSL ES 3.00 vertex/fragment program on software Mesa GLES 3.2 (llvmpipe).
This is NOT validation of the live host-provided shaders, their texture bindings, the Android GPU driver, foveated composition, the APK rebuild, or the XR compositor. See `validation.txt`.
