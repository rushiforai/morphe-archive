.class public Ll/q110$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/q110;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:I

.field public e:I


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


# virtual methods
.method public final a([BI)I
    .locals 1

    .line 1
    mul-int/lit8 p2, p2, 0x4

    .line 2
    .line 3
    add-int/lit8 p0, p2, 0x3

    .line 4
    .line 5
    aget-byte p0, p1, p0

    .line 6
    .line 7
    and-int/lit16 p0, p0, 0xff

    .line 8
    .line 9
    add-int/lit8 v0, p2, 0x2

    .line 10
    .line 11
    aget-byte v0, p1, v0

    .line 12
    .line 13
    and-int/lit16 v0, v0, 0xff

    .line 14
    .line 15
    shl-int/lit8 v0, v0, 0x8

    .line 16
    .line 17
    or-int/2addr p0, v0

    .line 18
    add-int/lit8 v0, p2, 0x1

    .line 19
    .line 20
    aget-byte v0, p1, v0

    .line 21
    .line 22
    and-int/lit16 v0, v0, 0xff

    .line 23
    .line 24
    shl-int/lit8 v0, v0, 0x10

    .line 25
    .line 26
    or-int/2addr p0, v0

    .line 27
    aget-byte p1, p1, p2

    .line 28
    .line 29
    and-int/lit16 p1, p1, 0xff

    .line 30
    .line 31
    shl-int/lit8 p1, p1, 0x18

    .line 32
    .line 33
    or-int/2addr p0, p1

    .line 34
    return p0
.end method

.method public b([B)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Ll/q110$a;->a([BI)I

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    iput v0, p0, Ll/q110$a;->a:I

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    invoke-virtual {p0, p1, v0}, Ll/q110$a;->a([BI)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iput v0, p0, Ll/q110$a;->b:I

    .line 14
    .line 15
    const/4 v0, 0x2

    .line 16
    invoke-virtual {p0, p1, v0}, Ll/q110$a;->a([BI)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iput v0, p0, Ll/q110$a;->c:I

    .line 21
    .line 22
    const/4 v0, 0x3

    .line 23
    invoke-virtual {p0, p1, v0}, Ll/q110$a;->a([BI)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    iput v0, p0, Ll/q110$a;->d:I

    .line 28
    .line 29
    const/4 v0, 0x4

    .line 30
    invoke-virtual {p0, p1, v0}, Ll/q110$a;->a([BI)I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    iput p1, p0, Ll/q110$a;->e:I

    .line 35
    .line 36
    return-void
.end method
