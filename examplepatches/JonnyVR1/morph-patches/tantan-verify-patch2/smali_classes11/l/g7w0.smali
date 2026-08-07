.class public final Ll/g7w0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:[J


# direct methods
.method public constructor <init>()V
    .locals 1

    const/16 v0, 0x10

    .line 25
    invoke-direct {p0, v0}, Ll/g7w0;-><init>(I)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 p1, 0x10

    .line 5
    .line 6
    invoke-static {p1}, Ljava/lang/Integer;->bitCount(I)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x1

    .line 11
    if-eq v0, v1, :cond_0

    .line 12
    .line 13
    const/16 p1, 0xf

    .line 14
    .line 15
    invoke-static {p1}, Ljava/lang/Integer;->highestOneBit(I)I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    add-int/2addr p1, p1

    .line 20
    :cond_0
    new-array p1, p1, [J

    .line 21
    .line 22
    iput-object p1, p0, Ll/g7w0;->a:[J

    .line 23
    .line 24
    return-void
.end method
