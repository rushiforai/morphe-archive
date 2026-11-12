.class public abstract Ljhh;
.super Ljava/lang/Object;


# static fields
.field public static final a:[I

.field public static final b:[I


# direct methods
.method public static constructor <clinit>()V
    .registers 1

    const v0, 0x7f040814

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Ljhh;->a:[I

    const/4 v0, 0x7

    new-array v0, v0, [I

    fill-array-data v0, :array_12

    sput-object v0, Ljhh;->b:[I

    return-void

    :array_12
    .array-data 4
        0x7f040355
        0x7f040356
        0x7f040359
        0x7f040362
        0x7f040365
        0x7f040579
        0x7f040820
    .end array-data
.end method
