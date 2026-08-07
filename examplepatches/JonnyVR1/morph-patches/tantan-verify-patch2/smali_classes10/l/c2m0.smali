.class public final synthetic Ll/c2m0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/d2m0;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;


# direct methods
.method public synthetic constructor <init>(Ll/d2m0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/c2m0;->a:Ll/d2m0;

    iput-object p2, p0, Ll/c2m0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/c2m0;->a:Ll/d2m0;

    iget-object p0, p0, Ll/c2m0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;

    invoke-static {v0, p0}, Ll/d2m0;->p4(Ll/d2m0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;)V

    return-void
.end method
