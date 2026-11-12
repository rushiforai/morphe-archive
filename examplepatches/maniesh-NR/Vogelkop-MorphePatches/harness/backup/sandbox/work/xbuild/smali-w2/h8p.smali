.class public abstract synthetic Lh8p;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final synthetic a:[I

.field public static final synthetic b:[I


# direct methods
.method static constructor <clinit>()V
    .registers 9

    const/4 v0, 0x3

    invoke-static {v0}, Lvep;->B(I)[I

    move-result-object v1

    array-length v1, v1

    new-array v1, v1, [I

    sput-object v1, Lh8p;->b:[I

    const/4 v2, 0x1

    :try_start_b
    aput v2, v1, v2
    :try_end_d
    .catch Ljava/lang/NoSuchFieldError; {:try_start_b .. :try_end_d} :catch_d

    :catch_d
    const/4 v1, 0x2

    :try_start_e
    sget-object v3, Lh8p;->b:[I

    const/4 v4, 0x0

    aput v1, v3, v4
    :try_end_13
    .catch Ljava/lang/NoSuchFieldError; {:try_start_e .. :try_end_13} :catch_13

    :catch_13
    :try_start_13
    sget-object v3, Lh8p;->b:[I

    aput v0, v3, v1
    :try_end_17
    .catch Ljava/lang/NoSuchFieldError; {:try_start_13 .. :try_end_17} :catch_17

    :catch_17
    const/16 v3, 0x1a

    invoke-static {v3}, Lvep;->B(I)[I

    move-result-object v3

    array-length v3, v3

    new-array v3, v3, [I

    sput-object v3, Lh8p;->a:[I

    const/4 v4, 0x7

    :try_start_23
    aput v2, v3, v4
    :try_end_25
    .catch Ljava/lang/NoSuchFieldError; {:try_start_23 .. :try_end_25} :catch_25

    :catch_25
    const/16 v2, 0xb

    :try_start_27
    sget-object v3, Lh8p;->a:[I

    aput v1, v3, v2
    :try_end_2b
    .catch Ljava/lang/NoSuchFieldError; {:try_start_27 .. :try_end_2b} :catch_2b

    :catch_2b
    const/16 v1, 0x8

    :try_start_2d
    sget-object v3, Lh8p;->a:[I

    aput v0, v3, v1
    :try_end_31
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2d .. :try_end_31} :catch_31

    :catch_31
    const/16 v0, 0x9

    :try_start_33
    sget-object v3, Lh8p;->a:[I

    const/4 v5, 0x4

    aput v5, v3, v0
    :try_end_38
    .catch Ljava/lang/NoSuchFieldError; {:try_start_33 .. :try_end_38} :catch_38

    :catch_38
    const/16 v3, 0xa

    :try_start_3a
    sget-object v5, Lh8p;->a:[I

    const/4 v6, 0x5

    aput v6, v5, v3
    :try_end_3f
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3a .. :try_end_3f} :catch_3f

    :catch_3f
    const/4 v5, 0x6

    const/16 v6, 0xf

    :try_start_42
    sget-object v7, Lh8p;->a:[I

    aput v5, v7, v6
    :try_end_46
    .catch Ljava/lang/NoSuchFieldError; {:try_start_42 .. :try_end_46} :catch_46

    :catch_46
    :try_start_46
    sget-object v7, Lh8p;->a:[I

    const/16 v8, 0x16

    aput v4, v7, v8
    :try_end_4c
    .catch Ljava/lang/NoSuchFieldError; {:try_start_46 .. :try_end_4c} :catch_4c

    :catch_4c
    :try_start_4c
    sget-object v4, Lh8p;->a:[I

    const/16 v7, 0x17

    aput v1, v4, v7
    :try_end_52
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4c .. :try_end_52} :catch_52

    :catch_52
    :try_start_52
    sget-object v1, Lh8p;->a:[I

    aput v0, v1, v5
    :try_end_56
    .catch Ljava/lang/NoSuchFieldError; {:try_start_52 .. :try_end_56} :catch_56

    :catch_56
    :try_start_56
    sget-object v0, Lh8p;->a:[I

    const/16 v1, 0x14

    aput v3, v0, v1
    :try_end_5c
    .catch Ljava/lang/NoSuchFieldError; {:try_start_56 .. :try_end_5c} :catch_5c

    :catch_5c
    :try_start_5c
    sget-object v0, Lh8p;->a:[I

    const/16 v1, 0x15

    aput v2, v0, v1
    :try_end_62
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5c .. :try_end_62} :catch_62

    :catch_62
    const/16 v0, 0xc

    const/16 v1, 0x12

    :try_start_66
    sget-object v2, Lh8p;->a:[I

    aput v0, v2, v1
    :try_end_6a
    .catch Ljava/lang/NoSuchFieldError; {:try_start_66 .. :try_end_6a} :catch_6a

    :catch_6a
    const/16 v2, 0xd

    :try_start_6c
    sget-object v3, Lh8p;->a:[I

    const/16 v4, 0x13

    aput v2, v3, v4
    :try_end_72
    .catch Ljava/lang/NoSuchFieldError; {:try_start_6c .. :try_end_72} :catch_72

    :catch_72
    const/16 v3, 0xe

    const/16 v4, 0x10

    :try_start_76
    sget-object v5, Lh8p;->a:[I

    aput v3, v5, v4
    :try_end_7a
    .catch Ljava/lang/NoSuchFieldError; {:try_start_76 .. :try_end_7a} :catch_7a

    :catch_7a
    const/16 v5, 0x11

    :try_start_7c
    sget-object v7, Lh8p;->a:[I

    aput v6, v7, v5
    :try_end_80
    .catch Ljava/lang/NoSuchFieldError; {:try_start_7c .. :try_end_80} :catch_80

    :catch_80
    :try_start_80
    sget-object v6, Lh8p;->a:[I

    aput v4, v6, v0
    :try_end_84
    .catch Ljava/lang/NoSuchFieldError; {:try_start_80 .. :try_end_84} :catch_84

    :catch_84
    :try_start_84
    sget-object v0, Lh8p;->a:[I

    aput v5, v0, v2
    :try_end_88
    .catch Ljava/lang/NoSuchFieldError; {:try_start_84 .. :try_end_88} :catch_88

    :catch_88
    :try_start_88
    sget-object v0, Lh8p;->a:[I

    aput v1, v0, v3
    :try_end_8c
    .catch Ljava/lang/NoSuchFieldError; {:try_start_88 .. :try_end_8c} :catch_8c

    :catch_8c
    return-void
.end method
