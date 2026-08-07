.class public final synthetic Ll/gfn0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gfn0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gfn0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;

    check-cast p1, Lcom/p1/mobile/putong/data/User;

    invoke-static {p0, p1}, Ll/kfn0;->g(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;Lcom/p1/mobile/putong/data/User;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
