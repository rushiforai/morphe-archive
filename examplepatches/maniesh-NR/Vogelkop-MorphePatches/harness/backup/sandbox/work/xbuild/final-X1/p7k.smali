.class public final Lp7k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltjn;


# instance fields
.field public final synthetic a:Lv7k;


# direct methods
.method public constructor <init>(Lv7k;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lp7k;->a:Lv7k;

    return-void
.end method


# virtual methods
.method public final a()I
    .registers 2

    iget-object p0, p0, Lp7k;->a:Lv7k;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const v0, 0x7f070152

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p0

    return p0
.end method

.method public final e()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lp7k;->a:Lv7k;

    invoke-virtual {p0}, Lv7k;->I0()Lc8k;

    move-result-object p0

    iget-object p0, p0, Lc8k;->d:Lb8k;

    iget-object p0, p0, Lb8k;->n:Lh42;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lz7k;

    if-eqz p0, :cond_17

    iget-object p0, p0, Lz7k;->a:Lknn;

    iget-object p0, p0, Lknn;->b:Ljava/lang/String;

    goto :goto_18

    :cond_17
    const/4 p0, 0x0

    :goto_18
    if-nez p0, :cond_1c

    const-string p0, ""

    :cond_1c
    return-object p0
.end method

.method public final i(Landroid/view/View;)V
    .registers 4

    iget-object p0, p0, Lp7k;->a:Lv7k;

    invoke-virtual {p0}, Lv7k;->I0()Lc8k;

    move-result-object p0

    iget-object p1, p0, Lc8k;->f:Lxln;

    new-instance v0, Ln6k;

    const/4 v1, 0x3

    invoke-direct {v0, p0, v1}, Ln6k;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p1, Lxln;->a:Lcom/opera/android/BrowserActivity;

    new-instance p1, Ltu;

    const/16 v1, 0xb

    invoke-direct {p1, v0, v1}, Ltu;-><init>(Ljava/lang/Object;B)V

    invoke-static {p0, p1}, Lb8h;->m(Landroid/content/Context;Lcom/opera/api/Callback;)V

    return-void
.end method

.method public final k(Landroid/view/View;)V
    .registers 4

    iget-object p0, p0, Lp7k;->a:Lv7k;

    invoke-virtual {p0}, Lv7k;->I0()Lc8k;

    move-result-object p0

    iget-object p0, p0, Lc8k;->f:Lxln;

    sget-object p1, Lvln;->b:Lvln;

    iget-object p0, p0, Lxln;->b:Lgjm;

    new-instance v0, Lrkn;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lrkn;-><init>(Lvln;Landroid/os/Bundle;)V

    const/4 p1, 0x0

    invoke-virtual {p0, v0, p1}, Lgjm;->e(Ln37;Z)V

    return-void
.end method

.method public final n(Laln;)V
    .registers 9

    iget-object p0, p0, Lp7k;->a:Lv7k;

    invoke-virtual {p0}, Lv7k;->I0()Lc8k;

    move-result-object p0

    invoke-interface {p1}, Laln;->getId()Ljava/lang/String;

    move-result-object v1

    iget-object p0, p0, Lc8k;->f:Lxln;

    sget-object p1, Lwln;->b:Lwln;

    iget-object p0, p0, Lxln;->b:Lgjm;

    new-instance v6, Ldmn;

    new-instance v0, Lcmn;

    const/4 v5, 0x1

    const/4 v4, 0x6

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-direct/range {v0 .. v5}, Lcmn;-><init>(Ljava/lang/String;Ljava/lang/String;IIZ)V

    invoke-direct {v6, p1, v0}, Ldmn;-><init>(Lwln;Lcmn;)V

    const/4 p1, 0x0

    invoke-virtual {p0, v6, p1}, Lgjm;->e(Ln37;Z)V

    return-void
.end method
