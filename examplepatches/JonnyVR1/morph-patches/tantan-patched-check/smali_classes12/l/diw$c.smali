.class Ll/diw$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/media/ImageReader$OnImageAvailableListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/diw;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/diw;


# direct methods
.method public constructor <init>(Ll/diw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/diw$c;->a:Ll/diw;

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

    .line 1
    invoke-virtual {p1}, Landroid/media/ImageReader;->acquireNextImage()Landroid/media/Image;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object v0, p0, Ll/diw$c;->a:Ll/diw;

    .line 6
    .line 7
    const/4 v1, 0x2

    .line 8
    iget-object v2, v0, Ll/diw;->z:[B

    .line 9
    .line 10
    invoke-static {p1, v1, v2}, Ll/yjm;->a(Landroid/media/Image;I[B)[B

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iput-object v1, v0, Ll/diw;->z:[B

    .line 15
    .line 16
    iget-object v0, p0, Ll/diw$c;->a:Ll/diw;

    .line 17
    .line 18
    invoke-static {v0}, Ll/diw;->X(Ll/diw;)Ll/ypl$a;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    iget-object v0, p0, Ll/diw$c;->a:Ll/diw;

    .line 25
    .line 26
    invoke-static {v0}, Ll/diw;->Y(Ll/diw;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-nez v0, :cond_0

    .line 31
    .line 32
    iget-object v0, p0, Ll/diw$c;->a:Ll/diw;

    .line 33
    .line 34
    invoke-static {v0}, Ll/diw;->X(Ll/diw;)Ll/ypl$a;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iget-object v1, p0, Ll/diw$c;->a:Ll/diw;

    .line 39
    .line 40
    iget-object v1, v1, Ll/diw;->z:[B

    .line 41
    .line 42
    invoke-interface {v0, v1}, Ll/ypl$a;->onData([B)V

    .line 43
    .line 44
    .line 45
    :cond_0
    iget-object p0, p0, Ll/diw$c;->a:Ll/diw;

    .line 46
    .line 47
    invoke-static {p0}, Ll/diw;->z(Ll/diw;)Ll/gql;

    .line 48
    .line 49
    .line 50
    invoke-virtual {p1}, Landroid/media/Image;->close()V

    .line 51
    .line 52
    .line 53
    return-void
.end method
