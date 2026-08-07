.class public Ll/msn0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/msn0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/msn0;


# direct methods
.method public constructor <init>(Ll/msn0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/msn0$a;->a:Ll/msn0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/msn0$a;->a:Ll/msn0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/msn0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;->playInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->userId:Ljava/lang/String;

    .line 12
    .line 13
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 14
    .line 15
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    iget-object v0, p0, Ll/msn0$a;->a:Ll/msn0;

    .line 26
    .line 27
    iget-object v0, v0, Ll/msn0;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;->playInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 30
    .line 31
    const-string v1, "[voice][ktv]"

    .line 32
    .line 33
    const-string v2, "timer end to play music"

    .line 34
    .line 35
    invoke-static {v1, v2}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Ll/msn0$a;->a:Ll/msn0;

    .line 39
    .line 40
    invoke-static {p0}, Ll/msn0;->m(Ll/msn0;)Ll/xvl;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->orderId:Ljava/lang/String;

    .line 45
    .line 46
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->songCode:Ljava/lang/String;

    .line 47
    .line 48
    iget-object v4, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->songUrl:Ljava/lang/String;

    .line 49
    .line 50
    iget-object v5, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->lyricUrl:Ljava/lang/String;

    .line 51
    .line 52
    iget-object v6, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->lyricType:Ljava/lang/String;

    .line 53
    .line 54
    iget-object v7, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->provider:Ljava/lang/String;

    .line 55
    .line 56
    invoke-interface/range {v1 .. v7}, Ll/xvl;->f0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    :cond_0
    return-void
.end method
