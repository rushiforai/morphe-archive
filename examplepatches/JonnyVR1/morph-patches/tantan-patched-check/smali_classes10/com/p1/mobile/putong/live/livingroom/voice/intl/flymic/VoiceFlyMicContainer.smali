.class public Lcom/p1/mobile/putong/live/livingroom/voice/intl/flymic/VoiceFlyMicContainer;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/FrameLayout;",
        "Ll/iam<",
        "Ll/zfn0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/live/base/view/XEGiftView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method

.method public a(Ll/zfn0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final b(Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;)Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffectExtend;
    .locals 5

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffectExtend;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffectExtend;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "user_pos"

    .line 6
    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffectExtend;->key:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;->startPosition:[I

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    aget v0, v0, v1

    .line 13
    .line 14
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;->startPosition:[I

    .line 19
    .line 20
    const/4 v3, 0x1

    .line 21
    aget v2, v2, v3

    .line 22
    .line 23
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    filled-new-array {v0, v2}, [Ljava/lang/Integer;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const-string v2, ","

    .line 36
    .line 37
    invoke-static {v0, v2}, Ll/jyb;->U(Ljava/util/Collection;Ljava/lang/String;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iget-object v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;->endPosition:[I

    .line 42
    .line 43
    aget v1, v4, v1

    .line 44
    .line 45
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;->endPosition:[I

    .line 50
    .line 51
    aget p1, p1, v3

    .line 52
    .line 53
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    filled-new-array {v1, p1}, [Ljava/lang/Integer;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    invoke-static {p1, v2}, Ll/jyb;->U(Ljava/util/Collection;Ljava/lang/String;)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    filled-new-array {v0, p1}, [Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffectExtend;->value:Ljava/util/List;

    .line 78
    .line 79
    return-object p0
.end method

.method public c(Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/flymic/VoiceFlyMicContainer;->a:Lcom/p1/mobile/putong/live/base/view/XEGiftView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/p1/mobile/putong/live/base/view/XEGiftView;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/live/base/view/XEGiftView;-><init>(Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/flymic/VoiceFlyMicContainer;->a:Lcom/p1/mobile/putong/live/base/view/XEGiftView;

    .line 15
    .line 16
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/flymic/VoiceFlyMicContainer;->a:Lcom/p1/mobile/putong/live/base/view/XEGiftView;

    .line 17
    .line 18
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    if-nez v0, :cond_1

    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/flymic/VoiceFlyMicContainer;->a:Lcom/p1/mobile/putong/live/base/view/XEGiftView;

    .line 25
    .line 26
    sget v1, Ll/bnl0;->e:I

    .line 27
    .line 28
    invoke-virtual {p0, v0, v1, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V

    .line 29
    .line 30
    .line 31
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;->dynamicEffectExtends:Ljava/util/List;

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/flymic/VoiceFlyMicContainer;->b(Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;)Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffectExtend;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    new-instance p1, Ll/hre;

    .line 45
    .line 46
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;->resourceId:Ljava/lang/String;

    .line 47
    .line 48
    invoke-direct {p1, v1}, Ll/hre;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;->dynamicEffectExtends:Ljava/util/List;

    .line 52
    .line 53
    invoke-virtual {p1, v0}, Ll/hre;->j(Ljava/util/List;)Ll/hre;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/flymic/VoiceFlyMicContainer;->a:Lcom/p1/mobile/putong/live/base/view/XEGiftView;

    .line 58
    .line 59
    invoke-static {p0, p1}, Ll/jhe;->s(Lcom/p1/mobile/putong/live/base/view/XEGiftView;Ll/hre;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public d(Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;Ll/sfn0;I)V
    .locals 0

    .line 1
    invoke-virtual {p2, p1, p3, p0}, Ll/sfn0;->v(Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;ILcom/p1/mobile/putong/live/livingroom/voice/intl/flymic/VoiceFlyMicContainer;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/flymic/VoiceFlyMicContainer;->a:Lcom/p1/mobile/putong/live/base/view/XEGiftView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/view/XEGiftView;->j()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/zfn0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/flymic/VoiceFlyMicContainer;->a(Ll/zfn0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method
