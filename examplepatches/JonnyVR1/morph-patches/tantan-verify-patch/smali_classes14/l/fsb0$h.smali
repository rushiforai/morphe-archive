.class public Ll/fsb0$h;
.super Ll/aj2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/fsb0;->P0(Lv/VDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/aj2<",
        "Ll/fb5<",
        "Lcom/facebook/common/memory/PooledByteBuffer;",
        ">;>;"
    }
.end annotation


# instance fields
.field public final synthetic a:Lv/VDraweeView;

.field public final synthetic b:Lcom/p1/mobile/putong/data/Picture$ImageUri;

.field public final synthetic c:I

.field public final synthetic d:I

.field public final synthetic e:Ll/fsb0;


# direct methods
.method public constructor <init>(Ll/fsb0;Lv/VDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;II)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fsb0$h;->e:Ll/fsb0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/fsb0$h;->a:Lv/VDraweeView;

    .line 4
    .line 5
    iput-object p3, p0, Ll/fsb0$h;->b:Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 6
    .line 7
    iput p4, p0, Ll/fsb0$h;->c:I

    .line 8
    .line 9
    iput p5, p0, Ll/fsb0$h;->d:I

    .line 10
    .line 11
    invoke-direct {p0}, Ll/aj2;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public e(Ll/i6c;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/i6c<",
            "Ll/fb5<",
            "Lcom/facebook/common/memory/PooledByteBuffer;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    iget-object p1, p0, Ll/fsb0$h;->e:Ll/fsb0;

    .line 2
    .line 3
    iget-object v0, p0, Ll/fsb0$h;->a:Lv/VDraweeView;

    .line 4
    .line 5
    iget-object p0, p0, Ll/fsb0$h;->b:Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p1, v0, p0}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public f(Ll/i6c;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/i6c<",
            "Ll/fb5<",
            "Lcom/facebook/common/memory/PooledByteBuffer;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-interface {p1}, Ll/i6c;->e()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-interface {p1}, Ll/i6c;->getResult()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-interface {p1}, Ll/i6c;->getResult()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Ll/fb5;

    .line 20
    .line 21
    invoke-virtual {v0}, Ll/fb5;->B()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    new-instance v4, Ll/gj80;

    .line 28
    .line 29
    invoke-interface {p1}, Ll/i6c;->getResult()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    check-cast p1, Ll/fb5;

    .line 34
    .line 35
    invoke-virtual {p1}, Ll/fb5;->B()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    check-cast p1, Lcom/facebook/common/memory/PooledByteBuffer;

    .line 40
    .line 41
    invoke-direct {v4, p1}, Ll/gj80;-><init>(Lcom/facebook/common/memory/PooledByteBuffer;)V

    .line 42
    .line 43
    .line 44
    iget-object v1, p0, Ll/fsb0$h;->e:Ll/fsb0;

    .line 45
    .line 46
    iget-object v2, p0, Ll/fsb0$h;->a:Lv/VDraweeView;

    .line 47
    .line 48
    iget-object v3, p0, Ll/fsb0$h;->b:Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 49
    .line 50
    iget v5, p0, Ll/fsb0$h;->c:I

    .line 51
    .line 52
    iget v6, p0, Ll/fsb0$h;->d:I

    .line 53
    .line 54
    invoke-static/range {v1 .. v6}, Ll/fsb0;->B(Ll/fsb0;Lv/VDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Ljava/io/InputStream;II)V

    .line 55
    .line 56
    .line 57
    :cond_0
    return-void
.end method
