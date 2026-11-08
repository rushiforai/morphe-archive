/*
 * Restore trust on re-signed builds (Morphe) — signature answer for Instagram.
 *
 * Instagram's security code reads who signed the running app and compares it to a table of Meta
 * certificates. A re-signed build carries a different certificate, so those checks fail (and the
 * login request built from them fails too). This helper answers with Instagram's original Meta
 * signing history when the package being checked is the running app, so the checks pass without
 * changing how Android actually installed the APK.
 *
 * Adapted from HushGram (SysAdminDoc/HushGram) and Andrew Liang's morphe-patches
 * (GPL-3.0; see NOTICE files). Trimmed to the self-package answer only: the same-key
 * Threads/Facebook/Messenger family handling is not needed here and was left out.
 */

package app.morphe.extension.instagram.patches.signature;

import android.content.pm.PackageInfo;
import android.content.pm.Signature;
import android.os.Process;
import android.util.Base64;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public final class InstagramSignature {

    private InstagramSignature() {
    }

    /**
     * Instagram's first signing certificate (CN=Kevin Systrom, O=Instagram Inc), DER in Base64.
     * SHA-256 5f3e50f4…a993e305. Android 7 to 12 report it as the current signer.
     */
    private static final String ORIGINAL_CERTIFICATE =
        "MIICTTCCAbagAwIBAgIETzHSyzANBgkqhkiG9w0BAQUFADBqMQswCQYDVQQGEwJVUzETMBEGA1UECBMKQ2FsaWZv"
        + "cm5pYTEWMBQGA1UEBxMNU2FuIEZyYW5jaXNjbzEWMBQGA1UEChMNSW5zdGFncmFtIEluYzEWMBQGA1UEAxMNS2V2"
        + "aW4gU3lzdHJvbTAgFw0xMjAyMDgwMTQxMzFaGA8yMTEyMDExNTAxNDEzMVowajELMAkGA1UEBhMCVVMxEzARBgNV"
        + "BAgTCkNhbGlmb3JuaWExFjAUBgNVBAcTDVNhbiBGcmFuY2lzY28xFjAUBgNVBAoTDUluc3RhZ3JhbSBJbmMxFjAU"
        + "BgNVBAMTDUtldmluIFN5c3Ryb20wgZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBAInrysAVZgtCpcCAv2lMUuKe"
        + "nfg6TJSWSwIso40rohV9jkZQlVx4eQasNEvbi30gKpIjFAPUjp4vDfPLkXz6m5dBMUyFBSZz1CrQDywlG+SmsBL7"
        + "nVszExsOXKC5GThW3DEdxl3EX5fSYy5yvsK0lkrf1dMGddXTcvuvETWaevtVAgMBAAEwDQYJKoZIhvcNAQEFBQAD"
        + "gYEAKu/YRSa1cBkpZ7Z5poW83BLPQAMFiVlNBNiFz6ijETcvuT8sHIumNvBhrrhyB/WhrSb+WHR8MHFPHpuRirLg"
        + "kNUlAwdlXuq1/t4eZAkxbF0pd5wDe1UPKbytQPpwyUe2FswF2qVTLA7MPs53OnHzcoekrDLyvX/u3oR8usVnGWk=";

    /**
     * The certificate Instagram rotated to (CN=Meta Platforms Inc.), DER in Base64.
     * SHA-256 3a10c50c…fcb4c014. Android 13 and newer report it as the current signer.
     */
    private static final String ROTATED_CERTIFICATE =
        "MIIFxTCCA62gAwIBAgIUb4xy1XKIl+SvqggzYlIIznmgYyUwDQYJKoZIhvcNAQELBQAwgYkxHDAaBgNVBAMME01l"
        + "dGEgUGxhdGZvcm1zIEluYy4xFDASBgNVBAsMC01ldGEgTW9iaWxlMRwwGgYDVQQKDBNNZXRhIFBsYXRmb3JtcyBJ"
        + "bmMuMRMwEQYDVQQHDApNZW5sbyBQYXJrMRMwEQYDVQQIDApDYWxpZm9ybmlhMQswCQYDVQQGEwJVUzAgFw0yNTAz"
        + "MDYyMjI2NTdaGA8yMDU1MDMwNjIyMjY1N1owgYkxHDAaBgNVBAMME01ldGEgUGxhdGZvcm1zIEluYy4xFDASBgNV"
        + "BAsMC01ldGEgTW9iaWxlMRwwGgYDVQQKDBNNZXRhIFBsYXRmb3JtcyBJbmMuMRMwEQYDVQQHDApNZW5sbyBQYXJr"
        + "MRMwEQYDVQQIDApDYWxpZm9ybmlhMQswCQYDVQQGEwJVUzCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIB"
        + "AMBQkySH5FNHvQNDuIMAzNCjI3cfnCUj21mdAzu4unF4ktUNggOMq1Edkh9rJqmPSCs4nftEMEP6OMy913pjFzku"
        + "KSet7k8owQVc/8nw3v6LApRvu4TKRGa5OM33H2YVoeUpXa+N519F4AfVhlFj14zhQf2lqGWLAmcLLVIXiLVu7TfK"
        + "tFda4vgVks2MM/t0B2+UNuXdQbvBDnMODlDHJcgyyUHwDrQ14C6Iokrd4HbFvPzRJ4fwMybiUZhX7VU5Rpq0HDMD"
        + "nL0s8++NTV8nkfkrNcrJNHbB8j+aOYX4U3JG2WNQMh0XMYj54Rv8RiTs0xnDDO/jT7rxQwPaDgCh28+A0LR1o17j"
        + "IsBDGNGZIVRxbps1L5UTzLIeqmxBsTWIF73rQW1J4ta0oGXF/WikHpNU5P9L1VyD4mo0FKKhc2Wevw/aFR0lyhFH"
        + "RAIbqNZdRUPeN/ik7SkMrYSPzFbBQ0j2hcRvjP1szugsucllAFaXWkyAvsdFgcycekfTMqexsXWPsxsVNwHps18B"
        + "9wVQJg9yo+CUwvhDWffLRw+2+Jxj0dqj5HndXTwJ0WIkHrqftEGbcmN6KS0OjMpKYZsMrVTAaonu9Err5Afwva2m"
        + "uppB7H8Yus3Uf5xFBO3HN7zKef6twUM5dxvYfU/+eA7E7pcaKtufPRuKc7/x/nAA/sQBAgMBAAGjITAfMB0GA1Ud"
        + "DgQWBBTmfUsLBke1fodbwdp0IlCEIFuNqzANBgkqhkiG9w0BAQsFAAOCAgEAMR0sxIrV6pdCKsEeOk53UfmFIFsS"
        + "wiufWSiNDQaHM3DEV4XyVFKz3dBDWofgKCDCSCMbzMoBFQAGyGpoAaOaqtkAG3aP9AMr3q6Gr31Yj2h193HivOlF"
        + "zRfx0UHuaV4FZ8iyGiMR68ctgVtgS42RRNdwn/cJy+BgDS+rc+t56BMLOSNSiJTo0M7QBVY1XzjwHWKA4cTC+cbg"
        + "qYJEPo+AYlf7iWTmniLe9e5oUVeld2XSLBoddW4P1oiZNU3jCGbm3/ei+8OWmGfFDEwO1HebVKcFMfA2kXDikb2I"
        + "VA/MhDV06yrpk5FCymQoWR9YrRiV8gE3sAcpqJVPTAHlljPc14QPrCzOF2ZckCCNLgS8E/16h6rsg+vNHbt5j0hk"
        + "zr8xT841Y6sDqNHLfFwOl5huf+KPi5c6lyp88whlz2YWfjPMwCD9cxjgE9qEaUoLvgHUW78TZ1ePpHdw2buOr3im"
        + "oSy0bZPG03d7y4nnvKqO/YiL3aL1MZZ39eG/Mz7WzND4gv9pAFq50gLSt87HyNImICem35KOF5ZPDRI5pWQB6FKQ"
        + "4YBbXJ3FBCv+VH/LeDYBKda/GknQH5ZCu0vf6bPFuXjYsMfZlQMY4TkwpfSHwfTcnA2hWNvc/p4KN2i+BDQhZamc"
        + "4QrP9dH86JW/n5UoPMHP4B9uJzBkffMtqjUmHpg=";

    private static volatile List<Signature> original;

    /**
     * Instagram's signing history, oldest first, when [info] is the running app; otherwise
     * {@code null}, leaving Instagram's own read untouched.
     */
    public static List<Signature> originalSigners(PackageInfo info) {
        if (info == null || !"com.instagram.android".equals(info.packageName)) return null;
        // The name alone is not proof it is this app: the uid is. When PackageManager hasn't filled
        // in the ApplicationInfo there is nothing else to go on, so answer anyway.
        if (info.applicationInfo != null && info.applicationInfo.uid != Process.myUid()) return null;
        return instagram();
    }

    /** Instagram's two certificates, read once. */
    private static List<Signature> instagram() {
        List<Signature> signers = original;
        if (signers == null) {
            signers = Collections.unmodifiableList(Arrays.asList(
                new Signature(Base64.decode(ORIGINAL_CERTIFICATE, Base64.DEFAULT)),
                new Signature(Base64.decode(ROTATED_CERTIFICATE, Base64.DEFAULT))));
            original = signers;
        }
        return signers;
    }
}
