.class public abstract synthetic Ljxa;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final synthetic a:[I


# direct methods
.method static constructor <clinit>()V
    .registers 3

    invoke-static {}, Lnsl;->values()[Lnsl;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_7
    sget-object v1, Lnsl;->d:Lavj;

    const/4 v1, 0x1

    aput v1, v0, v1
    :try_end_c
    .catch Ljava/lang/NoSuchFieldError; {:try_start_7 .. :try_end_c} :catch_c

    :catch_c
    const/4 v1, 0x2

    :try_start_d
    sget-object v2, Lnsl;->d:Lavj;

    const/4 v2, 0x4

    aput v1, v0, v2
    :try_end_12
    .catch Ljava/lang/NoSuchFieldError; {:try_start_d .. :try_end_12} :catch_12

    :catch_12
    :try_start_12
    sget-object v2, Lnsl;->d:Lavj;

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_17
    .catch Ljava/lang/NoSuchFieldError; {:try_start_12 .. :try_end_17} :catch_17

    :catch_17
    sput-object v0, Ljxa;->a:[I

    return-void
.end method
