package w0;

import android.view.textclassifier.TextClassification;

/* loaded from: classes2.dex */
public final class h extends b {

    /* renamed from: b, reason: collision with root package name */
    public final TextClassification f93426b;

    /* renamed from: c, reason: collision with root package name */
    public final int f93427c;

    public h(Object obj, TextClassification textClassification, int i5) {
        super(obj);
        this.f93426b = textClassification;
        this.f93427c = i5;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("TextContextMenuRemoteActionItem(key=");
        sb2.append(this.f93414a);
        sb2.append(", textClassification=");
        sb2.append(this.f93426b);
        sb2.append(", index=");
        return a2.c.m(sb2, this.f93427c, ')');
    }
}
