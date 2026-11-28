.class final Lcom/google/common/base/CharMatcher$SingleWidth;
.super Lcom/google/common/base/CharMatcher$RangesMatcher;
.source "CharMatcher.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/base/CharMatcher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "SingleWidth"
.end annotation


# static fields
.field static final INSTANCE:Lcom/google/common/base/CharMatcher;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 1488
    new-instance v0, Lcom/google/common/base/CharMatcher$SingleWidth;

    invoke-direct {v0}, Lcom/google/common/base/CharMatcher$SingleWidth;-><init>()V

    sput-object v0, Lcom/google/common/base/CharMatcher$SingleWidth;->INSTANCE:Lcom/google/common/base/CharMatcher;

    return-void
.end method

.method private constructor <init>()V
    .registers 4

    const/16 v0, 0xc

    .line 1493
    new-array v1, v0, [C

    fill-array-data v1, :array_0

    .line 1494
    new-array v0, v0, [C

    fill-array-data v0, :array_1

    .line 1491
    const-string v2, "CharMatcher.singleWidth()"

    invoke-direct {p0, v2, v1, v0}, Lcom/google/common/base/CharMatcher$RangesMatcher;-><init>(Ljava/lang/String;[C[C)V

    return-void

    :array_0
    .array-data 2
        0x0s
        0x5bes
        0x5d0s
        0x5f3s
        0x600s
        0x750s
        0xe00s
        0x1e00s
        0x2100s
        -0x4b0s
        -0x190s
        -0x9fs
    .end array-data

    :array_1
    .array-data 2
        0x4f9s
        0x5bes
        0x5eas
        0x5f4s
        0x6ffs
        0x77fs
        0xe7fs
        0x20afs
        0x213as
        -0x201s
        -0x101s
        -0x24s
    .end array-data
.end method
