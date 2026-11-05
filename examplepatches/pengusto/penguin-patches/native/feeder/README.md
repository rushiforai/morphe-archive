# Feeder #391 native source candidate

`391-image-viewer.patch` is the native source change from local commit
`36443ba0cf1a11bec50b0972744770d8bf02e7c4`, based on upstream Feeder commit
`7fb9e2263afcb750bb07d159cff0a138eb57c6f4`. It is separate from the Morphe
patch described in [`docs/FEEDER.md`](../../docs/FEEDER.md).

To inspect or restore it, fetch that base from
[`spacecowboy/Feeder`](https://github.com/spacecowboy/Feeder), then run
`git apply --check /absolute/path/to/391-image-viewer.patch` before applying it.
The base and patch were checked against all 990 tracked files in the removed
local checkout. This does not imply that an upstream pull request was opened.

The upstream source and derivative changes retain their original license and
attribution. Test reports and recovery details remain in the local ignored
`.scratch/retained-20261104/` directory.
