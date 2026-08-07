.class public final synthetic Ll/z320;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/data/BLiveActivity;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveActivity;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/z320;->a:Lcom/p1/mobile/putong/live/base/data/BLiveActivity;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z320;->a:Lcom/p1/mobile/putong/live/base/data/BLiveActivity;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLive;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/external/module/api/MyRoomInProfileApi;->b(Lcom/p1/mobile/putong/live/base/data/BLiveActivity;Lcom/p1/mobile/putong/live/base/data/BLive;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
