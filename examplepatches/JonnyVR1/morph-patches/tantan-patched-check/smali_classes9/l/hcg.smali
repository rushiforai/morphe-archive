.class public final synthetic Ll/hcg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/rcj;


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;

    check-cast p2, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    invoke-static {p1, p2}, Ll/ocg;->N3(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;)Ll/zsc0;

    move-result-object p0

    return-object p0
.end method
