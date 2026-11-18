## [1.1.2](https://github.com/semicoloncolonel/tv-morphe-patches/compare/v1.1.1...v1.1.2) (2026-11-18)

### Bug fixes

- **MLB**: Skip ads no longer breaks a playlist that starts with an ad. Removing that ad also removed the lines that begin the playlist, so the video could not play. An encryption or map change right before an ad break is now kept as well.
- **YouTube TV**: Block tracking now answers each blocked request with an empty response, as intended. Before, the blocked request returned nothing, which could cause errors in the page.


## [1.1.1](https://github.com/semicoloncolonel/tv-morphe-patches/compare/v1.1.0...v1.1.1) (2026-11-18)

### Supported apps

- **Starz**: the Android TV build of 6.12.1 (version code 9511) is now supported. Before, 6.12.1 was listed with the phone build's version code (4519), so Morphe Manager refused the Android TV build and offered the phone build instead. 6.12.0 is still supported.
- **Starz**: 6.11.0 is no longer supported. It was a phone version and was never tested on an Android TV build.
