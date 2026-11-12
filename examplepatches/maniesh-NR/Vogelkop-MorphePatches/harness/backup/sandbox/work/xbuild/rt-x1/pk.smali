.class public final Lpk;
.super Lj93;
.source "SourceFile"


# instance fields
.field public final d:Lri3;

.field public final e:Lpde;

.field public final f:Lpde;

.field public final g:Lwnm;


# direct methods
.method public constructor <init>(Lcom/opera/android/settings/SettingsManager;Ld8j;Lri3;)V
    .registers 7

    sget-object v0, La8j;->a:La8j;

    invoke-direct {p0, p1, p2}, Lj93;-><init>(Lcom/opera/android/settings/SettingsManager;Ld8j;)V

    iput-object p3, p0, Lpk;->d:Lri3;

    iget-object p2, p3, Lri3;->a:Lsi3;

    iget-object p2, p2, Lsi3;->q:Lzyk;

    invoke-virtual {p2}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lus4;

    iget-object p3, p2, Lus4;->a:Lekc;

    invoke-static {p3}, Lxf8;->o0(Lekc;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lui3;

    if-nez p3, :cond_1e

    sget-object p2, Lv08;->a:Lv08;

    goto :goto_3c

    :cond_1e
    iget-object v0, p3, Lui3;->b:Ljava/util/Set;

    iget-object v1, p2, Lus4;->c:Ltsd;

    invoke-static {v1}, Lxf8;->o0(Lekc;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Set;

    check-cast v0, Ljava/lang/Iterable;

    new-instance v2, Lrs4;

    invoke-direct {v2, p3, v1}, Lrs4;-><init>(Lui3;Ljava/util/Set;)V

    invoke-static {v0, v2}, Lic4;->w(Ljava/lang/Iterable;Lkotlin/jvm/functions/Function1;)Ljava/util/LinkedHashSet;

    move-result-object v1

    new-instance v2, Lrs4;

    invoke-direct {v2, p3, v1, p2}, Lrs4;-><init>(Lui3;Ljava/util/Set;Lus4;)V

    invoke-static {v0, v2}, Lic4;->w(Ljava/lang/Iterable;Lkotlin/jvm/functions/Function1;)Ljava/util/LinkedHashSet;

    move-result-object p2

    :goto_3c
    check-cast p2, Ljava/lang/Iterable;

    const/16 p3, 0xa

    invoke-static {p2, p3}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v0

    invoke-static {v0}, Lqbd;->a(I)I

    move-result v0

    const/16 v1, 0x10

    if-ge v0, v1, :cond_4d

    move v0, v1

    :cond_4d
    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1, v0}, Ljava/util/LinkedHashMap;-><init>(I)V

    invoke-interface {p2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_56
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_69

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Lnvm;

    iget-object v2, v2, Lnvm;->a:Ljava/lang/String;

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_56

    :cond_69
    new-instance p2, Lpde;

    invoke-direct {p2, v1}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p2, p0, Lpk;->e:Lpde;

    new-instance v0, Lpde;

    invoke-virtual {p1}, Lcom/opera/android/settings/SettingsManager;->b()La7j;

    move-result-object p1

    invoke-direct {v0, p1}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lpk;->f:Lpde;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, La7j;

    new-instance v1, Lok;

    sget-object v2, Ll08;->a:Ll08;

    invoke-direct {v1, p1, v2, v2, v2}, Lok;-><init>(La7j;Ljava/util/List;Ljava/util/List;Ljava/util/List;)V

    new-instance p1, Ly2;

    const/4 v2, 0x7

    invoke-direct {p1, v2}, Ly2;-><init>(B)V

    invoke-static {p2, p1}, Lb8h;->j(Lekc;Lkotlin/jvm/functions/Function1;)Lh42;

    move-result-object p1

    invoke-static {p1}, Lb8h;->d(Lekc;)Lh42;

    move-result-object p1

    new-instance p2, Lve5;

    invoke-direct {p2, p3}, Lve5;-><init>(B)V

    invoke-static {v1, v0, p1, p2}, Lxf8;->Y(Ljava/lang/Object;Lekc;Lekc;Lkotlin/jvm/functions/Function2;)Lwnm;

    move-result-object p1

    iput-object p1, p0, Lpk;->g:Lwnm;

    return-void
.end method


# virtual methods
.method public final g(Ljava/lang/String;Z)V
    .registers 12

    iget-object p0, p0, Lpk;->e:Lpde;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1, v0}, Ljava/util/LinkedHashMap;-><init>(Ljava/util/Map;)V

    invoke-virtual {v1, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnvm;

    if-eqz v0, :cond_2c

    iget-object v3, v0, Lnvm;->a:Ljava/lang/String;

    iget-object v4, v0, Lnvm;->b:Lpxh;

    iget-object v5, v0, Lnvm;->c:Lpxh;

    iget-object v6, v0, Lnvm;->d:Lti3;

    iget-object v7, v0, Lnvm;->e:Landroid/net/Uri;

    new-instance v2, Lnvm;

    move v8, p2

    invoke-direct/range {v2 .. v8}, Lnvm;-><init>(Ljava/lang/String;Lpxh;Lpxh;Lti3;Landroid/net/Uri;Z)V

    invoke-interface {v1, p1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0, v1}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    :cond_2c
    const-string p0, ""

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-void
.end method
