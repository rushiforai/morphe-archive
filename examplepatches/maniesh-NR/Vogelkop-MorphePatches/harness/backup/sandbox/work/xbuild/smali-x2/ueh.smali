.class public final Lueh;
.super Laii;
.source "SourceFile"


# instance fields
.field public final A:Lnqi;

.field public final B:Lj3i;

.field public final C:Ljava/lang/String;

.field public final D:Ljava/lang/String;

.field public final E:Landroid/net/Uri;

.field public final F:J

.field public final G:Ljvg;

.field public final y:Lumi;

.field public final z:Lag7;


# direct methods
.method public constructor <init>(Lmej;Lumi;Ldx3;Lag7;Lnqi;Lj3i;Landroid/net/Uri;Ljava/lang/String;J)V
    .registers 12

    const-string v0, "image/png"

    invoke-direct {p0, p1, p3, v0}, Laii;-><init>(Lmej;Ldx3;Ljava/lang/String;)V

    iput-object p2, p0, Lueh;->y:Lumi;

    iput-object p4, p0, Lueh;->z:Lag7;

    iput-object p5, p0, Lueh;->A:Lnqi;

    iput-object p6, p0, Lueh;->B:Lj3i;

    const-string p1, "png"

    iput-object p1, p0, Lueh;->C:Ljava/lang/String;

    iput-object v0, p0, Lueh;->D:Ljava/lang/String;

    iput-object p7, p0, Lueh;->E:Landroid/net/Uri;

    iput-wide p9, p0, Lueh;->F:J

    new-instance p1, Ljvg;

    const/4 p2, 0x1

    const/4 p3, 0x0

    invoke-direct {p1, p2, p8, p0, p3}, Ljvg;-><init>(BLjava/lang/Object;Ljava/lang/Object;Z)V

    iput-object p1, p0, Lueh;->G:Ljvg;

    return-void
.end method


# virtual methods
.method public final R(Lo93;)V
    .registers 2

    return-void
.end method

.method public final a(Landroid/content/Context;)Landroid/view/View;
    .registers 4

    invoke-super {p0, p1}, Liji;->a(Landroid/content/Context;)Landroid/view/View;

    move-result-object p1

    iget-object v0, p0, Lueh;->G:Ljvg;

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Liji;->r(Lfji;Lwjh;)V

    return-object p1
.end method

.method public final g()V
    .registers 1

    return-void
.end method

.method public final h(Landroid/net/Uri;Ljava/lang/String;)V
    .registers 6

    invoke-virtual {p0, p1, p2}, Laii;->a0(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    if-nez p1, :cond_7

    return-void

    :cond_7
    new-instance v0, Lmgf;

    const/16 v1, 0xa

    invoke-direct {v0, p0, p1, v1}, Lmgf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v1, p0, Lueh;->y:Lumi;

    invoke-virtual {v1, v0}, Lumi;->e(Ln5o;)Lnml;

    move-result-object v0

    new-instance v1, La32;

    const/16 v2, 0x1c

    invoke-direct {v1, p0, p1, p2, v2}, La32;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Lnml;->c(Ln5o;)Loml;

    move-result-object p0

    const/4 p1, 0x0

    invoke-virtual {p0, p1, p1}, Loml;->a(Ljava/lang/Object;Ljri;)V

    return-void
.end method
