.class public final Ly9p;
.super Laoo;
.source "SourceFile"


# static fields
.field public static final synthetic v:I


# instance fields
.field public final u:Ldcl;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ldcl;)V
    .registers 4

    iget-object v0, p2, Ldcl;->a:Ljava/lang/Object;

    check-cast v0, Ldzo;

    iget-object v0, v0, Ldzo;->c:Lnyo;

    invoke-direct {p0, p1, v0}, Laoo;-><init>(Landroid/content/Context;Landroid/view/View;)V

    iput-object p2, p0, Ly9p;->u:Ldcl;

    new-instance p1, Lh9p;

    invoke-direct {p1, p0}, Lh9p;-><init>(Ly9p;)V

    iget-object p2, p2, Ldcl;->a:Ljava/lang/Object;

    check-cast p2, Ldzo;

    iget-object p2, p2, Ldzo;->c:Lnyo;

    iget-object v0, p2, Lnyo;->a:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v0, -0x1

    invoke-direct {p1, v0, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, p2, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iput-object p2, p0, Laoo;->j:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final k()Landroid/view/View;
    .registers 1

    new-instance p0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p0
.end method

.method public final o()V
    .registers 2

    iget-object p0, p0, Ly9p;->u:Ldcl;

    iget-object v0, p0, Ldcl;->a:Ljava/lang/Object;

    check-cast v0, Ldzo;

    iget-object v0, v0, Ldzo;->c:Lnyo;

    invoke-static {v0}, Lupj;->j(Landroid/view/View;)V

    iget-object p0, p0, Ldcl;->a:Ljava/lang/Object;

    check-cast p0, Ldzo;

    iget-object v0, p0, Ldzo;->c:Lnyo;

    invoke-virtual {v0}, Landroid/view/View;->destroyDrawingCache()V

    invoke-virtual {v0}, Landroid/webkit/WebView;->destroy()V

    iget-object v0, p0, Ldzo;->b:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_21

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->clear()V

    const/4 v0, 0x0

    iput-object v0, p0, Ldzo;->b:Ljava/lang/ref/WeakReference;

    :cond_21
    return-void
.end method

.method public final p()V
    .registers 5

    iget-object v0, p0, Laoo;->o:Lsc;

    if-eqz v0, :cond_7

    invoke-virtual {v0}, Lsc;->a()V

    :cond_7
    iget-object p0, p0, Ly9p;->u:Ldcl;

    iget-object v0, p0, Ldcl;->a:Ljava/lang/Object;

    check-cast v0, Ldzo;

    iget-object v1, v0, Ldzo;->c:Lnyo;

    iget-boolean v2, v0, Ldzo;->f:Z

    if-nez v2, :cond_21

    invoke-virtual {v1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    invoke-virtual {v1}, Lnyo;->onPause()V

    const/4 v1, 0x1

    iput-boolean v1, v0, Ldzo;->f:Z

    :cond_21
    iget-object p0, p0, Ldcl;->a:Ljava/lang/Object;

    check-cast p0, Ldzo;

    iget-object p0, p0, Ldzo;->c:Lnyo;

    invoke-static {p0}, Lupj;->j(Landroid/view/View;)V

    return-void
.end method

.method public final q(Landroid/view/View;)V
    .registers 5

    iget-object v0, p0, Ly9p;->u:Ldcl;

    iget-object v0, v0, Ldcl;->a:Ljava/lang/Object;

    check-cast v0, Ldzo;

    iget-object v1, v0, Ldzo;->c:Lnyo;

    if-ne p1, v1, :cond_10

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    iput-wide v1, v0, Ldzo;->g:J

    :cond_10
    invoke-virtual {p0}, Laoo;->t()V

    return-void
.end method

.method public final r()V
    .registers 3

    iget-object p0, p0, Ly9p;->u:Ldcl;

    iget-object v0, p0, Ldcl;->a:Ljava/lang/Object;

    check-cast v0, Ldzo;

    iget-boolean v0, v0, Ldzo;->f:Z

    if-eqz v0, :cond_d

    invoke-virtual {p0}, Ldcl;->i()V

    :cond_d
    iget-object p0, p0, Ldcl;->a:Ljava/lang/Object;

    check-cast p0, Ldzo;

    iget-object p0, p0, Ldzo;->c:Lnyo;

    new-instance v0, Lz4d;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Lz4d;-><init>(B)V

    const-string v1, "(function() { try {   if (typeof fireOperaAdxImpressionEvent === \'function\') {       fireOperaAdxImpressionEvent();       return \'success\';   }   return \'fireOperaAdxImpressionEvent not defined\'; } catch(e) {   return \'error: \' + e.message; }})()"

    invoke-virtual {p0, v1, v0}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    return-void
.end method
