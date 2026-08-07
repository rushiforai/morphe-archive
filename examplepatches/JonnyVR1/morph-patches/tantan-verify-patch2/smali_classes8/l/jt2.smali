.class public abstract Ll/jt2;
.super Ll/gfj;
.source "SourceFile"

# interfaces
.implements Ll/dfj;


# instance fields
.field public parentFilter:Ll/jt2;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/gfj;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public newTextureReady(ILl/gfj;Z)V
    .locals 0

    .line 1
    if-eqz p3, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/gfj;->markAsDirty()V

    .line 4
    .line 5
    .line 6
    :cond_0
    iput p1, p0, Ll/wej;->texture_in:I

    .line 7
    .line 8
    invoke-virtual {p2}, Ll/wej;->getWidth()I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    invoke-virtual {p0, p1}, Ll/wej;->setWidth(I)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p2}, Ll/wej;->getHeight()I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    invoke-virtual {p0, p1}, Ll/wej;->setHeight(I)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p2, Ll/gfj;->glFrameBuffer:Ll/lej;

    .line 23
    .line 24
    iput-object p1, p0, Ll/gfj;->inputFrameBuffer:Ll/lej;

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/wej;->onDrawFrame()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p2}, Ll/gfj;->unlockRenderBuffer()V

    .line 30
    .line 31
    .line 32
    return-void
.end method
