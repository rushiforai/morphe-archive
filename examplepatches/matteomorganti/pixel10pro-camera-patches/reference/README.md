# Reference sources

`smali/Tomte*.smali` are the smali sources of the classes inside
`patches/src/main/resources/TomteInitHelper.dex`. They come from
Akshayykadam/Pixel-Camera, commit `10b75fab7c4036a836061d3619aea1a9c0845bec`
(`smali_patches/`), GPL-3.0, and are copied unmodified.

They are here for reference and review only: the build uses the precompiled
upstream `.dex` and does not recompile them.

These sources were not checked byte for byte against the `.dex` (see
WORKLOG.md). The 28 obfuscated types the `.dex` references were checked: all
of them exist in Pixel Camera 11.1.040.
