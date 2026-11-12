.class public abstract Lqhh;
.super Ljava/lang/Object;


# static fields
.field public static final a:[I

.field public static final b:[I

.field public static final c:[I

.field public static final d:[I


# direct methods
.method public static constructor <clinit>()V
    .registers 2

    const/16 v0, 0xd

    new-array v0, v0, [I

    fill-array-data v0, :array_28

    sput-object v0, Lqhh;->a:[I

    const/4 v0, 0x6

    new-array v0, v0, [I

    fill-array-data v0, :array_46

    sput-object v0, Lqhh;->b:[I

    const v0, 0x7f0408af

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lqhh;->c:[I

    const v0, 0x1010034

    const v1, 0x7f040626

    filled-new-array {v0, v1}, [I

    move-result-object v0

    sput-object v0, Lqhh;->d:[I

    return-void

    nop

    :array_28
    .array-data 4
        0x7f0400de
        0x7f040120
        0x7f040121
        0x7f040122
        0x7f040154
        0x7f04050d
        0x7f040817
        0x7f040818
        0x7f040819
        0x7f04081a
        0x7f04081b
        0x7f04081c
        0x7f040a63
    .end array-data

    :array_46
    .array-data 4
        0x7f0406ec
        0x7f0406ed
        0x7f0406ee
        0x7f0406ef
        0x7f0406f0
        0x7f0406f2
    .end array-data
.end method
