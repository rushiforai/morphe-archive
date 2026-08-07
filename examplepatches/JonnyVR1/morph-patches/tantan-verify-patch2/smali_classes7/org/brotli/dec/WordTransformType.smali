.class final Lorg/brotli/dec/WordTransformType;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field static final IDENTITY:I = 0x0

.field static final OMIT_FIRST_1:I = 0xc

.field static final OMIT_FIRST_2:I = 0xd

.field static final OMIT_FIRST_3:I = 0xe

.field static final OMIT_FIRST_4:I = 0xf

.field static final OMIT_FIRST_5:I = 0x10

.field static final OMIT_FIRST_6:I = 0x11

.field static final OMIT_FIRST_7:I = 0x12

.field static final OMIT_FIRST_8:I = 0x13

.field static final OMIT_FIRST_9:I = 0x14

.field static final OMIT_LAST_1:I = 0x1

.field static final OMIT_LAST_2:I = 0x2

.field static final OMIT_LAST_3:I = 0x3

.field static final OMIT_LAST_4:I = 0x4

.field static final OMIT_LAST_5:I = 0x5

.field static final OMIT_LAST_6:I = 0x6

.field static final OMIT_LAST_7:I = 0x7

.field static final OMIT_LAST_8:I = 0x8

.field static final OMIT_LAST_9:I = 0x9

.field static final UPPERCASE_ALL:I = 0xb

.field static final UPPERCASE_FIRST:I = 0xa


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static getOmitFirst(I)I
    .locals 1

    const/16 v0, 0xc

    if-lt p0, v0, :cond_0

    add-int/lit8 p0, p0, -0xb

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static getOmitLast(I)I
    .locals 1

    const/16 v0, 0x9

    if-gt p0, v0, :cond_0

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method
