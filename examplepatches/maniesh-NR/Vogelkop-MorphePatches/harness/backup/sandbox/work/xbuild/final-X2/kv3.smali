.class public final Lkv3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;


# instance fields
.field public final synthetic a:Landroid/view/View;

.field public final synthetic b:Lcom/opera/android/BrowserActivity;


# direct methods
.method public constructor <init>(Landroid/view/View;Lcom/opera/android/BrowserActivity;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lkv3;->a:Landroid/view/View;

    iput-object p2, p0, Lkv3;->b:Lcom/opera/android/BrowserActivity;

    return-void
.end method


# virtual methods
.method public final onPreDraw()Z
    .registers 4

    iget-object v0, p0, Lkv3;->a:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    iget-object p0, p0, Lkv3;->b:Lcom/opera/android/BrowserActivity;

    iget-object v0, p0, Lcom/opera/android/BrowserActivity;->x:Lumi;

    new-instance v1, Lqt3;

    const/16 v2, 0x13

    invoke-direct {v1, p0, v2}, Lqt3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    invoke-interface {v0, v1}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object p0

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lnml;->a(Ljava/lang/Object;)Loml;

    const/4 p0, 0x1

    return p0
.end method
