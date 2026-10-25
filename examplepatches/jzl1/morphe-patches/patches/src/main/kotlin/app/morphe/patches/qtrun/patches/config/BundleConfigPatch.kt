package lab.qtrun.patches.config

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch
import lab.qtrun.patches.shared.COMPATIBILITY_QUICKTEST
import net.fornwall.jelf.ElfFile
import java.io.RandomAccessFile
import java.util.Base64

private const val CONFIG_ASSET = "assets/configuration.xml"
private const val JNI_LIB = "lib/arm64-v8a/libqtrun_arch_jni.so"

/**
 * File offset of the config-integrity gate inside `libqtrun_arch_jni.so`.
 *
 * VA 0x12b65ec is the `tbz w25, #0, #0x12b6624` instruction in the native validator
 * (0x12b6374). In this ELF .text is identity-mapped, but derive the offset from the
 * containing section so the patch fails loudly rather than corrupting the library if
 * the layout ever changes.
 */
private const val VALIDATOR_VA = 0x12b65ecL

/** Original ARM64 encoding: `tbz w25, #0, #0x12b6624`. */
private val VALIDATOR_ORIGINAL = byteArrayOf(0xD9.toByte(), 0x01, 0x00, 0x36)

/** Patched ARM64 encoding: `b #0x12b6624` (skip the mismatch rejection). */
private val VALIDATOR_PATCHED = byteArrayOf(0x0E, 0x00, 0x00, 0x14)

/**
 * Stock `configuration.xml`, extracted from the test device with `adb backup`.
 *
 * It is the QTRUN-signed/encrypted config envelope (5,398 bytes). Morphe patches the
 * original APK and re-signs it, so the app has no cached config on first launch; this
 * asset gives it a valid signed config to decrypt even when `/cgi/report` returns 404.
 */
