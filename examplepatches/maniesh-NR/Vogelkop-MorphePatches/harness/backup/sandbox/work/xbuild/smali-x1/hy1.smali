.class public abstract synthetic Lhy1;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final synthetic a:[I


# direct methods
.method static constructor <clinit>()V
    .registers 7

    invoke-static {}, Lm32;->values()[Lm32;

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
    sget-object v4, Lm32;->a:Lm32;

    aput v3, v0, v2
    :try_end_10
    .catch Ljava/lang/NoSuchFieldError; {:try_start_c .. :try_end_10} :catch_10

    :catch_10
    invoke-static {}, Loy1;->values()[Loy1;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_17
    aput v2, v0, v2
    :try_end_19
    .catch Ljava/lang/NoSuchFieldError; {:try_start_17 .. :try_end_19} :catch_19

    :catch_19
    :try_start_19
    sget-object v4, Loy1;->a:Loy1;

    aput v3, v0, v3
    :try_end_1d
    .catch Ljava/lang/NoSuchFieldError; {:try_start_19 .. :try_end_1d} :catch_1d

    :catch_1d
    const/4 v4, 0x3

    :try_start_1e
    sget-object v5, Loy1;->a:Loy1;

    aput v4, v0, v4
    :try_end_22
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1e .. :try_end_22} :catch_22

    :catch_22
    const/4 v5, 0x4

    :try_start_23
    sget-object v6, Loy1;->a:Loy1;

    aput v5, v0, v1
    :try_end_27
    .catch Ljava/lang/NoSuchFieldError; {:try_start_23 .. :try_end_27} :catch_27

    :catch_27
    sput-object v0, Lhy1;->a:[I

    invoke-static {}, Lt12;->values()[Lt12;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_30
    aput v2, v0, v2
    :try_end_32
    .catch Ljava/lang/NoSuchFieldError; {:try_start_30 .. :try_end_32} :catch_32

    :catch_32
    :try_start_32
    sget-object v6, Lt12;->a:Lt12;

    aput v3, v0, v3
    :try_end_36
    .catch Ljava/lang/NoSuchFieldError; {:try_start_32 .. :try_end_36} :catch_36

    :catch_36
    :try_start_36
    sget-object v6, Lt12;->a:Lt12;

    aput v4, v0, v4
    :try_end_3a
    .catch Ljava/lang/NoSuchFieldError; {:try_start_36 .. :try_end_3a} :catch_3a

    :catch_3a
    :try_start_3a
    sget-object v6, Lt12;->a:Lt12;

    aput v5, v0, v1
    :try_end_3e
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3a .. :try_end_3e} :catch_3e

    :catch_3e
    invoke-static {}, Ley1;->values()[Ley1;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_45
    aput v2, v0, v1
    :try_end_47
    .catch Ljava/lang/NoSuchFieldError; {:try_start_45 .. :try_end_47} :catch_47

    :catch_47
    :try_start_47
    sget-object v1, Ley1;->a:Ley1;

    aput v3, v0, v2
    :try_end_4b
    .catch Ljava/lang/NoSuchFieldError; {:try_start_47 .. :try_end_4b} :catch_4b

    :catch_4b
    :try_start_4b
    sget-object v1, Ley1;->a:Ley1;

    aput v4, v0, v4
    :try_end_4f
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4b .. :try_end_4f} :catch_4f

    :catch_4f
    :try_start_4f
    sget-object v1, Ley1;->a:Ley1;

    aput v5, v0, v3
    :try_end_53
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4f .. :try_end_53} :catch_53

    :catch_53
    :try_start_53
    sget-object v1, Ley1;->a:Ley1;

    const/4 v1, 0x5

    aput v1, v0, v5
    :try_end_58
    .catch Ljava/lang/NoSuchFieldError; {:try_start_53 .. :try_end_58} :catch_58

    :catch_58
    return-void
.end method
