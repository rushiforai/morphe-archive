.class public final Lfon;
.super Lgv9;
.source "SourceFile"

# interfaces
.implements Lsvd;


# static fields
.field private static final DEFAULT_INSTANCE:Lfon;

.field public static final ENABLED_DEBUG_NOTIFICATIONS_FIELD_NUMBER:I = 0x5

.field public static final FCM_TOPICS_FIELD_NUMBER:I = 0x2

.field public static final HAS_REQUESTED_NOTIFICATION_PERMISSION_FIELD_NUMBER:I = 0x6

.field public static final LAST_GEOLOCATION_FIELD_NUMBER:I = 0x8

.field public static final LOCATION_MODE_FIELD_NUMBER:I = 0x7

.field public static final MINIMAL_WEATHER_DATA_FIELD_NUMBER:I = 0x1

.field private static volatile PARSER:Lp1g; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lp1g;"
        }
    .end annotation
.end field

.field public static final SELECTED_LOCATION_FIELD_NUMBER:I = 0x3

.field public static final SELECTED_TEMPERATURE_UNIT_FIELD_NUMBER:I = 0x4


# instance fields
.field private bitField0_:I

.field private enabledDebugNotifications_:Z

.field private fcmTopics_:Lffb;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lffb;"
        }
    .end annotation
.end field

.field private hasRequestedNotificationPermission_:Z

.field private lastGeolocation_:Lvv9;

.field private locationMode_:I

.field private minimalWeatherData_:Lq0e;

.field private selectedLocation_:Lfxc;

.field private selectedTemperatureUnit_:I


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lfon;

    invoke-direct {v0}, Lfon;-><init>()V

    sput-object v0, Lfon;->DEFAULT_INSTANCE:Lfon;

    const-class v1, Lfon;

    invoke-static {v1, v0}, Lgv9;->registerDefaultInstance(Ljava/lang/Class;Lgv9;)V

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Lgv9;-><init>()V

    invoke-static {}, Lgv9;->emptyProtobufList()Lffb;

    move-result-object v0

    iput-object v0, p0, Lfon;->fcmTopics_:Lffb;

    return-void
.end method

.method public static bridge synthetic a()Lfon;
    .registers 1

    sget-object v0, Lfon;->DEFAULT_INSTANCE:Lfon;

    return-object v0
.end method

.method public static g()Lfon;
    .registers 1

    sget-object v0, Lfon;->DEFAULT_INSTANCE:Lfon;

    return-object v0
.end method

.method public static s(Ljava/io/InputStream;)Lfon;
    .registers 2

    sget-object v0, Lfon;->DEFAULT_INSTANCE:Lfon;

    invoke-static {v0, p0}, Lgv9;->parseFrom(Lgv9;Ljava/io/InputStream;)Lgv9;

    move-result-object p0

    check-cast p0, Lfon;

    return-object p0
.end method


# virtual methods
.method public final b(Ljava/lang/Iterable;)V
    .registers 4

    iget-object v0, p0, Lfon;->fcmTopics_:Lffb;

    invoke-interface {v0}, Lffb;->isModifiable()Z

    move-result v1

    if-nez v1, :cond_e

    invoke-static {v0}, Lgv9;->mutableCopy(Lffb;)Lffb;

    move-result-object v0

    iput-object v0, p0, Lfon;->fcmTopics_:Lffb;

    :cond_e
    iget-object p0, p0, Lfon;->fcmTopics_:Lffb;

    invoke-static {p1, p0}, Lw5;->addAll(Ljava/lang/Iterable;Ljava/util/List;)V

    return-void
.end method

.method public final c()V
    .registers 2

    invoke-static {}, Lgv9;->emptyProtobufList()Lffb;

    move-result-object v0

    iput-object v0, p0, Lfon;->fcmTopics_:Lffb;

    return-void
.end method

.method public final d()V
    .registers 2

    const/4 v0, 0x0

    iput-object v0, p0, Lfon;->lastGeolocation_:Lvv9;

    iget v0, p0, Lfon;->bitField0_:I

    and-int/lit8 v0, v0, -0x41

    iput v0, p0, Lfon;->bitField0_:I

    return-void
.end method

