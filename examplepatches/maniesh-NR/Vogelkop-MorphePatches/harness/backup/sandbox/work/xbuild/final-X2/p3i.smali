.class public abstract synthetic Lp3i;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final synthetic a:[I


# direct methods
.method static constructor <clinit>()V
    .registers 4

    invoke-static {}, Lm18;->values()[Lm18;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    const/4 v1, 0x1

    :try_start_8
    sget-object v2, Lm18;->a:Lm18;

    const/4 v2, 0x0

    aput v1, v0, v2
    :try_end_d
    .catch Ljava/lang/NoSuchFieldError; {:try_start_8 .. :try_end_d} :catch_d

    :catch_d
    const/4 v2, 0x2

    :try_start_e
    sget-object v3, Lm18;->a:Lm18;

    aput v2, v0, v1
    :try_end_12
    .catch Ljava/lang/NoSuchFieldError; {:try_start_e .. :try_end_12} :catch_12

    :catch_12
    const/4 v1, 0x3

    :try_start_13
    sget-object v3, Lm18;->a:Lm18;

    aput v1, v0, v2
    :try_end_17
    .catch Ljava/lang/NoSuchFieldError; {:try_start_13 .. :try_end_17} :catch_17

    :catch_17
    :try_start_17
    sget-object v2, Lm18;->a:Lm18;

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_1c
    .catch Ljava/lang/NoSuchFieldError; {:try_start_17 .. :try_end_1c} :catch_1c

    :catch_1c
    sput-object v0, Lp3i;->a:[I

    return-void
.end method