private const val CONFIG_B64 = """PD94bWwgdmVyc2lvbj0nMS4wJyBlbmNvZGluZz0ndXRmLTgnPz4KPHJvb3Q+PGNvbnRlbnQgdGltZXN0YW1wPSIyMDI2LTEwLTI0VDA5OjE1OjU4WiIgdmVyc2lvbj0iMyI+RmJNNW42SE1ON3QvcFZJVVl1SHBDb0lYckZnUVZXQXovd2pPcktlVW1JNnNJc2xZd3dPYXBhRmtwYlN2U3ZVSnNuUUw4bjBxVWdRdQo4V3B2NGNJUzlxOGVHQms5ekd3SmNuUnBaSjNIVzRIOW5kZlcvNFpvYXUwbGRqNWNxdFlvRHZKV1BHRjI3azBneFhnTFg0ZGx2TXVTCnhMcWt1N2dTNG9DN1o3d1VKTDlFL1Q5eUlETE5WMHFSMXl4TjJXb3VlbHhvSEZrTllZQVVDbGgzZ08wcnY4ejN3b21VNFdDNldSbE4KeE81UmJQaDFGQWF3eVgwU0FFM1REWGVMMWNPSEE4OTdYemZxaHM2amZUcmU5amgrK01aa1RWbk4vN1BxdEttVHdCWGZVUE95K2x1UQpLanNjMHRhMXZkcGl4QTA5WFRGaVowNFZzYUYwYytiWm9TaXowenpjWWk5aGd4ZUhaQWdMd1JPaC9lZk5ELzg4QkFuT2NaVVp5R3NlCmwrTklFM01PeGlSd3phK1VveGVhbmxpL2lmNnRmcGdEd25ZL3dsdmhtOFU3eTJqLzhSUHJxajF0OVpTdXlhbXN1ZXdkL2ZCcXJDSlgKSDl5WEdTWWoxdDBQcVNORWx6SmhZQldDMVMzK0Y0dnBJTW85TWdBWCtvTjd5c0hNWTZtTzU0N2I5TlFkTUErVm12QWM2SUZiak83ZQpKOVJQc0t1b0pWS1BUVUpSSFFUa0RKZnFhN1JlZGRzeFp6dEVsT1JYUXltV1pmdHVxajVBWlBHeVZaMXduUjdNVDAyNGZxWjV4WGI0CmgwUzVDZWNlNEtKWHNKMDN5RHZQM2pGQjlKRzcra1ZGcTlTdGo0dnVsbGExd05BL1EzM2tVNmpaNG9rK2lqWkpkNlgyR2lyUEU2b2IKam82QVZlZ090aFNQeWtVdHdPanJhRVc0amNXSnc2ZU1vRUxXK1ZoVEFpQUhpRkMra1BCTlE3T0VzTCtjVVNYUTNJOXVBaHFoaHNWMwpMa3E1WFJSM0dhL294akpudWdYS0RCSXBEajdtaWFvNHJaeVJuWktBVUVRNkMzc1Fwc0R4UzJrcEw0Z2NWWHBmZ2paaDhtQ290dG1sCkRGQVVLYXh6RjhaK2VITnBFMlB6aEhZVWNwTGRTOU42SFpLcVNtYVpxaU1veHpKTUFwZElwY1Foa051ZE1zQ2UxRy9mRG5hUTBCRHYKeWRZOHhjc1g0Wk52cnFMUHVqeDZWZGd0dVlrMkdudXZYcEp1QldnOEFKZ2d6ZnpVbWxFdG1WeEw0V1Yzd0M4d1QyN0VCNStTMEI3cwpQamI0WXlDSTd0MkxhQ1grUW4rVnlFNEhEWTVRS0UwUmdSdGNUK2RNS01JemhlOU40dW9YS2RFVGhHb2NheVBlYlM1ZGpyNDRuQStyClN4UkZHSzhWZDB6QzVoSUJhUC94LzZMeVlvWWh1YVdzRC9aZnNkazlPbUg1Ukc3Yk9UWmhUck9ORTdyYkg2ZmJKWnR4Q002dkVEVGIKM28wMzJvOHZrRkZGdG9mTGJYS1BpL0syMWQ2RnRvb3paL2pndmxjWGdLY2ZIZnd3eTBJWU5xSTcvWDhmdit2V2tKL1ZUZkhmTnVJdwp4UzladlloNVRsaU9nZW1McHVna0o5UndYU0JpZmN1cGhnaUJOekg4c2I4RWlqTjhvTFNpcjlHMkRRWWo3V2FzKzFtWGp1c1FPcWQzCnlwblcxQ2UrdkpTdzc4L0xTcmQ5Y3NDQjdZN1AxY2ZvWE41dGRmVmhobVFpRDBLSFgzcXc0QzZ6eUo3aDBrZTBZSVRoL2Q2dzhMNzAKdFF6eng1QTAzeDJCeW9BL1M3cHNmaXc4MzZGenR2QkpaYlZ6UGFoWk8vMFVZQWV6TUYrWFQ5NzZpNUwydE9tR0VjUXhLS0hpMTJEUwp3VkNYbHNvSGZrYThQV2pPdjdDUkFVWWdLc3FIRUVEUkhLVXdKUDg3K1djN1VyRzE0dXZ1cnpuZVNvVE1GYk5JSHVjZVNidzFYMk5NClYyQkpWQzdmenRnUlBvM0VyRFJYaXhPWHBlL0tYUEk0Rnl4RW52Q09FYkllZzhDSW5lVHdPajlQWHpLM1RUTVFxT05HWEJma1dtMSsKd2U2dTFxdW01SWZuU2FZeE1kS1dhOFBWRnc9PQo8L2NvbnRlbnQ+PHNpZ25hdHVyZT5rWTlRZ25hNEhJdk1XTExGanFVMzdkbThobkE2SDFteFFyTzFuTktLejZsZ1F6SmkzWVp3OC9CU0dqNXFYeWVuMldNU3pwK3BPdjl3ClJUREIwcEZPeWZTVlVQTTY1SjQrTzVwOTlrdlN3V0hVSjZtNXd2NVAvQTU5cjR2bDRzQUcyZDBoTzhiRUw0aTVyWFB2enNNNEFjSHgKTWFlMENkSDlmS0p0VWtkU1owNXpaM0lZUU5aWVlZT0FUUVZnUFlLbW5QaU13eW1qTGFUU2VMdXI2OVB4ekw5WkQ1SVpMQ1NIbnE1VApIeC9PMWczaWh0eis1NVpQUWROS3hkY3d0TGdFNU5KZE9rb2FMNkZUWUxjeFhFcEtaRjR0N1JIWm4rUzBtYTNsbVAwcFJ1Y0RkaHZiCk5la0pXMGdDNzc5M0JUWlM1SkMzbmVLNlA1QklzbXg3MUttZXNBPT0KPC9zaWduYXR1cmU+PGNlcnRpZmljYXRlPi0tLS0tQkVHSU4gQ0VSVElGSUNBVEUtLS0tLQpNSUlEenpDQ0FyZWdBd0lCQWdJVUlIM1ZQVDdkbHYvUFJJcCs0RDlia2hEeEI4c3dEUVlKS29aSWh2Y05BUUVMCkJRQXdnWjh4SURBZUJna3Foa2lHOXcwQkNRRVdFV1psYm1kb1lXOUFjWFJ5ZFc0dVkyOXRNUXN3Q1FZRFZRUUcKRXdKRFRqRVFNQTRHQTFVRUNBd0hRbVZwYW1sdVp6RVFNQTRHQTFVRUJ3d0hRbVZwYW1sdVp6RWJNQmtHQTFVRQpDZ3dTVVZSU1ZVNGdWR1ZqYUc1dmJHOW5hV1Z6TVJBd0RnWURWUVFMREFkUWNtOWtkV04wTVJzd0dRWURWUVFECkRCSlJWRkpWVGlCUWNtOWtkV04wSUZKdmIzUXdIaGNOTWpZd09ESTBNRGN3TURBM1doY05Nall4TVRJeU1EY3cKTURBM1dqQ0JoakVkTUJzR0NTcUdTSWIzRFFFSkFSWU9hVzVtYjBCeGRISjFiaTVqYjIweEN6QUpCZ05WQkFZVApBa05PTVJBd0RnWURWUVFJREFkQ1pXbHFhVzVuTVJBd0RnWURWUVFIREFkQ1pXbHFhVzVuTVJzd0dRWURWUVFLCkRCSlJWRkpWVGlCVVpXTm9ibTlzYjJkcFpYTXhGekFWQmdOVkJBTU1EbEJKUUcwdWNYUnlkVzR1WTI5dE1JSUIKSWpBTkJna3Foa2lHOXcwQkFRRUZBQU9DQVE4QU1JSUJDZ0tDQVFFQXFXK1N4VGFjdUZoZVJvVWlNSU5VazEvdApTUVNhdVJBUndjdS9VdVdhUHpzTUl1WnhmQmR6MSs3UzZkeDNuemQyalFQb24vOGpLSkNCOFhBQkIrOEw3WGkyCjVvaHlQMlROTmFkWGNLdHFIbG9OVURhbkp6NjJaV2JIVi9jT29yd2l0VEdoK3hGNTVvNUNrY0VtcG1nRndPSnQKdklpZ1FybW8vWWhTaitZVTFvMHo5VjdYb2Q5eEVtM0ZJVE05OXZjcERrU3Vna3ZIRXNXcUN5Mm51ZzB1bUw3RQo1NDZnR01oYXZONGcydzR5VWc3bTBzck9PaURrRVRZaE5KNmF0cmNCZUZPbVNvYkdwYmdSV3k5MnhKaE1zRWFICjdoV1ZwK1V1SEpQZnJtaFhLZThBRlRZa3ltK0pwSVFwYWtVT2ZOZkJUbGJLMHVRdmlMTGdxTGl4dml2WXZRSUQKQVFBQm94b3dHREFKQmdOVkhSTUVBakFBTUFzR0ExVWREd1FFQXdJRjREQU5CZ2txaGtpRzl3MEJBUXNGQUFPQwpBUUVBcXBOeUwwMVB0SWRkTlNFSkFLZ3QzNzRiUVo3bFhONTcyWmkxQnpjTE5wRmZFRFhKeEM5QU03MHhzUWlnCjRacnVLYk9lRzV5cGhlZVV4YTllL3cvdTF2WHV4VlI5T1B3djBjd0dIZllSY2tWaHhmQXY3ajlkZEhad3lYYlMKbTZSUzI5Q29Zb2VMYS9FNkZxM0NCWnNrZXI4Rm5VbElJQlp5NldNYmlqa3JqUnVsT1lzUjM5TkJNNzdIU3JlNQppOTlaR1AyTUNEUGxncGErMVQzRS9vdXZMQ1Z5S2lvTGR1SG9QcmlsWVNoRkxmMGU2RUtVOHlkQmtFSzVPbHVNClZ0MzB6MEZZWHRvZ1VLZndsQjcrVzh2am9SQmdER291ZDV5OXo4WWFLQ2Q1anhneXhidDBRMmVLYkd2a1BqVjgKeFZZSE9QSXZpS3BzNTZxL0VQaExaUUJ5Z3c9PQotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCi0tLS0tQkVHSU4gQ0VSVElGSUNBVEUtLS0tLQpNSUlGS3pDQ0F4T2dBd0lCQWdJVVR6TTRJcHV0Z2sraERIaDc3TFQ0bVVKdkg5Y3dEUVlKS29aSWh2Y05BUUVMCkJRQXdnWmt4SFRBYkJna3Foa2lHOXcwQkNRRVdEbWx1Wm05QWNYUnlkVzR1WTI5dE1Rc3dDUVlEVlFRR0V3SkQKVGpFUU1BNEdBMVVFQ0F3SFFtVnBhbWx1WnpFUU1BNEdBMVVFQnd3SFFtVnBhbWx1WnpFYk1Ca0dBMVVFQ2d3UwpVVlJTVlU0Z1ZHVmphRzV2Ykc5bmFXVnpNUll3RkFZRFZRUUxEQTFCWkcxcGJtbHpkSEpoZEc5eU1SSXdFQVlEClZRUUREQWx4ZEhKMWJpNWpiMjB3SGhjTk1qTXdOekV5TURjME1qQTNXaGNOTWpnd05qRTFNRGMwTWpBM1dqQ0IKbnpFZ01CNEdDU3FHU0liM0RRRUpBUllSWm1WdVoyaGhiMEJ4ZEhKMWJpNWpiMjB4Q3pBSkJnTlZCQVlUQWtOTwpNUkF3RGdZRFZRUUlEQWRDWldscWFXNW5NUkF3RGdZRFZRUUhEQWRDWldscWFXNW5NUnN3R1FZRFZRUUtEQkpSClZGSlZUaUJVWldOb2JtOXNiMmRwWlhNeEVEQU9CZ05WQkFzTUIxQnliMlIxWTNReEd6QVpCZ05WQkFNTUVsRlUKVWxWT0lGQnliMlIxWTNRZ1VtOXZkRENDQVNJd0RRWUpLb1pJaHZjTkFRRUJCUUFEZ2dFUEFEQ0NBUW9DZ2dFQgpBT0h6NHlha1NQenl0cjNsNkxrU0o0bXAxSWVJNDZLY2xGd3VjS2l6dFl2bmJ0Z0EyZEFQK1ZwemNYZFIwSk9VCituRlVOdk5ReURRVDNpTE9oQVhSbWJaemtmeDFEOHYxR3J1eGxYcWU4U1RnODB2TlBkeVBHWFhwTStZRVNLWjEKeUVValJxMXFlOS8xdGowblpCbkIydDhrMnZ4ZkFnRVJqQjZGdWdERDlLKzBIbFJyazg3eDRhcmpHMmo1eWIvSwpPTVI0dXRaZXpKWXk1eFlVaGcwbEcrU2tzanFXN0o3UHRKRjk1cU80ZTQwL0xYNHptZ2xEMUdMUmRYbDlUYzR4CkZJL1hpbFhHb3RUaWJXbmQrTU1laWI5T1N0dG5PZzIyRHZxa2hJLzBqYWE0cTlPWVpwc3UyNFE2UEFUbDduVVIKRW5xeDRwNWVNRWNUU1ROSnIzaUFONVVDQXdFQUFhTmpNR0V3RWdZRFZSMFRBUUgvQkFnd0JnRUIvd0lCQVRBZApCZ05WSFE0RUZnUVVRZmVCNXpJS1B1Q0pvcU5rT3hXQ1pOM3ZEQ1V3SHdZRFZSMGpCQmd3Rm9BVVZQS0hERHB2Ck5sbnBUekZVTTBHMDAzTnA4Skl3Q3dZRFZSMFBCQVFEQWdFR01BMEdDU3FHU0liM0RRRUJDd1VBQTRJQ0FRQmwKN0wxajBweWlGQ1RRcTFCTWg4R2ZJVncwbytacU1TQnBRSjFsdk0xTzNkTE95TVEvM3RKQlM0RzE4WUl0TWVxRAo1dGxob1hGNno3QXZXNjZFUDFVampYSW9IM0Z2L2Y1aUNQWXBqdk5oYUIxUThhVjM5S3dZTjFIUXoxNkJBVXBECjJJdlE4OEF0TFRFNkFmVG9KQ2VTMnNZNFB4VEtLN3JTZkZwQkdZT3ZvSnN6R2tNUHR5WmR4WFZDNHpxVmt3ZW0KUUlFV08xRzU1ZmFPcUlmTElGOHlHcCtrbDl5ZGVTWWdzT3JkSXNxU3FWM2REaDZwUG93c1VvNFpndE9DWEthUgpGWlMrMm53NHUzSkRuUWNPeUhJeFQ2ZXhKazQ5OFI1eS9wc3dhcTl2TzZ4YmRKVGZLTXl0WTUrTWVkbnplMTA0CjBXRjIwV3JhOXdIeTBTeEVZa0piNHFPbnVhbTdWbnR0OXI5YmQ2Kyt6d0tIN2NuSXZMUmJJSzM5V2dKaTl2dHgKL2huVTIvWnJmTFp2YTloa1hxZEorOURVbWR4TzRpVU1nckNVZlVFUEZmRzREcStURU1CVXpOUlB3S2tITG11bQpGMlVveVp3dDZHb0tILzEwWUFiNTFXdDhVT3ZiUHA4eWQ3RWx5aTBGSWNwQTFBRkh0bmpjTHEyUjI5ZFgvSUwwCmZ2RWx5U2JHcW12aWRBTWswbXBSY2V5Q256U0FiSjkyRTIvK1lmbHlqVGEramFHS3NldmpjU3lMNEFHRDNEczIKbmxSUk5PTE9RYWFKVTgzUHpqLzVzTThMNS9JVVJ0ajJ0MVRSd095MkFVMGV4eWRVZUVTNTdreDFUdDhtOUkzYgpFK0c4QjkyblgxME5xdzFrWnZ4bEE0QThOWFVGYW5DWWJnOW5ETmZBc1E9PQotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCjwvY2VydGlmaWNhdGU+PC9yb290Pg=="""

