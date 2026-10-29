# 6jarjar6 Patches

Personal patch bundle for Morphe

## AI disclaimer

These patches were developed with AI assistance. Each patch was statically verified at the time of release. These patches are provided as-is, without a warranty of any kind.

---

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=6jarjar6/morphe-patches

## Patches list

<!-- PATCHES_START -->

<!-- Do not modify this section by hand. Regenerate it locally with:
     ./gradlew generatePatchesList
     python3 .github/scripts/generate_patches_readme.py 6jarjar6/morphe-patches <version> patches-list.json README.md
-->

<!-- PATCHES_END -->

### Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## License

6jarjar6 Patches are licensed under the [GNU General Public License v3.0](LICENSE)
