package com.google.firebase.crashlytics.internal.metadata;

import gm.c;
import gm.d;
import gm.e;
import hm.b;
import java.io.IOException;

/* loaded from: classes3.dex */
public final class AutoRolloutAssignmentEncoder implements hm.a {
    public static final int CODEGEN_VERSION = 2;
    public static final hm.a CONFIG = new AutoRolloutAssignmentEncoder();

    public static final class RolloutAssignmentEncoder implements d {
        static final RolloutAssignmentEncoder INSTANCE = new RolloutAssignmentEncoder();
        private static final c ROLLOUTID_DESCRIPTOR = c.a("rolloutId");
        private static final c PARAMETERKEY_DESCRIPTOR = c.a("parameterKey");
        private static final c PARAMETERVALUE_DESCRIPTOR = c.a("parameterValue");
        private static final c VARIANTID_DESCRIPTOR = c.a("variantId");
        private static final c TEMPLATEVERSION_DESCRIPTOR = c.a("templateVersion");

        private RolloutAssignmentEncoder() {
        }

        @Override // gm.b
        public void encode(RolloutAssignment rolloutAssignment, e eVar) throws IOException {
            eVar.f(ROLLOUTID_DESCRIPTOR, rolloutAssignment.getRolloutId());
            eVar.f(PARAMETERKEY_DESCRIPTOR, rolloutAssignment.getParameterKey());
            eVar.f(PARAMETERVALUE_DESCRIPTOR, rolloutAssignment.getParameterValue());
            eVar.f(VARIANTID_DESCRIPTOR, rolloutAssignment.getVariantId());
            eVar.d(TEMPLATEVERSION_DESCRIPTOR, rolloutAssignment.getTemplateVersion());
        }
    }

    private AutoRolloutAssignmentEncoder() {
    }

    @Override // hm.a
    public void configure(b bVar) {
        RolloutAssignmentEncoder rolloutAssignmentEncoder = RolloutAssignmentEncoder.INSTANCE;
        bVar.a(RolloutAssignment.class, rolloutAssignmentEncoder);
        bVar.a(AutoValue_RolloutAssignment.class, rolloutAssignmentEncoder);
    }
}
