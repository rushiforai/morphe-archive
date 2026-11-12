.class public final Lq0e;
.super Lgv9;
.source "SourceFile"

# interfaces
.implements Lsvd;


# static fields
.field public static final CITY_FIELD_NUMBER:I = 0x3

.field private static final DEFAULT_INSTANCE:Lq0e;

.field public static final ICON_ID_FIELD_NUMBER:I = 0x2

.field public static final LOCATION_ID_FIELD_NUMBER:I = 0x1

.field private static volatile PARSER:Lp1g; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lp1g;"
        }
    .end annotation
.end field

.field public static final TEMPERATURES_FIELD_NUMBER:I = 0x4


# instance fields
.field private bitField0_:I

.field private city_:Ljava/lang/String;

.field private iconId_:Ljava/lang/String;

.field private locationId_:Ljava/lang/String;

.field private temperatures_:Lbel;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lq0e;

    invoke-direct {v0}, Lq0e;-><init>()V

    sput-object v0, Lq0e;->DEFAULT_INSTANCE:Lq0e;

    const-class v1, Lq0e;

    invoke-static {v1, v0}, Lgv9;->registerDefaultInstance(Ljava/lang/Class;Lgv9;)V

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Lgv9;-><init>()V

    const-string v0, ""

    iput-object v0, p0, Lq0e;->locationId_:Ljava/lang/String;

    iput-object v0, p0, Lq0e;->iconId_:Ljava/lang/String;

    iput-object v0, p0, Lq0e;->city_:Ljava/lang/String;

    return-void
.end method

.method public static bridge synthetic a()Lq0e;
    .registers 1

    sget-object v0, Lq0e;->DEFAULT_INSTANCE:Lq0e;

    return-object v0
.end method

.method public static c()Lq0e;
    .registers 1

    sget-object v0, Lq0e;->DEFAULT_INSTANCE:Lq0e;

    return-object v0
.end method

.method public static g()Lo0e;
    .registers 1

    sget-object v0, Lq0e;->DEFAULT_INSTANCE:Lq0e;

    invoke-virtual {v0}, Lgv9;->createBuilder()Lgv9$a;

    move-result-object v0

    check-cast v0, Lo0e;

    return-object v0
.end method


# virtual methods
.method public final b()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lq0e;->city_:Ljava/lang/String;

    return-object p0
.end method

.method public final d()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lq0e;->iconId_:Ljava/lang/String;

    return-object p0
.end method

.method public final dynamicMethod(Lgv9$f;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 7

    sget-object p0, Ln0e;->a:[I

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    aget p0, p0, p1

    packed-switch p0, :pswitch_data_58

    const/4 p0, 0x0

    throw p0

    :pswitch_d
    const/4 p0, 0x1

    invoke-static {p0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p0

    return-object p0

    :pswitch_13
    sget-object p0, Lq0e;->PARSER:Lp1g;

    if-nez p0, :cond_2d

    const-class p1, Lq0e;

    monitor-enter p1

    :try_start_1a
    sget-object p0, Lq0e;->PARSER:Lp1g;

    if-nez p0, :cond_27

    new-instance p0, Lgv9$b;

    sget-object p2, Lq0e;->DEFAULT_INSTANCE:Lq0e;

    invoke-direct {p0, p2}, Lgv9$b;-><init>(Lgv9;)V

    sput-object p0, Lq0e;->PARSER:Lp1g;

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
    sget-object p0, Lq0e;->DEFAULT_INSTANCE:Lq0e;

    return-object p0

    :pswitch_31
    const-string p0, "\u0004\u0004\u0000\u0001\u0001\u0004\u0004\u0000\u0000\u0000\u0001\u1208\u0000\u0002\u1208\u0001\u0003\u1208\u0002\u0004\u1009\u0003"

    sget-object p1, Lq0e;->DEFAULT_INSTANCE:Lq0e;

    const-string p2, "bitField0_"

    const-string p3, "locationId_"

    const-string v0, "iconId_"

    const-string v1, "city_"

    const-string v2, "temperatures_"

    filled-new-array {p2, p3, v0, v1, v2}, [Ljava/lang/Object;

    move-result-object p2

    invoke-static {p1, p0, p2}, Lgv9;->newMessageInfo(Lrvd;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_48
    new-instance p0, Lo0e;

    invoke-static {}, Lq0e;->a()Lq0e;

    move-result-object p1

    invoke-direct {p0, p1}, Lgv9$a;-><init>(Lgv9;)V

    return-object p0

    :pswitch_52
    new-instance p0, Lq0e;

    invoke-direct {p0}, Lq0e;-><init>()V

    return-object p0

    :pswitch_data_58
    .packed-switch 0x1
        :pswitch_52
        :pswitch_48
        :pswitch_31
        :pswitch_2e
        :pswitch_13
        :pswitch_d
    .end packed-switch
.end method

.method public final e()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lq0e;->locationId_:Ljava/lang/String;

    return-object p0
.end method

.method public final f()Lbel;
    .registers 1

    iget-object p0, p0, Lq0e;->temperatures_:Lbel;

    if-nez p0, :cond_8

    invoke-static {}, Lbel;->b()Lbel;

    move-result-object p0

    :cond_8
    return-object p0
.end method

.method public final h(Ljava/lang/String;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v0, p0, Lq0e;->bitField0_:I

    or-int/lit8 v0, v0, 0x4

    iput v0, p0, Lq0e;->bitField0_:I

    iput-object p1, p0, Lq0e;->city_:Ljava/lang/String;

    return-void
.end method

.method public final i(Ljava/lang/String;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v0, p0, Lq0e;->bitField0_:I

    or-int/lit8 v0, v0, 0x2

    iput v0, p0, Lq0e;->bitField0_:I

    iput-object p1, p0, Lq0e;->iconId_:Ljava/lang/String;

    return-void
.end method

.method public final j(Ljava/lang/String;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v0, p0, Lq0e;->bitField0_:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lq0e;->bitField0_:I

    iput-object p1, p0, Lq0e;->locationId_:Ljava/lang/String;

    return-void
.end method

.method public final k(Lbel;)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object p1, p0, Lq0e;->temperatures_:Lbel;

    iget p1, p0, Lq0e;->bitField0_:I

    or-int/lit8 p1, p1, 0x8

    iput p1, p0, Lq0e;->bitField0_:I

    return-void
.end method
