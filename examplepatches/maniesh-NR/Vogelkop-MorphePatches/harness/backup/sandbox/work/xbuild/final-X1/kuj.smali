.class public final Lkuj;
.super Laii;
.source "SourceFile"


# instance fields
.field public final A:Ldx3;

.field public final B:Lumi;

.field public final C:Lh7b;

.field public final D:Lmni;

.field public final y:Landroid/net/Uri;

.field public final z:Landroid/net/Uri;


# direct methods
.method public constructor <init>(Lmej;Ldx3;Lumi;Landroid/net/Uri;Ljava/lang/String;Landroid/net/Uri;Lmni;)V
    .registers 9

    const-string v0, "image/png"

    invoke-direct {p0, p1, p2, v0}, Laii;-><init>(Lmej;Ldx3;Ljava/lang/String;)V

    iput-object p6, p0, Lkuj;->z:Landroid/net/Uri;

    iput-object p2, p0, Lkuj;->A:Ldx3;

    iput-object p3, p0, Lkuj;->B:Lumi;

    iput-object p4, p0, Lkuj;->y:Landroid/net/Uri;

    iput-object p7, p0, Lkuj;->D:Lmni;

    new-instance p1, Lh7b;

    invoke-direct {p1, p5}, Lh7b;-><init>(Ljava/lang/String;)V

    iput-object p1, p0, Lkuj;->C:Lh7b;

    return-void
.end method


# virtual methods
.method public final R(Lo93;)V
    .registers 2

    return-void
.end method

.method public final a(Landroid/content/Context;)Landroid/view/View;
    .registers 6

    invoke-super {p0, p1}, Liji;->a(Landroid/content/Context;)Landroid/view/View;

    move-result-object p1

    iget-object v0, p0, Lkuj;->C:Lh7b;

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Liji;->r(Lfji;Lwjh;)V

    new-instance v0, La3j;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, La3j;-><init>(B)V

    iget-object v1, p0, Lkuj;->B:Lumi;

    invoke-virtual {v1, v0}, Lumi;->e(Ln5o;)Lnml;

    move-result-object v0

    new-instance v2, Ltxi;

    const/16 v3, 0xa

    invoke-direct {v2, p0, v3}, Ltxi;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, v2}, Lumi;->f(Ln5o;)Lnml;

    move-result-object v1

    invoke-virtual {v0, v1}, Lnml;->b(Lnml;)V

    iget-object p0, p0, Lkuj;->z:Landroid/net/Uri;

    invoke-virtual {v0, p0}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-object p1
.end method

.method public final g()V
    .registers 1

    return-void
.end method

.method public final h(Landroid/net/Uri;Ljava/lang/String;)V
    .registers 7

    invoke-virtual {p0, p1, p2}, Laii;->a0(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    if-nez p1, :cond_7

    return-void

    :cond_7
    new-instance v0, Lroj;

    const/4 v1, 0x1

    invoke-direct {v0, p0, p1, v1}, Lroj;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v1, p0, Lkuj;->B:Lumi;

    invoke-virtual {v1, v0}, Lumi;->e(Ln5o;)Lnml;

    move-result-object v0

    new-instance v2, Lvdi;

    const/4 v3, 0x5

    invoke-direct {v2, p0, p1, p2, v3}, Lvdi;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v1, v2}, Lumi;->f(Ln5o;)Lnml;

    move-result-object p0

    invoke-virtual {v0, p0}, Lnml;->b(Lnml;)V

    const/4 p0, 0x0

    invoke-virtual {v0, p0}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void
.end method
