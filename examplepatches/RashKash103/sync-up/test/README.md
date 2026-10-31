# Offline checks

With a JDK 11 or newer available through `JAVA_HOME` or `PATH`, run:

```sh
uv run test/test_slink_security.py
uv run test/test_request_parsing.py
```

Alternatively, pass `--java-home /path/to/jdk`. Neither runner has Python package
dependencies, and neither needs an Android SDK or GitHub Packages credentials. Each
compiles the production code it covers against temporary, test-only stubs and runs the
Java test programs. Nothing is installed or sent over the network. That is what makes
them worth running on a pull request from a fork, where none of those secrets exist, and
both gate the release.

Every stub method throws. A stub that is reached is a test that is wrong about what it
is measuring, so it fails rather than passing quietly.

## The share link resolver

The checks cover legitimate share links, malicious hostnames and URL components,
HTTPS and port restrictions, redirects, and the `#bypass` fallback. A fake HTTPS
transport exercises the production credential method: rejected destinations must
not open a connection or reach the Android navigation code, while validated Reddit
requests retain their token, method, timeouts and disabled automatic redirects.

## Request parsing

`test_request_parsing.py` covers what the two Reddit endpoint patches read before anything
is fetched on the app's behalf, and the Imgur slug reader.

The lookup path is matched in the two spellings Sync uses and no others. The list of posts
asked about is answered in full or not at all, since a part answer would leave Sync
believing the rest do not exist, and it is capped, which is what keeps one tap from
becoming a burst of requests. The form body a "view more" sends is matched on whole field
names, so a longer name that merely begins or ends the same is not read in place of the
one wanted. An Imgur slug gives up its id only where the ending looks like one, and is
otherwise handed back exactly as it came, since a guess is worse than the original.

None of those methods touch okhttp or org.json, which is why compile-only stubs suffice.

## What these do not cover

These checks supplement patching a real APK and testing on Android. They do not verify the
Android WebView login flow, exercise a live Reddit account, or run any patch against a real
APK — the patcher and a device are still the only things that catch a bad fingerprint or a
register read from the wrong place.
