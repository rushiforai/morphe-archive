.class public Lcom/google/firebase/crashlytics/internal/common/ResponseParser;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final ResponseActionDiscard:I = 0x0

.field public static final ResponseActionRetry:I = 0x1


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

.method public static parse(I)I
    .locals 3

    const/16 v0, 0xc8

    const/4 v1, 0x0

    if-lt p0, v0, :cond_0

    const/16 v0, 0x12b

    if-gt p0, v0, :cond_0

    return v1

    :cond_0
    const/16 v0, 0x12c

    const/4 v2, 0x1

    if-lt p0, v0, :cond_1

    const/16 v0, 0x18f

    if-gt p0, v0, :cond_1

    return v2

    :cond_1
    const/16 v0, 0x190

    if-lt p0, v0, :cond_2

    const/16 v0, 0x1f3

    if-gt p0, v0, :cond_2

    return v1

    :cond_2
    return v2
.end method
