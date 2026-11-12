.class public abstract synthetic La2p;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final synthetic a:[I


# direct methods
.method static constructor <clinit>()V
    .registers 4

    const/4 v0, 0x3

    invoke-static {v0}, Lvep;->B(I)[I

    move-result-object v1

    array-length v1, v1

    new-array v1, v1, [I

    sput-object v1, La2p;->a:[I

    const/4 v2, 0x1

    const/4 v3, 0x0

    :try_start_c
    aput v2, v1, v3
    :try_end_e
    .catch Ljava/lang/NoSuchFieldError; {:try_start_c .. :try_end_e} :catch_e

    :catch_e
    const/4 v1, 0x2

    :try_start_f
    sget-object v3, La2p;->a:[I

    aput v1, v3, v2
    :try_end_13
    .catch Ljava/lang/NoSuchFieldError; {:try_start_f .. :try_end_13} :catch_13

    :catch_13
    :try_start_13
    sget-object v2, La2p;->a:[I

    aput v0, v2, v1
    :try_end_17
    .catch Ljava/lang/NoSuchFieldError; {:try_start_13 .. :try_end_17} :catch_17

    :catch_17
    return-void
.end method
