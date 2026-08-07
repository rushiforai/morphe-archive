.class public final Ll/rfe;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qfj0;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


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
    iput-object v0, p0, Ll/rfe;->a:[B

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a(JIIILl/qfj0$a;)V
    .locals 0
    .param p6    # Ll/qfj0$a;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    return-void
.end method

.method public b(Lcom/google/android/exoplayer2/k;)V
    .locals 0

    .line 1
    return-void
.end method

.method public c(Ll/e6c;IZI)I
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p4, p0, Ll/rfe;->a:[B

    .line 2
    .line 3
    array-length p4, p4

    .line 4
    invoke-static {p4, p2}, Ljava/lang/Math;->min(II)I

    .line 5
    .line 6
    .line 7
    move-result p2

    .line 8
    iget-object p0, p0, Ll/rfe;->a:[B

    .line 9
    .line 10
    const/4 p4, 0x0

    .line 11
    invoke-interface {p1, p0, p4, p2}, Ll/e6c;->read([BII)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    const/4 p1, -0x1

    .line 16
    if-ne p0, p1, :cond_1

    .line 17
    .line 18
    if-eqz p3, :cond_0

    .line 19
    .line 20
    return p1

    .line 21
    :cond_0
    invoke-static {}, Ll/vg3;->a()V

    .line 22
    .line 23
    .line 24
    const/4 p0, 0x0

    .line 25
    :cond_1
    return p0
.end method

.method public f(Ll/ig60;II)V
    .locals 0

    .line 1
    invoke-virtual {p1, p2}, Ll/ig60;->V(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
