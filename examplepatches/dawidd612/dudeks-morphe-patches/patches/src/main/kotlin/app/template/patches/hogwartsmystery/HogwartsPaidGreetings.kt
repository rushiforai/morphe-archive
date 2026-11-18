package app.template.patches.hogwartsmystery

import app.morphe.patcher.patch.ResourcePatchContext

// Full first campaign ID followed by the eight alternate bytes of the second.
// bundle10fq_v3_RegularModal and bundle5ah_v69_RegularModal
private const val STARTER_OFFER_IDS = "62756e646c65313066715f76335f526567756c61724d6f64616c3561685f7636395f"

internal fun ResourcePatchContext.hidePotterPaidGreetings() {
    // The first edit bypasses the void queuePurchasableGreetingModal wrapper.
    // The second redirects only tryToDisplay's automatic kind-41 featured call.
    // Its trampoline in ELF padding matches the exact 26-byte libc++ string.
    // Return false on a match. Otherwise tail-call the original PLT entry
    // with the original arguments and let the caller run its normal cleanup.
    editPotterLibraries(
        arm64 = listOf(
            PotterEdit(0x02ab2cdc, "e20301aa", "c0035fd6"),
            PotterEdit(0x02ab9054, "435f6a94", "9e6c6694"),
            PotterEdit(
                0x044542cc,
                "1f2003d5".repeat(13),
                "29004039298d073629a840a93f6900f1c18cff540b90fef06b710b914c6140f86d6140f86" +
                    "ea141f89f010deb84114efa56000014",
            ),
            PotterEdit(
                0x04454454,
                "1f2003d5".repeat(11),
                "0181ff544c0140f96d0140f98c010dca9fbd40f24cd140f86dd140f880014dfa4c2141f86" +
                    "d2141f8fafbff17",
            ),
            PotterEdit(0x04453464, "00".repeat(20), "80014dfa61000054e0031f2ac0035fd63bf60314"),
            PotterEdit(0x016572dc, "00".repeat(34), STARTER_OFFER_IDS),
        ),
        x64 = listOf(
            PotterEdit(0x02a1eaa0, "4889f2", "c36690"),
            PotterEdit(0x02a258e9, "e89229c501", "e8dc2bb501"),
            PotterEdit(
                0x045784ca,
                "cc".repeat(49),
                "f60601742748837e081a75204c8b4e104c8d153bb00cfd498b4106493b42067406493b421a7505" +
                    "e94e0fa8fde985fd0f00",
            ),
            PotterEdit(
                0x01ff9444,
                "00".repeat(47),
                "498b0149330248c1e0100f85a2f05702498b410d493b420d0f8594f05702498b4112493b4212" +
                    "0f8586f0570231c0c3",
            ),
            PotterEdit(0x0164351c, "00".repeat(34), STARTER_OFFER_IDS),
        ),
    )
}
