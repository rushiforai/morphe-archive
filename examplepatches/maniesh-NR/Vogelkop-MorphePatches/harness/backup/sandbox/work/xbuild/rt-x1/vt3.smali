.class public final synthetic Lvt3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalFocusChangeListener;


# instance fields
.field public final synthetic a:Lc37;

.field public final synthetic b:Lcom/opera/android/BrowserActivity;

.field public final synthetic c:Lc37;


# direct methods
.method public synthetic constructor <init>(Lc37;Lcom/opera/android/BrowserActivity;Lc37;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lvt3;->a:Lc37;

    iput-object p2, p0, Lvt3;->b:Lcom/opera/android/BrowserActivity;

    iput-object p3, p0, Lvt3;->c:Lc37;

    return-void
.end method


# virtual methods
.method public final onGlobalFocusChanged(Landroid/view/View;Landroid/view/View;)V
    .registers 8

    sget p1, Lcom/opera/android/BrowserActivity;->E1:I

    iget-object p1, p0, Lvt3;->b:Lcom/opera/android/BrowserActivity;

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eqz p2, :cond_14

    invoke-virtual {p1}, Lt5d;->e0()Lcom/opera/android/browser/chromium/ChromiumContainerView;

    move-result-object v2

    invoke-static {v2, p2}, Lq9n;->w(Landroid/view/ViewGroup;Landroid/view/View;)Z

    move-result v2

    if-eqz v2, :cond_14

    move v2, v1

    goto :goto_15

    :cond_14
    move v2, v0

    :goto_15
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    iget-object v3, p0, Lvt3;->a:Lc37;

    iget-object v3, v3, Lc37;->a:Ljava/lang/Object;

    check-cast v3, Lnak;

    const/4 v4, 0x0

    invoke-virtual {v3, v4, v2}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    if-eqz p2, :cond_31

    iget-object p1, p1, Lcom/opera/android/BrowserActivity;->A:Lcom/opera/android/bar/BottomBar;

    if-nez p1, :cond_2a

    move-object p1, v4

    :cond_2a
    invoke-static {p1, p2}, Lq9n;->w(Landroid/view/ViewGroup;Landroid/view/View;)Z

    move-result p1

    if-eqz p1, :cond_31

    move v0, v1

    :cond_31
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    iget-object p0, p0, Lvt3;->c:Lc37;

    iget-object p0, p0, Lc37;->a:Ljava/lang/Object;

    check-cast p0, Lnak;

    invoke-virtual {p0, v4, p1}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    return-void
.end method
