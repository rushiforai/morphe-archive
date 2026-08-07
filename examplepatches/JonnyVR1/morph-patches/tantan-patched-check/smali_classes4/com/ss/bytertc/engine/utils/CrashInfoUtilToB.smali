.class public Lcom/ss/bytertc/engine/utils/CrashInfoUtilToB;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final TAG:Ljava/lang/String; = "CrashInfoUtilToB"

.field private static final context:Landroid/content/Context;

.field private static sdk:Ll/d610; = null

.field private static final token:Ljava/lang/String; = "d7271e1eac254529abcffc63e36b02c3"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/ss/bytertc/base/utils/RtcContextUtils;->getApplicationContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Lcom/ss/bytertc/engine/utils/CrashInfoUtilToB;->context:Landroid/content/Context;

    .line 6
    .line 7
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

.method public static addTagsReport(Ljava/lang/String;)V
    .locals 5
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    const-string v0, "addTagsReport..."

    .line 2
    .line 3
    const-string v1, "CrashInfoUtilToB"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-eqz v2, :cond_0

    .line 22
    .line 23
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    check-cast v2, Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    sget-object v4, Lcom/ss/bytertc/engine/utils/CrashInfoUtilToB;->sdk:Ll/d610;

    .line 34
    .line 35
    invoke-virtual {v4, v2, v3}, Ll/d610;->d(Ljava/lang/String;Ljava/lang/String;)Ll/d610;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :catch_0
    move-exception p0

    .line 40
    goto :goto_1

    .line 41
    :cond_0
    return-void

    .line 42
    :goto_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    const-string v2, "addTagsReport catch exception.\n"

    .line 45
    .line 46
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public static initApm(Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    const-string p0, "initApm..."

    .line 2
    .line 3
    const-string v1, "CrashInfoUtilToB"

    .line 4
    .line 5
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :try_start_0
    const-string p0, "432410"

    .line 9
    .line 10
    invoke-static {p0}, Ll/d610$c;->d(Ljava/lang/String;)Ll/d610$c$b;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    const-string v0, "d7271e1eac254529abcffc63e36b02c3"

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Ll/d610$c$b;->f(Ljava/lang/String;)Ll/d610$c$b;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const-string v0, "1\u30020"

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Ll/d610$c$b;->h(Ljava/lang/String;)Ll/d610$c$b;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const-wide/16 v2, 0x1

    .line 27
    .line 28
    invoke-virtual {p0, v2, v3}, Ll/d610$c$b;->g(J)Ll/d610$c$b;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    new-instance v0, Lcom/ss/bytertc/engine/utils/CrashInfoUtilToB$1;

    .line 33
    .line 34
    invoke-direct {v0, p1}, Lcom/ss/bytertc/engine/utils/CrashInfoUtilToB$1;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0, v0}, Ll/d610$c$b;->c(Ll/d610$c$a;)Ll/d610$c$b;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    const-string p1, "rtc_sdk"

    .line 42
    .line 43
    invoke-virtual {p0, p1}, Ll/d610$c$b;->b(Ljava/lang/String;)Ll/d610$c$b;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    const-string p1, "bytertc"

    .line 48
    .line 49
    const-string v0, "com.ss.video.rtc.oner"

    .line 50
    .line 51
    const-string v2, "com.bytedance.ttgame.module.rtc.RtcService"

    .line 52
    .line 53
    filled-new-array {p1, v0, v2}, [Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-virtual {p0, p1}, Ll/d610$c$b;->d([Ljava/lang/String;)Ll/d610$c$b;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    const-string v2, "libbyteaudio.so"

    .line 62
    .line 63
    const-string v3, "libbytertc.so"

    .line 64
    .line 65
    const-string v4, "libagora.so"

    .line 66
    .line 67
    const-string v5, "libonerrtc.so"

    .line 68
    .line 69
    const-string v6, "libvolcenginertc.so"

    .line 70
    .line 71
    const-string v7, "libulien_audio.so"

    .line 72
    .line 73
    filled-new-array/range {v2 .. v7}, [Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    invoke-virtual {p0, p1}, Ll/d610$c$b;->e([Ljava/lang/String;)Ll/d610$c$b;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    invoke-virtual {p0}, Ll/d610$c$b;->a()Ll/d610$c;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    sget-object p1, Lcom/ss/bytertc/engine/utils/CrashInfoUtilToB;->context:Landroid/content/Context;

    .line 86
    .line 87
    invoke-static {p1, p0}, Ll/d610;->h(Landroid/content/Context;Ll/d610$c;)Ll/d610;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    sput-object p0, Lcom/ss/bytertc/engine/utils/CrashInfoUtilToB;->sdk:Ll/d610;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 92
    .line 93
    return-void

    .line 94
    :catch_0
    move-exception v0

    .line 95
    move-object p0, v0

    .line 96
    new-instance p1, Ljava/lang/StringBuilder;

    .line 97
    .line 98
    const-string v0, "initApm catch exception.\n"

    .line 99
    .line 100
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    return-void
.end method

.method public static onEventV3Report(Ljava/lang/String;)V
    .locals 6
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    const-string v0, "onEventV3Report..."

    .line 2
    .line 3
    const-string v1, "CrashInfoUtilToB"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const/4 v2, 0x0

    .line 18
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    if-eqz v3, :cond_1

    .line 23
    .line 24
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    check-cast v3, Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v4

    .line 34
    sget-object v5, Lcom/ss/bytertc/engine/utils/CrashInfoUtilToB;->sdk:Ll/d610;

    .line 35
    .line 36
    invoke-virtual {v5, v3, v4}, Ll/d610;->c(Ljava/lang/String;Ljava/lang/String;)Ll/d610;

    .line 37
    .line 38
    .line 39
    const-string v5, "rtc_room_id"

    .line 40
    .line 41
    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    if-eqz v3, :cond_0

    .line 46
    .line 47
    const-string v3, ""

    .line 48
    .line 49
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 53
    if-nez v3, :cond_0

    .line 54
    .line 55
    const/4 v2, 0x1

    .line 56
    goto :goto_0

    .line 57
    :catch_0
    move-exception p0

    .line 58
    goto :goto_2

    .line 59
    :cond_1
    const-string p0, "rtc_session_type"

    .line 60
    .line 61
    if-eqz v2, :cond_2

    .line 62
    .line 63
    :try_start_1
    sget-object v0, Lcom/ss/bytertc/engine/utils/CrashInfoUtilToB;->sdk:Ll/d610;

    .line 64
    .line 65
    const-string v2, "joinRoom"

    .line 66
    .line 67
    invoke-virtual {v0, p0, v2}, Ll/d610;->c(Ljava/lang/String;Ljava/lang/String;)Ll/d610;

    .line 68
    .line 69
    .line 70
    goto :goto_1

    .line 71
    :cond_2
    sget-object v0, Lcom/ss/bytertc/engine/utils/CrashInfoUtilToB;->sdk:Ll/d610;

    .line 72
    .line 73
    const-string v2, "createEngine"

    .line 74
    .line 75
    invoke-virtual {v0, p0, v2}, Ll/d610;->c(Ljava/lang/String;Ljava/lang/String;)Ll/d610;

    .line 76
    .line 77
    .line 78
    :goto_1
    sget-object p0, Lcom/ss/bytertc/engine/utils/CrashInfoUtilToB;->sdk:Ll/d610;

    .line 79
    .line 80
    const/4 v0, 0x0

    .line 81
    invoke-virtual {p0, v0}, Ll/d610;->j(Ll/o7m;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 82
    .line 83
    .line 84
    return-void

    .line 85
    :goto_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 86
    .line 87
    const-string v2, "onEventV3Report catch exception.\n"

    .line 88
    .line 89
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    return-void
.end method
