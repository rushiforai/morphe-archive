.class public Ll/urp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/rrp;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/IntlVoiceBgPagerView;

.field public b:Ll/rrp;


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

.method public static synthetic a(Ll/urp;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/urp;->e(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;)V

    return-void
.end method

.method public static synthetic b(Ll/urp;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/urp;->f(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;Landroid/view/View;)V

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

.method public c(Ll/rrp;)V
    .locals 3

    .line 1
    iput-object p1, p0, Ll/urp;->b:Ll/rrp;

    .line 2
    .line 3
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/IntlVoiceBgPagerView;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object v1, p0, Ll/urp;->b:Ll/rrp;

    .line 10
    .line 11
    invoke-virtual {v1}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Yi:I

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-direct {v0, p1, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/IntlVoiceBgPagerView;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Ll/urp;->a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/IntlVoiceBgPagerView;

    .line 25
    .line 26
    return-void
.end method

.method public d()Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/IntlVoiceBgPagerView;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/urp;->a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/IntlVoiceBgPagerView;

    .line 2
    .line 3
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic e(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/urp;->b:Ll/rrp;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/rrp;->X3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic f(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/urp;->b:Ll/rrp;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/rrp;->W3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public i(Ljava/util/List;)V
    .locals 5
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
    new-instance v3, Ll/srp;

    .line 25
    .line 26
    invoke-direct {v3, p0, v1}, Ll/srp;-><init>(Ll/urp;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;)V

    .line 27
    .line 28
    .line 29
    const-string v4, "shop"

    .line 30
    .line 31
    invoke-direct {v2, v1, v4, v3}, Ll/p4o0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;Ljava/lang/String;Ljava/lang/Runnable;)V

    .line 32
    .line 33
    .line 34
    new-instance v3, Ll/trp;

    .line 35
    .line 36
    invoke-direct {v3, p0, v1}, Ll/trp;-><init>(Ll/urp;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v2, v3}, Ll/d3q;->A(Landroid/view/View$OnClickListener;)V

    .line 40
    .line 41
    .line 42
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    iget-object p0, p0, Ll/urp;->a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/IntlVoiceBgPagerView;

    .line 47
    .line 48
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/roombg/common/IntlVoiceBgPagerView;->d(Ljava/util/List;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/rrp;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/urp;->c(Ll/rrp;)V

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
