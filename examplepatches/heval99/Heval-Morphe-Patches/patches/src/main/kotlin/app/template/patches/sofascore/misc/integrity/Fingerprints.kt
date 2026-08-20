package app.template.patches.sofascore.misc.integrity

import app.morphe.patcher.Fingerprint

// Play Integrity API token request
object IntegrityManagerRequestTokenFingerprint : Fingerprint(
    custom = { method, classDef -> classDef.type.contains("IntegrityManager") && method.name == "requestIntegrityToken" }
)

// Play Integrity API factory create
object IntegrityManagerFactoryCreateFingerprint : Fingerprint(
    custom = { method, classDef -> classDef.type.contains("IntegrityManagerFactory") && method.name == "create" }
)
