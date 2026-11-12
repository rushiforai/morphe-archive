.class public final Lwz2;
.super Lzz2;
.source "SourceFile"


# instance fields
.field public final synthetic d:Lro9;

.field public final synthetic e:Lami;


# direct methods
.method public constructor <init>(Lami;Lumi;ILro9;Lro9;)V
    .registers 6

    iput-object p5, p0, Lwz2;->d:Lro9;

    iput-object p1, p0, Lwz2;->e:Lami;

    invoke-direct {p0, p2, p3, p4}, Lzz2;-><init>(Lumi;ILro9;)V

    new-instance p2, Ln9k;

    new-instance p3, Lfv2;

    const/4 p4, 0x2

    invoke-direct {p3, p0, p4}, Lfv2;-><init>(Ljava/lang/Object;B)V

    invoke-direct {p2, p3}, Ln9k;-><init>(Ljava/lang/Object;)V

    iget-object p0, p1, Lami;->d:Ljava/lang/Object;

    check-cast p0, Lvp5;

    new-instance p1, Lqlk;

    const/16 p3, 0xa

    invoke-direct {p1, p2, p3}, Lqlk;-><init>(Ljava/lang/Object;B)V

    iget-object p3, p0, Lvp5;->f:Lcom/opera/android/browser/chromium/ChromiumContainerView;

    iget-object p3, p3, Lcom/opera/android/browser/chromium/ChromiumContainerView;->a:Lckf;

    iget-object p3, p3, Lckf;->k:Ljava/util/ArrayList;

    invoke-virtual {p3, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance p1, Lvr9;

    const/16 p3, 0x14

    const/4 p4, 0x0

    invoke-direct {p1, p3, p2, p0, p4}, Lvr9;-><init>(BLjava/lang/Object;Ljava/lang/Object;Z)V

    iget-object p0, p0, Lvp5;->f:Lcom/opera/android/browser/chromium/ChromiumContainerView;

    iget-object p0, p0, Lcom/opera/android/browser/chromium/ChromiumContainerView;->a:Lckf;

    iget-object p2, p0, Lckf;->l:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p2

    if-eqz p2, :cond_40

    const/4 p2, 0x1

    iget-wide p3, p0, Lorg/chromium/components/embedder_support/view/ContentViewRenderView;->a:J

    invoke-static {p3, p4, p2}, LJ/N;->MTRhfnYH(JZ)V

    :cond_40
    iget-object p0, p0, Lckf;->l:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method


# virtual methods
.method public final a(Z)V
    .registers 4

    iget-object v0, p0, Lzz2;->c:Ljava/lang/Object;

    check-cast v0, Loml;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Loml;->cancel(Z)Z

    const/4 v0, 0x1

    iput-boolean v0, p0, Lzz2;->a:Z

    if-eqz p1, :cond_18

    iget-object p1, p0, Lwz2;->e:Lami;

    iget-object v0, p1, Lami;->g:Ljava/lang/Object;

    check-cast v0, Lro9;

    iget-object p0, p0, Lwz2;->d:Lro9;

    invoke-virtual {p1, v0, p0}, Lami;->x(Lro9;Lro9;)V

    :cond_18
    return-void
.end method

.method public final b()V
    .registers 4

    iget-object v0, p0, Lwz2;->e:Lami;

    iget-object v1, v0, Lami;->g:Ljava/lang/Object;

    check-cast v1, Lro9;

    iget-object v2, p0, Lwz2;->d:Lro9;

    invoke-virtual {v0, v1, v2}, Lami;->y(Lro9;Lro9;)V

    iget-object p0, p0, Lzz2;->b:Ljava/lang/Object;

    check-cast p0, Lro9;

    invoke-virtual {v0, p0}, Lami;->t(Lro9;)V

    const/4 p0, 0x0

    iput-object p0, v0, Lami;->h:Ljava/lang/Object;

    return-void
.end method
