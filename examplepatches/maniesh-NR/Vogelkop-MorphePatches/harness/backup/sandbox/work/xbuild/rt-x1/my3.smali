.class public abstract synthetic Lmy3;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final synthetic a:[I


# direct methods
.method static constructor <clinit>()V
    .registers 3

    invoke-static {}, Lm18;->values()[Lm18;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_7
    sget-object v1, Lm18;->a:Lm18;

    const/4 v1, 0x1

    aput v1, v0, v1
    :try_end_c
    .catch Ljava/lang/NoSuchFieldError; {:try_start_7 .. :try_end_c} :catch_c

    :catch_c
    :try_start_c
    sget-object v1, Lm18;->a:Lm18;

    const/4 v1, 0x2

    aput v1, v0, v1
    :try_end_11
    .catch Ljava/lang/NoSuchFieldError; {:try_start_c .. :try_end_11} :catch_11

    :catch_11
    :try_start_11
    sget-object v1, Lm18;->a:Lm18;

    const/4 v1, 0x3

    aput v1, v0, v1
    :try_end_16
    .catch Ljava/lang/NoSuchFieldError; {:try_start_11 .. :try_end_16} :catch_16

    :catch_16
    :try_start_16
    sget-object v1, Lm18;->a:Lm18;

    const/4 v1, 0x0

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_1c
    .catch Ljava/lang/NoSuchFieldError; {:try_start_16 .. :try_end_1c} :catch_1c

    :catch_1c
    sput-object v0, Lmy3;->a:[I

    return-void
.end method
