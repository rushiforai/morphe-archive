# Consent, ads and tracking are different controls

A privacy screen asks you to make choices about your data. Other parts of the app request ads, display them or record your activity. These parts can work together. Removing one can leave the others running.

## Follow the separate steps

Imagine choosing "no" on a consent screen. The app needs to pass that choice to the relevant components. Whether they stop collecting data depends on how the app controls them. If you only hide the screen, you still do not know which choice was saved or what those components do.

[OneTrust](../trackers/onetrust.md) and [Didomi](../trackers/didomi.md) are consent-management services. They display and handle privacy choices. Fetching settings, recording proof of consent and uploading an advertising event are different actions, even when they happen around the same screen.

## Our consent skips

Where Skip consent screens is supported, the patch includes the required privacy controls. The patch completes the supported automatic steps without recording acceptance or rejection itself. You can still change privacy settings manually, and saved choices remain.

Some apps also have introductory screens for login or notifications. Each app page explains the differences.

## Why ads can disappear while collection remains

An ad space can be hidden while another component still records which screens you visit. A request to load an ad can also carry an identifier. This is why there are separate options for ads, tracking and promotions. Which options need each other depends on the app. [Choose patches](../guides/choose-patches.md).

## What this does not establish

The absence of a consent screen does not tell you how the app handles your data. These technical findings do not give a legal assessment. Skipping a screen also does not show that a provider has deleted data it already held. Read [our evidence method](../reference/methodology.md) for what was checked.
