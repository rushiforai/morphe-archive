.class public Lcom/google/android/gms/common/api/CommonStatusCodes;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final API_NOT_CONNECTED:I = 0x11

.field public static final CANCELED:I = 0x10

.field public static final CONNECTION_SUSPENDED_DURING_CALL:I = 0x14

.field public static final DEVELOPER_ERROR:I = 0xa

.field public static final ERROR:I = 0xd

.field public static final INTERNAL_ERROR:I = 0x8

.field public static final INTERRUPTED:I = 0xe

.field public static final INVALID_ACCOUNT:I = 0x5

.field public static final NETWORK_ERROR:I = 0x7

.field public static final RECONNECTION_TIMED_OUT:I = 0x16

.field public static final RECONNECTION_TIMED_OUT_DURING_UPDATE:I = 0x15

.field public static final REMOTE_EXCEPTION:I = 0x13

.field public static final RESOLUTION_REQUIRED:I = 0x6

.field public static final SERVICE_DISABLED:I = 0x3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final SERVICE_VERSION_UPDATE_REQUIRED:I = 0x2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final SIGN_IN_REQUIRED:I = 0x4

.field public static final SUCCESS:I = 0x0

.field public static final SUCCESS_CACHE:I = -0x1

.field public static final TIMEOUT:I = 0xf


# direct methods
.method public constructor <init>()V
    .locals 0
    .annotation build Lcom/google/android/gms/common/annotation/KeepForSdk;
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getStatusCodeString(I)Ljava/lang/String;
    .locals 2
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    packed-switch p0, :pswitch_data_0

    .line 2
    .line 3
    .line 4
    :pswitch_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string v1, "unknown status code: "

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0

    .line 19
    :pswitch_1
    const-string p0, "RECONNECTION_TIMED_OUT"

    .line 20
    .line 21
    return-object p0

    .line 22
    :pswitch_2
    const-string p0, "RECONNECTION_TIMED_OUT_DURING_UPDATE"

    .line 23
    .line 24
    return-object p0

    .line 25
    :pswitch_3
    const-string p0, "CONNECTION_SUSPENDED_DURING_CALL"

    .line 26
    .line 27
    return-object p0

    .line 28
    :pswitch_4
    const-string p0, "REMOTE_EXCEPTION"

    .line 29
    .line 30
    return-object p0

    .line 31
    :pswitch_5
    const-string p0, "DEAD_CLIENT"

    .line 32
    .line 33
    return-object p0

    .line 34
    :pswitch_6
    const-string p0, "API_NOT_CONNECTED"

    .line 35
    .line 36
    return-object p0

    .line 37
    :pswitch_7
    const-string p0, "CANCELED"

    .line 38
    .line 39
    return-object p0

    .line 40
    :pswitch_8
    const-string p0, "TIMEOUT"

    .line 41
    .line 42
    return-object p0

    .line 43
    :pswitch_9
    const-string p0, "INTERRUPTED"

    .line 44
    .line 45
    return-object p0

    .line 46
    :pswitch_a
    const-string p0, "ERROR"

    .line 47
    .line 48
    return-object p0

    .line 49
    :pswitch_b
    const-string p0, "DEVELOPER_ERROR"

    .line 50
    .line 51
    return-object p0

    .line 52
    :pswitch_c
    const-string p0, "INTERNAL_ERROR"

    .line 53
    .line 54
    return-object p0

    .line 55
    :pswitch_d
    const-string p0, "NETWORK_ERROR"

    .line 56
    .line 57
    return-object p0

    .line 58
    :pswitch_e
    const-string p0, "RESOLUTION_REQUIRED"

    .line 59
    .line 60
    return-object p0

    .line 61
    :pswitch_f
    const-string p0, "INVALID_ACCOUNT"

    .line 62
    .line 63
    return-object p0

    .line 64
    :pswitch_10
    const-string p0, "SIGN_IN_REQUIRED"

    .line 65
    .line 66
    return-object p0

    .line 67
    :pswitch_11
    const-string p0, "SERVICE_DISABLED"

    .line 68
    .line 69
    return-object p0

    .line 70
    :pswitch_12
    const-string p0, "SERVICE_VERSION_UPDATE_REQUIRED"

    .line 71
    .line 72
    return-object p0

    .line 73
    :pswitch_13
    const-string p0, "SUCCESS"

    .line 74
    .line 75
    return-object p0

    .line 76
    :pswitch_14
    const-string p0, "SUCCESS_CACHE"

    .line 77
    .line 78
    return-object p0

    .line 79
    :pswitch_data_0
    .packed-switch -0x1
        :pswitch_14
        :pswitch_13
        :pswitch_0
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_0
        :pswitch_b
        :pswitch_0
        :pswitch_0
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
    .end packed-switch
.end method
