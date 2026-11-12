.class public final Lky;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:I

.field public final synthetic c:Ljava/lang/Object;

.field public final synthetic d:Ljava/lang/Object;

.field public final synthetic e:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;ILjava/lang/Object;Ljava/io/Serializable;B)V
    .registers 6

    .line 15
    iput-byte p5, p0, Lky;->a:B

    iput p2, p0, Lky;->b:I

    iput-object p3, p0, Lky;->c:Ljava/lang/Object;

    iput-object p4, p0, Lky;->d:Ljava/lang/Object;

    iput-object p1, p0, Lky;->e:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Le9a;Lkotlin/jvm/functions/Function0;Licp;I)V
    .registers 6

    const/4 p2, 0x2

    iput-byte p2, p0, Lky;->a:B

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lky;->c:Ljava/lang/Object;

    iput-object p3, p0, Lky;->d:Ljava/lang/Object;

    iput-object p4, p0, Lky;->e:Ljava/lang/Object;

    iput p5, p0, Lky;->b:I

    return-void
.end method

.method public synthetic constructor <init>(Lrop;Ljava/lang/String;ILjava/lang/String;)V
    .registers 6

    const/4 v0, 0x3

    iput-byte v0, p0, Lky;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lky;->c:Ljava/lang/Object;

    iput-object p2, p0, Lky;->d:Ljava/lang/Object;

    iput p3, p0, Lky;->b:I

    iput-object p4, p0, Lky;->e:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 13

    iget-byte v0, p0, Lky;->a:B

    iget v1, p0, Lky;->b:I

    iget-object v2, p0, Lky;->e:Ljava/lang/Object;

    iget-object v3, p0, Lky;->d:Ljava/lang/Object;

    iget-object p0, p0, Lky;->c:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_124

    check-cast p0, Lrop;

    iget-object p0, p0, Lrop;->c:Ljava/lang/Object;

    check-cast p0, Lgpp;

    iget-object p0, p0, Lgpp;->c:Ljava/util/concurrent/ConcurrentHashMap;

    check-cast v3, Ljava/lang/String;

    invoke-virtual {p0, v3}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lxpp;

    if-eqz p0, :cond_3a

    check-cast v2, Ljava/lang/String;

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v4, "targetPackage"

    invoke-virtual {v0, v4, v3}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "errorCode"

    invoke-virtual {v0, v3, v1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string v1, "errorMessage"

    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lxpp;->b:Ljma;

    invoke-interface {p0, v0}, Ljma;->onError(Landroid/os/Bundle;)V

    :cond_3a
    return-void

    :pswitch_3b
    check-cast v3, Lkotlin/jvm/functions/Function0;

    invoke-interface {v3}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_4e

    check-cast v2, Licp;

    invoke-interface {v2, v1, p0}, Licp;->a(ILjava/lang/Object;)V

    :cond_4e
    return-void

    :pswitch_4f
    check-cast v2, Lg3k;

    invoke-virtual {v2, v1}, Lg3k;->b(I)Z

    move-result v0

    if-eqz v0, :cond_67

    iget-object v0, v2, Lg3k;->a:Lt9f;

    check-cast p0, Lv84;

    invoke-interface {p0}, Lv84;->request()Lkvh;

    move-result-object p0

    invoke-virtual {v0, p0}, Lt9f;->c(Lkvh;)Lokhttp3/internal/connection/RealCall;

    move-result-object p0

    invoke-interface {p0, v2}, Lv84;->enqueue(Lf94;)V

    goto :goto_70

    :cond_67
    check-cast v3, Ljava/io/IOException;

    invoke-virtual {v3}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, p0}, Lg3k;->c(Ljava/lang/String;)V

    :goto_70
    return-void

    :pswitch_71
    check-cast v2, Li5o;

    iget-object v0, v2, Li5o;->c:Ljava/lang/Object;

    check-cast v0, Ljy;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljz;

    check-cast p0, Lyz;

    move-object v10, v3

    check-cast v10, Ljava/lang/String;

    iget-object v2, v2, Li5o;->k:Ljava/lang/Object;

    check-cast v2, Lnz;

    if-eqz v2, :cond_8c

    iget-object v2, v2, Lnz;->o:Ljava/lang/String;

    :goto_8a
    move-object v8, v2

    goto :goto_8f

    :cond_8c
    const-string v2, ""

    goto :goto_8a

    :goto_8f
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v2, p0, Lyz;->i:Lyo;

    iget-object v9, v0, Ljz;->d:Ljava/util/HashMap;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "ad_dot_"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/4 v11, 0x0

    const/4 v4, 0x1

    if-eq v1, v4, :cond_a8

    const/4 v5, 0x2

    if-ne v1, v5, :cond_a7

    const-string v5, "CLICK"

    goto :goto_aa

    :cond_a7
    throw v11

    :cond_a8
    const-string v5, "IMPRESSION"

    :goto_aa
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "_"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    iget-object v2, v0, Ljz;->c:Lsy;

    invoke-static {v1}, Lvep;->A(I)I

    move-result v1

    if-eqz v1, :cond_d7

    if-ne v1, v4, :cond_d3

    invoke-virtual {v2}, Lsy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lk5o;

    iget-object v1, v1, Lk5o;->c:Ljava/lang/Object;

    check-cast v1, Landroid/net/Uri;

    :goto_d1
    move-object v7, v1

    goto :goto_e2

    :cond_d3
    invoke-static {}, Lhai;->d()V

    goto :goto_123

    :cond_d7
    invoke-virtual {v2}, Lsy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lk5o;

    iget-object v1, v1, Lk5o;->b:Ljava/lang/Object;

    check-cast v1, Landroid/net/Uri;

    goto :goto_d1

    :goto_e2
    invoke-static {v7, v6}, Lfki;->p(Landroid/net/Uri;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v9, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Liz;

    if-nez v2, :cond_fb

    new-instance v3, Liz;

    iget-object v4, v0, Ljz;->a:Lb59;

    iget-object v5, v0, Ljz;->b:Lt9f;

    invoke-direct/range {v3 .. v8}, Liz;-><init>(Lb59;Lt9f;Ljava/lang/String;Landroid/net/Uri;Ljava/lang/String;)V

    invoke-virtual {v9, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v2, v3

    :cond_fb
    iget-object v0, p0, Lyz;->n:Luz;

    if-eqz v0, :cond_10e

    new-instance v4, Lfz;

    iget-object v5, v0, Luz;->a:Ljava/lang/String;

    iget-object v6, v0, Luz;->b:Ljava/lang/String;

    iget-object v7, p0, Lyz;->l:Ljava/lang/String;

    iget-object v9, v0, Luz;->c:Ljava/lang/String;

    const/4 v8, 0x0

    invoke-direct/range {v4 .. v10}, Lfz;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    move-object v11, v4

    :cond_10e
    if-eqz v11, :cond_123

    iget-object p0, v2, Liz;->f:Ljava/util/ArrayList;

    invoke-virtual {p0, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object p0, v2, Liz;->b:Lt9f;

    iget-object v0, v2, Liz;->d:Landroid/net/Uri;

    iget-object v1, v2, Liz;->e:Ljava/lang/String;

    iget-object v3, v2, Liz;->g:Lhz;

    invoke-virtual {v11, p0, v0, v1, v3}, Lfz;->a(Lt9f;Landroid/net/Uri;Ljava/lang/String;Lhz;)V

    invoke-virtual {v2}, Liz;->a()V

    :cond_123
    :goto_123
    return-void

    :pswitch_data_124
    .packed-switch 0x0
        :pswitch_71
        :pswitch_4f
        :pswitch_3b
    .end packed-switch
.end method
