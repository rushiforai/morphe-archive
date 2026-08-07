.class public final Lcom/tencent/liteav/network/a/b/a;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private a:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/tencent/liteav/network/a/b/a;->a:I

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public a()I
    .locals 0

    .line 10
    iget p0, p0, Lcom/tencent/liteav/network/a/b/a;->a:I

    return p0
.end method

.method public a(I)Lcom/tencent/liteav/network/a/b/a;
    .locals 2

    .line 1
    iget v0, p0, Lcom/tencent/liteav/network/a/b/a;->a:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    shl-int p1, v1, p1

    .line 5
    .line 6
    or-int/2addr p1, v0

    .line 7
    iput p1, p0, Lcom/tencent/liteav/network/a/b/a;->a:I

    .line 8
    .line 9
    return-object p0
.end method
