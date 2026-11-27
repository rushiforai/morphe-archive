package dev.jason.gboardpatches.extension.longpressquickactions;

import android.view.View;

/** Version seam between stable gesture ownership and Gboard-private carriers. */
interface GboardGlobeDragPort {
    boolean isGlobeView(View view);

    Object patchGlobeMetadata(Object metadata, Object marker) throws Throwable;

    Object extractSoftKeyMetadata(Object softKeyView) throws Throwable;

    void observeBoundKey(Object metadata, View view) throws Throwable;

    InputSignal inspectInputEvent(Object event, Object marker) throws Throwable;

    GestureSignal inspectGesture(Object actionType, Object entry, Object metadata)
            throws Throwable;

    TargetSignal inspectPointerTarget(Object softKeyView, Object metadata) throws Throwable;

    TargetSignal inspectTerminalTarget(Object metadata, int selectedCode) throws Throwable;

    boolean cancelScheduledLongPress(Object pointerTracker) throws Throwable;

    final class InputSignal {
        final String actionType;
        final int selectedCode;
        final Object metadata;
        final boolean markerDown;
        final boolean markerUp;
        final boolean languageSwitch;
        final boolean chord;

        InputSignal(String actionType, int selectedCode, Object metadata,
                boolean markerDown, boolean markerUp,
                boolean languageSwitch, boolean chord) {
            this.actionType = actionType;
            this.selectedCode = selectedCode;
            this.metadata = metadata;
            this.markerDown = markerDown;
            this.markerUp = markerUp;
            this.languageSwitch = languageSwitch;
            this.chord = chord;
        }
    }

    final class GestureSignal {
        final String actionType;
        final int selectedCode;
        final Object metadata;
        final boolean languageSwitch;
        final TargetSignal target;

        GestureSignal(String actionType, int selectedCode, Object metadata,
                boolean languageSwitch, TargetSignal target) {
            this.actionType = actionType;
            this.selectedCode = selectedCode;
            this.metadata = metadata;
            this.languageSwitch = languageSwitch;
            this.target = target;
        }
    }

    final class TargetSignal {
        final Object metadataIdentity;
        final Object claimIdentity;
        final int keyId;
        final String pressText;
        final Object entryPayload;
        final GboardEditingShortcutPolicy.Shortcut shortcut;
        final boolean terminalCandidate;

        TargetSignal(Object metadataIdentity, Object claimIdentity,
                int keyId, String pressText,
                Object entryPayload,
                GboardEditingShortcutPolicy.Shortcut shortcut,
                boolean terminalCandidate) {
            this.metadataIdentity = metadataIdentity;
            this.claimIdentity = claimIdentity;
            this.keyId = keyId;
            this.pressText = pressText;
            this.entryPayload = entryPayload;
            this.shortcut = shortcut;
            this.terminalCandidate = terminalCandidate;
        }
    }
}
