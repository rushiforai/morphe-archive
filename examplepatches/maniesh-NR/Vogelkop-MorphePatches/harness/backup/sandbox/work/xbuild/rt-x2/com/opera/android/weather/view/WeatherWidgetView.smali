.class public final Lcom/opera/android/weather/view/WeatherWidgetView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u0008\u0007\u0018\u00002\u00020\u0001\u00a8\u0006\u0002"
    }
    d2 = {
        "Lcom/opera/android/weather/view/WeatherWidgetView;",
        "Landroid/widget/FrameLayout;",
        "app"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final a:Lvs;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 10
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    const v0, 0x7f0d0485

    invoke-virtual {p2, v0, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    const p2, 0x7f0a0141

    invoke-static {p2, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Landroid/widget/LinearLayout;

    const/4 v0, 0x0

    if-eqz v3, :cond_56

    const p2, 0x7f0a0322

    invoke-static {p2, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v4, v1

    check-cast v4, Lcom/opera/android/widget/LottieAnimationView;

    if-eqz v4, :cond_56

    const p2, 0x7f0a069d

    invoke-static {p2, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v5, v1

    check-cast v5, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v5, :cond_56

    new-instance v1, Lvs;

    const/16 v6, 0x1b

    move-object v2, p0

    invoke-direct/range {v1 .. v6}, Lvs;-><init>(Landroid/view/ViewGroup;Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v1, v2, Lcom/opera/android/weather/view/WeatherWidgetView;->a:Lvs;

    const/4 p0, 0x1

    invoke-virtual {v2, p0}, Landroid/view/View;->setFocusable(Z)V

    invoke-virtual {v2, p0}, Landroid/view/View;->setClickable(Z)V

    const p0, 0x7f0406a7

    invoke-static {p0, p1}, Lf03;->W(ILandroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object p0

    const p1, 0x7f07013a

    invoke-static {v0, p0, p1}, Lxgh;->i(Landroid/graphics/drawable/ShapeDrawable;Landroid/content/res/ColorStateList;I)Landroid/graphics/drawable/RippleDrawable;

    move-result-object p0

    invoke-virtual {v3, p0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    return-void

    :cond_56
    move-object v2, p0

    invoke-virtual {v2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    throw v0
.end method
