.class public Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkMvpView;
.super Lv/VFrame;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lv/VFrame;",
        "Ll/iam<",
        "Ll/aho0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Lv/VDraweeView;

.field public c:Lv/VDraweeView;

.field public d:Ll/aho0;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkMvpView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkMvpView;->v(Landroid/view/View;)V

    return-void
.end method

.method private synthetic v(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkMvpView;->d:Ll/aho0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/aho0;->W3()V

    .line 6
    .line 7
    .line 8
    :cond_0
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

.method public destroy()V
    .locals 0

    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/aho0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkMvpView;->u(Ll/aho0;)V

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

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkMvpView;->s(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    new-instance v0, Ll/qgo0;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/qgo0;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkMvpView;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final s(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/rgo0;->a(Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkMvpView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public u(Ll/aho0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkMvpView;->d:Ll/aho0;

    .line 2
    .line 3
    return-void
.end method

.method public w(Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;)V
    .locals 4

    .line 1
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->enable:Z

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkMvpView;->a:Lv/VDraweeView;

    .line 10
    .line 11
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->mvpBg:Ljava/lang/String;

    .line 12
    .line 13
    const-string v2, "context_single_room"

    .line 14
    .line 15
    invoke-static {v2, v0, v1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->leftUserAvatar:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkMvpView;->b:Lv/VDraweeView;

    .line 25
    .line 26
    const/4 v3, 0x0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    invoke-virtual {v1, v3}, Lv/VDraweeView;->setController(Ll/lde;)V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->leftUserAvatar:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {v2, v1, v0}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->rightUserAvatar:Ljava/lang/String;

    .line 39
    .line 40
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/pk/VoicePkMvpView;->c:Lv/VDraweeView;

    .line 45
    .line 46
    if-eqz v0, :cond_1

    .line 47
    .line 48
    invoke-virtual {p0, v3}, Lv/VDraweeView;->setController(Ll/lde;)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkInfo;->rightUserAvatar:Ljava/lang/String;

    .line 53
    .line 54
    invoke-static {v2, p0, p1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_2
    const/4 p1, 0x0

    .line 59
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 60
    .line 61
    .line 62
    return-void
.end method
