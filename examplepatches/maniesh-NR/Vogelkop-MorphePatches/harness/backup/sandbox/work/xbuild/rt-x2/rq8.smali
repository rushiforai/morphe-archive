.class public final Lrq8;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lr9i;

.field public final b:Lg77;

.field public final c:Llld;

.field public final d:Ljv1;

.field public final e:Ljv1;

.field public final f:Ljv1;

.field public final g:Lrb;

.field public final h:Lode;


# direct methods
.method public constructor <init>(Lr9i;Lg77;Llld;Luu1;Ljv1;Ljv1;Ljv1;Lrb;)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrq8;->a:Lr9i;

    iput-object p2, p0, Lrq8;->b:Lg77;

    iput-object p3, p0, Lrq8;->c:Llld;

    iput-object p5, p0, Lrq8;->d:Ljv1;

    iput-object p6, p0, Lrq8;->e:Ljv1;

    iput-object p7, p0, Lrq8;->f:Ljv1;

    iput-object p8, p0, Lrq8;->g:Lrb;

    new-instance p1, Lode;

    invoke-direct {p1}, Lekc;-><init>()V

    iput-object p1, p0, Lrq8;->h:Lode;

    new-instance p1, Loz2;

    const/4 p2, 0x2

    const/4 p4, 0x0

    invoke-direct {p1, p2, p0, p4}, Loz2;-><init>(BLjava/lang/Object;Z)V

    new-instance p2, Lhu5;

    const/16 p4, 0xa

    invoke-direct {p2, p1, p0, p4}, Lhu5;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p3, p2}, Llld;->e0(Lcom/opera/api/Callback;)V

    return-void
.end method


# virtual methods
.method public final a(Lnq8;Z)V
    .registers 6

    new-instance v0, Lrn9;

    const/16 v1, 0x10

    invoke-direct {v0, v1, p0, p1, p2}, Lrn9;-><init>(BLjava/lang/Object;Ljava/lang/Object;Z)V

    iget-object p0, p0, Lrq8;->a:Lr9i;

    iget-object p1, p0, Lr9i;->e:Ljava/lang/Object;

    check-cast p1, Lqie;

    iget-object p2, p0, Lr9i;->c:Ljava/lang/Object;

    check-cast p2, Lumi;

    new-instance v1, Lbm8;

    const/4 v2, 0x2

    invoke-direct {v1, p0, v2}, Lbm8;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p2, v1}, Lumi;->e(Ln5o;)Lnml;

    move-result-object p0

    new-instance v1, Lbm8;

    const/4 v2, 0x3

    invoke-direct {v1, v0, v2}, Lbm8;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p2, v1}, Lumi;->f(Ln5o;)Lnml;

    move-result-object p2

    invoke-virtual {p0, p2}, Lnml;->b(Lnml;)V

    new-instance p2, Loml;

    invoke-direct {p2, p0}, Loml;-><init>(Lnml;)V

    const/4 p0, 0x0

    invoke-virtual {p1, p2, p0}, Lqie;->n(Loml;Ljava/lang/Object;)Lp1j;

    return-void
.end method

.method public final b(Loq8;)V
    .registers 4

    iget-object p0, p0, Lrq8;->h:Lode;

    if-nez p1, :cond_f

    new-instance p1, Ljq8;

    sget-object v0, Ll08;->a:Ll08;

    invoke-direct {p1, v0, v0}, Ljq8;-><init>(Ljava/util/List;Ljava/util/List;)V

    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    :cond_f
    new-instance v0, Ljq8;

    iget-object v1, p1, Loq8;->b:Ljava/util/ArrayList;

    iget-object p1, p1, Loq8;->c:Ljava/util/ArrayList;

    invoke-direct {v0, v1, p1}, Ljq8;-><init>(Ljava/util/List;Ljava/util/List;)V

    invoke-virtual {p0, v0}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method
