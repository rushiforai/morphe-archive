package com.medium.android.donkey.read.carousel;

import android.animation.TimeInterpolator;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.transition.ChangeBounds;
import android.transition.ChangeImageTransform;
import android.transition.Transition;
import android.transition.TransitionSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.TextView;
import androidx.constraintlayout.widget.ConstraintLayout;
import com.drew.metadata.pcx.bLHD.HrUBqHumRuLe;
import com.medium.reader.R;
import defpackage.a5f;
import defpackage.b5f;
import defpackage.bu1;
import defpackage.c5f;
import defpackage.cx7;
import defpackage.dqb;
import defpackage.e5f;
import defpackage.em4;
import defpackage.f70;
import defpackage.fo3;
import defpackage.fy3;
import defpackage.fy5;
import defpackage.g01;
import defpackage.g76;
import defpackage.gr7;
import defpackage.gx5;
import defpackage.hy2;
import defpackage.iq1;
import defpackage.iw5;
import defpackage.jw5;
import defpackage.kva;
import defpackage.kw5;
import defpackage.mte;
import defpackage.mw5;
import defpackage.n1b;
import defpackage.n92;
import defpackage.na3;
import defpackage.nw5;
import defpackage.nx5;
import defpackage.o7f;
import defpackage.q84;
import defpackage.qb8;
import defpackage.rw5;
import defpackage.rz2;
import defpackage.sw5;
import defpackage.u94;
import defpackage.ute;
import defpackage.uz5;
import defpackage.v2;
import defpackage.vm2;
import defpackage.vn7;
import defpackage.vx0;
import defpackage.wld;
import defpackage.wx5;
import defpackage.xm5;
import defpackage.yec;
import defpackage.z72;
import java.util.Map;
import java.util.WeakHashMap;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ImageCarouselActivity extends xm5 {
    public static final /* synthetic */ int x = 0;
    public vm2 p;
    public uz5 q;
    public mw5 r;
    public String s;
    public SelectedImageContext t;
    public boolean u;
    public final iq1 v;
    public final c w;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    /* JADX INFO: loaded from: classes4.dex */
    @Metadata(d1 = {"\u0000<\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u000e\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\f\b\u0087\b\u0018\u00002\u00020\u0001:\u0001-B7\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0004\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0004\u0012\b\u0010\u0007\u001a\u0004\u0018\u00010\u0002\u0012\b\u0010\t\u001a\u0004\u0018\u00010\b¢\u0006\u0004\b\n\u0010\u000bJ\r\u0010\f\u001a\u00020\u0004¢\u0006\u0004\b\f\u0010\rJ\u001d\u0010\u0012\u001a\u00020\u00112\u0006\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u0010\u001a\u00020\u0004¢\u0006\u0004\b\u0012\u0010\u0013J\u0010\u0010\u0014\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0014\u0010\u0015J\u0012\u0010\u0016\u001a\u0004\u0018\u00010\u0004HÆ\u0003¢\u0006\u0004\b\u0016\u0010\u0017J\u0012\u0010\u0018\u001a\u0004\u0018\u00010\u0004HÆ\u0003¢\u0006\u0004\b\u0018\u0010\u0017J\u0012\u0010\u0019\u001a\u0004\u0018\u00010\u0002HÆ\u0003¢\u0006\u0004\b\u0019\u0010\u0015J\u0012\u0010\u001a\u001a\u0004\u0018\u00010\bHÆ\u0003¢\u0006\u0004\b\u001a\u0010\u001bJJ\u0010\u001c\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\n\b\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u00042\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00042\n\b\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u00022\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\bHÆ\u0001¢\u0006\u0004\b\u001c\u0010\u001dJ\u0010\u0010\u001e\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u001e\u0010\u0015J\u0010\u0010\u001f\u001a\u00020\u0004HÖ\u0001¢\u0006\u0004\b\u001f\u0010\rJ\u001a\u0010#\u001a\u00020\"2\b\u0010!\u001a\u0004\u0018\u00010 HÖ\u0003¢\u0006\u0004\b#\u0010$R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010%\u001a\u0004\b&\u0010\u0015R\u0019\u0010\u0005\u001a\u0004\u0018\u00010\u00048\u0006¢\u0006\f\n\u0004\b\u0005\u0010'\u001a\u0004\b(\u0010\u0017R\u0019\u0010\u0006\u001a\u0004\u0018\u00010\u00048\u0006¢\u0006\f\n\u0004\b\u0006\u0010'\u001a\u0004\b)\u0010\u0017R\u0019\u0010\u0007\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0007\u0010%\u001a\u0004\b*\u0010\u0015R\u0019\u0010\t\u001a\u0004\u0018\u00010\b8\u0006¢\u0006\f\n\u0004\b\t\u0010+\u001a\u0004\b,\u0010\u001b¨\u0006."}, d2 = {"Lcom/medium/android/donkey/read/carousel/ImageCarouselActivity$SelectedImageContext;", "Landroid/os/Parcelable;", "", "id", "", "originalWidth", "originalHeight", "alt", "Lcom/medium/android/donkey/read/carousel/ImageCarouselActivity$SelectedImageContext$Key;", "memoryCacheKey", "<init>", "(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/String;Lcom/medium/android/donkey/read/carousel/ImageCarouselActivity$SelectedImageContext$Key;)V", "describeContents", "()I", "Landroid/os/Parcel;", "dest", "flags", "Lc1e;", "writeToParcel", "(Landroid/os/Parcel;I)V", "component1", "()Ljava/lang/String;", "component2", "()Ljava/lang/Integer;", "component3", "component4", "component5", "()Lcom/medium/android/donkey/read/carousel/ImageCarouselActivity$SelectedImageContext$Key;", "copy", "(Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/String;Lcom/medium/android/donkey/read/carousel/ImageCarouselActivity$SelectedImageContext$Key;)Lcom/medium/android/donkey/read/carousel/ImageCarouselActivity$SelectedImageContext;", "toString", "hashCode", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getId", "Ljava/lang/Integer;", "getOriginalWidth", "getOriginalHeight", "getAlt", "Lcom/medium/android/donkey/read/carousel/ImageCarouselActivity$SelectedImageContext$Key;", "getMemoryCacheKey", "Key", "app_externalRelease"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class SelectedImageContext implements Parcelable {
        public static final int $stable = 8;
        public static final Parcelable.Creator<SelectedImageContext> CREATOR = new a();
        private final String alt;
        private final String id;
        private final Key memoryCacheKey;
        private final Integer originalHeight;
        private final Integer originalWidth;

        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        @Metadata(d1 = {"\u0000<\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010$\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0007\b\u0087\b\u0018\u00002\u00020\u0001B#\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0012\u0010\u0005\u001a\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00020\u0004¢\u0006\u0004\b\u0006\u0010\u0007J\r\u0010\t\u001a\u00020\b¢\u0006\u0004\b\t\u0010\nJ\u001d\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\r\u001a\u00020\b¢\u0006\u0004\b\u000f\u0010\u0010J\u0010\u0010\u0011\u001a\u00020\u0002HÆ\u0003¢\u0006\u0004\b\u0011\u0010\u0012J\u001c\u0010\u0013\u001a\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00020\u0004HÆ\u0003¢\u0006\u0004\b\u0013\u0010\u0014J0\u0010\u0015\u001a\u00020\u00002\b\b\u0002\u0010\u0003\u001a\u00020\u00022\u0014\b\u0002\u0010\u0005\u001a\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00020\u0004HÆ\u0001¢\u0006\u0004\b\u0015\u0010\u0016J\u0010\u0010\u0017\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u0017\u0010\u0012J\u0010\u0010\u0018\u001a\u00020\bHÖ\u0001¢\u0006\u0004\b\u0018\u0010\nJ\u001a\u0010\u001c\u001a\u00020\u001b2\b\u0010\u001a\u001a\u0004\u0018\u00010\u0019HÖ\u0003¢\u0006\u0004\b\u001c\u0010\u001dR\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u001e\u001a\u0004\b\u001f\u0010\u0012R#\u0010\u0005\u001a\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0005\u0010 \u001a\u0004\b!\u0010\u0014¨\u0006\""}, d2 = {"Lcom/medium/android/donkey/read/carousel/ImageCarouselActivity$SelectedImageContext$Key;", "Landroid/os/Parcelable;", "", "key", "", "extras", "<init>", "(Ljava/lang/String;Ljava/util/Map;)V", "", "describeContents", "()I", "Landroid/os/Parcel;", "dest", "flags", "Lc1e;", "writeToParcel", "(Landroid/os/Parcel;I)V", "component1", "()Ljava/lang/String;", "component2", "()Ljava/util/Map;", "copy", "(Ljava/lang/String;Ljava/util/Map;)Lcom/medium/android/donkey/read/carousel/ImageCarouselActivity$SelectedImageContext$Key;", "toString", "hashCode", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getKey", "Ljava/util/Map;", "getExtras", "app_externalRelease"}, k = 1, mv = {2, 2, 0}, xi = 48)
        public static final /* data */ class Key implements Parcelable {
            public static final int $stable = 8;
            public static final Parcelable.Creator<Key> CREATOR = new b();
            private final Map<String, String> extras;
            private final String key;

            public Key(String str, Map<String, String> map) {
                str.getClass();
                map.getClass();
                this.key = str;
                this.extras = map;
            }

            /* JADX WARN: Multi-variable type inference failed */
            public static /* synthetic */ Key copy$default(Key key, String str, Map map, int i, Object obj) {
                if ((i & 1) != 0) {
                    str = key.key;
                }
                if ((i & 2) != 0) {
                    map = key.extras;
                }
                return key.copy(str, map);
            }

            /* JADX INFO: renamed from: component1, reason: from getter */
            public final String getKey() {
                return this.key;
            }

            public final Map<String, String> component2() {
                return this.extras;
            }

            public final Key copy(String key, Map<String, String> extras) {
                key.getClass();
                extras.getClass();
                return new Key(key, extras);
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            public boolean equals(Object other) {
                if (this == other) {
                    return true;
                }
                if (!(other instanceof Key)) {
                    return false;
                }
                Key key = (Key) other;
                return g76.L(this.key, key.key) && g76.L(this.extras, key.extras);
            }

            public final Map<String, String> getExtras() {
                return this.extras;
            }

            public final String getKey() {
                return this.key;
            }

            public int hashCode() {
                return this.extras.hashCode() + (this.key.hashCode() * 31);
            }

            public String toString() {
                return "Key(key=" + this.key + ", extras=" + this.extras + ")";
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int flags) {
                dest.getClass();
                dest.writeString(this.key);
                Map<String, String> map = this.extras;
                dest.writeInt(map.size());
                for (Map.Entry<String, String> entry : map.entrySet()) {
                    dest.writeString(entry.getKey());
                    dest.writeString(entry.getValue());
                }
            }
        }

        public SelectedImageContext(String str, Integer num, Integer num2, String str2, Key key) {
            str.getClass();
            this.id = str;
            this.originalWidth = num;
            this.originalHeight = num2;
            this.alt = str2;
            this.memoryCacheKey = key;
        }

        public static /* synthetic */ SelectedImageContext copy$default(SelectedImageContext selectedImageContext, String str, Integer num, Integer num2, String str2, Key key, int i, Object obj) {
            if ((i & 1) != 0) {
                str = selectedImageContext.id;
            }
            if ((i & 2) != 0) {
                num = selectedImageContext.originalWidth;
            }
            if ((i & 4) != 0) {
                num2 = selectedImageContext.originalHeight;
            }
            if ((i & 8) != 0) {
                str2 = selectedImageContext.alt;
            }
            if ((i & 16) != 0) {
                key = selectedImageContext.memoryCacheKey;
            }
            Key key2 = key;
            Integer num3 = num2;
            return selectedImageContext.copy(str, num, num3, str2, key2);
        }

        /* JADX INFO: renamed from: component1, reason: from getter */
        public final String getId() {
            return this.id;
        }

        /* JADX INFO: renamed from: component2, reason: from getter */
        public final Integer getOriginalWidth() {
            return this.originalWidth;
        }

        /* JADX INFO: renamed from: component3, reason: from getter */
        public final Integer getOriginalHeight() {
            return this.originalHeight;
        }

        /* JADX INFO: renamed from: component4, reason: from getter */
        public final String getAlt() {
            return this.alt;
        }

        /* JADX INFO: renamed from: component5, reason: from getter */
        public final Key getMemoryCacheKey() {
            return this.memoryCacheKey;
        }

        public final SelectedImageContext copy(String id, Integer originalWidth, Integer originalHeight, String alt, Key memoryCacheKey) {
            id.getClass();
            return new SelectedImageContext(id, originalWidth, originalHeight, alt, memoryCacheKey);
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof SelectedImageContext)) {
                return false;
            }
            SelectedImageContext selectedImageContext = (SelectedImageContext) other;
            return g76.L(this.id, selectedImageContext.id) && g76.L(this.originalWidth, selectedImageContext.originalWidth) && g76.L(this.originalHeight, selectedImageContext.originalHeight) && g76.L(this.alt, selectedImageContext.alt) && g76.L(this.memoryCacheKey, selectedImageContext.memoryCacheKey);
        }

        public final String getAlt() {
            return this.alt;
        }

        public final String getId() {
            return this.id;
        }

        public final Key getMemoryCacheKey() {
            return this.memoryCacheKey;
        }

        public final Integer getOriginalHeight() {
            return this.originalHeight;
        }

        public final Integer getOriginalWidth() {
            return this.originalWidth;
        }

        public int hashCode() {
            int iHashCode = this.id.hashCode() * 31;
            Integer num = this.originalWidth;
            int iHashCode2 = (iHashCode + (num == null ? 0 : num.hashCode())) * 31;
            Integer num2 = this.originalHeight;
            int iHashCode3 = (iHashCode2 + (num2 == null ? 0 : num2.hashCode())) * 31;
            String str = this.alt;
            int iHashCode4 = (iHashCode3 + (str == null ? 0 : str.hashCode())) * 31;
            Key key = this.memoryCacheKey;
            return iHashCode4 + (key != null ? key.hashCode() : 0);
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int flags) {
            dest.getClass();
            dest.writeString(this.id);
            Integer num = this.originalWidth;
            if (num == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                dest.writeInt(num.intValue());
            }
            Integer num2 = this.originalHeight;
            if (num2 == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                dest.writeInt(num2.intValue());
            }
            dest.writeString(this.alt);
            Key key = this.memoryCacheKey;
            if (key == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                key.writeToParcel(dest, flags);
            }
        }

        public String toString() {
            return HrUBqHumRuLe.gwS + this.id + ", originalWidth=" + this.originalWidth + ", originalHeight=" + this.originalHeight + ", alt=" + this.alt + ", memoryCacheKey=" + this.memoryCacheKey + ")";
        }
    }

    public ImageCarouselActivity() {
        super(0);
        this.v = new iq1(n1b.a.b(rw5.class), new kw5(this, 0), new v2(16, new em4(8, this)), new kw5(this, 1));
        this.w = new c(this);
    }

    @Override // defpackage.xm5, defpackage.n1, defpackage.m15, defpackage.xy1, defpackage.wy1, android.app.Activity
    public final void onCreate(Bundle bundle) {
        n92 n92Var = null;
        fo3.a(this, null, 3);
        super.onCreate(bundle);
        postponeEnterTransition();
        View viewInflate = getLayoutInflater().inflate(R.layout.activity_image_carousel, (ViewGroup) null, false);
        int i = R.id.close;
        ImageButton imageButton = (ImageButton) vn7.x(viewInflate, R.id.close);
        if (imageButton != null) {
            i = R.id.error_state;
            TextView textView = (TextView) vn7.x(viewInflate, R.id.error_state);
            if (textView != null) {
                i = R.id.pager;
                ImageCarouselViewPager imageCarouselViewPager = (ImageCarouselViewPager) vn7.x(viewInflate, R.id.pager);
                if (imageCarouselViewPager != null) {
                    i = R.id.top_barrier;
                    View viewX = vn7.x(viewInflate, R.id.top_barrier);
                    if (viewX != null) {
                        i = R.id.transition_image;
                        ImageView imageView = (ImageView) vn7.x(viewInflate, R.id.transition_image);
                        if (imageView != null) {
                            ConstraintLayout constraintLayout = (ConstraintLayout) viewInflate;
                            this.q = new uz5(constraintLayout, imageButton, textView, imageCarouselViewPager, viewX, imageView);
                            setContentView(constraintLayout);
                            getOnBackPressedDispatcher().a(this, this.w);
                            Window window = getWindow();
                            int i2 = 1;
                            TransitionSet interpolator = new TransitionSet().addTransition(new ChangeBounds()).addTransition(new ChangeImageTransform()).setDuration(300L).setOrdering(0).setInterpolator((TimeInterpolator) new u94(1));
                            interpolator.getClass();
                            interpolator.addListener((Transition.TransitionListener) new jw5(this));
                            window.setSharedElementEnterTransition(interpolator);
                            String stringExtra = getIntent().getStringExtra("postId");
                            if (stringExtra == null) {
                                wld.a.e(null, "postId is null in ImageCarouselActivity", new Object[0]);
                                hy2 hy2Var = g01.y;
                                if (hy2Var != null) {
                                    hy2Var.a("postId is null in ImageCarouselActivity", null, fy3.a);
                                }
                                finish();
                                return;
                            }
                            this.s = stringExtra;
                            Intent intent = getIntent();
                            intent.getClass();
                            SelectedImageContext selectedImageContext = (SelectedImageContext) ((Parcelable) qb8.G(intent, "selectedImage", SelectedImageContext.class));
                            this.t = selectedImageContext;
                            if (selectedImageContext != null) {
                                sw5 sw5Var = new sw5(selectedImageContext.getId(), selectedImageContext.getOriginalWidth(), selectedImageContext.getOriginalHeight(), selectedImageContext.getAlt(), 24);
                                uz5 uz5Var = this.q;
                                if (uz5Var == null) {
                                    g76.g0("binding");
                                    throw null;
                                }
                                ((ImageView) uz5Var.f).setVisibility(0);
                                uz5 uz5Var2 = this.q;
                                if (uz5Var2 == null) {
                                    g76.g0("binding");
                                    throw null;
                                }
                                ImageView imageView2 = (ImageView) uz5Var2.f;
                                gx5 gx5VarA = yec.a(imageView2.getContext());
                                nx5 nx5Var = new nx5(imageView2.getContext());
                                nx5Var.c = sw5Var;
                                q84 q84Var = wx5.a;
                                nx5Var.d = new fy5(imageView2);
                                SelectedImageContext.Key memoryCacheKey = selectedImageContext.getMemoryCacheKey();
                                nx5Var.m = memoryCacheKey != null ? new cx7(memoryCacheKey.getKey(), memoryCacheKey.getExtras()) : null;
                                nx5Var.r = dqb.FIT;
                                nx5Var.q = new nw5(this, sw5Var);
                                nx5Var.e = new rz2(20, this);
                                ((kva) gx5VarA).a(nx5Var.a());
                            } else {
                                startPostponedEnterTransition();
                            }
                            gr7.B(getWindow(), false);
                            Window window2 = getWindow();
                            getWindow().getDecorView();
                            int i3 = Build.VERSION.SDK_INT;
                            (i3 >= 35 ? new e5f(window2) : i3 >= 30 ? new c5f(window2) : i3 >= 26 ? new b5f(window2) : new a5f(window2)).B(true);
                            View decorView = getWindow().getDecorView();
                            f70 f70Var = new f70(22, this);
                            WeakHashMap weakHashMap = ute.a;
                            mte.c(decorView, f70Var);
                            uz5 uz5Var3 = this.q;
                            if (uz5Var3 == null) {
                                g76.g0("binding");
                                throw null;
                            }
                            ((ImageButton) uz5Var3.b).setOnClickListener(new na3(this, i2));
                            LayoutInflater layoutInflater = getLayoutInflater();
                            layoutInflater.getClass();
                            mw5 mw5Var = new mw5(layoutInflater);
                            this.r = mw5Var;
                            uz5 uz5Var4 = this.q;
                            if (uz5Var4 == null) {
                                g76.g0("binding");
                                throw null;
                            }
                            ((ImageCarouselViewPager) uz5Var4.d).setAdapter(mw5Var);
                            uz5 uz5Var5 = this.q;
                            if (uz5Var5 == null) {
                                g76.g0("binding");
                                throw null;
                            }
                            ((ImageCarouselViewPager) uz5Var5.d).setPageMargin(50);
                            vx0.c0(o7f.x(this), null, null, new iw5(this, n92Var, i2), 3);
                            return;
                        }
                    }
                }
            }
        }
        z72.c("Missing required view with ID: ".concat(viewInflate.getResources().getResourceName(i)));
    }

    @Override // defpackage.n1, defpackage.m15, android.app.Activity
    public final void onPause() {
        super.onPause();
        mw5 mw5Var = this.r;
        if (mw5Var == null) {
            g76.g0("adapter");
            throw null;
        }
        uz5 uz5Var = this.q;
        if (uz5Var == null) {
            g76.g0("binding");
            throw null;
        }
        sw5 sw5Var = (sw5) bu1.A0(((ImageCarouselViewPager) uz5Var.d).getCurrentItem(), bu1.m1(mw5Var.e));
        SelectedImageContext selectedImageContext = this.t;
        if (selectedImageContext == null || sw5Var == null || g76.L(selectedImageContext.getId(), sw5Var.getId())) {
            return;
        }
        getWindow().setSharedElementReturnTransition(null);
        getWindow().setSharedElementReenterTransition(null);
        overridePendingTransition(0, R.anim.common_slide_out_bottom);
    }
}
