.class public final synthetic Ll/wjp0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/akp0;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;


# direct methods
.method public synthetic constructor <init>(Ll/akp0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wjp0;->a:Ll/akp0;

    iput-object p2, p0, Ll/wjp0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wjp0;->a:Ll/akp0;

    iget-object p0, p0, Ll/wjp0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    invoke-static {v0, p0}, Ll/akp0;->L3(Ll/akp0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;)V

    return-void
.end method
