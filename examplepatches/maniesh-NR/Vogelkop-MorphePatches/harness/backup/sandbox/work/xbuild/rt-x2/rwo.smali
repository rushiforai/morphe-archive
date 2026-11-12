.class public final Lrwo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lem;
.implements Lhm;


# instance fields
.field public final synthetic a:Lnxo;


# direct methods
.method public constructor <init>(Lnxo;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrwo;->a:Lnxo;

    return-void
.end method


# virtual methods
.method public final a(Ljvg;)V
    .registers 5

    iget-object p1, p1, Ljvg;->b:Ljava/lang/Object;

    check-cast p1, Ldm;

    invoke-virtual {p1}, Ldm;->toString()Ljava/lang/String;

    const/4 v0, 0x0

    iget-object p0, p0, Lrwo;->a:Lnxo;

    iput-object v0, p0, Lnxo;->k:Ljava/lang/Object;

    iget-object v0, p0, Lnxo;->d:Lujo;

    iget-short v1, v0, Lujo;->c:S

    const/4 v2, 0x1

    and-int/2addr v1, v2

    if-eqz v1, :cond_1d

    iget-object v1, v0, Lujo;->a:Lqi8;

    invoke-virtual {v1}, Lqi8;->stop()V

    const/16 v1, 0x80

    iput-short v1, v0, Lujo;->c:S

    :cond_1d
    sget-object v0, Lbm;->f:Lbm;

    iput-object v0, p0, Lnxo;->l:Lbm;

    iget p1, p1, Ldm;->b:I

    if-ne p1, v2, :cond_37

    sget-object p1, Lbm;->d:Lbm;

    iput-object p1, p0, Lnxo;->l:Lbm;

    iget-object p0, p0, Lnxo;->g:Lfzo;

    if-eqz p0, :cond_4f

    iget-object p0, p0, Lk8;->b:Ljava/lang/Object;

    check-cast p0, Ldn;

    if-eqz p0, :cond_4f

    invoke-interface {p0, p1}, Ldn;->p(Lbm;)V

    return-void

    :cond_37
    iput-object v0, p0, Lnxo;->l:Lbm;

    iget-object p1, p0, Lnxo;->i:Lxup;

    if-eqz p1, :cond_40

    invoke-virtual {p1}, Lxup;->b()V

    :cond_40
    iget-object p1, p0, Lnxo;->g:Lfzo;

    if-eqz p1, :cond_4f

    iget-object p0, p0, Lnxo;->l:Lbm;

    iget-object p1, p1, Lk8;->a:Ljava/lang/Object;

    check-cast p1, Lwm;

    if-eqz p1, :cond_4f

    invoke-interface {p1, p0}, Lwm;->d(Lbm;)V

    :cond_4f
    return-void
.end method

.method public final b(Lzrp;)V
    .registers 6

    iget-object p0, p0, Lrwo;->a:Lnxo;

    iget-object v0, p0, Lnxo;->f:Ljava/util/ArrayList;

    iget v1, p1, Lzrp;->a:I

    sget-object v2, Liwo;->a:[I

    invoke-static {v1}, Lvep;->A(I)I

    move-result v1

    aget v1, v2, v1

    const/4 v2, 0x1

    if-eq v1, v2, :cond_5c

    const/4 v3, 0x2

    if-eq v1, v3, :cond_44

    const/4 p1, 0x3

    if-eq v1, p1, :cond_2b

    const/4 p1, 0x4

    if-eq v1, p1, :cond_2b

    const/4 p1, 0x5

    if-ne v1, p1, :cond_69

    iget-object p0, p0, Lnxo;->g:Lfzo;

    if-eqz p0, :cond_69

    iget-object p0, p0, Lk8;->a:Ljava/lang/Object;

    check-cast p0, Lwm;

    if-eqz p0, :cond_69

    invoke-interface {p0}, Lwm;->onAdClicked()V

    return-void

    :cond_2b
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p1

    const/4 v1, 0x0

    :goto_30
    if-ge v1, p1, :cond_3e

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v1, v1, 0x1

    check-cast v3, Lnwo;

    invoke-interface {v3}, Lnwo;->a()V

    goto :goto_30

    :cond_3e
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    iput-boolean v2, p0, Lnxo;->p:Z

    return-void

    :cond_44
    iget-object p1, p1, Lzrp;->b:Lcom/google/ads/interactivemedia/v3/impl/data/zzc;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Lcom/google/ads/interactivemedia/v3/impl/data/zzc;->a()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lnxo;->o:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/google/ads/interactivemedia/v3/impl/data/zzc;->c()I

    move-result v0

    invoke-virtual {p1}, Lcom/google/ads/interactivemedia/v3/impl/data/zzc;->b()I

    move-result p1

    iput v0, p0, Lnxo;->m:I

    iput p1, p0, Lnxo;->n:I

    return-void

    :cond_5c
    iget-object p0, p0, Lnxo;->g:Lfzo;

    if-eqz p0, :cond_69

    iget-object p0, p0, Lk8;->a:Ljava/lang/Object;

    check-cast p0, Lwm;

    if-eqz p0, :cond_69

    invoke-interface {p0}, Lwm;->g()V

    :cond_69
    return-void
.end method
