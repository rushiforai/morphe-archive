package patches.bright

/**
 * Remove publisher-marked advertorial records before featured/date/row layout.
 * Fresh responses and cached home records share buildNewsAndBottom.
 *
 * Hide ads first sends the synchronous banner loader from its intact prologue
 * to its genuine null-return tail. The original body becomes unreachable;
 * borrow a guarded portion for a bounded, nonallocating leaf. No call, GC
 * safepoint, stack write or heap write is introduced. Only x16/x17 scratch
 * registers and condition flags change. Compare category.functionality exactly
 * against "advertorial", handling both Dart string widths. Null, another
 * category/string representation and nonmatching metadata keep the old path.
 *
 * The pass path replays the displaced age-value load and resumes the original
 * betting filter. The skip path uses the original iterator-state reloads and
 * continue branch. Existing age policy, pagination and click handlers remain.
 */
private val sponsoredLeafOriginal = nativeBytes(
    "502740f9ff0110eb69140054210080d2effd0994e10300aa" +
    "a0835ff8a1031ff820f000b8403f40f900444ff9702340f9" +
    "1f00106b61000054623740f95afa0994a0831ef870334091" +
    "10c643f9e04100a9643f40f9eefcff97e10300aa62334091" +
    "42c044f91b010094d08200911f00106bc1000054626b4091" +
    "42dc40f96187409121cc46f90a000014d0c200911f00106b" +
    "a1000054622b409142f844f961e755f90300001462e755f9" +
    "61e755f9a0835ff8a2831df8a1031df803b040b863801c8b" +
    "7f00166bc00e005464b040b884801c8ba4031ef8704340f9" +
    "be835ef8fe4100a9643f40f9cafcff97017040b821801c8b" +
    "702340f93f00106b400d0054207047b800801c8ba3835ff8" +
    "a0831cf861b040b821801c8b3f00166b800c005424f040b8" +
    "84801c8ba4831ef8e10316aa020180d2cb010a9470874091" +
    "10d246f910f000b8a1835df8013001b87087409110d646f9" +
    "107001b8a1035df801b001b870ab55f9e04100a9f5d6f997" +
    "a0831df8d6000094e30300aaa0835cf8a3031df8607000b8" +
    "a0835ef860b000b8a0835df8"
)
private val sponsoredLeafCode = nativeBytes(
    "b08359f81f02166be00b005410b243b81f02166b800b0054" +
    "700b003610821c8b11f25ff8317e4cd33f3a06f1c10a0054" +
    "10f240b81f02166b600a0054500a003610821c8b11f25ff8" +
    "317e4cd33f7a01f1000500543f7e01f161090054117240b8" +
    "3f5a00710109005411f240783f860171a108005411124178" +
    "3f92017141080054113241783fda0171e107005411524178" +
    "3f96017181070054117241783fca01712107005411924178" +
    "3fd20171c106005411b241783fbe01716106005411d24178" +
    "3fca01710106005411f241783fa60171a105005411124278" +
    "3f86017141050054113242783fb20171e104005450150114" +
    "117240b83f5a00716104005411f240383f86017101040054" +
    "110241383f920171a1030054111241383fda017141030054" +
    "112241383f960171e1020054113241383fca017181020054" +
    "114241383fd2017121020054115241383fbe0171c1010054" +
    "116241383fca017161010054117241383fa6017101010054" +
    "118241383f860171a1000054119241383fb2017141000054" +
    "2b150114a1035df816150114"
)
private val sponsoredBannerRange = NativeRange("bannerLoad", 0x4549dc, 0x2bc,
    "0b7b2e7d43f8af48c952c7a0b6423e5fd08a14e53b5f19b4d03251045c7381a0")

internal val nativeSponsoredEdits = mapOf(
    "arm64-v8a" to listOf(
        NativeEdit(sponsoredBannerRange, 0x4549e8,
            nativeBytes("a1831ff8"), nativeBytes("a2000014")),
        NativeEdit(sponsoredBannerRange, 0x4549ec,
            sponsoredLeafOriginal, sponsoredLeafCode),
        NativeEdit(NativeRange("homeSponsoredDispatch", 0x499d74, 0x10b0,
            "aa64da5687cb64bdb91ee85da537b1eb88a71ccd6f059da73aec0b33eacd480f"), 0x499fc8,
            nativeBytes("a1035df8"), nativeBytes("89eafe17")),
    ),
)
