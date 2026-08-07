.class public Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView$a;
.super Ll/dpf0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;->t0()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic c:Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;Ll/nxl;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView$a;->c:Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Ll/dpf0;-><init>(Ll/nxl;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView$a;->q()V

    return-void
.end method


# virtual methods
.method public e(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Ll/dpf0;->e(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView$a;->c:Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;

    .line 5
    .line 6
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;->n0(Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;Landroid/webkit/WebView;)V

    .line 7
    .line 8
    .line 9
    new-instance p0, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string p1, "onReceivedErrorX message = "

    .line 12
    .line 13
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const-string p1, "[live]operation"

    .line 24
    .line 25
    invoke-static {p1, p0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    const-class p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;

    .line 29
    .line 30
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-static {p2, p3, p4, p0}, Ll/awr;->b(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public f(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-super {p0, p1, p2}, Ll/dpf0;->f(Landroid/webkit/WebView;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView$a;->c:Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;

    .line 5
    .line 6
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;->m0(Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;)V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView$a;->c:Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/binding/LiveOperationWebViewBindings;->d:Ll/k3m;

    .line 12
    .line 13
    check-cast p1, Ll/p260;

    .line 14
    .line 15
    new-instance p2, Ll/h260;

    .line 16
    .line 17
    invoke-direct {p2, p0}, Ll/h260;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView$a;)V

    .line 18
    .line 19
    .line 20
    const-wide/16 v0, 0x1f4

    .line 21
    .line 22
    invoke-virtual {p1, v0, v1, p2}, Ll/i6t;->z3(JLjava/lang/Runnable;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final synthetic q()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView$a;->c:Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveOperationWebViewBindings;->f:Lcom/p1/mobile/putong/live/livingroom/increment/operation/OperationWebView;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
