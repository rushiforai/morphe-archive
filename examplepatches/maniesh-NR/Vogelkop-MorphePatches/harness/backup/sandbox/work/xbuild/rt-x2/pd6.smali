.class public abstract Lpd6;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Ljava/util/concurrent/FutureTask;

.field public static final b:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    sput-object v0, Lpd6;->b:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-void
.end method

.method public static a(ILjava/lang/String;)Ljava/io/File;
    .registers 5

    new-instance v0, Ljava/io/File;

    sget-object v1, Lod6;->a:Ljava/lang/String;

    packed-switch p0, :pswitch_data_4c

    const/4 p0, 0x0

    throw p0

    :pswitch_9
    const/16 p0, 0x12

    goto :goto_39

    :pswitch_c
    const/16 p0, 0x11

    goto :goto_39

    :pswitch_f
    const/16 p0, 0x10

    goto :goto_39

    :pswitch_12
    const/16 p0, 0xf

    goto :goto_39

    :pswitch_15
    const/16 p0, 0xe

    goto :goto_39

    :pswitch_18
    const/16 p0, 0xd

    goto :goto_39

    :pswitch_1b
    const/16 p0, 0xc

    goto :goto_39

    :pswitch_1e
    const/16 p0, 0xb

    goto :goto_39

    :pswitch_21
    const/16 p0, 0xa

    goto :goto_39

    :pswitch_24
    const/16 p0, 0x9

    goto :goto_39

    :pswitch_27
    const/16 p0, 0x8

    goto :goto_39

    :pswitch_2a
    const/4 p0, 0x7

    goto :goto_39

    :pswitch_2c
    const/4 p0, 0x6

    goto :goto_39

    :pswitch_2e
    const/4 p0, 0x5

    goto :goto_39

    :pswitch_30
    const/4 p0, 0x4

    goto :goto_39

    :pswitch_32
    const/4 p0, 0x3

    goto :goto_39

    :pswitch_34
    const/4 p0, 0x2

    goto :goto_39

    :pswitch_36
    const/4 p0, 0x1

    goto :goto_39

    :pswitch_38
    const/4 p0, 0x0

    :goto_39
    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object p0

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p0, v2}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    new-instance p0, Ljava/io/File;

    invoke-direct {p0, v0, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object p0

    :pswitch_data_4c
    .packed-switch 0x1
        :pswitch_38
        :pswitch_36
        :pswitch_34
        :pswitch_32
        :pswitch_30
        :pswitch_2e
        :pswitch_2c
        :pswitch_2a
        :pswitch_27
        :pswitch_24
        :pswitch_21
        :pswitch_1e
        :pswitch_1b
        :pswitch_18
        :pswitch_15
        :pswitch_12
        :pswitch_f
        :pswitch_c
        :pswitch_9
    .end packed-switch
.end method
