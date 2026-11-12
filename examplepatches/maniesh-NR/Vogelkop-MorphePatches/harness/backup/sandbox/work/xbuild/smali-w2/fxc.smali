.class public final Lfxc;
.super Lgv9;
.source "SourceFile"

# interfaces
.implements Lsvd;


# static fields
.field private static final DEFAULT_INSTANCE:Lfxc;

.field public static final ID_FIELD_NUMBER:I = 0x1

.field public static final NAME_FIELD_NUMBER:I = 0x2

.field private static volatile PARSER:Lp1g;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lp1g;"
        }
    .end annotation
.end field


# instance fields
.field private bitField0_:I

.field private id_:Ljava/lang/String;

.field private name_:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lfxc;

    invoke-direct {v0}, Lfxc;-><init>()V

    sput-object v0, Lfxc;->DEFAULT_INSTANCE:Lfxc;

    const-class v1, Lfxc;

    invoke-static {v1, v0}, Lgv9;->registerDefaultInstance(Ljava/lang/Class;Lgv9;)V

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Lgv9;-><init>()V

    const-string v0, ""

    iput-object v0, p0, Lfxc;->id_:Ljava/lang/String;

    iput-object v0, p0, Lfxc;->name_:Ljava/lang/String;

    return-void
.end method

.method public static bridge synthetic a()Lfxc;
    .registers 1

    sget-object v0, Lfxc;->DEFAULT_INSTANCE:Lfxc;

    return-object v0
.end method

.method public static b()Lfxc;
    .registers 1

    sget-object v0, Lfxc;->DEFAULT_INSTANCE:Lfxc;

    return-object v0
.end method

.method public static e()Lexc;
    .registers 1

    sget-object v0, Lfxc;->DEFAULT_INSTANCE:Lfxc;

    invoke-virtual {v0}, Lgv9;->createBuilder()Lgv9$a;

    move-result-object v0

    check-cast v0, Lexc;

    return-object v0
.end method


# virtual methods
.method public final c()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lfxc;->id_:Ljava/lang/String;

    return-object p0
.end method

.method public final d()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lfxc;->name_:Ljava/lang/String;

    return-object p0
.end method

.method public final dynamicMethod(Lgv9$f;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5

    sget-object p0, Ldxc;->a:[I

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
    sget-object p0, Lfxc;->PARSER:Lp1g;

    if-nez p0, :cond_2d

    const-class p1, Lfxc;

    monitor-enter p1

    :try_start_1a
    sget-object p0, Lfxc;->PARSER:Lp1g;

    if-nez p0, :cond_27

    new-instance p0, Lgv9$b;

    sget-object p2, Lfxc;->DEFAULT_INSTANCE:Lfxc;

    invoke-direct {p0, p2}, Lgv9$b;-><init>(Lgv9;)V

    sput-object p0, Lfxc;->PARSER:Lp1g;

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
    sget-object p0, Lfxc;->DEFAULT_INSTANCE:Lfxc;

    return-object p0

    :pswitch_31
    const-string p0, "\u0004\u0002\u0000\u0001\u0001\u0002\u0002\u0000\u0000\u0000\u0001\u1208\u0000\u0002\u1208\u0001"

    sget-object p1, Lfxc;->DEFAULT_INSTANCE:Lfxc;

    const-string p2, "bitField0_"

    const-string p3, "id_"

    const-string v0, "name_"

    filled-new-array {p2, p3, v0}, [Ljava/lang/Object;

    move-result-object p2

    invoke-static {p1, p0, p2}, Lgv9;->newMessageInfo(Lrvd;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_44
    new-instance p0, Lexc;

    invoke-static {}, Lfxc;->a()Lfxc;

    move-result-object p1

    invoke-direct {p0, p1}, Lgv9$a;-><init>(Lgv9;)V

    return-object p0

    :pswitch_4e
    new-instance p0, Lfxc;

    invoke-direct {p0}, Lfxc;-><init>()V

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

.method public final f(Ljava/lang/String;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v0, p0, Lfxc;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lfxc;->bitField0_:I

    iput-object p1, p0, Lfxc;->id_:Ljava/lang/String;

    return-void
.end method

.method public final g(Ljava/lang/String;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v0, p0, Lfxc;->bitField0_:I

    or-int/lit8 v0, v0, 0x2

    iput v0, p0, Lfxc;->bitField0_:I

    iput-object p1, p0, Lfxc;->name_:Ljava/lang/String;

    return-void
.end method
