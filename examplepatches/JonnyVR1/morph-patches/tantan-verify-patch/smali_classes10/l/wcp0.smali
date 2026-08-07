.class public final synthetic Ll/wcp0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/ndp0;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;


# direct methods
.method public synthetic constructor <init>(Ll/ndp0;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wcp0;->a:Ll/ndp0;

    iput-object p2, p0, Ll/wcp0;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/wcp0;->c:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wcp0;->a:Ll/ndp0;

    iget-object v1, p0, Ll/wcp0;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/wcp0;->c:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;

    invoke-static {v0, v1, p0}, Ll/ndp0;->T3(Ll/ndp0;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomTagInfo;)V

    return-void
.end method
