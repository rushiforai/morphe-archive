package un;

import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;

/* loaded from: classes3.dex */
public enum g {
    DEFINED_BY_JAVASCRIPT("definedByJavaScript"),
    UNSPECIFIED("unspecified"),
    /* JADX INFO: Fake field, exist only in values array */
    LOADED("loaded"),
    /* JADX INFO: Fake field, exist only in values array */
    BEGIN_TO_RENDER("beginToRender"),
    /* JADX INFO: Fake field, exist only in values array */
    ONE_PIXEL("onePixel"),
    /* JADX INFO: Fake field, exist only in values array */
    VIEWABLE("viewable"),
    /* JADX INFO: Fake field, exist only in values array */
    AUDIBLE("audible"),
    /* JADX INFO: Fake field, exist only in values array */
    OTHER(InneractiveMediationNameConsts.OTHER);


    /* renamed from: a, reason: collision with root package name */
    public final String f91388a;

    g(String str) {
        this.f91388a = str;
    }

    @Override // java.lang.Enum
    public final String toString() {
        return this.f91388a;
    }
}
