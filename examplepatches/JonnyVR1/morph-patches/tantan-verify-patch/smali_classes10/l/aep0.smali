.class public final synthetic Ll/aep0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/bep0;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;


# direct methods
.method public synthetic constructor <init>(Ll/bep0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/aep0;->a:Ll/bep0;

    iput-object p2, p0, Ll/aep0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/aep0;->a:Ll/bep0;

    iget-object p0, p0, Ll/aep0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;

    invoke-static {v0, p0}, Ll/bep0;->L3(Ll/bep0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;)V

    return-void
.end method
