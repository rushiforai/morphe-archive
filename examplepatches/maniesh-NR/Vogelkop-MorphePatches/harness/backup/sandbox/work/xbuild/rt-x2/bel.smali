.class public final Lbel;
.super Lgv9;
.source "SourceFile"

# interfaces
.implements Lsvd;


# static fields
.field private static final DEFAULT_INSTANCE:Lbel;

.field public static final IMPERIAL_FIELD_NUMBER:I = 0x2

.field public static final METRIC_FIELD_NUMBER:I = 0x1

.field private static volatile PARSER:Lp1g;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lp1g;"
        }
    .end annotation
.end field


# instance fields
.field private bitField0_:I

.field private imperial_:Lxdl;

.field private metric_:Lxdl;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lbel;

    invoke-direct {v0}, Lgv9;-><init>()V

    sput-object v0, Lbel;->DEFAULT_INSTANCE:Lbel;

    const-class v1, Lbel;

    invoke-static {v1, v0}, Lgv9;->registerDefaultInstance(Ljava/lang/Class;Lgv9;)V

    return-void
.end method

.method public static bridge synthetic a()Lbel;
    .registers 1

    sget-object v0, Lbel;->DEFAULT_INSTANCE:Lbel;

    return-object v0
.end method

.method public static b()Lbel;
    .registers 1

    sget-object v0, Lbel;->DEFAULT_INSTANCE:Lbel;

    return-object v0
.end method

.method public static e()Lzdl;
    .registers 1

    sget-object v0, Lbel;->DEFAULT_INSTANCE:Lbel;

    invoke-virtual {v0}, Lgv9;->createBuilder()Lgv9$a;

    move-result-object v0

    check-cast v0, Lzdl;

    return-object v0
.end method


# virtual methods
.method public final c()Lxdl;
    .registers 1

    iget-object p0, p0, Lbel;->imperial_:Lxdl;

    if-nez p0, :cond_8

    invoke-static {}, Lxdl;->b()Lxdl;

    move-result-object p0

    :cond_8
    return-object p0
.end method

.method public final d()Lxdl;
    .registers 1

    iget-object p0, p0, Lbel;->metric_:Lxdl;

    if-nez p0, :cond_8

    invoke-static {}, Lxdl;->b()Lxdl;

    move-result-object p0

    :cond_8
    return-object p0
.end method

.method public final dynamicMethod(Lgv9$f;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5

    sget-object p0, Lydl;->a:[I

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    aget p0, p0, p1

    packed-switch p0, :pswitch_data_54

    const/4 p0, 0x0

    throw p0

    :pswitch_d
    const/4 p0, 0x1

    invoke-static {p0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p0

    return-object p0

    :pswitch_13
    sget-object p0, Lbel;->PARSER:Lp1g;

    if-nez p0, :cond_2d

    const-class p1, Lbel;

    monitor-enter p1

    :try_start_1a
    sget-object p0, Lbel;->PARSER:Lp1g;

    if-nez p0, :cond_27

    new-instance p0, Lgv9$b;

    sget-object p2, Lbel;->DEFAULT_INSTANCE:Lbel;

    invoke-direct {p0, p2}, Lgv9$b;-><init>(Lgv9;)V

    sput-object p0, Lbel;->PARSER:Lp1g;

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
    sget-object p0, Lbel;->DEFAULT_INSTANCE:Lbel;

    return-object p0

    :pswitch_31
    const-string p0, "\u0004\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001\u1009\u0000\u0002\u1009\u0001"

    sget-object p1, Lbel;->DEFAULT_INSTANCE:Lbel;

    const-string p2, "bitField0_"

    const-string p3, "metric_"

    const-string v0, "imperial_"

    filled-new-array {p2, p3, v0}, [Ljava/lang/Object;

    move-result-object p2

    invoke-static {p1, p0, p2}, Lgv9;->newMessageInfo(Lrvd;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_44
    new-instance p0, Lzdl;

    invoke-static {}, Lbel;->a()Lbel;

    move-result-object p1

    invoke-direct {p0, p1}, Lgv9$a;-><init>(Lgv9;)V

    return-object p0

    :pswitch_4e
    new-instance p0, Lbel;

    invoke-direct {p0}, Lgv9;-><init>()V

    return-object p0

    :pswitch_data_54
    .packed-switch 0x1
        :pswitch_4e
        :pswitch_44
        :pswitch_31
        :pswitch_2e
        :pswitch_13
        :pswitch_d
    .end packed-switch
.end method

.method public final f(Lxdl;)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lbel;->imperial_:Lxdl;

    iget p1, p0, Lbel;->bitField0_:I

    or-int/lit8 p1, p1, 0x2

    iput p1, p0, Lbel;->bitField0_:I

    return-void
.end method

.method public final g(Lxdl;)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lbel;->metric_:Lxdl;

    iget p1, p0, Lbel;->bitField0_:I

    or-int/lit8 p1, p1, 0x1

    iput p1, p0, Lbel;->bitField0_:I

    return-void
.end method
