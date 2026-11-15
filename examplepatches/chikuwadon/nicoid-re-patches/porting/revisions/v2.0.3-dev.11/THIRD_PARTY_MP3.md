# MP3 encoder dependency

nicoid Re's optional **MP3で保存** feature uses a Java port of LAME.
It is a genuine PCM-to-MPEG Layer III encoder, not AAC with an .mp3 suffix.

- Upstream: https://github.com/nwaldispuehl/java-lame
- Source revision: \`0224bc48f7ca4c9dfafea3d3bee13be741d34552\` (v3.98.4)
- License: GNU Lesser General Public License v3 (upstream LICENSE)
- Source: https://github.com/nwaldispuehl/java-lame/tree/0224bc48f7ca4c9dfafea3d3bee13be741d34552
- Rebuilding: \`porting/revisions/v2.0.3-dev.11/build_mpp.py\` automatically clones this exact revision, builds only the core MP3 classes with Java 8 and runs an audio encoding smoke test. It also embeds the complete upstream LICENSE in the generated MPP as \`META-INF/java-lame-3.98.4-LGPL-3.0.txt\`.

The Java LAME source itself is available from the linked revision and must remain available with its upstream license when redistributing modified builds.

**Implementation details**

The existing MP4 download queue is reused. MP3 jobs store their selected bitrate as a negative \`Job.height\` sentinel, preserving all existing serialized MP4 job formats. Audio is decoded from the authenticated temporary HLS remux and re-encoded to 128, 192, or 256 kbps MP3. Finished files use \`audio/mpeg\` and the selected MP4 save folder.

For efficiency, a later revision can select only the HLS audio rendition and skip temporary video downloads. This first implementation preserves the established authentication, quality and retry flow, and cleans temporary video tracks on completion.
