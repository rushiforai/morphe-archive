.class public abstract synthetic Ln2i;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final synthetic a:[I


# direct methods
.method static constructor <clinit>()V
    .registers 3

    invoke-static {}, Lpc;->values()[Lpc;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    const/4 v1, 0x1

    :try_start_8
    sget-object v2, Lpc;->x:Lpc;

    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    move-result v2

    aput v1, v0, v2
    :try_end_10
    .catch Ljava/lang/NoSuchFieldError; {:try_start_8 .. :try_end_10} :catch_10

    :catch_10
    sput-object v0, Ln2i;->a:[I

    invoke-static {}, Lm18;->values()[Lm18;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_19
    aput v1, v0, v1
    :try_end_1b
    .catch Ljava/lang/NoSuchFieldError; {:try_start_19 .. :try_end_1b} :catch_1b

    :catch_1b
    :try_start_1b
    sget-object v1, Lm18;->a:Lm18;

    const/4 v1, 0x2

    aput v1, v0, v1
    :try_end_20
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1b .. :try_end_20} :catch_20

    :catch_20
    const/4 v1, 0x3

    :try_start_21
    sget-object v2, Lm18;->a:Lm18;

    const/4 v2, 0x0

    aput v1, v0, v2
    :try_end_26
    .catch Ljava/lang/NoSuchFieldError; {:try_start_21 .. :try_end_26} :catch_26

    :catch_26
    :try_start_26
    sget-object v2, Lm18;->a:Lm18;

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_2b
    .catch Ljava/lang/NoSuchFieldError; {:try_start_26 .. :try_end_2b} :catch_2b

    :catch_2b
    return-void
.end method
