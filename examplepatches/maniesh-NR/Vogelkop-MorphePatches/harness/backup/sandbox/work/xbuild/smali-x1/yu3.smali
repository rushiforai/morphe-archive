.class public final Lyu3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltvb;
.implements Lw9l;


# instance fields
.field public final synthetic a:Lcom/opera/android/BrowserActivity;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/BrowserActivity;)V
    .registers 2

    iput-object p1, p0, Lyu3;->a:Lcom/opera/android/BrowserActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final L(Ljava/lang/Long;)V
    .registers 3

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    iget-object p0, p0, Lyu3;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->P0()Lgjm;

    move-result-object p0

    new-instance v0, Lxl3;

    invoke-direct {v0, p1}, Lxl3;-><init>(Ljava/lang/Long;)V

    const/4 p1, 0x0

    invoke-virtual {p0, v0, p1}, Lgjm;->e(Ln37;Z)V

    return-void
.end method

.method public final a()Z
    .registers 2

    iget-object p0, p0, Lyu3;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0}, Landroidx/fragment/app/r;->getSupportFragmentManager()Landroidx/fragment/app/w;

    move-result-object p0

    invoke-static {p0}, Lcqp;->d0(Landroidx/fragment/app/w;)I

    move-result p0

    const/4 v0, 0x1

    if-eq p0, v0, :cond_e

    return v0

    :cond_e
    const/4 p0, 0x0

    return p0
.end method

.method public final h0(Lb2l;Lcom/opera/android/browser/TabInfo;)Lb2l;
    .registers 10

    move-object v0, p1

    check-cast v0, Ld7l;

    iget-object v0, v0, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->m()Z

    move-result v2

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    sget-object v5, Llqm;->l:Llqm;

    iget-object v1, p0, Lyu3;->a:Lcom/opera/android/BrowserActivity;

    const/4 v4, 0x0

    move-object v3, p1

    move-object v6, p2

    invoke-virtual/range {v1 .. v6}, Lcom/opera/android/BrowserActivity;->i0(ZLb2l;ZLlqm;Lcom/opera/android/browser/TabInfo;)Ld7l;

    move-result-object p0

    return-object p0
.end method

.method public final j0(Lp6l;Lcom/opera/android/browser/TabInfo;)Lb2l;
    .registers 5

    sget-object v0, Lp6l;->b:Lp6l;

    const/4 v1, 0x0

    if-ne p1, v0, :cond_7

    const/4 p1, 0x1

    goto :goto_8

    :cond_7
    move p1, v1

    :goto_8
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    iget-object p0, p0, Lyu3;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0, p1, v1, p2}, Lcom/opera/android/BrowserActivity;->j1(ZZLcom/opera/android/browser/TabInfo;)Ld7l;

    move-result-object p0

    return-object p0
.end method

.method public final k(Lp6l;)Lb2l;
    .registers 8

    sget-object v0, Lp6l;->b:Lp6l;

    if-ne p1, v0, :cond_7

    const/4 p1, 0x1

    :goto_5
    move v1, p1

    goto :goto_9

    :cond_7
    const/4 p1, 0x0

    goto :goto_5

    :goto_9
    sget p1, Lcom/opera/android/BrowserActivity;->E1:I

    const/4 v3, 0x0

    sget-object v4, Llqm;->l:Llqm;

    iget-object v0, p0, Lyu3;->a:Lcom/opera/android/BrowserActivity;

    const/4 v2, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Lcom/opera/android/BrowserActivity;->i0(ZLb2l;ZLlqm;Lcom/opera/android/browser/TabInfo;)Ld7l;

    move-result-object p0

    return-object p0
.end method

.method public final run()V
    .registers 4

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    iget-object p0, p0, Lyu3;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0}, Landroidx/fragment/app/r;->getSupportFragmentManager()Landroidx/fragment/app/w;

    move-result-object v0

    invoke-static {v0}, Lcqp;->d0(Landroidx/fragment/app/w;)I

    move-result v0

    if-eqz v0, :cond_1d

    const/4 v1, 0x2

    if-eq v0, v1, :cond_12

    return-void

    :cond_12
    invoke-virtual {p0}, Landroidx/fragment/app/r;->getSupportFragmentManager()Landroidx/fragment/app/w;

    move-result-object p0

    const/4 v0, 0x1

    const/4 v1, -0x1

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v0, v2}, Landroidx/fragment/app/w;->Y(IILjava/lang/String;)Z

    return-void

    :cond_1d
    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->v1()V

    return-void
.end method

.method public final y()V
    .registers 2

    const-class v0, Ld8j;

    iget-object p0, p0, Lyu3;->a:Lcom/opera/android/BrowserActivity;

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->g0:Lwub;

    invoke-virtual {p0, v0}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object p0

    check-cast p0, Ld8j;

    const/4 v0, 0x0

    new-array v0, v0, [I

    check-cast p0, Lg8j;

    invoke-virtual {p0, v0}, Lg8j;->d([I)V

    return-void
.end method
