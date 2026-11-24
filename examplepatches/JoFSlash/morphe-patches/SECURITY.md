# Security

## Supported versions

Only the latest release gets fixes. Morphe Manager updates the patches on its own, so an older
bundle is replaced as soon as a new one is out.

## Reporting a vulnerability

Please don't open a public issue. Report it privately through
[GitHub's vulnerability reporting](https://github.com/JoFSlash/morphe-patches/security/advisories/new)
with what you found, how to reproduce it, and the versions of the app, the patches and Morphe Manager.
You'll get an answer within a week, and a fix goes out as an urgent release instead of waiting for
the weekly one.

## What counts

In scope is the code this repository adds to the apps it patches (the list is in the [README](README.md)):

- the extension code in `extensions/`, for example the bridge Quora's page scripts use to talk to
  the app, the settings backup and restore, saving images and opening links, Booking.com's price
  watch and Google Hotels comparison, and the Google Health clone,
- the scripts and styles the page patches inject into Quora's pages,
- the build and release workflows, and the signing of the published bundle.

Out of scope are problems in the patched apps themselves or their websites, in Morphe Manager or the Morphe CLI, and in
MicroG-RE. Please report those to their own projects.

## Checking a release

The bundles are built and signed by the Release workflow on GitHub. The public key Morphe Manager
uses to check them is in [`morphe-signing.pub`](morphe-signing.pub). Only install the bundle from
this repository's releases or through Morphe Manager.
