.class public final Lw43;
.super Ly08;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;

.field public final c:Ljava/lang/Object;

.field public final d:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lb4b;Lr9c;Lk6l;)V
    .registers 5

    const/4 v0, 0x1

    iput-byte v0, p0, Lw43;->a:B

    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 79
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lw43;->b:Ljava/lang/Object;

    .line 80
    iput-object p1, p0, Lw43;->c:Ljava/lang/Object;

    .line 81
    iput-object p2, p0, Lw43;->d:Ljava/lang/Object;

    .line 82
    iget-boolean p1, p2, Lr9c;->a:Z

    if-eqz p1, :cond_18

    .line 83
    invoke-virtual {p3, p0}, Lk6l;->a(La2l;)Lf6l;

    :cond_18
    return-void
.end method

.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lk6l;Lpde;)V
    .registers 8

    const/4 v0, 0x0

    iput-byte v0, p0, Lw43;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lw43;->b:Ljava/lang/Object;

    iput-object p3, p0, Lw43;->c:Ljava/lang/Object;

    iget-object v1, p2, Lk6l;->w:Lxg;

    new-instance v2, Loc2;

    const/16 v3, 0x8

    invoke-direct {v2, p0, v3}, Loc2;-><init>(Ljava/lang/Object;B)V

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object v3

    invoke-static {v1, v3, p0, v2}, Laib;->A(Lw6f;Ltcc;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)V

    new-instance v1, Lk9;

    const/16 v2, 0xb

    invoke-direct {v1, p0, v2}, Lk9;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p3, p1, v1}, Lekc;->j(Lndc;Lf7f;)V

    new-instance p1, Lkze;

    iget-object p2, p2, Lk6l;->o:Lb2l;

    if-eqz p2, :cond_3f

    check-cast p2, Ld7l;

    invoke-virtual {p2}, Ld7l;->n0()Z

    move-result p2

    if-eqz p2, :cond_3e

    invoke-virtual {p3}, Lekc;->g()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    if-lez p2, :cond_3f

    :cond_3e
    const/4 v0, 0x1

    :cond_3f
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    invoke-direct {p1, p2}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lw43;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lk6l;Lhd;Luk6;)V
    .registers 5

    const/4 v0, 0x2

    iput-byte v0, p0, Lw43;->a:B

    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 74
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lw43;->d:Ljava/lang/Object;

    .line 75
    iput-object p2, p0, Lw43;->b:Ljava/lang/Object;

    .line 76
    iput-object p3, p0, Lw43;->c:Ljava/lang/Object;

    .line 77
    invoke-virtual {p1, p0}, Lk6l;->b(La2l;)V

    return-void
.end method


