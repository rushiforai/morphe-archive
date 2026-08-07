.class public abstract Lcom/xiaomi/push/service/an;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static A:Ljava/lang/String; = "ext_auth_method"

.field public static B:Ljava/lang/String; = "ext_security"

.field public static C:Ljava/lang/String; = "ext_kick"

.field public static D:Ljava/lang/String; = "ext_client_attr"

.field public static E:Ljava/lang/String; = "ext_cloud_attr"

.field public static F:Ljava/lang/String; = "ext_pkg_name"

.field public static G:Ljava/lang/String; = "ext_notify_id"

.field public static H:Ljava/lang/String; = "ext_clicked_button"

.field public static I:Ljava/lang/String; = "ext_notify_type"

.field public static J:Ljava/lang/String; = "ext_session"

.field public static K:Ljava/lang/String; = "sig"

.field public static L:Ljava/lang/String; = "ext_notify_title"

.field public static M:Ljava/lang/String; = "ext_notify_description"

.field public static N:Ljava/lang/String; = "ext_messenger"

.field public static O:Ljava/lang/String; = "title"

.field public static P:Ljava/lang/String; = "description"

.field public static Q:Ljava/lang/String; = "notifyId"

.field public static R:Ljava/lang/String; = "dump"

.field public static a:Ljava/lang/String; = "1"

.field public static b:Ljava/lang/String; = "2"

.field public static c:Ljava/lang/String; = "3"

.field public static d:Ljava/lang/String; = "com.xiaomi.push.OPEN_CHANNEL"

.field public static e:Ljava/lang/String; = "com.xiaomi.push.SEND_MESSAGE"

.field public static f:Ljava/lang/String; = "com.xiaomi.push.SEND_IQ"

.field public static g:Ljava/lang/String; = "com.xiaomi.push.BATCH_SEND_MESSAGE"

.field public static h:Ljava/lang/String; = "com.xiaomi.push.SEND_PRES"

.field public static i:Ljava/lang/String; = "com.xiaomi.push.CLOSE_CHANNEL"

.field public static j:Ljava/lang/String; = "com.xiaomi.push.FORCE_RECONN"

.field public static k:Ljava/lang/String; = "com.xiaomi.push.RESET_CONN"

.field public static l:Ljava/lang/String; = "com.xiaomi.push.UPDATE_CHANNEL_INFO"

.field public static m:Ljava/lang/String; = "com.xiaomi.push.SEND_STATS"

.field public static n:Ljava/lang/String; = "com.xiaomi.push.HANDLE_FCM_MSG"

.field public static o:Ljava/lang/String; = "com.xiaomi.push.APP_NOTIFY_MSG"

.field public static p:Ljava/lang/String; = "com.xiaomi.push.CHANGE_HOST"

.field public static q:Ljava/lang/String; = "com.xiaomi.push.PING_TIMER"

.field public static r:Ljava/lang/String; = "com.xiaomi.push.APP_CHANNEL_SWITCH"

.field public static s:Ljava/lang/String; = "ext_user_id"

.field public static t:Ljava/lang/String; = "ext_user_server"

.field public static u:Ljava/lang/String; = "ext_user_res"

.field public static v:Ljava/lang/String; = "ext_chid"

.field public static w:Ljava/lang/String; = "ext_receive_time"

.field public static x:Ljava/lang/String; = "ext_broadcast_time"

.field public static y:Ljava/lang/String; = "ext_sid"

.field public static z:Ljava/lang/String; = "ext_token"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public static a(I)Ljava/lang/String;
    .locals 0

    .line 1
    packed-switch p0, :pswitch_data_0

    .line 2
    .line 3
    .line 4
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0

    .line 9
    :pswitch_0
    const-string p0, "ERROR_PING_TIMEOUT"

    .line 10
    .line 11
    return-object p0

    .line 12
    :pswitch_1
    const-string p0, "ERROR_BIND_TIMEOUT"

    .line 13
    .line 14
    return-object p0

    .line 15
    :pswitch_2
    const-string p0, "ERROR_REDIRECT"

    .line 16
    .line 17
    return-object p0

    .line 18
    :pswitch_3
    const-string p0, "ERROR_USER_BLOCKED"

    .line 19
    .line 20
    return-object p0

    .line 21
    :pswitch_4
    const-string p0, "ERROR_CONNECTIING_TIMEOUT"

    .line 22
    .line 23
    return-object p0

    .line 24
    :pswitch_5
    const-string p0, "ERROR_READ_TIMEOUT"

    .line 25
    .line 26
    return-object p0

    .line 27
    :pswitch_6
    const-string p0, "ERROR_SESSION_CHANGED"

    .line 28
    .line 29
    return-object p0

    .line 30
    :pswitch_7
    const-string p0, "ERROR_SERVICE_DESTROY"

    .line 31
    .line 32
    return-object p0

    .line 33
    :pswitch_8
    const-string p0, "ERROR_THREAD_BLOCK"

    .line 34
    .line 35
    return-object p0

    .line 36
    :pswitch_9
    const-string p0, "ERROR_SERVER_STREAM"

    .line 37
    .line 38
    return-object p0

    .line 39
    :pswitch_a
    const-string p0, "ERROR_NO_CLIENT"

    .line 40
    .line 41
    return-object p0

    .line 42
    :pswitch_b
    const-string p0, "ERROR_RESET"

    .line 43
    .line 44
    return-object p0

    .line 45
    :pswitch_c
    const-string p0, "ERROR_SEND_ERROR"

    .line 46
    .line 47
    return-object p0

    .line 48
    :pswitch_d
    const-string p0, "ERROR_READ_ERROR"

    .line 49
    .line 50
    return-object p0

    .line 51
    :pswitch_e
    const-string p0, "ERROR_RECEIVE_TIMEOUT"

    .line 52
    .line 53
    return-object p0

    .line 54
    :pswitch_f
    const-string p0, "ERROR_SERVER_ERROR"

    .line 55
    .line 56
    return-object p0

    .line 57
    :pswitch_10
    const-string p0, "ERROR_MULTI_LOGIN"

    .line 58
    .line 59
    return-object p0

    .line 60
    :pswitch_11
    const-string p0, "ERROR_AUTH_FAILED"

    .line 61
    .line 62
    return-object p0

    .line 63
    :pswitch_12
    const-string p0, "ERROR_ACCESS_DENIED"

    .line 64
    .line 65
    return-object p0

    .line 66
    :pswitch_13
    const-string p0, "ERROR_NETWORK_FAILED"

    .line 67
    .line 68
    return-object p0

    .line 69
    :pswitch_14
    const-string p0, "ERROR_NETWORK_NOT_AVAILABLE"

    .line 70
    .line 71
    return-object p0

    .line 72
    :pswitch_15
    const-string p0, "ERROR_SERVICE_NOT_INSTALLED"

    .line 73
    .line 74
    return-object p0

    .line 75
    :pswitch_16
    const-string p0, "ERROR_OK"

    .line 76
    .line 77
    return-object p0

    .line 78
    nop

    .line 79
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
