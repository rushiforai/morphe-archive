.class public final synthetic Lyx1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Liy1;


# direct methods
.method public synthetic constructor <init>(Liy1;B)V
    .registers 3

    iput-byte p2, p0, Lyx1;->a:B

    iput-object p1, p0, Lyx1;->b:Liy1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 10

    iget-byte v0, p0, Lyx1;->a:B

    packed-switch v0, :pswitch_data_d4

    check-cast p1, Ljava/util/List;

    check-cast p1, Ljava/lang/Iterable;

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_d
    :goto_d
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_b2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljx1;

    const/4 v1, 0x0

    if-eqz v0, :cond_ae

    instance-of v2, v0, Lpx1;

    if-eqz v2, :cond_a2

    check-cast v0, Lpx1;

    iget-object v2, v0, Lvx1;->a:Ljava/lang/String;

    iget-object v3, v0, Lvx1;->b:Lwxe;

    iget-object v0, v0, Lpx1;->d:Ley1;

    iget-object v4, p0, Lyx1;->b:Liy1;

    iget-object v5, v4, Liy1;->h:Lgy1;

    iget-object v6, v4, Liy1;->o:Ljava/util/LinkedHashSet;

    invoke-interface {v6, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_d

    invoke-interface {v6, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iget-object v2, v4, Liy1;->b:Lcy1;

    invoke-interface {v2}, Lcy1;->c()V

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    if-eqz v0, :cond_90

    const/4 v2, 0x1

    if-eq v0, v2, :cond_90

    const/4 v2, 0x2

    if-eq v0, v2, :cond_74

    const/4 v2, 0x3

    if-eq v0, v2, :cond_63

    const/4 v2, 0x4

    if-ne v0, v2, :cond_5f

    invoke-virtual {v3}, Lwxe;->G()Z

    move-result v0

    if-eqz v0, :cond_58

    const v0, 0x7f1401d4

    goto :goto_5b

    :cond_58
    const v0, 0x7f1406c2

    :goto_5b
    invoke-interface {v5, v0}, Lgy1;->o(I)V

    goto :goto_d

    :cond_5f
    invoke-static {}, Lh9o;->p()V

    goto :goto_b4

    :cond_63
    invoke-virtual {v3}, Lwxe;->G()Z

    move-result v0

    if-eqz v0, :cond_6d

    const v0, 0x7f1401c5

    goto :goto_70

    :cond_6d
    const v0, 0x7f1401c6

    :goto_70
    invoke-interface {v5, v0}, Lgy1;->o(I)V

    goto :goto_d

    :cond_74
    iget-object v0, v4, Liy1;->k:Ljy1;

    invoke-virtual {v0}, Ljy1;->invoke()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_89

    const v0, 0x7f140167

    invoke-interface {v5, v0}, Lgy1;->o(I)V

    goto :goto_d

    :cond_89
    iget-object v0, v4, Liy1;->l:Ljy1;

    invoke-interface {v5, v0}, Lgy1;->c(Ljy1;)V

    goto/16 :goto_d

    :cond_90
    invoke-virtual {v3}, Lwxe;->G()Z

    move-result v0

    if-eqz v0, :cond_9a

    const v0, 0x7f1401c9

    goto :goto_9d

    :cond_9a
    const v0, 0x7f1406a9

    :goto_9d
    invoke-interface {v5, v0}, Lgy1;->o(I)V

    goto/16 :goto_d

    :cond_a2
    instance-of v2, v0, Lrx1;

    if-nez v2, :cond_d

    instance-of v2, v0, Lsx1;

    if-nez v2, :cond_d

    instance-of v0, v0, Lfz1;

    if-nez v0, :cond_d

    :cond_ae
    invoke-static {}, Lh9o;->p()V

    goto :goto_b4

    :cond_b2
    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_b4
    return-object v1

    :pswitch_b5
    check-cast p1, Ljava/util/Map;

    new-instance v0, Ls2;

    const/4 v6, 0x0

    const/4 v7, 0x4

    const/4 v1, 0x2

    iget-object v2, p0, Lyx1;->b:Liy1;

    const-class v3, Liy1;

    const-string v4, "onUploadFileChanged"

    const-string v5, "onUploadFileChanged(Ljava/lang/String;Lcom/opera/android/webaiassistant/AriaFileUploader$Status;)V"

    invoke-direct/range {v0 .. v7}, Ls2;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    new-instance p0, Lby1;

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lby1;-><init>(Lkotlin/jvm/functions/Function2;B)V

    invoke-interface {p1, p0}, Ljava/util/Map;->forEach(Ljava/util/function/BiConsumer;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_d4
    .packed-switch 0x0
        :pswitch_b5
    .end packed-switch
.end method
