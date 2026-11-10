.class public final LT/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:LT/d;


# direct methods
.method public constructor <init>(LT/d;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, LT/a;->b:LT/d;

    iput-object p2, p0, LT/a;->a:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 2

    check-cast p1, Landroid/webkit/WebView;

    invoke-virtual {p1}, Landroid/webkit/WebView;->getHitTestResult()Landroid/webkit/WebView$HitTestResult;

    iget-object p1, p0, LT/a;->b:LT/d;

    iget-object p1, p1, LT/d;->c:Ljava/lang/Object;

    check-cast p1, LC/j;

    if-eqz p1, :cond_0

    iget-object p2, p0, LT/a;->a:Ljava/lang/String;

    iget-object p1, p1, LC/j;->b:Ljava/lang/Object;

    check-cast p1, LC/j;

    iget-object v0, p1, LC/j;->b:Ljava/lang/Object;

    check-cast v0, LQ/h;

    iget-object v0, v0, LQ/h;->d:Ljava/lang/Object;

    check-cast v0, LT/g;

    iget-object v1, v0, LT/g;->p:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p1, p1, LC/j;->b:Ljava/lang/Object;

    check-cast p1, LQ/h;

    iget-object p1, p1, LQ/h;->d:Ljava/lang/Object;

    check-cast p1, LT/g;

    iget-object v0, p1, LT/g;->p:Ljava/lang/String;

    iget-object v1, p1, LT/g;->n:Ljava/lang/String;

    invoke-virtual {p1, v0, p2, v1}, LT/g;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    const/4 p1, 0x0

    return p1
.end method
