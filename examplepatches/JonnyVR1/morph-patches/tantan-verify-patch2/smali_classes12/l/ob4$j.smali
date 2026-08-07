.class Ll/ob4$j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ppw;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/ob4;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/ob4;


# direct methods
.method public constructor <init>(Ll/ob4;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ob4$j;->a:Ll/ob4;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Landroid/graphics/Bitmap;Ljava/lang/Exception;)V
    .locals 2

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Ll/ob4$j;->a:Ll/ob4;

    .line 4
    .line 5
    invoke-static {v0}, Ll/ob4;->a(Ll/ob4;)Ll/qpw;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/ob4$j;->a:Ll/ob4;

    .line 12
    .line 13
    invoke-static {v0}, Ll/ob4;->a(Ll/ob4;)Ll/qpw;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const/4 v1, -0x1

    .line 18
    invoke-interface {v0, v1, p2}, Ll/qpw;->a(ILjava/lang/Exception;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    iget-object p2, p0, Ll/ob4$j;->a:Ll/ob4;

    .line 22
    .line 23
    iget-object p2, p2, Ll/ob4;->f0:Ll/c3i0;

    .line 24
    .line 25
    invoke-virtual {p2, p1}, Ll/c3i0;->e(Landroid/graphics/Bitmap;)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Ll/ob4$j;->a:Ll/ob4;

    .line 29
    .line 30
    invoke-static {p0}, Ll/ob4;->f(Ll/ob4;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method
