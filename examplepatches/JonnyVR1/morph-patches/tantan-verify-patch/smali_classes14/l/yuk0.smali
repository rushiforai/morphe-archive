.class public Ll/yuk0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Ljava/lang/String; = "accept"

.field public static b:Ljava/lang/String; = "join"

.field public static c:Ljava/lang/String; = "quit"

.field public static d:Ljava/lang/String; = "timeout"

.field public static e:Ljava/lang/String; = "leave"

.field public static f:Ljava/lang/String; = "other-leave"

.field public static g:Ljava/lang/String; = "not-pay"

.field public static h:Ljava/lang/String; = "cancel"

.field public static i:Ljava/lang/String; = "reject"

.field public static j:Ljava/lang/String; = "quit_multi_device"

.field public static k:Ljava/lang/String; = "mute-video"

.field public static l:Ljava/lang/String; = "unmute-video"

.field public static m:Ljava/lang/String; = "auto-answer"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)Z
    .locals 1

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return p0

    .line 5
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->status:Ljava/lang/String;

    .line 6
    .line 7
    const-string v0, "calling"

    .line 8
    .line 9
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public static b(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)Z
    .locals 1

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return p0

    .line 5
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->status:Ljava/lang/String;

    .line 6
    .line 7
    const-string v0, "connecting"

    .line 8
    .line 9
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public static c(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    const-string v1, "pending"

    .line 6
    .line 7
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->status:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-nez v1, :cond_2

    .line 14
    .line 15
    const-string v1, "connecting"

    .line 16
    .line 17
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->status:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-nez v1, :cond_2

    .line 24
    .line 25
    const-string v1, "calling"

    .line 26
    .line 27
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->status:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-nez v1, :cond_2

    .line 34
    .line 35
    const-string v1, "stopped"

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->status:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    if-eqz p0, :cond_1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    return v0

    .line 47
    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 48
    return p0
.end method

.method public static d(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "pending"

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatLive;->status:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public static e(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)Z
    .locals 1

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    return p0

    .line 5
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->status:Ljava/lang/String;

    .line 6
    .line 7
    const-string v0, "stopped"

    .line 8
    .line 9
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public static f(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)Z
    .locals 1

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return p0

    .line 5
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->status:Ljava/lang/String;

    .line 6
    .line 7
    const-string v0, "pending"

    .line 8
    .line 9
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public static g(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)Z
    .locals 1

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return p0

    .line 5
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->status:Ljava/lang/String;

    .line 6
    .line 7
    const-string v0, "stopped"

    .line 8
    .line 9
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method
