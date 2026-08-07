.class public final synthetic Ll/dgv;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/data/BLiveLiveMedalCDN;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveLiveMedalCDN;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dgv;->a:Lcom/p1/mobile/putong/live/base/data/BLiveLiveMedalCDN;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dgv;->a:Lcom/p1/mobile/putong/live/base/data/BLiveLiveMedalCDN;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveMedals;

    invoke-static {p0, p1}, Ll/aiv;->Q(Lcom/p1/mobile/putong/live/base/data/BLiveLiveMedalCDN;Lcom/p1/mobile/putong/live/base/data/BLiveMedals;)Lcom/p1/mobile/putong/live/base/data/BLiveModelsFromCdnWarpData;

    move-result-object p0

    return-object p0
.end method