.method public final dynamicMethod(Lgv9$f;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 13

    sget-object p0, Ldon;->a:[I

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    aget p0, p0, p1

    packed-switch p0, :pswitch_data_62

    const/4 p0, 0x0

    throw p0

    :pswitch_d
    const/4 p0, 0x1

    invoke-static {p0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p0

    return-object p0

    :pswitch_13
    sget-object p0, Lfon;->PARSER:Lp1g;

    if-nez p0, :cond_2e

    const-class p1, Lfon;

    monitor-enter p1

    :try_start_1a
    sget-object p0, Lfon;->PARSER:Lp1g;

    if-nez p0, :cond_27

    new-instance p0, Lgv9$b;

    sget-object p2, Lfon;->DEFAULT_INSTANCE:Lfon;

    invoke-direct {p0, p2}, Lgv9$b;-><init>(Lgv9;)V

    sput-object p0, Lfon;->PARSER:Lp1g;

    :cond_27
    monitor-exit p1

    return-object p0

    :goto_29
    monitor-exit p1
    :try_end_2a
    .catchall {:try_start_1a .. :try_end_2a} :catchall_2b

    throw p0

    :catchall_2b
    move-exception v0

    move-object p0, v0

    goto :goto_29

    :cond_2e
    return-object p0

    :pswitch_2f
    sget-object p0, Lfon;->DEFAULT_INSTANCE:Lfon;

    return-object p0

    :pswitch_32
    const-string p0, "\u0004\u0008\u0000\u0001\u0001\u0008\u0008\u0000\u0001\u0000\u0001\u1009\u0000\u0002\u021a\u0003\u1009\u0001\u0004\u100c\u0002\u0005\u1007\u0003\u0006\u1007\u0004\u0007\u100c\u0005\u0008\u1009\u0006"

    sget-object p1, Lfon;->DEFAULT_INSTANCE:Lfon;

    const-string v0, "bitField0_"

    const-string v1, "minimalWeatherData_"

    const-string v2, "fcmTopics_"

    const-string v3, "selectedLocation_"

    const-string v4, "selectedTemperatureUnit_"

    const-string v5, "enabledDebugNotifications_"

    const-string v6, "hasRequestedNotificationPermission_"

    const-string v7, "locationMode_"

    const-string v8, "lastGeolocation_"

    filled-new-array/range {v0 .. v8}, [Ljava/lang/Object;

    move-result-object p2

    invoke-static {p1, p0, p2}, Lgv9;->newMessageInfo(Lrvd;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_51
    new-instance p0, Leon;

    invoke-static {}, Lfon;->a()Lfon;

    move-result-object p1

    invoke-direct {p0, p1}, Lgv9$a;-><init>(Lgv9;)V

    return-object p0

    :pswitch_5b
    new-instance p0, Lfon;

    invoke-direct {p0}, Lfon;-><init>()V

    return-object p0

    nop

    :pswitch_data_62
    .packed-switch 0x1
        :pswitch_5b
        :pswitch_51
        :pswitch_32
        :pswitch_2f
        :pswitch_13
        :pswitch_d
    .end packed-switch
.end method

.method public final e()V
    .registers 2

    const/4 v0, 0x0

    iput-object v0, p0, Lfon;->selectedLocation_:Lfxc;

    iget v0, p0, Lfon;->bitField0_:I

    and-int/lit8 v0, v0, -0x3

    iput v0, p0, Lfon;->bitField0_:I

    return-void
.end method

.method public final f()V
    .registers 2

    iget v0, p0, Lfon;->bitField0_:I

    and-int/lit8 v0, v0, -0x5

    iput v0, p0, Lfon;->bitField0_:I

    const/4 v0, 0x0

    iput v0, p0, Lfon;->selectedTemperatureUnit_:I

    return-void
.end method

.method public final h()Z
    .registers 1

    iget-boolean p0, p0, Lfon;->enabledDebugNotifications_:Z

    return p0
.end method

.method public final i()Lffb;
    .registers 1

    iget-object p0, p0, Lfon;->fcmTopics_:Lffb;

    return-object p0
.end method

.method public final j()Z
    .registers 1

    iget-boolean p0, p0, Lfon;->hasRequestedNotificationPermission_:Z

    return p0
.end method

.method public final k()Lvv9;
    .registers 1

    iget-object p0, p0, Lfon;->lastGeolocation_:Lvv9;

    if-nez p0, :cond_8

    invoke-static {}, Lvv9;->b()Lvv9;

    move-result-object p0

    :cond_8
    return-object p0
.end method

.method public final l()Lzxc;
    .registers 2

    iget p0, p0, Lfon;->locationMode_:I

    if-eqz p0, :cond_12

    const/4 v0, 0x1

    if-eq p0, v0, :cond_f

    const/4 v0, 0x2

    if-eq p0, v0, :cond_c

    const/4 p0, 0x0

    goto :goto_14

    :cond_c
    sget-object p0, Lzxc;->d:Lzxc;

    goto :goto_14

    :cond_f
    sget-object p0, Lzxc;->c:Lzxc;

    goto :goto_14

    :cond_12
    sget-object p0, Lzxc;->b:Lzxc;

    :goto_14
    if-nez p0, :cond_18

    sget-object p0, Lzxc;->e:Lzxc;

    :cond_18
    return-object p0
.end method

.method public final m()Lq0e;
    .registers 1

    iget-object p0, p0, Lfon;->minimalWeatherData_:Lq0e;

    if-nez p0, :cond_8

    invoke-static {}, Lq0e;->c()Lq0e;

    move-result-object p0

    :cond_8
    return-object p0
.end method

.method public final n()Lfxc;
    .registers 1

    iget-object p0, p0, Lfon;->selectedLocation_:Lfxc;

    if-nez p0, :cond_8

    invoke-static {}, Lfxc;->b()Lfxc;

    move-result-object p0

    :cond_8
    return-object p0
.end method

.method public final o()Ldel;
    .registers 2

    iget p0, p0, Lfon;->selectedTemperatureUnit_:I

    if-eqz p0, :cond_12

    const/4 v0, 0x1

    if-eq p0, v0, :cond_f

    const/4 v0, 0x2

    if-eq p0, v0, :cond_c

    const/4 p0, 0x0

    goto :goto_14

    :cond_c
    sget-object p0, Ldel;->d:Ldel;

    goto :goto_14

    :cond_f
    sget-object p0, Ldel;->c:Ldel;

    goto :goto_14

    :cond_12
    sget-object p0, Ldel;->b:Ldel;

    :goto_14
    if-nez p0, :cond_18

    sget-object p0, Ldel;->e:Ldel;

    :cond_18
    return-object p0
.end method

.method public final p()Z
    .registers 1

    iget p0, p0, Lfon;->bitField0_:I

    and-int/lit8 p0, p0, 0x40

    if-eqz p0, :cond_8

    const/4 p0, 0x1

    return p0

    :cond_8
    const/4 p0, 0x0

    return p0
.end method

.method public final q()Z
    .registers 2

    iget p0, p0, Lfon;->bitField0_:I

    const/4 v0, 0x1

    and-int/2addr p0, v0

    if-eqz p0, :cond_7

    return v0

    :cond_7
    const/4 p0, 0x0

    return p0
.end method

.method public final r()Z
    .registers 1

    iget p0, p0, Lfon;->bitField0_:I

    and-int/lit8 p0, p0, 0x2

    if-eqz p0, :cond_8

    const/4 p0, 0x1

    return p0

    :cond_8
    const/4 p0, 0x0

    return p0
.end method

.method public final t(Z)V
    .registers 3

    iget v0, p0, Lfon;->bitField0_:I

    or-int/lit8 v0, v0, 0x8

    iput v0, p0, Lfon;->bitField0_:I

    iput-boolean p1, p0, Lfon;->enabledDebugNotifications_:Z

    return-void
.end method

.method public final u(Z)V
    .registers 3

    iget v0, p0, Lfon;->bitField0_:I

    or-int/lit8 v0, v0, 0x10

    iput v0, p0, Lfon;->bitField0_:I

    iput-boolean p1, p0, Lfon;->hasRequestedNotificationPermission_:Z

    return-void
.end method

.method public final v(Lvv9;)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lfon;->lastGeolocation_:Lvv9;

    iget p1, p0, Lfon;->bitField0_:I

    or-int/lit8 p1, p1, 0x40

    iput p1, p0, Lfon;->bitField0_:I

    return-void
.end method

.method public final w(Lzxc;)V
    .registers 2

    invoke-virtual {p1}, Lzxc;->getNumber()I

    move-result p1

    iput p1, p0, Lfon;->locationMode_:I

    iget p1, p0, Lfon;->bitField0_:I

    or-int/lit8 p1, p1, 0x20

    iput p1, p0, Lfon;->bitField0_:I

    return-void
.end method

.method public final x(Lq0e;)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lfon;->minimalWeatherData_:Lq0e;

    iget p1, p0, Lfon;->bitField0_:I

    or-int/lit8 p1, p1, 0x1

    iput p1, p0, Lfon;->bitField0_:I

    return-void
.end method

.method public final y(Lfxc;)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lfon;->selectedLocation_:Lfxc;

    iget p1, p0, Lfon;->bitField0_:I

    or-int/lit8 p1, p1, 0x2

    iput p1, p0, Lfon;->bitField0_:I

    return-void
.end method

.method public final z(Ldel;)V
    .registers 2

    invoke-virtual {p1}, Ldel;->getNumber()I

    move-result p1

    iput p1, p0, Lfon;->selectedTemperatureUnit_:I

    iget p1, p0, Lfon;->bitField0_:I

    or-int/lit8 p1, p1, 0x4

    iput p1, p0, Lfon;->bitField0_:I

    return-void
.end method
