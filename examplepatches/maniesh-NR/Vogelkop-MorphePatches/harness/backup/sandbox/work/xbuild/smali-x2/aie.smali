.class public abstract synthetic Laie;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final synthetic a:[I

.field public static final synthetic b:[I

.field public static final synthetic c:[I


# direct methods
.method static constructor <clinit>()V
    .registers 13

    invoke-static {}, Lbm;->values()[Lbm;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Laie;->c:[I

    const/4 v1, 0x1

    const/16 v2, 0x12

    :try_start_c
    aput v1, v0, v2
    :try_end_e
    .catch Ljava/lang/NoSuchFieldError; {:try_start_c .. :try_end_e} :catch_e

    :catch_e
    const/4 v0, 0x2

    const/16 v3, 0x13

    :try_start_11
    sget-object v4, Laie;->c:[I

    aput v0, v4, v3
    :try_end_15
    .catch Ljava/lang/NoSuchFieldError; {:try_start_11 .. :try_end_15} :catch_15

    :catch_15
    const/16 v4, 0x14

    const/4 v5, 0x3

    :try_start_18
    sget-object v6, Laie;->c:[I

    aput v5, v6, v4
    :try_end_1c
    .catch Ljava/lang/NoSuchFieldError; {:try_start_18 .. :try_end_1c} :catch_1c

    :catch_1c
    const/4 v6, 0x4

    const/16 v7, 0x15

    :try_start_1f
    sget-object v8, Laie;->c:[I

    aput v6, v8, v7
    :try_end_23
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1f .. :try_end_23} :catch_23

    :catch_23
    const/4 v8, 0x5

    const/16 v9, 0x16

    :try_start_26
    sget-object v10, Laie;->c:[I

    aput v8, v10, v9
    :try_end_2a
    .catch Ljava/lang/NoSuchFieldError; {:try_start_26 .. :try_end_2a} :catch_2a

    :catch_2a
    const/16 v10, 0x1a

    invoke-static {v10}, Lvep;->B(I)[I

    move-result-object v10

    array-length v10, v10

    new-array v10, v10, [I

    sput-object v10, Laie;->b:[I

    const/4 v11, 0x0

    :try_start_36
    aput v1, v10, v11
    :try_end_38
    .catch Ljava/lang/NoSuchFieldError; {:try_start_36 .. :try_end_38} :catch_38

    :catch_38
    :try_start_38
    sget-object v10, Laie;->b:[I

    aput v0, v10, v5
    :try_end_3c
    .catch Ljava/lang/NoSuchFieldError; {:try_start_38 .. :try_end_3c} :catch_3c

    :catch_3c
    invoke-static {}, Lw06;->values()[Lw06;

    move-result-object v10

    array-length v10, v10

    new-array v10, v10, [I

    sput-object v10, Laie;->a:[I

    :try_start_45
    aput v1, v10, v11
    :try_end_47
    .catch Ljava/lang/NoSuchFieldError; {:try_start_45 .. :try_end_47} :catch_47

    :catch_47
    :try_start_47
    sget-object v10, Laie;->a:[I

    aput v0, v10, v1
    :try_end_4b
    .catch Ljava/lang/NoSuchFieldError; {:try_start_47 .. :try_end_4b} :catch_4b

    :catch_4b
    const/16 v0, 0xc

    :try_start_4d
    sget-object v1, Laie;->a:[I

    aput v5, v1, v0
    :try_end_51
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4d .. :try_end_51} :catch_51

    :catch_51
    :try_start_51
    sget-object v1, Laie;->a:[I

    aput v6, v1, v5
    :try_end_55
    .catch Ljava/lang/NoSuchFieldError; {:try_start_51 .. :try_end_55} :catch_55

    :catch_55
    const/16 v1, 0xd

    :try_start_57
    sget-object v5, Laie;->a:[I

    aput v8, v5, v1
    :try_end_5b
    .catch Ljava/lang/NoSuchFieldError; {:try_start_57 .. :try_end_5b} :catch_5b

    :catch_5b
    const/16 v5, 0xe

    :try_start_5d
    sget-object v6, Laie;->a:[I

    const/4 v8, 0x6

    aput v8, v6, v5
    :try_end_62
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5d .. :try_end_62} :catch_62

    :catch_62
    const/16 v6, 0xb

    :try_start_64
    sget-object v8, Laie;->a:[I

    const/4 v10, 0x7

    aput v10, v8, v6
    :try_end_69
    .catch Ljava/lang/NoSuchFieldError; {:try_start_64 .. :try_end_69} :catch_69

    :catch_69
    const/16 v8, 0x8

    :try_start_6b
    sget-object v10, Laie;->a:[I

    const/16 v11, 0x19

    aput v8, v10, v11
    :try_end_71
    .catch Ljava/lang/NoSuchFieldError; {:try_start_6b .. :try_end_71} :catch_71

    :catch_71
    const/16 v10, 0xf

    :try_start_73
    sget-object v11, Laie;->a:[I

    const/16 v12, 0x9

    aput v12, v11, v10
    :try_end_79
    .catch Ljava/lang/NoSuchFieldError; {:try_start_73 .. :try_end_79} :catch_79

    :catch_79
    :try_start_79
    sget-object v11, Laie;->a:[I

    const/16 v12, 0xa

    aput v12, v11, v8
    :try_end_7f
    .catch Ljava/lang/NoSuchFieldError; {:try_start_79 .. :try_end_7f} :catch_7f

    :catch_7f
    :try_start_7f
    sget-object v8, Laie;->a:[I

    aput v6, v8, v3
    :try_end_83
    .catch Ljava/lang/NoSuchFieldError; {:try_start_7f .. :try_end_83} :catch_83

    :catch_83
    :try_start_83
    sget-object v6, Laie;->a:[I

    aput v0, v6, v4
    :try_end_87
    .catch Ljava/lang/NoSuchFieldError; {:try_start_83 .. :try_end_87} :catch_87

    :catch_87
    :try_start_87
    sget-object v0, Laie;->a:[I

    aput v1, v0, v7
    :try_end_8b
    .catch Ljava/lang/NoSuchFieldError; {:try_start_87 .. :try_end_8b} :catch_8b

    :catch_8b
    const/16 v0, 0x11

    :try_start_8d
    sget-object v1, Laie;->a:[I

    aput v5, v1, v0
    :try_end_91
    .catch Ljava/lang/NoSuchFieldError; {:try_start_8d .. :try_end_91} :catch_91

    :catch_91
    :try_start_91
    sget-object v1, Laie;->a:[I

    aput v10, v1, v2
    :try_end_95
    .catch Ljava/lang/NoSuchFieldError; {:try_start_91 .. :try_end_95} :catch_95

    :catch_95
    :try_start_95
    sget-object v1, Laie;->a:[I

    const/16 v4, 0x10

    aput v4, v1, v4
    :try_end_9b
    .catch Ljava/lang/NoSuchFieldError; {:try_start_95 .. :try_end_9b} :catch_9b

    :catch_9b
    :try_start_9b
    sget-object v1, Laie;->a:[I

    aput v0, v1, v9
    :try_end_9f
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9b .. :try_end_9f} :catch_9f

    :catch_9f
    :try_start_9f
    sget-object v0, Laie;->a:[I

    const/16 v1, 0x17

    aput v2, v0, v1
    :try_end_a5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9f .. :try_end_a5} :catch_a5

    :catch_a5
    :try_start_a5
    sget-object v0, Laie;->a:[I

    const/16 v1, 0x18

    aput v3, v0, v1
    :try_end_ab
    .catch Ljava/lang/NoSuchFieldError; {:try_start_a5 .. :try_end_ab} :catch_ab

    :catch_ab
    return-void
.end method
