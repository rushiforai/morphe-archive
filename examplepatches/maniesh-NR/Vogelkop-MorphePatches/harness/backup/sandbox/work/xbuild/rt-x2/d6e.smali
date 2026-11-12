.class public final synthetic Ld6e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Z

.field public final synthetic d:Ljava/lang/Object;

.field public final synthetic e:Ljava/lang/Object;

.field public final synthetic f:Ljava/io/Serializable;


# direct methods
.method public synthetic constructor <init>(Lae5;Lek6;ZLjava/lang/String;Le6g;)V
    .registers 7

    const/4 v0, 0x0

    iput-byte v0, p0, Ld6e;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ld6e;->d:Ljava/lang/Object;

    iput-object p2, p0, Ld6e;->e:Ljava/lang/Object;

    iput-boolean p3, p0, Ld6e;->c:Z

    iput-object p4, p0, Ld6e;->b:Ljava/lang/String;

    iput-object p5, p0, Ld6e;->f:Ljava/io/Serializable;

    return-void
.end method

.method public synthetic constructor <init>(Luyj;Ljava/lang/String;Ljava/util/Locale;Ljava/lang/String;Z)V
    .registers 7

    .line 17
    const/4 v0, 0x1

    iput-byte v0, p0, Ld6e;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ld6e;->d:Ljava/lang/Object;

    iput-object p2, p0, Ld6e;->b:Ljava/lang/String;

    iput-object p3, p0, Ld6e;->e:Ljava/lang/Object;

    iput-object p4, p0, Ld6e;->f:Ljava/io/Serializable;

    iput-boolean p5, p0, Ld6e;->c:Z

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 10

    iget-byte v0, p0, Ld6e;->a:B

    iget-boolean v1, p0, Ld6e;->c:Z

    iget-object v2, p0, Ld6e;->f:Ljava/io/Serializable;

    iget-object v3, p0, Ld6e;->e:Ljava/lang/Object;

    iget-object v4, p0, Ld6e;->b:Ljava/lang/String;

    iget-object p0, p0, Ld6e;->d:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_114

    check-cast p0, Luyj;

    check-cast v3, Ljava/util/Locale;

    check-cast v2, Ljava/lang/String;

    iget-object v0, p0, Luyj;->h:Lpyl;

    iget-object v5, p0, Luyj;->b:Lkze;

    iget-object v6, v0, Lpyl;->c:Ljava/lang/Object;

    check-cast v6, Ljava/lang/String;

    invoke-static {v6, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    const/4 v7, 0x0

    if-eqz v6, :cond_26

    move v6, v7

    goto :goto_37

    :cond_26
    const/4 v6, 0x0

    iput-object v6, v0, Lpyl;->c:Ljava/lang/Object;

    iput-object v6, v0, Lpyl;->d:Ljava/lang/Object;

    iput v7, v0, Lpyl;->b:I

    iget-object v6, v0, Lpyl;->e:Ljava/lang/Object;

    check-cast v6, Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->clear()V

    iput-object v4, v0, Lpyl;->c:Ljava/lang/Object;

    const/4 v6, 0x1

    :goto_37
    if-eqz v6, :cond_6a

    iget-object v8, p0, Luyj;->d:Landroid/speech/tts/TextToSpeech;

    invoke-virtual {v8, v3}, Landroid/speech/tts/TextToSpeech;->setLanguage(Ljava/util/Locale;)I

    move-result v3

    const/4 v8, -0x2

    if-eq v3, v8, :cond_5c

    const/4 v8, -0x1

    if-eq v3, v8, :cond_4e

    new-instance v3, Lxyj;

    invoke-direct {v3, v4}, Lxyj;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v3}, Lekc;->n(Ljava/lang/Object;)V

    goto :goto_6a

    :cond_4e
    new-instance p0, Lvyj;

    sget-object v0, Lryj;->a:Lryj;

    invoke-direct {p0, v0}, Lvyj;-><init>(Lryj;)V

    invoke-virtual {v5, p0}, Lekc;->n(Ljava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto/16 :goto_ff

    :cond_5c
    new-instance p0, Lvyj;

    sget-object v0, Lryj;->b:Lryj;

    invoke-direct {p0, v0}, Lvyj;-><init>(Lryj;)V

    invoke-virtual {v5, p0}, Lekc;->n(Ljava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto/16 :goto_ff

    :cond_6a
    :goto_6a
    new-instance v3, Llqh;

    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    iput-boolean v6, v3, Llqh;->a:Z

    new-instance v4, Lvvf;

    const/16 v5, 0x1d

    invoke-direct {v4, p0, v3, v5}, Lvvf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p0, v0, Lpyl;->f:Ljava/lang/Object;

    check-cast p0, Lsa2;

    new-instance v3, Laz7;

    invoke-direct {v3, v2}, Laz7;-><init>(Ljava/lang/String;)V

    iput-object v3, v0, Lpyl;->d:Ljava/lang/Object;

    iget-object v2, v0, Lpyl;->e:Ljava/lang/Object;

    check-cast v2, Ljava/util/ArrayList;

    invoke-static {v2}, Lkotlin/collections/CollectionsKt;->R(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ltyj;

    if-eqz v2, :cond_99

    iget v5, v2, Ltyj;->d:I

    iget-object v2, v2, Ltyj;->c:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    add-int/2addr v2, v5

    goto :goto_9a

    :cond_99
    move v2, v7

    :goto_9a
    iget-object v3, v3, Laz7;->b:Ljava/lang/String;

    invoke-virtual {v3, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    if-eqz v1, :cond_c4

    invoke-virtual {p0, v2, v3}, Lsa2;->g(ILjava/lang/String;)Ljava/util/List;

    move-result-object p0

    check-cast p0, Ljava/lang/Iterable;

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_ac
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_fd

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lffl;

    iget-object v2, v1, Lffl;->a:Ljava/lang/String;

    iget v1, v1, Lffl;->b:I

    invoke-virtual {v0, v1, v2}, Lpyl;->h(ILjava/lang/String;)Ltyj;

    move-result-object v1

    invoke-virtual {v4, v1}, Lvvf;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_ac

    :cond_c4
    const/16 v1, 0xa

    invoke-static {v3, v1}, Lkotlin/text/StringsKt;->F(Ljava/lang/CharSequence;C)Z

    move-result v5

    if-eqz v5, :cond_fd

    const/4 v5, 0x6

    invoke-static {v3, v1, v7, v5}, Lkotlin/text/StringsKt;->P(Ljava/lang/CharSequence;CII)I

    move-result v1

    invoke-virtual {v3, v7, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lkotlin/text/StringsKt;->N(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_fd

    invoke-virtual {p0, v2, v1}, Lsa2;->g(ILjava/lang/String;)Ljava/util/List;

    move-result-object p0

    check-cast p0, Ljava/lang/Iterable;

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_e5
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_fd

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lffl;

    iget-object v2, v1, Lffl;->a:Ljava/lang/String;

    iget v1, v1, Lffl;->b:I

    invoke-virtual {v0, v1, v2}, Lpyl;->h(ILjava/lang/String;)Ltyj;

    move-result-object v1

    invoke-virtual {v4, v1}, Lvvf;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_e5

    :cond_fd
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_ff
    return-object p0

    :pswitch_100
    check-cast p0, Lae5;

    check-cast v3, Lek6;

    check-cast v2, Le6g;

    new-instance v0, Lk7i;

    invoke-direct {v0, v3, v1, v4, v2}, Lk7i;-><init>(Lek6;ZLjava/lang/String;Le6g;)V

    filled-new-array {p0, v0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lqyn;->V([Ljava/lang/Object;)Lf0g;

    move-result-object p0

    return-object p0

    :pswitch_data_114
    .packed-switch 0x0
        :pswitch_100
    .end packed-switch
.end method
