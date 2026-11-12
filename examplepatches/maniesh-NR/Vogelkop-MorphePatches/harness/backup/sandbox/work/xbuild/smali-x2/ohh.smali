.class public abstract Lohh;
.super Ljava/lang/Object;


# static fields
.field public static final a:[I

.field public static final b:[I

.field public static final c:[I


# direct methods
.method public static constructor <clinit>()V
    .registers 1

    const/16 v0, 0xb

    new-array v0, v0, [I

    fill-array-data v0, :array_1c

    sput-object v0, Lohh;->a:[I

    const/16 v0, 0x15

    new-array v0, v0, [I

    fill-array-data v0, :array_36

    sput-object v0, Lohh;->b:[I

    const v0, 0x7f040859

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lohh;->c:[I

    return-void

    :array_1c
    .array-data 4
        0x7f0400a0
        0x7f040524
        0x7f040525
        0x7f0406f3
        0x7f0406f5
        0x7f040749
        0x7f04074a
        0x7f0407c2
        0x7f0407c3
        0x7f040a02
        0x7f040a10
    .end array-data

    :array_36
    .array-data 4
        0x10100d4
        0x7f0401a7
        0x7f040413
        0x7f04041d
        0x7f04041e
        0x7f040423
        0x7f0408ce
        0x7f0408cf
        0x7f0408d3
        0x7f0408d6
        0x7f0408d7
        0x7f0408e5
        0x7f0408e6
        0x7f040907
        0x7f040909
        0x7f04090a
        0x7f04090b
        0x7f040a02
        0x7f040a0c
        0x7f040a0f
        0x7f040a10
    .end array-data
.end method
