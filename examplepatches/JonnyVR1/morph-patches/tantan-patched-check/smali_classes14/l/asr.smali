.class public final synthetic Ll/asr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/msr;

.field public final synthetic b:Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;


# direct methods
.method public synthetic constructor <init>(Ll/msr;Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/asr;->a:Ll/msr;

    iput-object p2, p0, Ll/asr;->b:Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/asr;->a:Ll/msr;

    iget-object p0, p0, Ll/asr;->b:Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;

    invoke-static {v0, p0, p1}, Ll/msr;->b3(Ll/msr;Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveActivitiesEntry;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method
