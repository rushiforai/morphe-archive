.class Ll/ciw$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/media/ImageReader$OnImageAvailableListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/ciw;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/ciw;


# direct methods
.method public constructor <init>(Ll/ciw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ciw$b;->a:Ll/ciw;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onImageAvailable(Landroid/media/ImageReader;)V
    .locals 3
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x13
    .end annotation

    .line 1
    invoke-virtual {p1}, Landroid/media/ImageReader;->acquireNextImage()Landroid/media/Image;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object v0, p0, Ll/ciw$b;->a:Ll/ciw;

    .line 6
    .line 7
    const/4 v1, 0x2

    .line 8
    iget-object v2, v0, Ll/ciw;->A:[B

    .line 9
    .line 10
    invoke-static {p1, v1, v2}, Ll/zjm;->a(Landroid/media/Image;I[B)[B

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iput-object v1, v0, Ll/ciw;->A:[B

    .line 15
    .line 16
    iget-object v0, p0, Ll/ciw$b;->a:Ll/ciw;

    .line 17
    .line 18
    invoke-static {v0}, Ll/ciw;->O(Ll/ciw;)Ll/xpl$a;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    iget-object v0, p0, Ll/ciw$b;->a:Ll/ciw;

    .line 25
    .line 26
    invoke-static {v0}, Ll/ciw;->P(Ll/ciw;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-nez v0, :cond_0

    .line 31
    .line 32
    iget-object v0, p0, Ll/ciw$b;->a:Ll/ciw;

    .line 33
    .line 34
    invoke-static {v0}, Ll/ciw;->O(Ll/ciw;)Ll/xpl$a;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iget-object p0, p0, Ll/ciw$b;->a:Ll/ciw;

    .line 39
    .line 40
    iget-object p0, p0, Ll/ciw;->A:[B

    .line 41
    .line 42
    invoke-interface {v0, p0}, Ll/xpl$a;->onData([B)V

    .line 43
    .line 44
    .line 45
    :cond_0
    invoke-virtual {p1}, Landroid/media/Image;->close()V

    .line 46
    .line 47
    .line 48
    return-void
.end method
