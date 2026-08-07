.class public Lcom/momo/mcamera/mask/hotdance/TextureChangeFilter;
.super Ll/jt2;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/jt2;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public initFBO()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/lej;->e()V

    .line 6
    .line 7
    .line 8
    :cond_0
    new-instance v0, Ll/lej;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    invoke-direct {v0, v1, v2}, Ll/lej;-><init>(II)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    invoke-virtual {v0, v1}, Ll/lej;->k(Z)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    invoke-virtual {v0, v1, p0}, Ll/lej;->c(II)V

    .line 38
    .line 39
    .line 40
    return-void
.end method
