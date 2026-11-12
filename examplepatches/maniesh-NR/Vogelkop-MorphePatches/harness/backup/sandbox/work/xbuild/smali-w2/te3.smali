.class public final synthetic Lte3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lfbh;


# instance fields
.field public final synthetic a:Laf3;


# direct methods
.method public synthetic constructor <init>(Laf3;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lte3;->a:Laf3;

    return-void
.end method


# virtual methods
.method public final a(Lmf3;Ljava/util/List;)V
    .registers 11

    iget-object p0, p0, Lte3;->a:Laf3;

    iget-object p0, p0, Laf3;->e:Ljava/util/ArrayList;

    iget v0, p1, Lmf3;->a:I

    const/4 v1, 0x1

    if-nez v0, :cond_7c

    if-eqz p2, :cond_7c

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_f
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_7b

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lvah;

    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1f
    :goto_1f
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_f

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lxe3;

    invoke-virtual {p2}, Lvah;->a()Ljava/util/ArrayList;

    move-result-object v3

    iget-object v4, p2, Lvah;->c:Lorg/json/JSONObject;

    iget-object v5, v2, Lxe3;->a:Lnsh;

    iget-object v5, v5, Lnsh;->a:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1f

    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    iget-object v2, v2, Lxe3;->b:Llh4;

    new-instance v3, Lff3;

    new-instance v5, Lif3;

    const-string v6, "token"

    const-string v7, "purchaseToken"

    invoke-virtual {v4, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v6, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    const-string v6, "orderId"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    const-string v6, "developerPayload"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    invoke-virtual {p2}, Lvah;->a()Ljava/util/ArrayList;

    move-result-object v6

    invoke-static {v6}, Lh1b;->s(Ljava/util/Collection;)Lh1b;

    const-string v6, "acknowledged"

    invoke-virtual {v4, v6, v1}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    const-string v6, "purchaseTime"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    const/4 v4, 0x5

    sget-object v6, Ljf3;->a:Ljf3;

    invoke-direct {v5, v6, v4}, Ln1;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v3, v5, v6}, Lk8;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v2, v3}, Llh4;->run(Ljava/lang/Object;)V

    goto :goto_1f

    :cond_7b
    return-void

    :cond_7c
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p2

    const/4 v0, 0x0

    :goto_81
    if-ge v0, p2, :cond_a9

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v0, v0, 0x1

    check-cast v2, Lxe3;

    iget-object v2, v2, Lxe3;->b:Llh4;

    new-instance v3, Lff3;

    iget v4, p1, Lmf3;->a:I

    if-ne v4, v1, :cond_99

    new-instance v4, Lef3;

    invoke-direct {v4}, Lef3;-><init>()V

    goto :goto_9e

    :cond_99
    new-instance v4, Lgf3;

    invoke-direct {v4}, Lgf3;-><init>()V

    :goto_9e
    iget-object v5, v4, Ln1;->b:Ljava/lang/Object;

    check-cast v5, Ljf3;

    invoke-direct {v3, v4, v5}, Lk8;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v2, v3}, Llh4;->run(Ljava/lang/Object;)V

    goto :goto_81

    :cond_a9
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    return-void
.end method
