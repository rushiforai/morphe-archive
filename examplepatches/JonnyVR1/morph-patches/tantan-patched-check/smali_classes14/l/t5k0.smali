.class public final synthetic Ll/t5k0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/PushMessage;

.field public final synthetic b:Lcom/p1/mobile/putong/api/push/PushTrackData;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/putong/api/push/PushTrackData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/t5k0;->a:Lcom/p1/mobile/putong/data/PushMessage;

    iput-object p2, p0, Ll/t5k0;->b:Lcom/p1/mobile/putong/api/push/PushTrackData;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/t5k0;->a:Lcom/p1/mobile/putong/data/PushMessage;

    iget-object p0, p0, Ll/t5k0;->b:Lcom/p1/mobile/putong/api/push/PushTrackData;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveSquareSummary;

    invoke-static {v0, p0, p1}, Ll/v5k0;->b(Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/putong/api/push/PushTrackData;Lcom/p1/mobile/putong/live/base/data/BLiveSquareSummary;)V

    return-void
.end method
