.class public abstract synthetic Lhgf;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final synthetic a:[I


# direct methods
.method static constructor <clinit>()V
    .registers 5

    invoke-static {}, Ligf;->values()[Ligf;

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
    sget-object v4, Ligf;->b:Lwu5;

    aput v3, v0, v2
    :try_end_10
    .catch Ljava/lang/NoSuchFieldError; {:try_start_c .. :try_end_10} :catch_10

    :catch_10
    :try_start_10
    sget-object v4, Ligf;->b:Lwu5;

    const/4 v4, 0x3

    aput v4, v0, v3
    :try_end_15
    .catch Ljava/lang/NoSuchFieldError; {:try_start_10 .. :try_end_15} :catch_15

    :catch_15
    invoke-static {}, Ljgf;->values()[Ljgf;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_1c
    aput v2, v0, v1
    :try_end_1e
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1c .. :try_end_1e} :catch_1e

    :catch_1e
    sput-object v0, Lhgf;->a:[I

    return-void
.end method
