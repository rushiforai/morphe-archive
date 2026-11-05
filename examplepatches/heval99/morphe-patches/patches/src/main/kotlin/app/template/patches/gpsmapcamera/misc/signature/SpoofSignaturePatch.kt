package app.template.patches.gpsmapcamera.misc.signature

import app.template.patches.shared.Constants.COMPATIBILITY_GPSMAPCAMERA
import app.template.patches.shared.misc.signature.spoofSignaturePatch

// The Play app-signing certificate (CN=Android, OU=Android, O=Google Inc., L=Mountain View,
// ST=California, C=US; SHA-256 ad0e1988...8d37, SHA-1 9195b65a6300de633b99a1fd84a9c191ab8a4fa4),
// DER as base64, read from the v3 signing block of the 1.0.31 Play base split (the merged APK's
// block no longer verifies, the certificate is intact).
// The Places SDK sends this certificate's SHA-1 as X-Android-Cert, computed in the app's dex from
// getPackageInfo(package, GET_SIGNATURES), and the app's Places key only accepts it, so a re-signed
// build loses place search; Firebase (Remote Config, Installations) sends it too. The map tiles
// are authorised inside Google Play services, not in the app, so this cannot fix those. On by
// default because it is a fix users should not have to discover.
internal const val GPSMAPCAMERA_CERTIFICATE =
    "MIIFiDCCA3CgAwIBAgIUJssvoI9f9umuHoJWsiWtI7NTpQgwDQYJKoZIhvcNAQELBQAwdDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCkNhbGlmb3JuaWExFjAUBgNVBAcTDU1vdW50YWluIFZpZXcxFDASBgNVBAoTC0dvb2dsZSBJbmMuMRAwDgYDVQQLEwdBbmRyb2lkMRAwDgYDVQQDEwdBbmRyb2lkMCAXDTI1MDEzMTA4NTUyMloYDzIwNTUwMTMxMDg1NTIyWjB0MQswCQYDVQQGEwJVUzETMBEGA1UECBMKQ2FsaWZvcm5pYTEWMBQGA1UEBxMNTW91bnRhaW4gVmlldzEUMBIGA1UEChMLR29vZ2xlIEluYy4xEDAOBgNVBAsTB0FuZHJvaWQxEDAOBgNVBAMTB0FuZHJvaWQwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQDMj6lLneft2/NL6qFNFtqF4NH/7IUMKdiZe4c+SOzONsLYUzZehfjWxb4po0FPD2qzqf/oLat20pbgikXbMBwQ7MNumVS91DjjAExulczHWpIygvlhuGq7AQwS2KRlGT4GdtMgOgxZk3oVdMSJmvOmxc/+Wknmbqw5QlDHvE8XMgJ9d/deysu4vrDK7kQOXdA4pu5HZLks5pKXezO1oDMf3wVKAno05mKOHnnYVUYb/28i8iNfcOlAppRUND3JFR7llbXhn4I0wuagiwFQy8rDsyQCM2knd3C3f4fsf05PelmaksPKQI9D8B0kUKiGxhFa5gjkUhER7vKq1Sfa6BOrCko5zGHm6MOyyEK7p9NNgvLjqJXcGhkFXr0ZZmUthICrp2u5VHJt+OVMPgNZSMTAclrUywAgMp/pNzQYBPuh75anEXMcKbn/31yH9w3E5BgkvCtt+nNEkzwmhoj7w3jw97rl6/xD+TEyPLKI5iiIsj5XbAv0//wfVkOb12b/TeyR6/xZnnbP75pZ+pOEjE0wK/iSHvh4DOoQ/4GvRz7iw2VXMcVFqNtbc0Ga2r4RxYQEArxhMgGFDSy1u9BtZlvsFPGGpaQMnB65vO4jt7S3rLvGNHqnj/S0VNXt7tfZlNFEoNuQO721GbkTaxOsuYyqmtzuvBweq5Jah5D7NY3L0QIDAQABoxAwDjAMBgNVHRMEBTADAQH/MA0GCSqGSIb3DQEBCwUAA4ICAQBcCkDLvzfiXEIK2G+KI8ZKjZe0lo2naI0VVTfqvkL3uuIB4zo/ZYvpdgFG24Hz2oQPd2F9WgMKosdIem+tYyaJqo8tGSeEcrYoqDLIWARdplK9z5RRoJiXNBQiDSPf46bRdvBcOiPGk9HEu4QO8DoFeZ7TGjZ0K1md630hyDe1+H1lwGUyNxI4YXnq173cIfgjaePQ9X29b6Fl/+hPzpr4TiQSSn8Iopr59uJ80Mu3xTU+x8iyCx9GL4n1Atu1FRI0zxyvqG2wI7ehUI2PFNyTD8xSk4g+tYFagX2JVa8TkElU7ghq1Hie9PccWVEFIDCyKQ2tT29MlbFz0azT6Gv93LALbgyDRsCsLFTtrvJ7iknEmJqNxFzZhG9VkRm8TRheS26i4Ei5AUkytedam8s20M3v1yKVBQ+dsDS9DCD9WrOixTAeO3pU5lLVgGU/OEfCzBLj/ruv8nXTyfdxcmntrdXFUy0N1lhGsoV65YXWRAV24BKeKF6dJIqs0+hsTCFjMAELfaBDaN90opjIic1r7PEz1izmt/x+HQtl9KynLf2IA/SXLaaydQyuU4NBNrZQ4pZc09H4QU3pJYNBsD7XLZhtKdwdxSrkbnlDFyce1SaWmw2/f/RCYa70iU1FOiqvxD2BFKF+5+eSoKzkyOE1awy/D3Ciu/y4WRSzb4HIfw=="

@Suppress("unused")
val spoofSignaturePatch = spoofSignaturePatch(
    fromPackageName = "com.gkfriend.gpsmapcameraeditor",
    certificateBase64 = GPSMAPCAMERA_CERTIFICATE,
    compatibility = COMPATIBILITY_GPSMAPCAMERA,
    default = true,
    description = "Fixes place search and other Google services in the patched app.",
)
