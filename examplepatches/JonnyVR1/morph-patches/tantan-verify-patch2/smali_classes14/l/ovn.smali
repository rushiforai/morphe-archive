.class public Ll/ovn;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;ILl/str;)V
    .locals 3

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-string v1, "room_name"

    .line 7
    .line 8
    iget-object v2, p2, Ll/str;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;

    .line 9
    .line 10
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->title:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 13
    .line 14
    .line 15
    const-string v1, "label_name"

    .line 16
    .line 17
    iget-object v2, p2, Ll/str;->d:Lcom/p1/mobile/putong/live/base/data/BLiveActivity;

    .line 18
    .line 19
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveActivity;->value:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :catch_0
    move-exception v1

    .line 26
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 30
    .line 31
    .line 32
    :goto_0
    move-object v1, p0

    .line 33
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 34
    .line 35
    iget-object p2, p2, Ll/str;->d:Lcom/p1/mobile/putong/live/base/data/BLiveActivity;

    .line 36
    .line 37
    invoke-static {v1, p2}, Ll/gfj0;->b(Lcom/p1/mobile/putong/live/base/data/BLive;Lcom/p1/mobile/putong/live/base/data/BLiveActivity;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    invoke-static {}, Ll/kfd0;->x()Ll/kfd0$a;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    const-string v2, "page"

    .line 46
    .line 47
    invoke-virtual {v1, v2}, Ll/kfd0$a;->w(Ljava/lang/String;)Ll/kfd0$a;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    add-int/lit8 p1, p1, 0x1

    .line 52
    .line 53
    invoke-virtual {v1, p1}, Ll/kfd0$a;->l(I)Ll/kfd0$a;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-virtual {p1, p0}, Ll/kfd0$a;->b(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Ll/kfd0$a;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {p0, p2}, Ll/kfd0$a;->t(Ljava/lang/String;)Ll/kfd0$a;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {p0, v0}, Ll/kfd0$a;->A(Ljava/lang/Object;)Ll/kfd0$a;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {p0}, Ll/kfd0$a;->a()Ll/kfd0;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    const-string p1, "p_live_follow"

    .line 74
    .line 75
    invoke-static {p0, p1}, Ll/bfu;->c(Ll/kfd0;Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public static b(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;ILl/str;)V
    .locals 4

    .line 1
    move-object v0, p0

    .line 2
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 3
    .line 4
    iget-object v1, p2, Ll/str;->d:Lcom/p1/mobile/putong/live/base/data/BLiveActivity;

    .line 5
    .line 6
    invoke-static {v0, v1}, Ll/gfj0;->b(Lcom/p1/mobile/putong/live/base/data/BLive;Lcom/p1/mobile/putong/live/base/data/BLiveActivity;)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    new-instance v1, Lorg/json/JSONObject;

    .line 11
    .line 12
    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 13
    .line 14
    .line 15
    :try_start_0
    const-string v2, "room_name"

    .line 16
    .line 17
    iget-object v3, p2, Ll/str;->c:Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;

    .line 18
    .line 19
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->title:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 22
    .line 23
    .line 24
    const-string v2, "label_name"

    .line 25
    .line 26
    iget-object p2, p2, Ll/str;->d:Lcom/p1/mobile/putong/live/base/data/BLiveActivity;

    .line 27
    .line 28
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveActivity;->value:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v1, v2, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :catch_0
    move-exception p2

    .line 35
    invoke-static {p2}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p2}, Ljava/lang/Throwable;->printStackTrace()V

    .line 39
    .line 40
    .line 41
    :goto_0
    invoke-static {}, Ll/kfd0;->x()Ll/kfd0$a;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    const-string v2, "page"

    .line 46
    .line 47
    invoke-virtual {p2, v2}, Ll/kfd0$a;->w(Ljava/lang/String;)Ll/kfd0$a;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    add-int/lit8 p1, p1, 0x1

    .line 52
    .line 53
    invoke-virtual {p2, p1}, Ll/kfd0$a;->l(I)Ll/kfd0$a;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-virtual {p1, p0}, Ll/kfd0$a;->b(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Ll/kfd0$a;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {p0, v0}, Ll/kfd0$a;->t(Ljava/lang/String;)Ll/kfd0$a;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {p0, v1}, Ll/kfd0$a;->A(Ljava/lang/Object;)Ll/kfd0$a;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {p0}, Ll/kfd0$a;->a()Ll/kfd0;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    const-string p1, "p_live_follow"

    .line 74
    .line 75
    invoke-static {p0, p1}, Ll/bfu;->g(Ll/kfd0;Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    return-void
.end method
