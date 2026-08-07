.class public Ll/itm0;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/afo0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBonusGifts;

.field public c:Lcom/p1/mobile/android/app/Act;

.field public d:Ll/x20;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p2}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/itm0;->c:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    new-instance p1, Ll/afo0;

    .line 7
    .line 8
    invoke-direct {p1}, Ll/afo0;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/ar2;->C(Ll/iam;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic e0(Ll/itm0;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/itm0;->j0(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method

.method public static synthetic f0(Ll/itm0;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/itm0;->k0(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method

.method public static synthetic g0(Ll/itm0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/itm0;->l0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic h0(Ljava/util/ArrayList;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBonusGiftItem;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBonusGiftItem;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/itm0;->c:Lcom/p1/mobile/android/app/Act;

    .line 3
    .line 4
    return-void
.end method

.method public i0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/itm0;->a:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/itm0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBonusGifts;

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBonusGifts;->giftItems:Ljava/util/List;

    .line 14
    .line 15
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, Ll/itm0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBonusGifts;

    .line 28
    .line 29
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBonusGifts;->giftItems:Ljava/util/List;

    .line 30
    .line 31
    new-instance v2, Ll/etm0;

    .line 32
    .line 33
    invoke-direct {v2, v0}, Ll/etm0;-><init>(Ljava/util/ArrayList;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v1, v2}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 37
    .line 38
    .line 39
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 40
    .line 41
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iget-object v1, p0, Ll/itm0;->a:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/voice/call/api/VCallApiProvider;->openBonusGifts(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    new-instance v1, Ll/ftm0;

    .line 56
    .line 57
    invoke-direct {v1, p0}, Ll/ftm0;-><init>(Ll/itm0;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    new-instance v1, Ll/gtm0;

    .line 65
    .line 66
    invoke-direct {v1, p0}, Ll/gtm0;-><init>(Ll/itm0;)V

    .line 67
    .line 68
    .line 69
    new-instance v2, Ll/htm0;

    .line 70
    .line 71
    invoke-direct {v2, p0}, Ll/htm0;-><init>(Ll/itm0;)V

    .line 72
    .line 73
    .line 74
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 79
    .line 80
    .line 81
    :cond_1
    :goto_0
    return-void
.end method

.method public final synthetic j0(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/itm0;->m0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic k0(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/afo0;

    .line 4
    .line 5
    iget-object p0, p0, Ll/itm0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBonusGifts;

    .line 6
    .line 7
    iget-wide v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBonusGifts;->tantanCoins:J

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBonusGifts;->giftItems:Ljava/util/List;

    .line 10
    .line 11
    invoke-virtual {p1, v0, v1, p0}, Ll/afo0;->w(JLjava/util/List;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic l0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/afo0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/afo0;->v()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final m0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/itm0;->d:Ll/x20;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/x20;->call()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public n0(Landroid/view/ViewGroup;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBonusGifts;Ll/x20;)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/itm0;->a:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p3, p0, Ll/itm0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBonusGifts;

    .line 4
    .line 5
    iput-object p4, p0, Ll/itm0;->d:Ll/x20;

    .line 6
    .line 7
    iget-object p2, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 8
    .line 9
    check-cast p2, Ll/afo0;

    .line 10
    .line 11
    iget-object p0, p0, Ll/itm0;->c:Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    invoke-virtual {p2, p0, p1, p3}, Ll/afo0;->x(Landroid/content/Context;Landroid/view/ViewGroup;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBonusGifts;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
