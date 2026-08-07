.class public Ll/hrp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/erp;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ll/erp;

.field public b:Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/IntlVoiceBgPagerView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;Ll/d3q;)V
    .locals 1

    .line 1
    instance-of v0, p1, Ll/p4o0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Ll/p4o0;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Ll/p4o0;->I(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static synthetic b(Ll/hrp;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/hrp;->e(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public c(Ll/erp;)V
    .locals 3

    .line 1
    iput-object p1, p0, Ll/hrp;->a:Ll/erp;

    .line 2
    .line 3
    new-instance p1, Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/IntlVoiceBgPagerView;

    .line 4
    .line 5
    iget-object v0, p0, Ll/hrp;->a:Ll/erp;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Ll/hrp;->a:Ll/erp;

    .line 12
    .line 13
    invoke-virtual {v1}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Xi:I

    .line 18
    .line 19
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-direct {p1, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/IntlVoiceBgPagerView;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iput-object p1, p0, Ll/hrp;->b:Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/IntlVoiceBgPagerView;

    .line 27
    .line 28
    return-void
.end method

.method public d()Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/IntlVoiceBgPagerView;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hrp;->b:Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/IntlVoiceBgPagerView;

    .line 2
    .line 3
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic e(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-boolean p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;->check:Z

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/hrp;->a:Ll/erp;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/erp;->M3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public f(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;

    .line 21
    .line 22
    new-instance v2, Ll/p4o0;

    .line 23
    .line 24
    const-string v3, "me"

    .line 25
    .line 26
    invoke-direct {v2, v1, v3}, Ll/p4o0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    new-instance v3, Ll/frp;

    .line 30
    .line 31
    invoke-direct {v3, p0, v1}, Ll/frp;-><init>(Ll/hrp;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v2, v3}, Ll/d3q;->A(Landroid/view/View$OnClickListener;)V

    .line 35
    .line 36
    .line 37
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    iget-object p0, p0, Ll/hrp;->b:Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/IntlVoiceBgPagerView;

    .line 42
    .line 43
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/IntlVoiceBgPagerView;->d(Ljava/util/List;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public i(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hrp;->b:Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/IntlVoiceBgPagerView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/IntlVoiceBgPagerView;->getModels()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/grp;

    .line 8
    .line 9
    invoke-direct {v1, p1}, Ll/grp;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;)V

    .line 10
    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ll/hrp;->b:Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/IntlVoiceBgPagerView;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/IntlVoiceBgPagerView;->c()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/erp;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/hrp;->c(Ll/erp;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method
