# Local build and checks

Use Python 3, Java 17, ECJ 3.38.0, Android API 35 stubs, D8 8.7.18, smali/baksmali/dexlib2/util 2.5.2, and dex2jar 2.4 helpers.jar from the official 1.9.12 helper payload. The base MPP digest is checked before compilation.

```sh
python build.py --base base.mpp --tools tools --output nicoid-re-1.10.0.mpp
python verify.py base.mpp nicoid-re-1.10.0.mpp
python test/download_actions_test.py tools/ecj.jar
python test/player_download_test.py tools/ecj.jar
python test/download_files_test.py tools/ecj.jar
python test/comment_continuity_test.py tools/ecj.jar
python test/cache_titles_test.py tools/ecj.jar
python test/fragment_media_test.py tools/ecj.jar
python test/mp4_transfer_test.py tools/ecj.jar
python test/download_queue_test.py tools/ecj.jar
python test/output_binding_test.py tools/ecj.jar
```

src contains replacement helpers. native is the baseline used to check field preservation. The builder overlays helpers and method deltas onto the official MPP. JVM doubles do not provide Android media codecs, a document provider, or the real service lifecycle. Android device testing remains necessary.

fragment_media_test.py additionally requires ffmpeg/ffprobe with libx264/AAC. It creates test-pattern media in a temporary directory and verifies packets against ffprobe; it does not use a device codec or a live video service.
