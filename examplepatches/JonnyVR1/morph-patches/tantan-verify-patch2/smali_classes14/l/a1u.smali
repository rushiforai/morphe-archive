.class public abstract Ll/a1u;
.super Ll/mus;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V::",
        "Ll/iam;",
        ">",
        "Ll/mus<",
        "TV;>;"
    }
.end annotation


# instance fields
.field public f:Ll/ft5;

.field public g:I

.field public h:Z

.field public i:I

.field public final j:I

.field public k:Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;


# direct methods
.method public constructor <init>(Ll/ner;Ll/nus;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/mus;-><init>(Ll/ner;Ll/nus;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/ft5;

    .line 5
    .line 6
    invoke-direct {p1}, Ll/ft5;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/a1u;->f:Ll/ft5;

    .line 10
    .line 11
    const/16 p1, 0x3c

    .line 12
    .line 13
    iput p1, p0, Ll/a1u;->g:I

    .line 14
    .line 15
    const/16 p1, 0x258

    .line 16
    .line 17
    iput p1, p0, Ll/a1u;->i:I

    .line 18
    .line 19
    const/16 p1, 0xbb8

    .line 20
    .line 21
    iput p1, p0, Ll/a1u;->j:I

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/a1u;->Q2()V

    .line 24
    .line 25
    .line 26
    return-void
.end method


# virtual methods
.method public P2()I
    .locals 0

    .line 1
    iget p0, p0, Ll/a1u;->i:I

    .line 2
    .line 3
    return p0
.end method

.method public Q2()V
    .locals 2

    .line 1
    sget-object v0, Ll/tbs;->b:Ll/vwt;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/vwt;->A3()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveSquareRefreshListInterval:I

    .line 15
    .line 16
    if-lez v1, :cond_1

    .line 17
    .line 18
    iput v1, p0, Ll/a1u;->i:I

    .line 19
    .line 20
    :cond_1
    iget v1, p0, Ll/a1u;->g:I

    .line 21
    .line 22
    if-lez v1, :cond_2

    .line 23
    .line 24
    iget v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->liveSquareRefreshStateInterval:I

    .line 25
    .line 26
    iput v0, p0, Ll/a1u;->g:I

    .line 27
    .line 28
    :cond_2
    :goto_0
    return-void
.end method

.method public R2(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    .line 1
    sget-object v0, Ll/tbs;->f:Ll/j6t;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/mus;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->getBuilder()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    const/4 v3, 0x1

    .line 12
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->C(Z)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->expendToFullLive()Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {v2, p1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->D(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->O(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    const-string p2, "type_normal_live"

    .line 29
    .line 30
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->H(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    iget-boolean p2, p0, Ll/a1u;->h:Z

    .line 35
    .line 36
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->M(Z)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p1, p3}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->y(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->u()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {v0, v1, p1}, Ll/j6t;->f(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;)Landroid/content/Intent;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-virtual {p0}, Ll/mus;->act()Lcom/p1/mobile/android/app/Act;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public S2(Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/a1u;->k:Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;

    .line 2
    .line 3
    return-void
.end method

.method public T2()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method
