.class public Ll/qa$c;
.super Ll/dpf0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/qa;->z()Ll/dpf0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic c:Ll/dpf0;

.field public final synthetic d:Ll/qa;


# direct methods
.method public constructor <init>(Ll/qa;Ll/nxl;Ll/dpf0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/qa$c;->d:Ll/qa;

    .line 2
    .line 3
    iput-object p3, p0, Ll/qa$c;->c:Ll/dpf0;

    .line 4
    .line 5
    invoke-direct {p0, p2}, Ll/dpf0;-><init>(Ll/nxl;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public e(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qa$c;->c:Ll/dpf0;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/qa$c;->c:Ll/dpf0;

    .line 10
    .line 11
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/dpf0;->e(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public f(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/qa$c;->d:Ll/qa;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/qa;->b0()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/qa$c;->d:Ll/qa;

    .line 10
    .line 11
    iget-object v1, v0, Ll/pd00;->g:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 12
    .line 13
    invoke-virtual {v1}, Landroid/webkit/WebView;->getTitle()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-static {v0, v1}, Ll/qa;->Y(Ll/qa;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object v0, p0, Ll/qa$c;->c:Ll/dpf0;

    .line 21
    .line 22
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    iget-object p0, p0, Ll/qa$c;->c:Ll/dpf0;

    .line 29
    .line 30
    invoke-virtual {p0, p1, p2}, Ll/dpf0;->f(Landroid/webkit/WebView;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    :cond_1
    return-void
.end method

.method public g(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qa$c;->c:Ll/dpf0;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/qa$c;->c:Ll/dpf0;

    .line 10
    .line 11
    invoke-virtual {p0, p1, p2, p3}, Ll/dpf0;->g(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public l(Landroid/webkit/WebView;Landroid/webkit/RenderProcessGoneDetail;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qa$c;->c:Ll/dpf0;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/qa$c;->c:Ll/dpf0;

    .line 10
    .line 11
    invoke-virtual {p0, p1, p2}, Ll/ilw;->l(Landroid/webkit/WebView;Landroid/webkit/RenderProcessGoneDetail;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method
