package app.template.patches.steamlink.binary

// Exact decoded-base guards. Evidence: diagnostics/steamlink-blue-noise-ditering/native-layouts.json.
internal val BLUE_NOISE_LAYOUTS = listOf(
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
