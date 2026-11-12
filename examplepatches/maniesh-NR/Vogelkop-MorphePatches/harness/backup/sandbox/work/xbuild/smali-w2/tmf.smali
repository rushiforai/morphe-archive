.class public abstract synthetic Ltmf;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final synthetic a:[I


# direct methods
.method static constructor <clinit>()V
    .registers 8

    invoke-static {}, Lsmf;->values()[Lsmf;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    const/4 v1, 0x0

    const/4 v2, 0x1

    :try_start_9
    aput v2, v0, v1
    :try_end_b
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9 .. :try_end_b} :catch_b

    :catch_b
    const/4 v3, 0x2

    :try_start_c
    sget-object v4, Lsmf;->a:Lsmf;

    aput v3, v0, v2
    :try_end_10
    .catch Ljava/lang/NoSuchFieldError; {:try_start_c .. :try_end_10} :catch_10

    :catch_10
    const/4 v4, 0x3

    :try_start_11
    sget-object v5, Lsmf;->a:Lsmf;

    aput v4, v0, v3
    :try_end_15
    .catch Ljava/lang/NoSuchFieldError; {:try_start_11 .. :try_end_15} :catch_15

    :catch_15
    const/4 v5, 0x4

    :try_start_16
    sget-object v6, Lsmf;->a:Lsmf;

    aput v5, v0, v4
    :try_end_1a
    .catch Ljava/lang/NoSuchFieldError; {:try_start_16 .. :try_end_1a} :catch_1a

    :catch_1a
    const/4 v6, 0x5

    :try_start_1b
    sget-object v7, Lsmf;->a:Lsmf;

    aput v6, v0, v5
    :try_end_1f
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1b .. :try_end_1f} :catch_1f

    :catch_1f
    :try_start_1f
    sget-object v5, Lsmf;->a:Lsmf;

    const/4 v5, 0x6

    aput v5, v0, v6
    :try_end_24
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1f .. :try_end_24} :catch_24

    :catch_24
    sput-object v0, Ltmf;->a:[I

    invoke-static {}, Lrmf;->values()[Lrmf;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_2d
    aput v2, v0, v1
    :try_end_2f
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2d .. :try_end_2f} :catch_2f

    :catch_2f
    :try_start_2f
    sget-object v1, Lrmf;->a:Lrmf;

    aput v3, v0, v2
    :try_end_33
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2f .. :try_end_33} :catch_33

    :catch_33
    :try_start_33
    sget-object v1, Lrmf;->a:Lrmf;

    aput v4, v0, v3
    :try_end_37
    .catch Ljava/lang/NoSuchFieldError; {:try_start_33 .. :try_end_37} :catch_37

    :catch_37
    return-void
.end method
