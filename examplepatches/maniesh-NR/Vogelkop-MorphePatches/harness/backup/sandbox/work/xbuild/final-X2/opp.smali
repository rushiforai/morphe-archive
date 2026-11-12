.class public final Lopp;
.super Landroid/widget/ImageView;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final a:Lcom/google/ads/interactivemedia/v3/impl/data/zzaz;

.field public final b:Lwpp;

.field public final c:Ljava/lang/String;

.field public final d:Ljava/util/ArrayList;

.field public final e:Lcom/google/ads/interactivemedia/v3/internal/zzfe;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lwpp;Lcom/google/ads/interactivemedia/v3/impl/data/zzaz;Ljava/lang/String;Ljava/util/ArrayList;Lcom/google/ads/interactivemedia/v3/internal/zzfe;)V
    .registers 7

    invoke-direct {p0, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lopp;->b:Lwpp;

    iput-object p3, p0, Lopp;->a:Lcom/google/ads/interactivemedia/v3/impl/data/zzaz;

    iput-object p4, p0, Lopp;->c:Ljava/lang/String;

    iput-object p5, p0, Lopp;->d:Ljava/util/ArrayList;

    iput-object p6, p0, Lopp;->e:Lcom/google/ads/interactivemedia/v3/internal/zzfe;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 3

    iget-object p1, p0, Lopp;->e:Lcom/google/ads/interactivemedia/v3/internal/zzfe;

    iget-object v0, p0, Lopp;->a:Lcom/google/ads/interactivemedia/v3/impl/data/zzaz;

    invoke-virtual {v0}, Lcom/google/ads/interactivemedia/v3/impl/data/zzaz;->a()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/google/ads/interactivemedia/v3/internal/zzfe;->a(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1a

    iget-object p0, p0, Lopp;->d:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-nez p1, :cond_1b

    :cond_1a
    return-void

    :cond_1b
    invoke-static {p0}, Lp3p;->g(Ljava/util/Iterator;)Ljava/lang/ClassCastException;

    move-result-object p0

    throw p0
.end method

.method public final setImageBitmap(Landroid/graphics/Bitmap;)V
    .registers 6

    invoke-super {p0, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    iget-object p1, p0, Lopp;->a:Lcom/google/ads/interactivemedia/v3/impl/data/zzaz;

    invoke-virtual {p1}, Lcom/google/ads/interactivemedia/v3/impl/data/zzaz;->b()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/google/ads/interactivemedia/v3/internal/zzou;->b(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2f

    iget-object v0, p0, Lopp;->c:Ljava/lang/String;

    invoke-static {v0}, Lcom/google/ads/interactivemedia/v3/internal/zzou;->b(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2f

    const/4 v1, 0x1

    invoke-static {v1}, Lcom/google/ads/interactivemedia/v3/internal/zzqj;->a(I)Ljava/util/HashMap;

    move-result-object v1

    const-string v2, "companionId"

    invoke-virtual {v1, v2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance p1, Lwmb;

    sget-object v2, Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgChannel;->displayContainer:Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgChannel;

    sget-object v3, Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgType;->companionView:Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgType;

    invoke-direct {p1, v2, v3, v0, v1}, Lwmb;-><init>(Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgChannel;Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgType;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object p0, p0, Lopp;->b:Lwpp;

    invoke-virtual {p0, p1}, Lwpp;->a(Lwmb;)V

    :cond_2f
    return-void
.end method
