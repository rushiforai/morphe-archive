.class final Lcom/google/common/base/CharMatcher$Invisible;
.super Lcom/google/common/base/CharMatcher$RangesMatcher;
.source "CharMatcher.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/base/CharMatcher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Invisible"
.end annotation


# static fields
.field static final INSTANCE:Lcom/google/common/base/CharMatcher;

.field private static final RANGE_ENDS:Ljava/lang/String; = " \u00a0\u00ad\u0605\u061c\u06dd\u070f\u0891\u08e2\u1680\u180e\u200f\u202f\u2064\u206f\u3000\uf8ff\ufeff\ufffb"

.field private static final RANGE_STARTS:Ljava/lang/String; = "\u0000\u007f\u00ad\u0600\u061c\u06dd\u070f\u0890\u08e2\u1680\u180e\u2000\u2028\u205f\u2066\u3000\ud800\ufeff\ufff9"


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 1478
    new-instance v0, Lcom/google/common/base/CharMatcher$Invisible;

    invoke-direct {v0}, Lcom/google/common/base/CharMatcher$Invisible;-><init>()V

    sput-object v0, Lcom/google/common/base/CharMatcher$Invisible;->INSTANCE:Lcom/google/common/base/CharMatcher;

    return-void
.end method

.method private constructor <init>()V
    .registers 4

    const/16 v0, 0x13

    .line 1481
    new-array v1, v0, [C

    fill-array-data v1, :array_0

    new-array v0, v0, [C

    fill-array-data v0, :array_1

    const-string v2, "CharMatcher.invisible()"

    invoke-direct {p0, v2, v1, v0}, Lcom/google/common/base/CharMatcher$RangesMatcher;-><init>(Ljava/lang/String;[C[C)V

    return-void

    :array_0
    .array-data 2
        0x0s
        0x7fs
        0xads
        0x600s
        0x61cs
        0x6dds
        0x70fs
        0x890s
        0x8e2s
        0x1680s
        0x180es
        0x2000s
        0x2028s
        0x205fs
        0x2066s
        0x3000s
        -0x2800s
        -0x101s
        -0x7s
    .end array-data

    nop

    :array_1
    .array-data 2
        0x20s
        0xa0s
        0xads
        0x605s
        0x61cs
        0x6dds
        0x70fs
        0x891s
        0x8e2s
        0x1680s
        0x180es
        0x200fs
        0x202fs
        0x2064s
        0x206fs
        0x3000s
        -0x701s
        -0x101s
        -0x5s
    .end array-data
.end method
