.class public final Lh1a;
.super Lgv9;
.source "SourceFile"

# interfaces
.implements Lsvd;


# static fields
.field public static final CONTEXT_PRIVATE_FIELD_NUMBER:I = 0x6

.field public static final CONTEXT_REGULAR_FIELD_NUMBER:I = 0x5

.field private static final DEFAULT_INSTANCE:Lh1a;

.field public static final ERROR_PRIVATE_FIELD_NUMBER:I = 0x9

.field public static final ERROR_REGULAR_FIELD_NUMBER:I = 0x8

.field public static final INTENTS_REGULAR_FIELD_NUMBER:I = 0xa

.field public static final OMNIBAR_PRIVATE_FIELD_NUMBER:I = 0x2

.field public static final OMNIBAR_REGULAR_FIELD_NUMBER:I = 0x1

.field private static volatile PARSER:Lp1g; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lp1g;"
        }
    .end annotation
.end field

.field public static final SD_PRIVATE_FIELD_NUMBER:I = 0x4

.field public static final SD_REGULAR_FIELD_NUMBER:I = 0x3

.field public static final WIDGET_REGULAR_FIELD_NUMBER:I = 0x7


# instance fields
.field private bitField0_:I

.field private contextPrivate_:Ljava/lang/String;

.field private contextRegular_:Ljava/lang/String;

.field private errorPrivate_:Ljava/lang/String;

.field private errorRegular_:Ljava/lang/String;

.field private intentsRegular_:Ljava/lang/String;

.field private omnibarPrivate_:Ljava/lang/String;

.field private omnibarRegular_:Ljava/lang/String;

.field private sdPrivate_:Ljava/lang/String;

.field private sdRegular_:Ljava/lang/String;

.field private widgetRegular_:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lh1a;

    invoke-direct {v0}, Lh1a;-><init>()V

    sput-object v0, Lh1a;->DEFAULT_INSTANCE:Lh1a;

    const-class v1, Lh1a;

    invoke-static {v1, v0}, Lgv9;->registerDefaultInstance(Ljava/lang/Class;Lgv9;)V

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Lgv9;-><init>()V

    const-string v0, ""

    iput-object v0, p0, Lh1a;->omnibarRegular_:Ljava/lang/String;

    iput-object v0, p0, Lh1a;->omnibarPrivate_:Ljava/lang/String;

    iput-object v0, p0, Lh1a;->sdRegular_:Ljava/lang/String;

    iput-object v0, p0, Lh1a;->sdPrivate_:Ljava/lang/String;

    iput-object v0, p0, Lh1a;->contextRegular_:Ljava/lang/String;

    iput-object v0, p0, Lh1a;->contextPrivate_:Ljava/lang/String;

    iput-object v0, p0, Lh1a;->widgetRegular_:Ljava/lang/String;

    iput-object v0, p0, Lh1a;->errorRegular_:Ljava/lang/String;

    iput-object v0, p0, Lh1a;->errorPrivate_:Ljava/lang/String;

    iput-object v0, p0, Lh1a;->intentsRegular_:Ljava/lang/String;

    return-void
.end method

.method public static c()Lh1a;
    .registers 1

    sget-object v0, Lh1a;->DEFAULT_INSTANCE:Lh1a;

    return-object v0
.end method


# virtual methods
.method public final a()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lh1a;->contextPrivate_:Ljava/lang/String;

    return-object p0
.end method

.method public final b()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lh1a;->contextRegular_:Ljava/lang/String;

    return-object p0
.end method

.method public final d()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lh1a;->errorPrivate_:Ljava/lang/String;

    return-object p0
.end method

.method public final dynamicMethod(Lgv9$f;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 15

    sget-object p0, Lg1a;->a:[I

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    aget p0, p0, p1

    packed-switch p0, :pswitch_data_64

    const/4 p0, 0x0

    throw p0

    :pswitch_d
    const/4 p0, 0x1

    invoke-static {p0}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object p0

    return-object p0

    :pswitch_13
    sget-object p0, Lh1a;->PARSER:Lp1g;

    if-nez p0, :cond_2e

    const-class p1, Lh1a;

    monitor-enter p1

    :try_start_1a
    sget-object p0, Lh1a;->PARSER:Lp1g;

    if-nez p0, :cond_27

    new-instance p0, Lgv9$b;

    sget-object p2, Lh1a;->DEFAULT_INSTANCE:Lh1a;

    invoke-direct {p0, p2}, Lgv9$b;-><init>(Lgv9;)V

    sput-object p0, Lh1a;->PARSER:Lp1g;

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
    sget-object p0, Lh1a;->DEFAULT_INSTANCE:Lh1a;

    return-object p0

    :pswitch_32
    const-string p0, "\u0004\n\u0000\u0001\u0001\n\n\u0000\u0000\u0000\u0001\u1208\u0000\u0002\u1208\u0001\u0003\u1208\u0002\u0004\u1208\u0003\u0005\u1208\u0004\u0006\u1208\u0005\u0007\u1208\u0006\u0008\u1208\u0007\t\u1208\u0008\n\u1208\t"

    sget-object p1, Lh1a;->DEFAULT_INSTANCE:Lh1a;

    const-string v0, "bitField0_"

    const-string v1, "omnibarRegular_"

    const-string v2, "omnibarPrivate_"

    const-string v3, "sdRegular_"

    const-string v4, "sdPrivate_"

    const-string v5, "contextRegular_"

    const-string v6, "contextPrivate_"

    const-string v7, "widgetRegular_"

    const-string v8, "errorRegular_"

    const-string v9, "errorPrivate_"

    const-string v10, "intentsRegular_"

    filled-new-array/range {v0 .. v10}, [Ljava/lang/Object;

    move-result-object p2

    invoke-static {p1, p0, p2}, Lgv9;->newMessageInfo(Lrvd;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_55
    new-instance p0, Lgv9$a;

    sget-object p1, Lh1a;->DEFAULT_INSTANCE:Lh1a;

    invoke-direct {p0, p1}, Lgv9$a;-><init>(Lgv9;)V

    return-object p0

    :pswitch_5d
    new-instance p0, Lh1a;

    invoke-direct {p0}, Lh1a;-><init>()V

    return-object p0

    nop

    :pswitch_data_64
    .packed-switch 0x1
        :pswitch_5d
        :pswitch_55
        :pswitch_32
        :pswitch_2f
        :pswitch_13
        :pswitch_d
    .end packed-switch
.end method

.method public final e()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lh1a;->errorRegular_:Ljava/lang/String;

    return-object p0
.end method

.method public final f()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lh1a;->intentsRegular_:Ljava/lang/String;

    return-object p0
.end method

.method public final g()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lh1a;->omnibarPrivate_:Ljava/lang/String;

    return-object p0
.end method

.method public final h()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lh1a;->omnibarRegular_:Ljava/lang/String;

    return-object p0
.end method

.method public final i()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lh1a;->sdPrivate_:Ljava/lang/String;

    return-object p0
.end method

.method public final j()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lh1a;->sdRegular_:Ljava/lang/String;

    return-object p0
.end method

.method public final k()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lh1a;->widgetRegular_:Ljava/lang/String;

    return-object p0
.end method
