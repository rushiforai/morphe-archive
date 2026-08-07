.class public Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground;
.super Lv/VFrame;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground$Type;
    }
.end annotation


# instance fields
.field public a:Landroid/view/View;

.field public b:Lv/VDraweeView;

.field public c:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public d:Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground$Type;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 6
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 7
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method private s(Ljava/lang/String;Ljava/lang/String;)Landroid/graphics/drawable/GradientDrawable;
    .locals 1

    .line 1
    new-instance p0, Landroid/graphics/drawable/GradientDrawable;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-virtual {p0, v0}, Landroid/graphics/drawable/GradientDrawable;->setGradientType(I)V

    .line 8
    .line 9
    .line 10
    const/high16 v0, 0x41400000    # 12.0f

    .line 11
    .line 12
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    int-to-float v0, v0

    .line 17
    invoke-virtual {p0, v0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 18
    .line 19
    .line 20
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    move-result p2

    .line 28
    filled-new-array {p1, p2}, [I

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/GradientDrawable;->setColors([I)V

    .line 33
    .line 34
    .line 35
    sget-object p1, Landroid/graphics/drawable/GradientDrawable$Orientation;->LEFT_RIGHT:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/GradientDrawable;->setOrientation(Landroid/graphics/drawable/GradientDrawable$Orientation;)V

    .line 38
    .line 39
    .line 40
    return-object p0
.end method

.method public static u(I)Z
    .locals 1

    .line 1
    const/16 v0, 0x12c

    if-eq p0, v0, :cond_1

    const/16 v0, 0xc8

    if-eq p0, v0, :cond_1

    const/16 v0, 0x64

    if-ne p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x1

    return p0
.end method


# virtual methods
.method public B()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground;->c:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->n()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground;->c:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/tantan/library/svga/SVGAnimationView;->clearDynamicData()V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground;->c:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->n()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground;->p(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final p(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/tij0;->a(Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setBackgroundImg(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground;->b:Lv/VDraweeView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground;->a:Landroid/view/View;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    const-string v0, "context_livingAct"

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground;->b:Lv/VDraweeView;

    .line 16
    .line 17
    invoke-static {v0, p0, p1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public v(Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground$Type;Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground;->b:Lv/VDraweeView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground;->a:Landroid/view/View;

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground$Type;->first:Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground$Type;

    .line 14
    .line 15
    if-ne p1, v0, :cond_1

    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground;->a:Landroid/view/View;

    .line 18
    .line 19
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground;->d:Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground$Type;

    .line 23
    .line 24
    const-string p1, "voice-live"

    .line 25
    .line 26
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-eqz p1, :cond_0

    .line 31
    .line 32
    const-string p1, "#e63e3e48"

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    const-string p1, "#4D000000"

    .line 36
    .line 37
    :goto_0
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground;->a:Landroid/view/View;

    .line 38
    .line 39
    invoke-direct {p0, p1, p1}, Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground;->s(Ljava/lang/String;Ljava/lang/String;)Landroid/graphics/drawable/GradientDrawable;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p2, p0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_1
    sget-object p2, Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground$Type;->second:Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground$Type;

    .line 48
    .line 49
    if-ne p1, p2, :cond_2

    .line 50
    .line 51
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground;->a:Landroid/view/View;

    .line 52
    .line 53
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 54
    .line 55
    .line 56
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground;->c:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 57
    .line 58
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 59
    .line 60
    .line 61
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground;->d:Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground$Type;

    .line 62
    .line 63
    return-void

    .line 64
    :cond_2
    sget-object p2, Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground$Type;->third:Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground$Type;

    .line 65
    .line 66
    if-ne p1, p2, :cond_3

    .line 67
    .line 68
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground;->d:Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground$Type;

    .line 69
    .line 70
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground;->a:Landroid/view/View;

    .line 71
    .line 72
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 73
    .line 74
    .line 75
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground;->c:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 76
    .line 77
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_3
    sget-object p2, Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground$Type;->fourth:Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground$Type;

    .line 82
    .line 83
    if-ne p1, p2, :cond_4

    .line 84
    .line 85
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground;->d:Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground$Type;

    .line 86
    .line 87
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground;->a:Landroid/view/View;

    .line 88
    .line 89
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 90
    .line 91
    .line 92
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground;->c:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 93
    .line 94
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 95
    .line 96
    .line 97
    :cond_4
    return-void
.end method

.method public w()V
    .locals 7

    .line 1
    invoke-static {}, Ll/i9n;->b()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground;->d:Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground$Type;

    .line 6
    .line 7
    const-string v2, "https://auto.tancdn.com/v1/raw/2e06f3f3-8507-4a93-a020-0862e6aadf5c11.pdf"

    .line 8
    .line 9
    const-string v3, "https://auto.tancdn.com/v1/raw/6576f882-b083-415e-ac89-eebbfb83706510.pdf"

    .line 10
    .line 11
    const-string v4, "https://auto.tancdn.com/v1/raw/e9a7dfe6-1aa5-4280-8067-a2161fb1925c11.pdf"

    .line 12
    .line 13
    const/4 v5, 0x0

    .line 14
    if-eqz v0, :cond_2

    .line 15
    .line 16
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground$Type;->second:Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground$Type;

    .line 17
    .line 18
    const/4 v6, 0x0

    .line 19
    if-ne v1, v0, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground;->c:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 22
    .line 23
    invoke-virtual {p0, v4, v5, v6, v5}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->i(Ljava/lang/String;ILl/wo0;Z)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground$Type;->third:Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground$Type;

    .line 28
    .line 29
    if-ne v1, v0, :cond_1

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground;->c:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 32
    .line 33
    invoke-virtual {p0, v3, v5, v6, v5}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->i(Ljava/lang/String;ILl/wo0;Z)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground$Type;->fourth:Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground$Type;

    .line 38
    .line 39
    if-ne v1, v0, :cond_5

    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground;->c:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 42
    .line 43
    invoke-virtual {p0, v2, v5, v6, v5}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->i(Ljava/lang/String;ILl/wo0;Z)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground$Type;->second:Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground$Type;

    .line 48
    .line 49
    if-ne v1, v0, :cond_3

    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground;->c:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 52
    .line 53
    invoke-virtual {p0, v4, v5}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->j(Ljava/lang/String;I)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_3
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground$Type;->third:Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground$Type;

    .line 58
    .line 59
    if-ne v1, v0, :cond_4

    .line 60
    .line 61
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground;->c:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 62
    .line 63
    invoke-virtual {p0, v3, v5}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->j(Ljava/lang/String;I)V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_4
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground$Type;->fourth:Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground$Type;

    .line 68
    .line 69
    if-ne v1, v0, :cond_5

    .line 70
    .line 71
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground;->c:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 72
    .line 73
    invoke-virtual {p0, v2, v5}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->j(Ljava/lang/String;I)V

    .line 74
    .line 75
    .line 76
    :cond_5
    return-void
.end method

.method public z(Ljava/lang/String;)V
    .locals 4

    .line 1
    invoke-static {}, Ll/i9n;->b()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground;->c:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    const/4 v3, 0x0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground;->c:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 15
    .line 16
    new-instance v1, Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground$a;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, p1, v3, v1, v3}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->i(Ljava/lang/String;ILl/wo0;Z)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground;->c:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 29
    .line 30
    new-instance v1, Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground$b;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground$b;-><init>(Lcom/p1/mobile/putong/live/livingroom/view/TrayBackground;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, p1, v3, v1}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->l(Ljava/lang/String;ILl/wo0;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method
