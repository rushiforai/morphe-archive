.class public final synthetic Ldgo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lg94;
.implements Lv2p;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Ldgo;->a:B

    iput-object p1, p0, Ldgo;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .registers 6

    iget-object p0, p0, Ldgo;->b:Ljava/lang/Object;

    check-cast p0, Ljro;

    check-cast p1, Lc0p;

    sget-object v0, Lg1p;->n:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_10
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_2e

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    if-ne p1, v3, :cond_10

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    goto :goto_2f

    :cond_2e
    move v0, v2

    :goto_2f
    if-nez v0, :cond_40

    iget-object p1, p1, Lc0p;->a:Ljava/lang/String;

    const-string v0, "api/v1/sdk_fetch"

    invoke-virtual {p1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Ljro;->b:Ljava/lang/String;

    iput v2, p0, Ljro;->i:I

    const/4 p1, 0x1

    iput-boolean p1, p0, Ljro;->j:Z

    :cond_40
    return-void
.end method

.method public final l(Ljava/lang/Object;)V
    .registers 7

    iget-byte v0, p0, Ldgo;->a:B

    sget-object v1, Lahb;->c:Lahb;

    iget-object p0, p0, Ldgo;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_82

    :pswitch_9
    check-cast p0, Lu2p;

    check-cast p1, Landroid/view/View;

    invoke-virtual {p0, p1}, Laoo;->j(Landroid/view/View;)V

    return-void

    :pswitch_11
    check-cast p0, Lbzo;

    check-cast p1, Ljava/lang/Exception;

    iget-object p0, p0, Lbzo;->b:Lbn;

    check-cast p1, Lzno;

    iget-object p1, p1, Lzno;->a:Lbm;

    invoke-interface {p0, p1}, Lbn;->m(Lbm;)V

    return-void

    :pswitch_1f
    check-cast p0, Lqjo;

    check-cast p1, Lahb;

    if-ne p1, v1, :cond_2c

    iget-object p0, p0, Ln1;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/ad/interstitial/AdActivity;

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    :cond_2c
    return-void

    :pswitch_2d
    check-cast p0, Lt9l;

    iget-object p1, p0, Lt9l;->b:Ljava/lang/Object;

    check-cast p1, Lujo;

    iget-object p1, p1, Lujo;->a:Lqi8;

    invoke-virtual {p1}, Lqi8;->getDuration()J

    move-result-wide v0

    long-to-int v0, v0

    if-lez v0, :cond_4e

    new-instance v0, Ll4n;

    invoke-virtual {p1}, Lqi8;->getCurrentPosition()J

    move-result-wide v1

    long-to-int v1, v1

    int-to-long v1, v1

    invoke-virtual {p1}, Lqi8;->getDuration()J

    move-result-wide v3

    long-to-int p1, v3

    int-to-long v3, p1

    invoke-direct {v0, v1, v2, v3, v4}, Ll4n;-><init>(JJ)V

    goto :goto_50

    :cond_4e
    sget-object v0, Ll4n;->c:Ll4n;

    :goto_50
    iget-object p0, p0, Lt9l;->d:Ljava/lang/Object;

    check-cast p0, Ln9h;

    iget-object p1, p0, Ln9h;->c:Ljava/lang/Object;

    check-cast p1, Ljn;

    if-eqz p1, :cond_68

    iget-object p1, p0, Ln9h;->b:Ljava/lang/Object;

    check-cast p1, Ljava/util/ArrayList;

    new-instance v1, Lroj;

    const/16 v2, 0x15

    invoke-direct {v1, p0, v0, v2}, Lroj;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {p1, v1}, Lm5h;->c(Ljava/util/Collection;Lv2p;)V

    :cond_68
    return-void

    :pswitch_69
    check-cast p0, Lxho;

    check-cast p1, Ljava/lang/Long;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    iput-wide v0, p0, Lxho;->F:J

    return-void

    :pswitch_74
    check-cast p0, Lrjo;

    check-cast p1, Lahb;

    if-ne p1, v1, :cond_81

    iget-object p0, p0, Ln1;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/ad/interstitial/AdActivity;

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    :cond_81
    return-void

    :pswitch_data_82
    .packed-switch 0x0
        :pswitch_74
        :pswitch_69
        :pswitch_2d
        :pswitch_9
        :pswitch_9
        :pswitch_9
        :pswitch_1f
        :pswitch_11
    .end packed-switch
.end method
