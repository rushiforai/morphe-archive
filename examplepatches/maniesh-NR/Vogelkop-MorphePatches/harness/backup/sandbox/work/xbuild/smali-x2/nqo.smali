.class public abstract synthetic Lnqo;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final synthetic a:[I


# direct methods
.method static constructor <clinit>()V
    .registers 3

    const/16 v0, 0x1a

    invoke-static {v0}, Lvep;->B(I)[I

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lnqo;->a:[I

    const/4 v1, 0x1

    const/4 v2, 0x0

    :try_start_d
    aput v1, v0, v2
    :try_end_f
    .catch Ljava/lang/NoSuchFieldError; {:try_start_d .. :try_end_f} :catch_f

    :catch_f
    :try_start_f
    sget-object v0, Lnqo;->a:[I

    const/4 v1, 0x3

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_15
    .catch Ljava/lang/NoSuchFieldError; {:try_start_f .. :try_end_15} :catch_15

    :catch_15
    return-void
.end method
