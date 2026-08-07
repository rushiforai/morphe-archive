.class public Ll/n35;
.super Ll/a3g0;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/a3g0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Ll/p2g0;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/pb1;->c()Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p1}, Ll/p2g0;->a()Ll/d3g0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    sget-object v1, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->CHAT_ROOM_WINDOW:Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 16
    .line 17
    if-eq p0, v1, :cond_0

    .line 18
    .line 19
    new-instance p0, Landroid/content/Intent;

    .line 20
    .line 21
    invoke-virtual {v0}, Ll/d3g0;->a()Landroid/content/Context;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    const-class v2, Lcom/p1/mobile/putong/live/livingroom/archi/act/InternationalAudioConflictAct;

    .line 26
    .line 27
    invoke-direct {p0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 28
    .line 29
    .line 30
    const-string v1, "startData"

    .line 31
    .line 32
    invoke-virtual {v0}, Ll/d3g0;->c()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-virtual {p0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, p0}, Ll/d3g0;->g(Landroid/content/Intent;)V

    .line 40
    .line 41
    .line 42
    invoke-interface {p1, v0}, Ll/p2g0;->b(Ll/d3g0;)Ll/p2g0;

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_0
    invoke-interface {p1, v0}, Ll/p2g0;->b(Ll/d3g0;)Ll/p2g0;

    .line 47
    .line 48
    .line 49
    return-void
.end method
