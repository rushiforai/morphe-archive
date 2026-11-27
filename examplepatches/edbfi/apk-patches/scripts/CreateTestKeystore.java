// SPDX-License-Identifier: AGPL-3.0-or-later

import app.revanced.library.ApkSigner;
import java.nio.file.Files;
import java.nio.file.Path;
import java.time.Instant;
import java.time.temporal.ChronoUnit;
import java.util.Date;
import java.util.Set;

class CreateTestKeystore {
    public static void main(String[] args) throws Exception {
        ApkSigner signer = ApkSigner.INSTANCE;
        var expires = Date.from(Instant.now().plus(10000, ChronoUnit.DAYS));
        var key = signer.newPrivateKeyCertificatePair("ReVanced", expires);
        var keystore = signer.newKeyStore(Set.of(new ApkSigner.KeyStoreEntry("ReVanced Key", "", key)));
        try (var output = Files.newOutputStream(Path.of(args[0]))) {
            keystore.store(output, new char[0]);
        }
    }
}
