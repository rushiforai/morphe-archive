package dev.jason.gboardpatches.extension.longpressquickactions;

import java.lang.ref.ReferenceQueue;
import java.lang.ref.WeakReference;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Objects;

/** Bounded weak-identity index used when a terminal arrives without an endpoint owner. */
final class GboardGlobeDragBoundSlotRegistry {
    private static final int MAX_BINDINGS = 64;
    private static final GboardGlobeDragBoundSlotRegistry SHARED =
            new GboardGlobeDragBoundSlotRegistry();

    private final ReferenceQueue<Object> collectedMetadata = new ReferenceQueue<>();
    private final Map<IdentityWeakReference, Binding> bindings =
            new LinkedHashMap<IdentityWeakReference, Binding>(MAX_BINDINGS, 0.75f, true) {
                @Override
                protected boolean removeEldestEntry(
                        Map.Entry<IdentityWeakReference, Binding> eldest) {
                    return size() > MAX_BINDINGS;
                }
            };

    static GboardGlobeDragBoundSlotRegistry shared() {
        return SHARED;
    }

    synchronized void observe(Object metadata,
            GboardGlobeDragPhysicalSlotPolicy.ShortcutSlot slot,
            int keyId, String pressText,
            int pressCarrierCode,
            int alphabetCarrierCode) {
        purgeCollectedMetadata();
        if (metadata == null) {
            return;
        }
        IdentityWeakReference lookup = new IdentityWeakReference(metadata, null);
        if (!GboardGlobeDragPhysicalSlotPolicy.isAlphabetKey(
                pressText, pressCarrierCode, alphabetCarrierCode)) {
            bindings.remove(lookup);
        } else {
            bindings.remove(lookup);
            bindings.put(
                    new IdentityWeakReference(metadata, collectedMetadata),
                    new Binding(slot, keyId, pressText));
        }
    }

    synchronized GboardEditingShortcutPolicy.Shortcut resolve(
            Object metadata,
            int keyId, String pressText,
            int pressCarrierCode,
            int alphabetCarrierCode) {
        GboardGlobeDragPhysicalSlotPolicy.ShortcutSlot slot = resolveSlot(
                metadata, keyId, pressText, pressCarrierCode, alphabetCarrierCode);
        return GboardGlobeDragPhysicalSlotPolicy.resolve(
                slot, pressText, pressCarrierCode, alphabetCarrierCode);
    }

    synchronized GboardGlobeDragPhysicalSlotPolicy.ShortcutSlot resolveSlot(
            Object metadata,
            int keyId, String pressText,
            int pressCarrierCode,
            int alphabetCarrierCode) {
        purgeCollectedMetadata();
        if (metadata == null) {
            return null;
        }
        if (!GboardGlobeDragPhysicalSlotPolicy.isAlphabetKey(
                pressText, pressCarrierCode, alphabetCarrierCode)) {
            return null;
        }
        Binding binding = bindings.get(new IdentityWeakReference(metadata, null));
        if (binding != null) {
            return binding.matches(keyId, pressText)
                    ? binding.slot
                    : null;
        }
        GboardGlobeDragPhysicalSlotPolicy.ShortcutSlot resolvedSlot = null;
        for (Map.Entry<IdentityWeakReference, Binding> entry : bindings.entrySet()) {
            if (entry.getKey().get() == null) {
                continue;
            }
            Binding candidate = entry.getValue();
            if (!candidate.matches(keyId, pressText)) {
                continue;
            }
            if (candidate.slot == null) {
                return null;
            }
            if (resolvedSlot != null && resolvedSlot != candidate.slot) {
                return null;
            }
            resolvedSlot = candidate.slot;
        }
        return resolvedSlot;
    }

    private void purgeCollectedMetadata() {
        IdentityWeakReference reference;
        while ((reference = (IdentityWeakReference) collectedMetadata.poll()) != null) {
            bindings.remove(reference);
        }
    }

    private static final class Binding {
        private final GboardGlobeDragPhysicalSlotPolicy.ShortcutSlot slot;
        private final int keyId;
        private final String pressText;

        Binding(GboardGlobeDragPhysicalSlotPolicy.ShortcutSlot slot,
                int keyId, String pressText) {
            this.slot = slot;
            this.keyId = keyId;
            this.pressText = pressText;
        }

        boolean matches(int candidateKeyId, String candidatePressText) {
            return keyId == candidateKeyId && Objects.equals(pressText, candidatePressText);
        }
    }

    private static final class IdentityWeakReference extends WeakReference<Object> {
        private final int identityHashCode;

        IdentityWeakReference(Object referent, ReferenceQueue<Object> queue) {
            super(referent, queue);
            identityHashCode = System.identityHashCode(referent);
        }

        @Override
        public boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof IdentityWeakReference reference)) {
                return false;
            }
            Object referent = get();
            return referent != null && referent == reference.get();
        }

        @Override
        public int hashCode() {
            return identityHashCode;
        }
    }
}
