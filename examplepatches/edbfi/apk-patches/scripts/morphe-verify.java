// SPDX-License-Identifier: AGPL-3.0-or-later
// Checks that a Morphe patch bundle is signed by the committed key, with Morphe's own verifier.
// Run it with the pinned morphe-desktop jar, which bundles morphe-patcher, as the class path:
//
//   java -cp morphe-desktop-<version>-all.jar scripts/morphe-verify.java <bundle.mpp> <morphe-signing.pub>
//
// Exits 0 only if the bundle's signature is valid and its key is the one in the .pub file.

import app.morphe.patcher.patch.PatchBundleSignature;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;

class MorpheVerify {
    public static void main(String[] args) throws Exception {
        if (args.length != 2) fail("usage: morphe-verify.java <bundle.mpp> <morphe-signing.pub>");
        String expected = Files.readString(Path.of(args[1])).strip();

        String signer;
        try {
            signer = PatchBundleSignature.INSTANCE.verify(new File(args[0]));
        } catch (SecurityException e) {
            fail(e.getMessage());
            return;
        }
        if (signer == null) fail(args[0] + " is not signed");
        if (!signer.equals(expected)) {
            fail(args[0] + " is signed by " + PatchBundleSignature.INSTANCE.fingerprint(signer) + ", not by "
                + PatchBundleSignature.INSTANCE.fingerprint(expected) + " from " + args[1]);
        }
        System.out.println(args[0] + " is signed by " + PatchBundleSignature.INSTANCE.fingerprint(signer));
    }

    private static void fail(String message) {
        System.err.println("::error::" + message);
        System.exit(1);
    }
}
