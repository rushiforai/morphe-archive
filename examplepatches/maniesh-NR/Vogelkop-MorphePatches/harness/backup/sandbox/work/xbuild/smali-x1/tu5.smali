.class public abstract synthetic Ltu5;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final synthetic a:[I


# direct methods
.method static constructor <clinit>()V
    .registers 5

    invoke-static {}, Lapc;->values()[Lapc;

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
    sget-object v4, Lapc;->b:Lix5;

    aput v3, v0, v2
    :try_end_10
    .catch Ljava/lang/NoSuchFieldError; {:try_start_c .. :try_end_10} :catch_10

    :catch_10
    invoke-static {}, Ljnc;->values()[Ljnc;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_17
    aput v2, v0, v1
    :try_end_19
    .catch Ljava/lang/NoSuchFieldError; {:try_start_17 .. :try_end_19} :catch_19

    :catch_19
    :try_start_19
    sget-object v1, Ljnc;->Companion:Linc;

    aput v3, v0, v2
    :try_end_1d
    .catch Ljava/lang/NoSuchFieldError; {:try_start_19 .. :try_end_1d} :catch_1d

    :catch_1d
    const/4 v1, 0x3

    :try_start_1e
    sget-object v2, Ljnc;->Companion:Linc;

    aput v1, v0, v3
    :try_end_22
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1e .. :try_end_22} :catch_22

    :catch_22
    const/4 v2, 0x4

    :try_start_23
    sget-object v3, Ljnc;->Companion:Linc;

    aput v2, v0, v1
    :try_end_27
    .catch Ljava/lang/NoSuchFieldError; {:try_start_23 .. :try_end_27} :catch_27

    :catch_27
    const/4 v1, 0x5

    :try_start_28
    sget-object v3, Ljnc;->Companion:Linc;

    aput v1, v0, v2
    :try_end_2c
    .catch Ljava/lang/NoSuchFieldError; {:try_start_28 .. :try_end_2c} :catch_2c

    :catch_2c
    const/4 v2, 0x6

    :try_start_2d
    sget-object v3, Ljnc;->Companion:Linc;

    aput v2, v0, v1
    :try_end_31
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2d .. :try_end_31} :catch_31

    :catch_31
    :try_start_31
    sget-object v1, Ljnc;->Companion:Linc;

    const/4 v1, 0x7

    aput v1, v0, v2
    :try_end_36
    .catch Ljava/lang/NoSuchFieldError; {:try_start_31 .. :try_end_36} :catch_36

    :catch_36
    sput-object v0, Ltu5;->a:[I

    return-void
.end method