/**
 * Adds the stock config asset and patches the native validator's integrity-mismatch
 * branch. The config signature/decryption path is left untouched; only the
 * `application.integrity == app.manifest` rejection is skipped.
 */
@Suppress("unused")
val bundleQtrunConfigPatch = rawResourcePatch(
    name = "Bundle QuickTest configuration",
    description = "Adds the stock QTRUN-signed configuration.xml and skips the native " +
            "config-integrity mismatch gate, so the app can start without a fresh /cgi/report response.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_QUICKTEST)

    execute {
        val asset = get(CONFIG_ASSET, false)
        asset.parentFile?.mkdirs()
        asset.writeBytes(Base64.getDecoder().decode(CONFIG_B64))

        val lib = get(JNI_LIB, true)
        val elf = ElfFile.from(lib)
        val fileOffset = fileOffsetOf(elf, VALIDATOR_VA)

        RandomAccessFile(lib, "rw").use { raf ->
            raf.seek(fileOffset)
            val original = ByteArray(VALIDATOR_ORIGINAL.size)
            raf.readFully(original)
            if (!original.contentEquals(VALIDATOR_ORIGINAL)) {
                throw PatchException(
                    "Unexpected bytes at $JNI_LIB+0x${VALIDATOR_VA.toString(16)}: " +
                            original.joinToString("") { "%02x".format(it) } +
                            " (expected ${VALIDATOR_ORIGINAL.joinToString("") { "%02x".format(it) }})",
                )
            }
            raf.seek(fileOffset)
            raf.write(VALIDATOR_PATCHED)
        }
    }
}

/**
 * Translate a virtual address to a file offset using the ELF section headers.
 */
private fun fileOffsetOf(elf: ElfFile, va: Long): Long {
    var index = 0
    while (true) {
        val section = try {
            elf.getSection(index)
        } catch (_: Exception) {
            null
        } ?: break

        val header = section.header
        if (header.sh_addr != 0L && header.sh_size > 0) {
            if (va >= header.sh_addr && va < header.sh_addr + header.sh_size) {
                return header.sh_offset + (va - header.sh_addr)
            }
        }
        index++
    }
    throw PatchException("VA 0x${va.toString(16)} is not inside any ELF section of $JNI_LIB.")
}
