.class public final Lyln;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltjn;


# instance fields
.field public final synthetic a:Ljvg;

.field public final synthetic b:Lbmn;


# direct methods
.method public constructor <init>(Lbmn;Ljvg;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lyln;->a:Ljvg;

    iput-object p1, p0, Lyln;->b:Lbmn;

    return-void
.end method


# virtual methods
.method public final a()I
    .registers 1

    iget-object p0, p0, Lyln;->b:Lbmn;

    iget p0, p0, Lbmn;->g:I

    return p0
.end method

.method public final d()Z
    .registers 1

    iget-object p0, p0, Lyln;->b:Lbmn;

    iget-object p0, p0, Lbmn;->b:Lqln;

    invoke-virtual {p0}, Lqln;->g()Z

    move-result p0

    return p0
.end method

.method public final e()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lyln;->b:Lbmn;

    iget-object p0, p0, Lbmn;->b:Lqln;

    invoke-virtual {p0}, Lqln;->i()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final f()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lyln;->b:Lbmn;

    iget-object p0, p0, Lbmn;->b:Lqln;

    invoke-virtual {p0}, Lqln;->f()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final i(Landroid/view/View;)V
    .registers 6

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object p0, p0, Lyln;->a:Ljvg;

    iget-object v1, p0, Ljvg;->b:Ljava/lang/Object;

    check-cast v1, Lqf;

    new-instance v2, Ls2g;

    const/16 v3, 0xe

    invoke-direct {v2, p0, p1, v1, v3}, Ls2g;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v0, v2}, Lb8h;->m(Landroid/content/Context;Lcom/opera/api/Callback;)V

    return-void
.end method

.method public final k(Landroid/view/View;)V
    .registers 4

    iget-object p0, p0, Lyln;->a:Ljvg;

    iget-object p1, p0, Ljvg;->c:Ljava/lang/Object;

    check-cast p1, Lbmn;

    sget-object v0, Lru0;->e:Lru0;

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lbmn;->f(Lru0;Ljava/lang/String;)V

    iget-object p0, p0, Ljvg;->b:Ljava/lang/Object;

    check-cast p0, Lqf;

    invoke-virtual {p0}, Ldej;->b()V

    invoke-virtual {p1}, Lbmn;->h()V

    return-void
.end method

.method public final n(Laln;)V
    .registers 2

    invoke-interface {p1}, Laln;->getId()Ljava/lang/String;

    move-result-object p1

    iget-object p0, p0, Lyln;->a:Ljvg;

    iget-object p0, p0, Ljvg;->c:Ljava/lang/Object;

    check-cast p0, Lbmn;

    invoke-virtual {p0, p1}, Lbmn;->e(Ljava/lang/String;)V

    return-void
.end method
