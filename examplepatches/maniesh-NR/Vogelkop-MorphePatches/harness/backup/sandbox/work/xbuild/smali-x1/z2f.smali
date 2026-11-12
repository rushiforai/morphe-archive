.class public abstract synthetic Lz2f;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final synthetic a:[I


# direct methods
.method static constructor <clinit>()V
    .registers 4

    invoke-static {}, Lw0f;->values()[Lw0f;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    const/4 v1, 0x1

    :try_start_8
    sget-object v2, Lw0f;->a:Lw0f;

    const/4 v2, 0x0

    aput v1, v0, v2
    :try_end_d
    .catch Ljava/lang/NoSuchFieldError; {:try_start_8 .. :try_end_d} :catch_d

    :catch_d
    const/4 v2, 0x2

    :try_start_e
    sget-object v3, Lw0f;->a:Lw0f;

    aput v2, v0, v1
    :try_end_12
    .catch Ljava/lang/NoSuchFieldError; {:try_start_e .. :try_end_12} :catch_12

    :catch_12
    :try_start_12
    sget-object v1, Lw0f;->a:Lw0f;

    const/4 v1, 0x3

    aput v1, v0, v2
    :try_end_17
    .catch Ljava/lang/NoSuchFieldError; {:try_start_12 .. :try_end_17} :catch_17

    :catch_17
    sput-object v0, Lz2f;->a:[I

    return-void
.end method
