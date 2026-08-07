.class public abstract synthetic Ll/ngg0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final synthetic a:[I


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 1
    const/4 v0, 0x6

    .line 2
    new-array v1, v0, [I

    .line 3
    .line 4
    sget-object v2, Ll/pxg0;->a:[I

    .line 5
    .line 6
    const/4 v3, 0x0

    .line 7
    invoke-static {v2, v3, v1, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 8
    .line 9
    .line 10
    new-array v1, v0, [I

    .line 11
    .line 12
    sput-object v1, Ll/ngg0;->a:[I

    .line 13
    .line 14
    const/4 v2, 0x1

    .line 15
    const/4 v4, 0x3

    .line 16
    :try_start_0
    aput v2, v1, v4
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    .line 18
    :catch_0
    const/4 v1, 0x2

    .line 19
    const/4 v5, 0x4

    .line 20
    :try_start_1
    sget-object v6, Ll/ngg0;->a:[I

    .line 21
    .line 22
    aput v1, v6, v5
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    .line 23
    .line 24
    :catch_1
    :try_start_2
    sget-object v6, Ll/ngg0;->a:[I

    .line 25
    .line 26
    aput v4, v6, v2
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_2

    .line 27
    .line 28
    :catch_2
    :try_start_3
    sget-object v2, Ll/ngg0;->a:[I

    .line 29
    .line 30
    aput v5, v2, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_3

    .line 31
    .line 32
    :catch_3
    :try_start_4
    sget-object v1, Ll/ngg0;->a:[I

    .line 33
    .line 34
    const/4 v2, 0x5

    .line 35
    aput v2, v1, v2
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_4

    .line 36
    .line 37
    :catch_4
    :try_start_5
    sget-object v1, Ll/ngg0;->a:[I

    .line 38
    .line 39
    aput v0, v1, v3
    :try_end_5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5 .. :try_end_5} :catch_5

    .line 40
    .line 41
    :catch_5
    return-void
.end method
