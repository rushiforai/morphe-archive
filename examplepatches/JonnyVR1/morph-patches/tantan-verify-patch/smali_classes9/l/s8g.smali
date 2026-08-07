.class public final synthetic Ll/s8g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/d9g;

.field public final synthetic b:Ll/ppq;

.field public final synthetic c:Lcom/p1/mobile/putong/live/base/data/BLiveJoinFanBaseContent;


# direct methods
.method public synthetic constructor <init>(Ll/d9g;Ll/ppq;Lcom/p1/mobile/putong/live/base/data/BLiveJoinFanBaseContent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/s8g;->a:Ll/d9g;

    iput-object p2, p0, Ll/s8g;->b:Ll/ppq;

    iput-object p3, p0, Ll/s8g;->c:Lcom/p1/mobile/putong/live/base/data/BLiveJoinFanBaseContent;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/s8g;->a:Ll/d9g;

    iget-object v1, p0, Ll/s8g;->b:Ll/ppq;

    iget-object p0, p0, Ll/s8g;->c:Lcom/p1/mobile/putong/live/base/data/BLiveJoinFanBaseContent;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;

    invoke-static {v0, v1, p0, p1}, Ll/d9g;->T3(Ll/d9g;Ll/ppq;Lcom/p1/mobile/putong/live/base/data/BLiveJoinFanBaseContent;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method
