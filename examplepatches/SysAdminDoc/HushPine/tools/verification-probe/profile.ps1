# The verification probe's one profile: what it instruments, its own package and its log tag.
function Get-VerificationProbeProfile {
    return [pscustomobject]@{ Name = 'pinedrama-whole-app-v1'; Package = 'com.ss.android.ttmd.video'; ProbePackage = 'app.hushpine.verification'
        Instrumentation = 'app.hushpine.verification.Probe'; LogTag = 'HushPineProbe' }
}
