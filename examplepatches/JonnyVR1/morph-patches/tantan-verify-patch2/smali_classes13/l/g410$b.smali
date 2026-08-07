.class Ll/g410$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/g410;->O(Ll/gfj;Lcom/momo/pipline/MomoInterface/MomoCodec;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/momo/pipline/MomoInterface/MomoCodec;

.field final synthetic b:Ll/gfj;

.field final synthetic c:Ll/g410;


# direct methods
.method public constructor <init>(Ll/g410;Lcom/momo/pipline/MomoInterface/MomoCodec;Ll/gfj;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/g410$b;->c:Ll/g410;

    .line 2
    .line 3
    iput-object p2, p0, Ll/g410$b;->a:Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 4
    .line 5
    iput-object p3, p0, Ll/g410$b;->b:Ll/gfj;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/g410$b;->c:Ll/g410;

    .line 2
    .line 3
    iget-object v0, v0, Ll/g410;->g:Ll/rsy;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v1, p0, Ll/g410$b;->a:Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 8
    .line 9
    invoke-interface {v1}, Lcom/momo/pipline/MomoInterface/MomoCodec;->getFilter()Lcom/momo/pipline/codec/MediaBaseCodecFilter;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ll/rsy;->removeTarget(Ll/dfj;)V

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    iget-object v0, p0, Ll/g410$b;->b:Ll/gfj;

    .line 18
    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    iget-object v1, p0, Ll/g410$b;->a:Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 22
    .line 23
    invoke-interface {v1}, Lcom/momo/pipline/MomoInterface/MomoCodec;->getFilter()Lcom/momo/pipline/codec/MediaBaseCodecFilter;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 28
    .line 29
    .line 30
    :cond_1
    :goto_0
    iget-object v0, p0, Ll/g410$b;->a:Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 31
    .line 32
    invoke-interface {v0}, Lcom/momo/pipline/MomoInterface/MomoCodec;->getFilter()Lcom/momo/pipline/codec/MediaBaseCodecFilter;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    if-eqz v0, :cond_2

    .line 37
    .line 38
    iget-object p0, p0, Ll/g410$b;->a:Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 39
    .line 40
    invoke-interface {p0}, Lcom/momo/pipline/MomoInterface/MomoCodec;->getFilter()Lcom/momo/pipline/codec/MediaBaseCodecFilter;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {p0}, Ll/wej;->releaseFrameBuffer()V

    .line 45
    .line 46
    .line 47
    :cond_2
    return-void
.end method
