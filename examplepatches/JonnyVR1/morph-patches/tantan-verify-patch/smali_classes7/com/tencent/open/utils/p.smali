.class public final Lcom/tencent/open/utils/p;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;


# instance fields
.field private a:I


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    iput p1, p0, Lcom/tencent/open/utils/p;->a:I

    return-void
.end method

.method public constructor <init>([B)V
    .locals 1

    const/4 v0, 0x0

    .line 24
    invoke-direct {p0, p1, v0}, Lcom/tencent/open/utils/p;-><init>([BI)V

    return-void
.end method

.method public constructor <init>([BI)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    add-int/lit8 v0, p2, 0x1

    .line 5
    .line 6
    aget-byte v0, p1, v0

    .line 7
    .line 8
    shl-int/lit8 v0, v0, 0x8

    .line 9
    .line 10
    const v1, 0xff00

    .line 11
    .line 12
    .line 13
    and-int/2addr v0, v1

    .line 14
    iput v0, p0, Lcom/tencent/open/utils/p;->a:I

    .line 15
    .line 16
    aget-byte p1, p1, p2

    .line 17
    .line 18
    and-int/lit16 p1, p1, 0xff

    .line 19
    .line 20
    add-int/2addr v0, p1

    .line 21
    iput v0, p0, Lcom/tencent/open/utils/p;->a:I

    .line 22
    .line 23
    return-void
.end method


# virtual methods
.method public a()[B
    .locals 3

    .line 1
    iget p0, p0, Lcom/tencent/open/utils/p;->a:I

    .line 2
    .line 3
    and-int/lit16 v0, p0, 0xff

    .line 4
    .line 5
    int-to-byte v0, v0

    .line 6
    const v1, 0xff00

    .line 7
    .line 8
    .line 9
    and-int/2addr p0, v1

    .line 10
    shr-int/lit8 p0, p0, 0x8

    .line 11
    .line 12
    int-to-byte p0, p0

    .line 13
    const/4 v1, 0x2

    .line 14
    new-array v1, v1, [B

    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    aput-byte v0, v1, v2

    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    aput-byte p0, v1, v0

    .line 21
    .line 22
    return-object v1
.end method

.method public b()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/open/utils/p;->a:I

    .line 2
    .line 3
    return p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_1

    .line 3
    .line 4
    instance-of v1, p1, Lcom/tencent/open/utils/p;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    iget p0, p0, Lcom/tencent/open/utils/p;->a:I

    .line 10
    .line 11
    check-cast p1, Lcom/tencent/open/utils/p;

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/tencent/open/utils/p;->b()I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-ne p0, p1, :cond_1

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_1
    :goto_0
    return v0
.end method

.method public hashCode()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/open/utils/p;->a:I

    .line 2
    .line 3
    return p0
.end method
