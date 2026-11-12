.class public abstract synthetic Lbhb;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final synthetic a:[I


# direct methods
.method static constructor <clinit>()V
    .registers 3

    invoke-static {}, Lw06;->values()[Lw06;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lbhb;->a:[I

    const/4 v1, 0x1

    const/16 v2, 0x16

    :try_start_c
    aput v1, v0, v2
    :try_end_e
    .catch Ljava/lang/NoSuchFieldError; {:try_start_c .. :try_end_e} :catch_e

    :catch_e
    :try_start_e
    sget-object v0, Lbhb;->a:[I

    const/16 v1, 0x17

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_15
    .catch Ljava/lang/NoSuchFieldError; {:try_start_e .. :try_end_15} :catch_15

    :catch_15
    const/4 v0, 0x4

    :try_start_16
    sget-object v1, Lbhb;->a:[I

    const/4 v2, 0x3

    aput v2, v1, v0
    :try_end_1b
    .catch Ljava/lang/NoSuchFieldError; {:try_start_16 .. :try_end_1b} :catch_1b

    :catch_1b
    :try_start_1b
    sget-object v1, Lbhb;->a:[I

    const/4 v2, 0x0

    aput v0, v1, v2
    :try_end_20
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1b .. :try_end_20} :catch_20

    :catch_20
    :try_start_20
    sget-object v0, Lbhb;->a:[I

    const/16 v1, 0xc

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_27
    .catch Ljava/lang/NoSuchFieldError; {:try_start_20 .. :try_end_27} :catch_27

    :catch_27
    return-void
.end method
