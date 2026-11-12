.class public abstract synthetic Liwo;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final synthetic a:[I


# direct methods
.method static constructor <clinit>()V
    .registers 4

    const/16 v0, 0x1b

    invoke-static {v0}, Lvep;->B(I)[I

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Liwo;->a:[I

    const/4 v1, 0x1

    const/16 v2, 0xf

    :try_start_e
    aput v1, v0, v2
    :try_end_10
    .catch Ljava/lang/NoSuchFieldError; {:try_start_e .. :try_end_10} :catch_10

    :catch_10
    const/4 v0, 0x2

    :try_start_11
    sget-object v1, Liwo;->a:[I

    const/16 v2, 0x14

    aput v0, v1, v2
    :try_end_17
    .catch Ljava/lang/NoSuchFieldError; {:try_start_11 .. :try_end_17} :catch_17

    :catch_17
    :try_start_17
    sget-object v1, Liwo;->a:[I

    const/4 v2, 0x3

    aput v2, v1, v2
    :try_end_1c
    .catch Ljava/lang/NoSuchFieldError; {:try_start_17 .. :try_end_1c} :catch_1c

    :catch_1c
    :try_start_1c
    sget-object v1, Liwo;->a:[I

    const/4 v2, 0x0

    const/4 v3, 0x4

    aput v3, v1, v2
    :try_end_22
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1c .. :try_end_22} :catch_22

    :catch_22
    :try_start_22
    sget-object v1, Liwo;->a:[I

    const/4 v2, 0x5

    aput v2, v1, v0
    :try_end_27
    .catch Ljava/lang/NoSuchFieldError; {:try_start_22 .. :try_end_27} :catch_27

    :catch_27
    return-void
.end method
