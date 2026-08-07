.class public final Ll/oer0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/sgr0;


# instance fields
.field public final a:[B


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x1000

    .line 5
    .line 6
    new-array v0, v0, [B

    .line 7
    .line 8
    iput-object v0, p0, Ll/oer0;->a:[B

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final a(Ll/bgw0;II)V
    .locals 0

    .line 1
    invoke-virtual {p1, p2}, Ll/bgw0;->l(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final b(Ll/nyy0;IZI)I
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/oer0;->a:[B

    .line 2
    .line 3
    const/16 p4, 0x1000

    .line 4
    .line 5
    invoke-static {p4, p2}, Ljava/lang/Math;->min(II)I

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    const/4 p4, 0x0

    .line 10
    invoke-interface {p1, p0, p4, p2}, Ll/nyy0;->a([BII)I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    const/4 p1, -0x1

    .line 15
    if-ne p0, p1, :cond_1

    .line 16
    .line 17
    if-eqz p3, :cond_0

    .line 18
    .line 19
    return p1

    .line 20
    :cond_0
    invoke-static {}, Ll/vg3;->a()V

    .line 21
    .line 22
    .line 23
    const/4 p0, 0x0

    .line 24
    :cond_1
    return p0
.end method

.method public final c(JIIILl/ggr0;)V
    .locals 0
    .param p6    # Ll/ggr0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    return-void
.end method

.method public final d(Ll/sqr0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic e(Ll/nyy0;IZ)I
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Ll/fgr0;->a(Ll/sgr0;Ll/nyy0;IZ)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public final synthetic f(Ll/bgw0;I)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/fgr0;->b(Ll/sgr0;Ll/bgw0;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
