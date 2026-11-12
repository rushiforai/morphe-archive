.class public final Lxdl;
.super Lgv9;
.source "SourceFile"

# interfaces
.implements Lsvd;


# static fields
.field private static final DEFAULT_INSTANCE:Lxdl;

.field private static volatile PARSER:Lp1g; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lp1g;"
        }
    .end annotation
.end field

.field public static final VALUE_FIELD_NUMBER:I = 0x1


# instance fields
.field private bitField0_:I

.field private value_:D


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lxdl;

    invoke-direct {v0}, Lgv9;-><init>()V

    sput-object v0, Lxdl;->DEFAULT_INSTANCE:Lxdl;

    const-class v1, Lxdl;

    invoke-static {v1, v0}, Lgv9;->registerDefaultInstance(Ljava/lang/Class;Lgv9;)V

    return-void
.end method

.method public static bridge synthetic a()Lxdl;
    .registers 1

    sget-object v0, Lxdl;->DEFAULT_INSTANCE:Lxdl;

    return-object v0
.end method

.method public static b()Lxdl;
    .registers 1

    sget-object v0, Lxdl;->DEFAULT_INSTANCE:Lxdl;

    return-object v0
.end method

.method public static d()Lvdl;
    .registers 1

    sget-object v0, Lxdl;->DEFAULT_INSTANCE:Lxdl;

    invoke-virtual {v0}, Lgv9;->createBuilder()Lgv9$a;

    move-result-object v0

    check-cast v0, Lvdl;

    return-object v0
.end method


# virtual methods
.method public final c()D
    .registers 3

    iget-wide v0, p0, Lxdl;->value_:D

    return-wide v0
.end method

.method public final dynamicMethod(Lgv9$f;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    sget-object p0, Ludl;->a:[I

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    aget p0, p0, p1

    packed-switch p0, :pswitch_data_52

    const/4 p0, 0x0

    throw p0

    :pswitch_d
    const/4 p0, 0x1

    invoke-static {p0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p0

    return-object p0

    :pswitch_13
    sget-object p0, Lxdl;->PARSER:Lp1g;

    if-nez p0, :cond_2d

    const-class p1, Lxdl;

    monitor-enter p1

    :try_start_1a
    sget-object p0, Lxdl;->PARSER:Lp1g;

    if-nez p0, :cond_27

    new-instance p0, Lgv9$b;

    sget-object p2, Lxdl;->DEFAULT_INSTANCE:Lxdl;

    invoke-direct {p0, p2}, Lgv9$b;-><init>(Lgv9;)V

    sput-object p0, Lxdl;->PARSER:Lp1g;

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
    sget-object p0, Lxdl;->DEFAULT_INSTANCE:Lxdl;

    return-object p0

    :pswitch_31
    const-string p0, "\u0004\u0001\u0000\u0001\u0001\u0001\u0001\u0000\u0000\u0000\u0001\u1000\u0000"

    sget-object p1, Lxdl;->DEFAULT_INSTANCE:Lxdl;

    const-string p2, "bitField0_"

    const-string p3, "value_"

    filled-new-array {p2, p3}, [Ljava/lang/Object;

    move-result-object p2

    invoke-static {p1, p0, p2}, Lgv9;->newMessageInfo(Lrvd;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_42
    new-instance p0, Lvdl;

    invoke-static {}, Lxdl;->a()Lxdl;

    move-result-object p1

    invoke-direct {p0, p1}, Lgv9$a;-><init>(Lgv9;)V

    return-object p0

    :pswitch_4c
    new-instance p0, Lxdl;

    invoke-direct {p0}, Lgv9;-><init>()V

    return-object p0

    :pswitch_data_52
    .packed-switch 0x1
        :pswitch_4c
        :pswitch_42
        :pswitch_31
        :pswitch_2e
        :pswitch_13
        :pswitch_d
    .end packed-switch
.end method

.method public final e(D)V
    .registers 4

    iget v0, p0, Lxdl;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lxdl;->bitField0_:I

    iput-wide p1, p0, Lxdl;->value_:D

    return-void
.end method
