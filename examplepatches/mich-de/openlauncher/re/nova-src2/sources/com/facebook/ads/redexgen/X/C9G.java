package com.facebook.ads.redexgen.X;

import java.util.List;
import java.util.Map;
import java.util.Set;

/* renamed from: com.facebook.ads.redexgen.X.9G, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public class C9G extends AbstractC07579o<String, List<String>> {
    public final Map<String, List<String>> A00;

    public C9G(Map<String, List<String>> headers) {
        this.A00 = headers;
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Override // com.facebook.ads.redexgen.X.AbstractC07579o, java.util.Map
    /* renamed from: A00, reason: merged with bridge method [inline-methods] */
    public final List<String> get(Object obj) {
        if (obj == null) {
            return null;
        }
        return (List) super.get(obj);
    }

    public static /* synthetic */ boolean A01(String str) {
        return str != null;
    }

    public static /* synthetic */ boolean A02(Map.Entry entry) {
        return entry.getKey() != null;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1313Vw
    /* renamed from: A05, reason: merged with bridge method [inline-methods] */
    public final Map<String, List<String>> A03() {
        return this.A00;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC07579o, java.util.Map
    public final boolean containsKey(Object obj) {
        return obj != null && super.containsKey(obj);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC07579o, java.util.Map
    public final boolean containsValue(Object obj) {
        return A06(obj);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC07579o, java.util.Map
    public final Set<Map.Entry<String, List<String>>> entrySet() {
        return VX.A07(super.entrySet(), new InterfaceC1334Wt() { // from class: com.facebook.ads.redexgen.X.TB
            @Override // com.facebook.ads.redexgen.X.InterfaceC1334Wt
            public final boolean A4d(Object obj) {
                return C9G.A02((Map.Entry) obj);
            }
        });
    }

    @Override // java.util.Map
    public final boolean equals(Object obj) {
        return obj != null && A07(obj);
    }

    @Override // java.util.Map
    public final int hashCode() {
        return A04();
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC07579o, java.util.Map
    public final boolean isEmpty() {
        if (super.isEmpty()) {
            return true;
        }
        return super.size() == 1 && super.containsKey(null);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC07579o, java.util.Map
    public final Set<String> keySet() {
        return VX.A07(super.keySet(), new InterfaceC1334Wt() { // from class: com.facebook.ads.redexgen.X.TC
            @Override // com.facebook.ads.redexgen.X.InterfaceC1334Wt
            public final boolean A4d(Object obj) {
                return C9G.A01((String) obj);
            }
        });
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC07579o, java.util.Map
    public final int size() {
        return super.size() - (super.containsKey(null) ? 1 : 0);
    }
}
