.class public final synthetic Ll/x8g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/data/BLiveFanBase;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveFanBase;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/x8g;->a:Lcom/p1/mobile/putong/live/base/data/BLiveFanBase;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x8g;->a:Lcom/p1/mobile/putong/live/base/data/BLiveFanBase;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;

    invoke-static {p0, p1}, Ll/d9g;->V3(Lcom/p1/mobile/putong/live/base/data/BLiveFanBase;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Ll/a8g;

    move-result-object p0

    return-object p0
.end method
