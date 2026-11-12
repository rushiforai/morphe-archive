.class public abstract synthetic Lvgo;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final synthetic a:[I


# direct methods
.method static constructor <clinit>()V
    .registers 3

    invoke-static {}, Lahb;->values()[Lahb;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lvgo;->a:[I

    const/4 v1, 0x1

    const/4 v2, 0x2

    :try_start_b
    aput v1, v0, v2
    :try_end_d
    .catch Ljava/lang/NoSuchFieldError; {:try_start_b .. :try_end_d} :catch_d

    :catch_d
    :try_start_d
    sget-object v0, Lvgo;->a:[I

    aput v2, v0, v1
    :try_end_11
    .catch Ljava/lang/NoSuchFieldError; {:try_start_d .. :try_end_11} :catch_11

    :catch_11
    :try_start_11
    sget-object v0, Lvgo;->a:[I

    const/4 v1, 0x0

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_17
    .catch Ljava/lang/NoSuchFieldError; {:try_start_11 .. :try_end_17} :catch_17

    :catch_17
    return-void
.end method
