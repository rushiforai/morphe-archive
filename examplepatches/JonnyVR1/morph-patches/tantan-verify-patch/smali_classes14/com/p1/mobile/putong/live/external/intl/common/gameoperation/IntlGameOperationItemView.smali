.class public Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationItemView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationItemView;

.field public b:Lv/VFrame;

.field public c:Lv/VDraweeView;

.field public d:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public e:Landroid/graphics/drawable/GradientDrawable;

.field public f:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveGameOperationConfig;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationItemView;Lcom/p1/mobile/putong/live/base/data/BLiveGameOperationConfig;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationItemView;->c(Lcom/p1/mobile/putong/live/base/data/BLiveGameOperationConfig;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final b(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/kkn;->a(Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic c(Lcom/p1/mobile/putong/live/base/data/BLiveGameOperationConfig;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationItemView;->f:Ll/y20;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public d(Lcom/p1/mobile/putong/live/base/data/BLiveGameOperationConfig;)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationItemView;->d:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 5
    .line 6
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGameOperationConfig;->isSvga:Z

    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationItemView;->c:Lv/VDraweeView;

    .line 12
    .line 13
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGameOperationConfig;->isSvga:Z

    .line 14
    .line 15
    xor-int/lit8 v1, v1, 0x1

    .line 16
    .line 17
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGameOperationConfig;->icon:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_2

    .line 27
    .line 28
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGameOperationConfig;->isSvga:Z

    .line 29
    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationItemView;->d:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 33
    .line 34
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGameOperationConfig;->icon:Ljava/lang/String;

    .line 35
    .line 36
    const/4 v2, -0x1

    .line 37
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->j(Ljava/lang/String;I)V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationItemView;->c:Lv/VDraweeView;

    .line 42
    .line 43
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGameOperationConfig;->icon:Ljava/lang/String;

    .line 44
    .line 45
    const-string v2, "context_single_room"

    .line 46
    .line 47
    invoke-static {v2, v0, v1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    :cond_2
    :goto_0
    :try_start_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationItemView;->e:Landroid/graphics/drawable/GradientDrawable;

    .line 51
    .line 52
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGameOperationConfig;->startBackgroundColor:Ljava/lang/String;

    .line 53
    .line 54
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGameOperationConfig;->endBackgroundColor:Ljava/lang/String;

    .line 59
    .line 60
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    filled-new-array {v1, v2}, [I

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setColors([I)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationItemView;->a:Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationItemView;

    .line 72
    .line 73
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationItemView;->e:Landroid/graphics/drawable/GradientDrawable;

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 76
    .line 77
    .line 78
    goto :goto_1

    .line 79
    :catch_0
    move-exception v0

    .line 80
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 81
    .line 82
    .line 83
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationItemView;->a:Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationItemView;

    .line 84
    .line 85
    new-instance v1, Ll/jkn;

    .line 86
    .line 87
    invoke-direct {v1, p0, p1}, Ll/jkn;-><init>(Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationItemView;Lcom/p1/mobile/putong/live/base/data/BLiveGameOperationConfig;)V

    .line 88
    .line 89
    .line 90
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public onFinishInflate()V
    .locals 8

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationItemView;->b(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    .line 8
    .line 9
    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationItemView;->e:Landroid/graphics/drawable/GradientDrawable;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setGradientType(I)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationItemView;->e:Landroid/graphics/drawable/GradientDrawable;

    .line 19
    .line 20
    const/high16 v1, 0x41400000    # 12.0f

    .line 21
    .line 22
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    int-to-float v1, v1

    .line 27
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationItemView;->e:Landroid/graphics/drawable/GradientDrawable;

    .line 31
    .line 32
    sget-object v1, Landroid/graphics/drawable/GradientDrawable$Orientation;->TL_BR:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setOrientation(Landroid/graphics/drawable/GradientDrawable$Orientation;)V

    .line 35
    .line 36
    .line 37
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationItemView;->b:Lv/VFrame;

    .line 38
    .line 39
    const/high16 p0, 0x41000000    # 8.0f

    .line 40
    .line 41
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 42
    .line 43
    .line 44
    move-result v7

    .line 45
    const/4 v3, 0x0

    .line 46
    const/4 v4, 0x0

    .line 47
    const/4 v5, 0x0

    .line 48
    const/4 v6, 0x0

    .line 49
    invoke-static/range {v2 .. v7}, Ll/qnp0;->c1(Landroid/view/View;IIIII)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public setAction1(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveGameOperationConfig;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/common/gameoperation/IntlGameOperationItemView;->f:Ll/y20;

    .line 2
    .line 3
    return-void
.end method
