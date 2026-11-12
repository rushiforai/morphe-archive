.class public final Lzgo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Leig;


# instance fields
.field public final synthetic a:Lkvo;

.field public final synthetic b:Lujo;


# direct methods
.method public constructor <init>(Lujo;Lkvo;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lzgo;->b:Lujo;

    iput-object p2, p0, Lzgo;->a:Lkvo;

    return-void
.end method


# virtual methods
.method public final F(Lrhg;)V
    .registers 8

    const/16 p1, 0x100

    iget-object p0, p0, Lzgo;->b:Lujo;

    iput-short p1, p0, Lujo;->c:S

    iget-object p0, p0, Lujo;->d:Ln9h;

    if-eqz p0, :cond_37

    iget-object p1, p0, Ln9h;->c:Ljava/lang/Object;

    check-cast p1, Ljn;

    if-eqz p1, :cond_37

    iget-object p1, p0, Ln9h;->b:Ljava/lang/Object;

    check-cast p1, Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :cond_19
    :goto_19
    if-ge v1, v0, :cond_37

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v1, v1, 0x1

    check-cast v2, Lvsp;

    iget-object v3, p0, Ln9h;->c:Ljava/lang/Object;

    check-cast v3, Ljn;

    iget-boolean v4, v2, Lvsp;->c:Z

    if-eqz v4, :cond_19

    sget-object v4, Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgType;->error:Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgType;

    const/4 v5, 0x0

    invoke-virtual {v2, v4, v3, v5}, Lvsp;->a(Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgType;Ljn;Ljava/lang/Object;)V

    iget-object v2, v2, Lvsp;->a:Ljava/util/HashMap;

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_19

    :cond_37
    return-void
.end method

.method public final P(Z)V
    .registers 2

    iget-object p0, p0, Lzgo;->b:Lujo;

    iget-object p1, p0, Lujo;->f:Landroid/view/TextureView;

    if-eqz p1, :cond_e

    invoke-virtual {p1}, Landroid/view/TextureView;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object p1

    if-eqz p1, :cond_e

    iput-object p1, p0, Lujo;->e:Landroid/graphics/Bitmap;

    :cond_e
    return-void
.end method

.method public final h(I)V
    .registers 8

    const/4 v0, 0x3

    iget-object v1, p0, Lzgo;->b:Lujo;

    if-ne p1, v0, :cond_1b

    const/16 p1, 0x9

    iput-short p1, v1, Lujo;->c:S

    iget-object p0, p0, Lzgo;->a:Lkvo;

    iget-object p0, p0, Lkvo;->a:Lnxo;

    iget-object p0, p0, Lnxo;->g:Lfzo;

    if-eqz p0, :cond_53

    iget-object p0, p0, Lk8;->b:Ljava/lang/Object;

    check-cast p0, Ldn;

    if-eqz p0, :cond_53

    invoke-interface {p0}, Ldn;->i()V

    return-void

    :cond_1b
    const/4 p0, 0x4

    if-ne p1, p0, :cond_53

    const/16 p0, 0x41

    iput-short p0, v1, Lujo;->c:S

    iget-object p0, v1, Lujo;->d:Ln9h;

    if-eqz p0, :cond_53

    iget-object p1, p0, Ln9h;->c:Ljava/lang/Object;

    check-cast p1, Ljn;

    if-eqz p1, :cond_53

    iget-object p1, p0, Ln9h;->b:Ljava/lang/Object;

    check-cast p1, Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :cond_35
    :goto_35
    if-ge v1, v0, :cond_53

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v1, v1, 0x1

    check-cast v2, Lvsp;

    iget-object v3, p0, Ln9h;->c:Ljava/lang/Object;

    check-cast v3, Ljn;

    iget-boolean v4, v2, Lvsp;->c:Z

    if-eqz v4, :cond_35

    sget-object v4, Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgType;->end:Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgType;

    const/4 v5, 0x0

    invoke-virtual {v2, v4, v3, v5}, Lvsp;->a(Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgType;Ljn;Ljava/lang/Object;)V

    iget-object v2, v2, Lvsp;->a:Ljava/util/HashMap;

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_35

    :cond_53
    return-void
.end method
