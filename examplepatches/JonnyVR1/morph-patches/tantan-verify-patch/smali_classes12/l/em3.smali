.class public Ll/em3;
.super Ll/qpl;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000=\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\t\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0008\u0005*\u0001\u001c\u0008\u0016\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0019\u0010\t\u001a\u00020\u00082\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u0006H\u0002\u00a2\u0006\u0004\u0008\t\u0010\nJ-\u0010\u000f\u001a\u00020\u000e2\u0008\u0010\u000c\u001a\u0004\u0018\u00010\u000b2\u0008\u0010\r\u001a\u0004\u0018\u00010\u000b2\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u0006H\u0014\u00a2\u0006\u0004\u0008\u000f\u0010\u0010J\u0019\u0010\u0011\u001a\u00020\u00082\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u0006H\u0004\u00a2\u0006\u0004\u0008\u0011\u0010\nJ\u000f\u0010\u0012\u001a\u00020\u0008H\u0004\u00a2\u0006\u0004\u0008\u0012\u0010\u0013J\u000f\u0010\u0014\u001a\u00020\u0008H\u0016\u00a2\u0006\u0004\u0008\u0014\u0010\u0013R\u0018\u0010\u0017\u001a\u0004\u0018\u00010\u000b8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0015\u0010\u0016R\u0018\u0010\u001b\u001a\u0004\u0018\u00010\u00188\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0019\u0010\u001aR\u0014\u0010\u001f\u001a\u00020\u001c8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u001d\u0010\u001e\u00a8\u0006 "
    }
    d2 = {
        "Ll/em3;",
        "Ll/qpl;",
        "Ll/hul;",
        "pMkWebview",
        "<init>",
        "(Ll/hul;)V",
        "Lorg/json/JSONObject;",
        "params",
        "",
        "s",
        "(Lorg/json/JSONObject;)V",
        "",
        "namespace",
        "method",
        "",
        "p",
        "(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)Z",
        "t",
        "u",
        "()V",
        "l",
        "c",
        "Ljava/lang/String;",
        "senorCallback",
        "Landroid/hardware/SensorManager;",
        "d",
        "Landroid/hardware/SensorManager;",
        "sensorManager",
        "l/em3$a",
        "e",
        "Ll/em3$a;",
        "sensorEventListener",
        "MKBusiness_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# instance fields
.field private c:Ljava/lang/String;

.field private d:Landroid/hardware/SensorManager;

.field private final e:Ll/em3$a;


# direct methods
.method public constructor <init>(Ll/hul;)V
    .locals 0
    .param p1    # Ll/hul;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Ll/qpl;-><init>(Ll/hul;)V

    .line 5
    .line 6
    .line 7
    new-instance p1, Ll/em3$a;

    .line 8
    .line 9
    invoke-direct {p1, p0}, Ll/em3$a;-><init>(Ll/em3;)V

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Ll/em3;->e:Ll/em3$a;

    .line 13
    .line 14
    return-void
.end method

.method public static final synthetic q(Ll/em3;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/em3;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic r(Ll/em3;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/qpl;->g(Ljava/lang/String;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final s(Lorg/json/JSONObject;)V
    .locals 8

    .line 1
    invoke-virtual {p0}, Ll/qpl;->c()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    const-string v2, "vibrator"

    .line 9
    .line 10
    invoke-virtual {v0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    move-object v0, v1

    .line 16
    :goto_0
    instance-of v2, v0, Landroid/os/Vibrator;

    .line 17
    .line 18
    if-nez v2, :cond_1

    .line 19
    .line 20
    goto :goto_1

    .line 21
    :cond_1
    move-object v1, v0

    .line 22
    :goto_1
    check-cast v1, Landroid/os/Vibrator;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/qpl;->c()Landroid/content/Context;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    if-eqz p0, :cond_6

    .line 29
    .line 30
    if-eqz v1, :cond_6

    .line 31
    .line 32
    const-wide/16 v2, 0x32

    .line 33
    .line 34
    if-eqz p1, :cond_2

    .line 35
    .line 36
    :try_start_0
    const-string p0, "time"

    .line 37
    .line 38
    invoke-virtual {p1, p0, v2, v3}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    .line 39
    .line 40
    .line 41
    move-result-wide v4

    .line 42
    goto :goto_2

    .line 43
    :cond_2
    move-wide v4, v2

    .line 44
    :goto_2
    const-wide/16 v6, 0x0

    .line 45
    .line 46
    cmp-long p0, v4, v6

    .line 47
    .line 48
    if-gez p0, :cond_3

    .line 49
    .line 50
    goto :goto_3

    .line 51
    :cond_3
    move-wide v2, v4

    .line 52
    :goto_3
    sget p0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 53
    .line 54
    const/16 v0, 0x1a

    .line 55
    .line 56
    if-lt p0, v0, :cond_5

    .line 57
    .line 58
    const/4 p0, -0x1

    .line 59
    if-eqz p1, :cond_4

    .line 60
    .line 61
    const-string v0, "amplitude"

    .line 62
    .line 63
    invoke-virtual {p1, v0, p0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    :cond_4
    const/4 p1, 0x1

    .line 68
    invoke-static {p0, p1}, Lkotlin/ranges/a;->b(II)I

    .line 69
    .line 70
    .line 71
    move-result p0

    .line 72
    const/16 p1, 0xff

    .line 73
    .line 74
    invoke-static {p0, p1}, Lkotlin/ranges/a;->e(II)I

    .line 75
    .line 76
    .line 77
    move-result p0

    .line 78
    invoke-static {v2, v3, p0}, Ll/cm3;->a(JI)Landroid/os/VibrationEffect;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-static {v1, p0}, Ll/dm3;->a(Landroid/os/Vibrator;Landroid/os/VibrationEffect;)V

    .line 83
    .line 84
    .line 85
    return-void

    .line 86
    :cond_5
    invoke-virtual {v1, v2, v3}, Landroid/os/Vibrator;->vibrate(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 87
    .line 88
    .line 89
    return-void

    .line 90
    :catch_0
    move-exception p0

    .line 91
    sget-object p1, Ll/qpl;->b:Ljava/lang/String;

    .line 92
    .line 93
    const-string v0, ""

    .line 94
    .line 95
    invoke-static {p1, v0, p0}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 96
    .line 97
    .line 98
    :cond_6
    return-void
.end method


# virtual methods
.method public l()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/qpl;->l()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/em3;->u()V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-object v0, p0, Ll/em3;->d:Landroid/hardware/SensorManager;

    .line 9
    .line 10
    return-void
.end method

.method public p(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)Z
    .locals 3
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p3    # Lorg/json/JSONObject;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    const-string v0, "sensor"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    return v1

    .line 11
    :cond_0
    invoke-virtual {p0}, Ll/qpl;->c()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-eqz v0, :cond_2

    .line 16
    .line 17
    if-nez p2, :cond_1

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_1
    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    const/4 v2, 0x1

    .line 25
    sparse-switch v0, :sswitch_data_0

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :sswitch_0
    const-string v0, "startCompass"

    .line 30
    .line 31
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    invoke-virtual {p0, p1, p2, p3}, Ll/qpl;->k(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 38
    .line 39
    .line 40
    return v2

    .line 41
    :sswitch_1
    const-string v0, "getRealLocation"

    .line 42
    .line 43
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_2

    .line 48
    .line 49
    invoke-virtual {p0, p1, p2, p3}, Ll/qpl;->k(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 50
    .line 51
    .line 52
    return v2

    .line 53
    :sswitch_2
    const-string p1, "vibrate"

    .line 54
    .line 55
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    if-eqz p1, :cond_2

    .line 60
    .line 61
    invoke-direct {p0, p3}, Ll/em3;->s(Lorg/json/JSONObject;)V

    .line 62
    .line 63
    .line 64
    return v2

    .line 65
    :sswitch_3
    const-string p1, "startAccelerometer"

    .line 66
    .line 67
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    if-eqz p1, :cond_2

    .line 72
    .line 73
    invoke-virtual {p0, p3}, Ll/em3;->t(Lorg/json/JSONObject;)V

    .line 74
    .line 75
    .line 76
    return v2

    .line 77
    :sswitch_4
    const-string v0, "stopCompass"

    .line 78
    .line 79
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    if-eqz v0, :cond_2

    .line 84
    .line 85
    invoke-virtual {p0, p1, p2, p3}, Ll/qpl;->k(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 86
    .line 87
    .line 88
    return v2

    .line 89
    :sswitch_5
    const-string p1, "stopAccelerometer"

    .line 90
    .line 91
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result p1

    .line 95
    if-eqz p1, :cond_2

    .line 96
    .line 97
    invoke-virtual {p0}, Ll/em3;->u()V

    .line 98
    .line 99
    .line 100
    return v2

    .line 101
    :cond_2
    :goto_0
    return v1

    .line 102
    nop

    .line 103
    :sswitch_data_0
    .sparse-switch
        -0x6d359493 -> :sswitch_5
        -0x13ecd950 -> :sswitch_4
        0x832cb0d -> :sswitch_3
        0x1ae6756f -> :sswitch_2
        0x1e2571e9 -> :sswitch_1
        0x30a3be50 -> :sswitch_0
    .end sparse-switch
.end method

.method public final t(Lorg/json/JSONObject;)V
    .locals 2
    .param p1    # Lorg/json/JSONObject;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_0

    .line 3
    .line 4
    const-string v1, "callback"

    .line 5
    .line 6
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    move-object p1, v0

    .line 12
    :goto_0
    iput-object p1, p0, Ll/em3;->c:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/qpl;->c()Landroid/content/Context;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    if-eqz p1, :cond_3

    .line 19
    .line 20
    iget-object p1, p0, Ll/em3;->d:Landroid/hardware/SensorManager;

    .line 21
    .line 22
    if-nez p1, :cond_3

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/qpl;->c()Landroid/content/Context;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    if-eqz p1, :cond_1

    .line 29
    .line 30
    const-string v1, "sensor"

    .line 31
    .line 32
    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    goto :goto_1

    .line 37
    :cond_1
    move-object p1, v0

    .line 38
    :goto_1
    instance-of v1, p1, Landroid/hardware/SensorManager;

    .line 39
    .line 40
    if-nez v1, :cond_2

    .line 41
    .line 42
    move-object p1, v0

    .line 43
    :cond_2
    check-cast p1, Landroid/hardware/SensorManager;

    .line 44
    .line 45
    iput-object p1, p0, Ll/em3;->d:Landroid/hardware/SensorManager;

    .line 46
    .line 47
    :cond_3
    iget-object p1, p0, Ll/em3;->d:Landroid/hardware/SensorManager;

    .line 48
    .line 49
    if-eqz p1, :cond_5

    .line 50
    .line 51
    iget-object p0, p0, Ll/em3;->e:Ll/em3$a;

    .line 52
    .line 53
    if-eqz p1, :cond_4

    .line 54
    .line 55
    const/4 v0, 0x1

    .line 56
    invoke-virtual {p1, v0}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    :cond_4
    const/4 v1, 0x0

    .line 61
    invoke-virtual {p1, p0, v0, v1}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    .line 62
    .line 63
    .line 64
    :cond_5
    return-void
.end method

.method public final u()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/em3;->d:Landroid/hardware/SensorManager;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/em3;->e:Ll/em3$a;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method
