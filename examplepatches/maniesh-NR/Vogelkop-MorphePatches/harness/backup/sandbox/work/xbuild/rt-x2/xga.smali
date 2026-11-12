.class public abstract synthetic Lxga;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final synthetic a:[I


# direct methods
.method static constructor <clinit>()V
    .registers 3

    invoke-static {}, Lw98;->values()[Lw98;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_7
    sget-object v1, Lw98;->b:Lw98;

    const/4 v1, 0x1

    aput v1, v0, v1
    :try_end_c
    .catch Ljava/lang/NoSuchFieldError; {:try_start_7 .. :try_end_c} :catch_c

    :catch_c
    :try_start_c
    sget-object v1, Lw98;->b:Lw98;

    const/4 v1, 0x0

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_12
    .catch Ljava/lang/NoSuchFieldError; {:try_start_c .. :try_end_12} :catch_12

    :catch_12
    sput-object v0, Lxga;->a:[I

    return-void
.end method
