.class public final Lvv9;
.super Lgv9;
.source "SourceFile"

# interfaces
.implements Lsvd;


# static fields
.field private static final DEFAULT_INSTANCE:Lvv9;

.field public static final LATITUDE_FIELD_NUMBER:I = 0x1

.field public static final LONGITUDE_FIELD_NUMBER:I = 0x2

.field private static volatile PARSER:Lp1g; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lp1g;"
        }
    .end annotation
.end field

.field public static final TIMESTAMP_FIELD_NUMBER:I = 0x3


# instance fields
.field private bitField0_:I

.field private latitude_:D

.field private longitude_:D

.field private timestamp_:J


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lvv9;

    invoke-direct {v0}, Lgv9;-><init>()V

    sput-object v0, Lvv9;->DEFAULT_INSTANCE:Lvv9;

    const-class v1, Lvv9;

    invoke-static {v1, v0}, Lgv9;->registerDefaultInstance(Ljava/lang/Class;Lgv9;)V

    return-void
.end method

.method public static bridge synthetic a()Lvv9;
    .registers 1

    sget-object v0, Lvv9;->DEFAULT_INSTANCE:Lvv9;

    return-object v0
.end method

.method public static b()Lvv9;
    .registers 1

    sget-object v0, Lvv9;->DEFAULT_INSTANCE:Lvv9;

    return-object v0
.end method

.method public static f()Ltv9;
    .registers 1

    sget-object v0, Lvv9;->DEFAULT_INSTANCE:Lvv9;

    invoke-virtual {v0}, Lgv9;->createBuilder()Lgv9$a;

    move-result-object v0

    check-cast v0, Ltv9;

    return-object v0
.end method


# virtual methods
.method public final c()D
    .registers 3

    iget-wide v0, p0, Lvv9;->latitude_:D

    return-wide v0
.end method

.method public final d()D
    .registers 3

    iget-wide v0, p0, Lvv9;->longitude_:D

    return-wide v0
.end method

.method public final dynamicMethod(Lgv9$f;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6

    sget-object p0, Lsv9;->a:[I

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    aget p0, p0, p1

    packed-switch p0, :pswitch_data_56

    const/4 p0, 0x0

    throw p0

    :pswitch_d
    const/4 p0, 0x1

    invoke-static {p0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p0

    return-object p0

    :pswitch_13
    sget-object p0, Lvv9;->PARSER:Lp1g;

    if-nez p0, :cond_2d

    const-class p1, Lvv9;

    monitor-enter p1

    :try_start_1a
    sget-object p0, Lvv9;->PARSER:Lp1g;

    if-nez p0, :cond_27

    new-instance p0, Lgv9$b;

    sget-object p2, Lvv9;->DEFAULT_INSTANCE:Lvv9;

    invoke-direct {p0, p2}, Lgv9$b;-><init>(Lgv9;)V

    sput-object p0, Lvv9;->PARSER:Lp1g;

    :cond_27
    monitor-exit p1

    return-object p0

    :goto_29
    monitor-exit p1
    :try_end_2a
    .catchall {:try_start_1a .. :try_end_2a} :catchall_2b

    throw p0

    :catchall_2b
    move-exception p0

    goto :goto_29

    :cond_2d
    return-object p0

    :pswitch_2e
    sget-object p0, Lvv9;->DEFAULT_INSTANCE:Lvv9;

    return-object p0

    :pswitch_31
    const-string p0, "\u0004\u0003\u0000\u0001\u0001\u0003\u0003\u0000\u0000\u0000\u0001\u1000\u0000\u0002\u1000\u0001\u0003\u1003\u0002"

    sget-object p1, Lvv9;->DEFAULT_INSTANCE:Lvv9;

    const-string p2, "bitField0_"

    const-string p3, "latitude_"

    const-string v0, "longitude_"

    const-string v1, "timestamp_"

    filled-new-array {p2, p3, v0, v1}, [Ljava/lang/Object;

    move-result-object p2

    invoke-static {p1, p0, p2}, Lgv9;->newMessageInfo(Lrvd;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_46
    new-instance p0, Ltv9;

    invoke-static {}, Lvv9;->a()Lvv9;

    move-result-object p1

    invoke-direct {p0, p1}, Lgv9$a;-><init>(Lgv9;)V

    return-object p0

    :pswitch_50
    new-instance p0, Lvv9;

    invoke-direct {p0}, Lgv9;-><init>()V

    return-object p0

    :pswitch_data_56
    .packed-switch 0x1
        :pswitch_50
        :pswitch_46
        :pswitch_31
        :pswitch_2e
        :pswitch_13
        :pswitch_d
    .end packed-switch
.end method

.method public final e()J
    .registers 3

    iget-wide v0, p0, Lvv9;->timestamp_:J

    return-wide v0
.end method

.method public final g(D)V
    .registers 4

    iget v0, p0, Lvv9;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lvv9;->bitField0_:I

    iput-wide p1, p0, Lvv9;->latitude_:D

    return-void
.end method

.method public final h(D)V
    .registers 4

    iget v0, p0, Lvv9;->bitField0_:I

    or-int/lit8 v0, v0, 0x2

    iput v0, p0, Lvv9;->bitField0_:I

    iput-wide p1, p0, Lvv9;->longitude_:D

    return-void
.end method

.method public final i(J)V
    .registers 4

    iget v0, p0, Lvv9;->bitField0_:I

    or-int/lit8 v0, v0, 0x4

    iput v0, p0, Lvv9;->bitField0_:I

    iput-wide p1, p0, Lvv9;->timestamp_:J

    return-void
.end method
