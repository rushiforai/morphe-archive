package app.template.patches.steamlink.binary

// Exact decoded-base guards. Evidence: diagnostics/steamlink-blue-noise-ditering/native-layouts.json.
internal val BLUE_NOISE_LAYOUTS = listOf(
    BlueNoiseLayout("2.0.20", "5001812", 2220872,
        "eebf7eabfb299ab7b9e5bba1612d4a32b27c51f451efc2bd206ba6fc6ac5205a", 0x9b3ca, 0xa6503, 0xf1b48L,
        listOf(
            BlueNoiseSite(0x6f5a8, "libGLESv3.so", "libgxd.so"),
            BlueNoiseSite(0x4a127, "glShaderSource", "gxShaderSource"),
            BlueNoiseSite(0x31842, "glDrawArrays", "gxDrawArrays"),
            BlueNoiseSite(0x49a69, "eglCreateContext", "gxdCreateContext"),
            BlueNoiseSite(0x49ae1, "eglDestroyContext", "gxdDestroyContext"),
            BlueNoiseSite(0x49a9e, "eglMakeCurrent", "gxdMakeCurrent"),
            BlueNoiseSite(0x49b05, "eglTerminate", "gxdTerminate"),
            BlueNoiseSite(0xa5928, "glCompileShader", "gxCompileShader"),
            BlueNoiseSite(0xab0eb, "glLinkProgram", "gxLinkProgram"),
            BlueNoiseSite(0x983ea, "glDeleteShader", "gxDeleteShader"),
            BlueNoiseSite(0xaa53e, "glDeleteProgram", "gxDeleteProgram"),
        ), listOf(
            BlueNoiseGuard(0x16caa4, 160, "27665b6b32526da7ee2144518fa9c91710b3675a8454e3a026bb456825d8c305"),
            BlueNoiseGuard(0xf19f4, 616, "7355446ebb31eaef3be2a38e0667ede67af3c281e3194ecc211eca3837bf45da"),
            BlueNoiseGuard(0xf1848, 428, "850d7d0fc0d277307080122b5b6fab1aa8ee82ba69d0c13839d22b109c01da8d"),
            BlueNoiseGuard(0x9d182, 29, "93158a53e85fde1af61ce449f16c91b3b4213c93101cb98da42e5cc5bdca3f4c"),
            BlueNoiseGuard(0xa6503, 296, "2bad22b297f2016866482551483c0ecd44f629ce4d9df1848eb55d6a03008623"),
            BlueNoiseGuard(0x16c838, 16, "f0682fbf23421ea32a6312055204938c77bbe31b5ff3d02f03f9f341ef1c1612"),
            BlueNoiseGuard(0x16c898, 16, "f3709394e8fd077e540f3e4121e9de867977e8caf267a258ceac4c883bcddfc2"),
            BlueNoiseGuard(0x16c878, 16, "dc7f3c98223353e774d9ad008b4a640ad7ab88d16c8c355be73b32ad71fcd12f"),
            BlueNoiseGuard(0x16c868, 16, "87492e58e2450198c9d18a9bd7c6bba2169593735055f05870cb69a34a6d071c"),
            BlueNoiseGuard(0x2f8, 118848, "4afc06b386ac5f31bf727a161d7834fa2064f884bf6211486f7c0da4ed5c6790"), // .dynsym
            BlueNoiseGuard(0x218c60, 560, "70baad2fe243b77e889359d86ec6451e5699025563b26efa97cbfd645e4855f4"), // .dynamic
            BlueNoiseGuard(0x6f5c8, 122064, "7d343743c1d64f72b69fb7f17b4515a3c1f3ba2fce2022896f4604e89c867b4a"), // .rela.dyn
            BlueNoiseGuard(0x8d298, 40968, "72090fed064f1e301f572f13ae08959f5e4969feaf1ca5895867c18414101017"), // .rela.plt
            BlueNoiseGuard(0x1fa68, 30888, "a8e32860ef33903e4ea5baf1f8823422ab440e932166a509a92bf71b3a9b3350"), // .gnu.hash
        )),
    BlueNoiseLayout("2.0.21", "5001968", 2234048,
        "596b5680aa6c217daf5c151de517b1ad61b3999c6fd864ff59a718136ca40192", 0x94fdd, 0xa0677, 0xed478L,
        listOf(
            BlueNoiseSite(0x68178, "libGLESv3.so", "libgxd.so"),
            BlueNoiseSite(0x41525, "glShaderSource", "gxShaderSource"),
            BlueNoiseSite(0x28bb2, "glDrawArrays", "gxDrawArrays"),
            BlueNoiseSite(0x40e67, "eglCreateContext", "gxdCreateContext"),
            BlueNoiseSite(0x40edf, "eglDestroyContext", "gxdDestroyContext"),
            BlueNoiseSite(0x40e9c, "eglMakeCurrent", "gxdMakeCurrent"),
            BlueNoiseSite(0x40f03, "eglTerminate", "gxdTerminate"),
            BlueNoiseSite(0x9fa86, "glCompileShader", "gxCompileShader"),
            BlueNoiseSite(0xa5402, "glLinkProgram", "gxLinkProgram"),
            BlueNoiseSite(0x91e82, "glDeleteShader", "gxDeleteShader"),
            BlueNoiseSite(0xa4855, "glDeleteProgram", "gxDeleteProgram"),
        ), listOf(
            BlueNoiseGuard(0x16f5c8, 160, "9b81003caefa4d53cf14f01d8c0513ab96e37d55be6cad5f077310895413aec7"),
            BlueNoiseGuard(0xed324, 616, "9e296fa85155786d2b91e1eb7405e0659a6ed15737d30653932a203d2a543faf"),
            BlueNoiseGuard(0xed178, 428, "e73e380340915a83c6716379be1cffb0d73db55f6b8fae51ceaf0354d6516a26"),
            BlueNoiseGuard(0x96e5b, 29, "93158a53e85fde1af61ce449f16c91b3b4213c93101cb98da42e5cc5bdca3f4c"),
            BlueNoiseGuard(0xa0677, 296, "2bad22b297f2016866482551483c0ecd44f629ce4d9df1848eb55d6a03008623"),
            BlueNoiseGuard(0x16f35c, 16, "c013576a2b087445eb2f2e7fd1b5195ae68bce26b3d36ce4c90adba7cb4bba0b"),
            BlueNoiseGuard(0x16f3bc, 16, "db5ca69af59e0004b9a1d147a97f614620012be44c2621029c619ceab7569115"),
            BlueNoiseGuard(0x16f39c, 16, "6716f4703aa6fb22021971f658c13b2dbcc531305119978df46f65458d09a47e"),
            BlueNoiseGuard(0x16f38c, 16, "bd9973367249a9b4731d752b2a69c7faf607d3ad01edc421ff9338e77221ddd3"),
            BlueNoiseGuard(0x2f8, 121704, "bdcec14f0ab282a7a554df0feebb4b5b8d02721efceec044b6abfe01769b33d2"), // .dynsym
            BlueNoiseGuard(0x21bd70, 544, "85bcaf2b499ceee8d661568272ec65be3c7d93225b3beed93f8bad5076ef3a08"), // .dynamic
            BlueNoiseGuard(0x68198, 124752, "7597131317aae915b41bc89a6d4a4ca04d905089689d4fc56cc6a6682c3e7291"), // .rela.dyn
            BlueNoiseGuard(0x868e8, 42000, "aedc9b37573d75f6d7ef85c7bd7799b82811c7f8f1a270b25a7f77277b5a9a81"), // .rela.plt
            BlueNoiseGuard(0x20680, 31432, "725e78bb4e8ac8d8c8d91e3461527dbca798ae65255edf25a903fdb20d8ff89a"), // .gnu.hash
        )),
    BlueNoiseLayout("2.0.20", "5001712", 2221072,
        "80b62797c7e26d6b67b0cca00693b076a336bdb48ebc1383a16cccb1616ed495", 0x9b4b8, 0xa6582, 0xf1c48L,
        listOf(
            BlueNoiseSite(0x6f686, "libGLESv3.so", "libgxd.so"),
            BlueNoiseSite(0x4a1b4, "glShaderSource", "gxShaderSource"),
            BlueNoiseSite(0x318b6, "glDrawArrays", "gxDrawArrays"),
            BlueNoiseSite(0x49af7, "eglCreateContext", "gxdCreateContext"),
            BlueNoiseSite(0x49b47, "eglDestroyContext", "gxdDestroyContext"),
            BlueNoiseSite(0x49b2c, "eglMakeCurrent", "gxdMakeCurrent"),
            BlueNoiseSite(0x49b6b, "eglTerminate", "gxdTerminate"),
            BlueNoiseSite(0xa59a7, "glCompileShader", "gxCompileShader"),
            BlueNoiseSite(0xab149, "glLinkProgram", "gxLinkProgram"),
            BlueNoiseSite(0x984da, "glDeleteShader", "gxDeleteShader"),
            BlueNoiseSite(0xaa5bc, "glDeleteProgram", "gxDeleteProgram"),
        ), listOf(
            BlueNoiseGuard(0x16caac, 160, "4c478a48c72a9c1463a4ff7f5e6da1c29022899f9b1b6d606517ada6780202f6"),
            BlueNoiseGuard(0xf1af4, 616, "4c905f1e24f02ea5e0c99bdba69aab311443c14af9a85f03005520985d490e7b"),
            BlueNoiseGuard(0xf1948, 428, "dd38203bb41b89c84575a8318ab1bf9986aae93d310dfd4640dcd47c01bf0887"),
            BlueNoiseGuard(0x9d23d, 29, "93158a53e85fde1af61ce449f16c91b3b4213c93101cb98da42e5cc5bdca3f4c"),
            BlueNoiseGuard(0xa6582, 296, "2bad22b297f2016866482551483c0ecd44f629ce4d9df1848eb55d6a03008623"),
            BlueNoiseGuard(0x16c840, 16, "76b218da0d5c29c9a9f22833ef63917d3fcab0cc5f275b2d68af9b355b52ec51"),
            BlueNoiseGuard(0x16c8a0, 16, "857a6127732e16291e7e8cd161322d336105bc6b633e3a250b77c2048ed5f1c7"),
            BlueNoiseGuard(0x16c880, 16, "28db6dc044aa1ffac4884e93ec2cb8e7d9442311d0304ffbc5fb292aa6ef5dcc"),
            BlueNoiseGuard(0x16c870, 16, "8f9e741858c85994ddb78f13d4de7c5519680db9877b5e7b7c1e017fae477e72"),
            BlueNoiseGuard(0x2f8, 118920, "c1bcd99be9f2cd4e81612391d70f99418ebaa99012450b50fa3d8b3685b3c706"), // .dynsym
            BlueNoiseGuard(0x218d20, 560, "d39eeb974204134ccfa17cbeaf6b4609af75454ffe5951f445fa67966633a791"), // .dynamic
            BlueNoiseGuard(0x6f6a8, 122064, "6901e8c10ab17f23eccc354f350df8196b2a643f934d96368358e8911a7e7636"), // .rela.dyn
            BlueNoiseGuard(0x8d378, 40992, "1e6a6f232900b92c57bda1bf1986da6442d09691352401662f99cb2002f3e30a"), // .rela.plt
            BlueNoiseGuard(0x1fab8, 30900, "47f424ce6a4054b5746ecbbfc4303d54ddd63c8fde38423e9c7e7b856d749f54"), // .gnu.hash
        )),
    BlueNoiseLayout("2.0.22", "5002244", 2251920,
        "4b2fa5e1b5d9d5c938873f692b0e5e18159e1199dee1253dd6eccc8fa43dfa12", 0x957bc, 0xa11d7, 0xeea64L,
        listOf(
            BlueNoiseSite(0x68717, "libGLESv3.so", "libgxd.so"),
            BlueNoiseSite(0x417b2, "glShaderSource", "gxShaderSource"),
            BlueNoiseSite(0x28c7f, "glDrawArrays", "gxDrawArrays"),
            BlueNoiseSite(0x410f4, "eglCreateContext", "gxdCreateContext"),
            BlueNoiseSite(0x4116c, "eglDestroyContext", "gxdDestroyContext"),
            BlueNoiseSite(0x41129, "eglMakeCurrent", "gxdMakeCurrent"),
            BlueNoiseSite(0x41190, "eglTerminate", "gxdTerminate"),
            BlueNoiseSite(0xa05f0, "glCompileShader", "gxCompileShader"),
            BlueNoiseSite(0xa6003, "glLinkProgram", "gxLinkProgram"),
            BlueNoiseSite(0x92485, "glDeleteShader", "gxDeleteShader"),
            BlueNoiseSite(0xa5396, "glDeleteProgram", "gxDeleteProgram"),
        ), listOf(
            BlueNoiseGuard(0x173c0c, 160, "715cf977c45b045d148e098f7988ceb37310c3feb31cca93c5769c0682fda23f"),
            BlueNoiseGuard(0xee910, 616, "8ce7ad238e140586f2914445a683d9260f83fe33a61e2e9c2fc53abc3908bdf5"),
            BlueNoiseGuard(0xee764, 428, "3d85244eb48e008561b0911f49450533299d1471b416c0b1ec9a2bf64d7a70ec"),
            BlueNoiseGuard(0x976e6, 29, "93158a53e85fde1af61ce449f16c91b3b4213c93101cb98da42e5cc5bdca3f4c"),
            BlueNoiseGuard(0xa11d7, 296, "2bad22b297f2016866482551483c0ecd44f629ce4d9df1848eb55d6a03008623"),
            BlueNoiseGuard(0x1739a0, 16, "dfd3c9287bfaab31edefc5d32b13fc24b7afe4f1eb39d48b6a5c1a410e09e529"),
            BlueNoiseGuard(0x173a00, 16, "c0d7dabaa12c638746ce1afcb2e0b12cbc75b127a16ba676ab27def0722ea632"),
            BlueNoiseGuard(0x1739e0, 16, "a4943f10686a85266bf0c5729f1497aefce14be8dc2115695485ac6d4dc65b48"),
            BlueNoiseGuard(0x1739d0, 16, "1210188af534c55c8ced4ba24fea7f4715acbb0b5d87fc99d4819d65b2993d03"),
            BlueNoiseGuard(0x2f8, 122040, "e44b6656ba77ee2b485c8aa12ff2f89807d75697558a860f3a1ba4eabafee381"), // .dynsym
            BlueNoiseGuard(0x220308, 544, "cb6f88bbabc388330fe4a07998af2c8a26979c2512ea7a46425e6c588aa33255"), // .dynamic
            BlueNoiseGuard(0x68738, 124560, "fe278657f947754354fcd13316348b1e10fb5e10972eaf81ed424db67899bf5e"), // .rela.dyn
            BlueNoiseGuard(0x86dc8, 42168, "ee7e70e5ed4dc5a88b0153b9dd5423632c2e4ad6d73c64c9c3426f515547141f"), // .rela.plt
            BlueNoiseGuard(0x207f0, 31488, "0fa123d648bbe5ab8f1b1769d8fb3b0ebde1180a28816aa3a468f7822a9644dd"), // .gnu.hash
        )),
    BlueNoiseLayout("2.0.23", "5002363", 2292008,
        "628821feab199d7712be8a51273eb9a21ec440a7c91aa6a768cc7307a4fe22f0", 0x970a1, 0xa31bb, 0xf1ba4L,
        listOf(
            BlueNoiseSite(0x69956, "libGLESv3.so", "libgxd.so"),
            BlueNoiseSite(0x425b2, "glShaderSource", "gxShaderSource"),
            BlueNoiseSite(0x28f77, "glDrawArrays", "gxDrawArrays"),
            BlueNoiseSite(0x41ef4, "eglCreateContext", "gxdCreateContext"),
            BlueNoiseSite(0x41f6c, "eglDestroyContext", "gxdDestroyContext"),
            BlueNoiseSite(0x41f29, "eglMakeCurrent", "gxdMakeCurrent"),
            BlueNoiseSite(0x41f90, "eglTerminate", "gxdTerminate"),
            BlueNoiseSite(0xa25b4, "glCompileShader", "gxCompileShader"),
            BlueNoiseSite(0xa8140, "glLinkProgram", "gxLinkProgram"),
            BlueNoiseSite(0x93c25, "glDeleteShader", "gxDeleteShader"),
            BlueNoiseSite(0xa74a5, "glDeleteProgram", "gxDeleteProgram"),
        ), listOf(
            BlueNoiseGuard(0x17c6ac, 160, "3f90f3e44ced8bf344e81d9fe1e08be2d8039e239e053e2efcf2f55e0071c6e3"),
            BlueNoiseGuard(0xf1a50, 616, "d3ad75422bac1df96b5a647ef0c4fbdf34facf0800f0164c2eedfdfd0daac4d0"),
            BlueNoiseGuard(0xf18a4, 428, "cd6ec95d09c7fead86e91fdcec38e1576ac61ef1466f574f17d4c138f4fe3f5f"),
            BlueNoiseGuard(0x99013, 29, "93158a53e85fde1af61ce449f16c91b3b4213c93101cb98da42e5cc5bdca3f4c"),
            BlueNoiseGuard(0xa31bb, 296, "2bad22b297f2016866482551483c0ecd44f629ce4d9df1848eb55d6a03008623"),
            BlueNoiseGuard(0x17c440, 16, "f696de7cf2419c18a1c452a1770d088145691d966390a095554a68a035aa4c6e"),
            BlueNoiseGuard(0x17c4a0, 16, "7460e8d6d80b5c2c345a62f388fda723892fdb19c43286ab5f947169493bbb7d"),
            BlueNoiseGuard(0x17c480, 16, "dc8c76065aedde40772dac980793605d4e2cf3d00634dfd2680501827bdba3cb"),
            BlueNoiseGuard(0x17c470, 16, "dbdedd4db1ce76c6c85a38e6b7fc6c67be3e816cde3e620d53d6acec9d8c144e"),
            BlueNoiseGuard(0x2f8, 122640, "fd7f2d8911947b552130b80917543a68548ae7f436a16e09ad6f8b06ae0dda17"), // .dynsym
            BlueNoiseGuard(0x229e10, 544, "474d0ed7bbcaffbe9ebd3e472e4c01556ae9a7d1b0d3ac0680ec0815b754dba8"), // .dynamic
            BlueNoiseGuard(0x69978, 124968, "89275273d4d33c820d84df2ce88cde55c3bd7671dc60b9eb7b7a09087bb02c8e"), // .rela.dyn
            BlueNoiseGuard(0x881a0, 42960, "060b780ed894d32c5c4d29fba3594cb1a1e14b2392992bdc372a230ef47619f5"), // .rela.plt
            BlueNoiseGuard(0x20a78, 31600, "08a05d1c41821d0d0792fa49b67164ed75a0f7382bd7c0720f488658bf314195"), // .gnu.hash
        )),
)
