package com.instabridge.ai.chat.ui;

import android.graphics.Typeface;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import androidx.recyclerview.widget.RecyclerView;
import androidx.recyclerview.widget.b2;
import java.util.WeakHashMap;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000E\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\u0011\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003*\u0001\u0015\b\u0001\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003J\u000e\u0010\u0017\u001a\u00020\u00182\u0006\u0010\u0019\u001a\u00020\u001aJ\u0012\u0010\u001b\u001a\u00020\u00132\b\u0010\u001c\u001a\u0004\u0018\u00010\u0005H\u0002R(\u0010\u0006\u001a\u0004\u0018\u00010\u00052\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005@FX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0007\u0010\b\"\u0004\b\t\u0010\nR\u0018\u0010\u000b\u001a\n\u0012\u0004\u0012\u00020\u0005\u0018\u00010\fX\u0082\u000e¢\u0006\u0004\n\u0002\u0010\rR\u001c\u0010\u000e\u001a\u0010\u0012\u0004\u0012\u00020\u0010\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u000fX\u0082\u0004¢\u0006\u0002\n\u0000R\u001a\u0010\u0011\u001a\u000e\u0012\u0004\u0012\u00020\u0012\u0012\u0004\u0012\u00020\u00130\u000fX\u0082\u0004¢\u0006\u0002\n\u0000R\u0010\u0010\u0014\u001a\u00020\u0015X\u0082\u0004¢\u0006\u0004\n\u0002\u0010\u0016¨\u0006\u001d"}, d2 = {"Lcom/instabridge/ai/chat/ui/ChatTypeface;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "value", "Landroid/graphics/Typeface;", "typeface", "getTypeface", "()Landroid/graphics/Typeface;", "setTypeface", "(Landroid/graphics/Typeface;)V", "styledFonts", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "[Landroid/graphics/Typeface;", "defaults", "Ljava/util/WeakHashMap;", "Landroid/widget/TextView;", "recyclers", "Landroidx/recyclerview/widget/RecyclerView;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "childListener", "com/instabridge/ai/chat/ui/ChatTypeface$childListener$1", "Lcom/instabridge/ai/chat/ui/ChatTypeface$childListener$1;", "apply", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "view", "Landroid/view/View;", "isMonospace", "font", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class ChatTypeface {
    public static final int $stable = 8;

    @Nullable
    private Typeface[] styledFonts;

    @Nullable
    private Typeface typeface;

    @NotNull
    private final WeakHashMap<TextView, Typeface> defaults = new WeakHashMap<>();

    @NotNull
    private final WeakHashMap<RecyclerView, Boolean> recyclers = new WeakHashMap<>();

    @NotNull
    private final ChatTypeface$childListener$1 childListener = new b2() { // from class: com.instabridge.ai.chat.ui.ChatTypeface$childListener$1
        @Override // androidx.recyclerview.widget.b2
        public void onChildViewAttachedToWindow(View view) {
            Intrinsics.g(view, "view");
            this.this$0.apply(view);
        }

        @Override // androidx.recyclerview.widget.b2
        public void onChildViewDetachedFromWindow(View view) {
            Intrinsics.g(view, "view");
        }
    };

    private final boolean isMonospace(Typeface font) {
        return font != null && font.equals(Typeface.create(Typeface.MONOSPACE, font.getStyle()));
    }

    public final void apply(@NotNull View view) {
        Intrinsics.g(view, "view");
        if (this.typeface == null && this.defaults.isEmpty()) {
            return;
        }
        if (view instanceof TextView) {
            TextView textView = (TextView) view;
            if (!isMonospace(textView.getTypeface())) {
                if (!this.defaults.containsKey(view)) {
                    this.defaults.put(view, textView.getTypeface());
                }
                Typeface typeface = this.defaults.get(view);
                Typeface[] typefaceArr = this.styledFonts;
                if (typefaceArr != null) {
                    Typeface typeface2 = typefaceArr[typeface != null ? typeface.getStyle() : 0];
                    if (typeface2 != null) {
                        typeface = typeface2;
                    }
                }
                if (!Intrinsics.b(textView.getTypeface(), typeface)) {
                    textView.setTypeface(typeface);
                }
                if (this.typeface == null) {
                    this.defaults.remove(view);
                }
            }
        }
        if ((view instanceof RecyclerView) && !this.recyclers.containsKey(view)) {
            ((RecyclerView) view).addOnChildAttachStateChangeListener(this.childListener);
            this.recyclers.put(view, Boolean.TRUE);
        }
        if (view instanceof ViewGroup) {
            ViewGroup viewGroup = (ViewGroup) view;
            int childCount = viewGroup.getChildCount();
            for (int i5 = 0; i5 < childCount; i5++) {
                View childAt = viewGroup.getChildAt(i5);
                Intrinsics.f(childAt, "getChildAt(...)");
                apply(childAt);
            }
        }
    }

    @Nullable
    public final Typeface getTypeface() {
        return this.typeface;
    }

    public final void setTypeface(@Nullable Typeface typeface) {
        Typeface[] typefaceArr;
        this.typeface = typeface;
        if (typeface != null) {
            typefaceArr = new Typeface[4];
            for (int i5 = 0; i5 < 4; i5++) {
                Typeface typefaceCreate = Typeface.create(typeface, i5);
                Intrinsics.f(typefaceCreate, "create(...)");
                typefaceArr[i5] = typefaceCreate;
            }
        } else {
            typefaceArr = null;
        }
        this.styledFonts = typefaceArr;
    }
}
