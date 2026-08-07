.class public final synthetic Ll/c9o0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/d9o0;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;


# direct methods
.method public synthetic constructor <init>(Ll/d9o0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/c9o0;->a:Ll/d9o0;

    iput-object p2, p0, Ll/c9o0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/c9o0;->a:Ll/d9o0;

    iget-object p0, p0, Ll/c9o0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;

    invoke-static {v0, p0}, Ll/d9o0;->i4(Ll/d9o0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;)V

    return-void
.end method