# virtual methods
.method public final E(Lb2l;Lorg/chromium/content_public/browser/NavigationHandle;)V
    .registers 10

    iget-byte p2, p0, Lw43;->a:B

    packed-switch p2, :pswitch_data_98

    return-void

    :pswitch_6
    check-cast p1, Ld7l;

    invoke-virtual {p1}, Ld7l;->o0()Z

    move-result p2

    if-nez p2, :cond_92

    iget-object p1, p1, Ld7l;->j:Le7l;

    invoke-interface {p1}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object p1

    iget-object p2, p0, Lw43;->b:Ljava/lang/Object;

    check-cast p2, Ljava/util/HashSet;

    invoke-static {p1}, Lwqm;->i(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_92

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p1, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lw43;->c:Ljava/lang/Object;

    check-cast v0, Lb4b;

    invoke-virtual {v0}, Lno7;->i()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, La4b;

    iget-object v1, v0, La4b;->a:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_92

    const/16 v1, 0x2e

    const/4 v2, 0x0

    invoke-static {v2, p1, v1}, Laik;->r(ZLjava/lang/String;C)Ljava/util/ArrayList;

    move-result-object p1

    iget-object v0, v0, La4b;->a:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_47
    :goto_47
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_92

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lz3b;

    iget-object v2, v1, Lz3b;->b:Ljava/lang/String;

    invoke-virtual {p2, v2}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_47

    iget-object v1, v1, Lz3b;->a:Ljava/util/List;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    if-gt v4, v3, :cond_47

    :goto_6b
    add-int/lit8 v5, v3, -0x1

    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    add-int/lit8 v6, v4, -0x1

    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_47

    if-gez v6, :cond_8f

    iget-object v1, p0, Lw43;->d:Ljava/lang/Object;

    check-cast v1, Lr9c;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v2}, Lcom/leanplum/Leanplum;->track(Ljava/lang/String;)V

    invoke-virtual {p2, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_47

    :cond_8f
    move v3, v5

    move v4, v6

    goto :goto_6b

    :cond_92
    return-void

    :pswitch_93
    invoke-virtual {p0, p1}, Lw43;->W(Lb2l;)V

    return-void

    nop

    :pswitch_data_98
    .packed-switch 0x0
        :pswitch_93
        :pswitch_6
    .end packed-switch
.end method

.method public final G(Lb2l;)V
    .registers 3

    iget-byte v0, p0, Lw43;->a:B

    packed-switch v0, :pswitch_data_a

    return-void

    :pswitch_6
    invoke-virtual {p0, p1}, Lw43;->W(Lb2l;)V

    return-void

    :pswitch_data_a
    .packed-switch 0x0
        :pswitch_6
    .end packed-switch
.end method

.method public final I(Lb2l;)V
    .registers 6

    iget-byte v0, p0, Lw43;->a:B

    packed-switch v0, :pswitch_data_86

    return-void

    :pswitch_6
    iget-object v0, p0, Lw43;->d:Ljava/lang/Object;

    check-cast v0, Ljava/util/HashSet;

    move-object v1, p1

    check-cast v1, Ld7l;

    iget-object v2, v1, Ld7l;->j:Le7l;

    invoke-interface {v2}, Lb9l;->getId()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_84

    invoke-virtual {v1}, Ld7l;->i0()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_84

    iget-object v1, p0, Lw43;->c:Ljava/lang/Object;

    check-cast v1, Luk6;

    iget-object v1, v1, Luk6;->b:Ljava/lang/Object;

    check-cast v1, Lmu6;

    invoke-virtual {v1, p1, v0}, Lmu6;->a(Lb2l;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_84

    iget-object p0, p0, Lw43;->b:Ljava/lang/Object;

    check-cast p0, Lhd;

    iget-boolean p1, p0, Lhd;->b:Z

    if-eqz p1, :cond_84

    invoke-static {v0}, Laik;->g(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_44

    const/4 p1, 0x0

    :cond_44
    if-eqz p1, :cond_84

    iget-object v0, p0, Lhd;->d:Ljava/lang/Object;

    check-cast v0, Ln9a;

    invoke-static {}, Ln9a;->o()Lw56;

    move-result-object v1

    new-instance v2, Lbk0;

    invoke-direct {v2, v0, v1}, Lbk0;-><init>(Ln9a;Lw56;)V

    new-instance v0, Lw5f;

    const/16 v3, 0xb

    invoke-direct {v0, v3}, Lw5f;-><init>(B)V

    invoke-virtual {v2, p1, v0}, Lbk0;->a(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V

    iget-object p1, p0, Lhd;->g:Ljava/lang/Object;

    check-cast p1, Lmgh;

    invoke-virtual {p1, v1}, Lmgh;->c(Ljf0;)Z

    move-result p1

    if-nez p1, :cond_84

    iget-object p1, p0, Lhd;->c:Ljava/lang/Object;

    check-cast p1, Lumi;

    new-instance v0, Lrml;

    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-direct {v0, v1, p1}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance p1, Lo5f;

    const/16 v1, 0x12

    invoke-direct {p1, p0, v1}, Lo5f;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, p1}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p1

    iget-object p0, p0, Lhd;->f:Ljava/lang/Object;

    check-cast p0, Lqie;

    invoke-virtual {p1, p0}, Lplk;->m(Lqie;)Lp1j;

    :cond_84
    return-void

    nop

    :pswitch_data_86
    .packed-switch 0x2
        :pswitch_6
    .end packed-switch
.end method

.method public final R(Ld7l;)V
    .registers 3

    iget-byte v0, p0, Lw43;->a:B

    packed-switch v0, :pswitch_data_18

    return-void

    :pswitch_6
    iget-object p0, p0, Lw43;->d:Ljava/lang/Object;

    check-cast p0, Ljava/util/HashSet;

    iget-object p1, p1, Ld7l;->j:Le7l;

    invoke-interface {p1}, Lb9l;->getId()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    return-void

    :pswitch_data_18
    .packed-switch 0x2
        :pswitch_6
    .end packed-switch
.end method

.method public final W(Lb2l;)V
    .registers 3

    if-eqz p1, :cond_1c

    check-cast p1, Ld7l;

    invoke-virtual {p1}, Ld7l;->n0()Z

    move-result p1

    if-eqz p1, :cond_1a

    iget-object p1, p0, Lw43;->c:Ljava/lang/Object;

    check-cast p1, Lpde;

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    if-lez p1, :cond_1c

    :cond_1a
    const/4 p1, 0x1

    goto :goto_1d

    :cond_1c
    const/4 p1, 0x0

    :goto_1d
    iget-object p0, p0, Lw43;->d:Ljava/lang/Object;

    check-cast p0, Lkze;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-ne p1, v0, :cond_2e

    return-void

    :cond_2e
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method
