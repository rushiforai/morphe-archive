.class public final synthetic Lrx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ldy;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lrx;->a:B

    iput-object p1, p0, Lrx;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final s(Lml;)V
    .registers 9

    iget-byte v0, p0, Lrx;->a:B

    iget-object p0, p0, Lrx;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_106

    check-cast p0, Ls9i;

    iget-object p1, p1, Lml;->h:Lil;

    iput-object p1, p0, Ls9i;->e:Ljava/lang/Object;

    return-void

    :pswitch_e
    check-cast p0, Lnhb;

    iget-object p1, p1, Lml;->f:Lhl;

    iput-object p1, p0, Lnhb;->b:Lhl;

    return-void

    :pswitch_15
    check-cast p0, Lwy8;

    new-instance p1, Ljava/util/HashSet;

    iget-object p0, p0, Lwy8;->a:Ljava/util/HashSet;

    invoke-direct {p1, p0}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-virtual {p1}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-nez p1, :cond_29

    return-void

    :cond_29
    invoke-static {p0}, Lp3p;->g(Ljava/util/Iterator;)Ljava/lang/ClassCastException;

    move-result-object p0

    throw p0

    :pswitch_2e
    check-cast p0, Lnn7;

    iget-object p1, p1, Lml;->h:Lil;

    iput-object p1, p0, Lnn7;->q:Lil;

    return-void

    :pswitch_35
    check-cast p0, Lvzk;

    new-instance v0, Ljava/util/HashSet;

    iget-object v1, p0, Lvzk;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/Set;

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_44
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_54

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ldy;

    invoke-interface {v1, p1}, Ldy;->s(Lml;)V

    goto :goto_44

    :cond_54
    iget-object p0, p0, Lvzk;->b:Ljava/lang/Object;

    check-cast p0, Lami;

    iget-object p1, p0, Lami;->b:Ljava/lang/Object;

    check-cast p1, Ljava/util/HashMap;

    iget-object v0, p0, Lami;->e:Ljava/lang/Object;

    check-cast v0, Lvzk;

    invoke-virtual {p1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_68
    :goto_68
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_8c

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lxx;

    iget-object v1, v1, Llyf;->a:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    iget-object v2, v0, Lvzk;->a:Ljava/lang/Object;

    check-cast v2, Lcy;

    invoke-virtual {v2}, Lcy;->c()Lml;

    move-result-object v2

    iget-object v2, v2, Lml;->j:Ljava/util/HashSet;

    invoke-virtual {v2, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_68

    invoke-interface {p1}, Ljava/util/Iterator;->remove()V

    goto :goto_68

    :cond_8c
    iget-object p0, p0, Lami;->f:Ljava/lang/Object;

    check-cast p0, Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object p1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    const-wide/32 v3, 0x4d3f6400

    sub-long/2addr v1, v3

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_aa
    :goto_aa
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_fe

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    const-string v4, "providers_config_"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_aa

    const-string v4, "_timestamp"

    invoke-virtual {v3, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_aa

    const/16 v4, 0x5f

    const/16 v5, 0x11

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->indexOf(II)I

    move-result v4

    const/4 v6, -0x1

    if-eq v4, v6, :cond_aa

    invoke-virtual {v3, v5, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    iget-object v5, v0, Lvzk;->a:Ljava/lang/Object;

    check-cast v5, Lcy;

    invoke-virtual {v5}, Lcy;->c()Lml;

    move-result-object v5

    iget-object v5, v5, Lml;->j:Ljava/util/HashSet;

    invoke-virtual {v5, v4}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_ef

    const-wide/16 v4, 0x0

    invoke-interface {p0, v3, v4, v5}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v4

    cmp-long v4, v4, v1

    if-gtz v4, :cond_aa

    :cond_ef
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0xa

    const/4 v5, 0x0

    invoke-virtual {v3, v5, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-static {p0, v3}, Lami;->s(Landroid/content/SharedPreferences;Ljava/lang/String;)V

    goto :goto_aa

    :cond_fe
    return-void

    :pswitch_ff
    check-cast p0, Lux;

    iget-object p1, p1, Lml;->h:Lil;

    iput-object p1, p0, Lux;->d:Lil;

    return-void

    :pswitch_data_106
    .packed-switch 0x0
        :pswitch_ff
        :pswitch_35
        :pswitch_2e
        :pswitch_15
        :pswitch_e
    .end packed-switch
.end method
