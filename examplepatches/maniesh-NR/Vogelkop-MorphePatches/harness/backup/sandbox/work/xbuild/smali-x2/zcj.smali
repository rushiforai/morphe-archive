.class public final Lzcj;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lumi;

.field public final c:Lqie;

.field public final d:Loji;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lumi;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lzcj;->a:Landroid/content/Context;

    iput-object p2, p0, Lzcj;->b:Lumi;

    new-instance p2, Lqie;

    const/16 v0, 0x13

    invoke-direct {p2, v0}, Lqie;-><init>(B)V

    iput-object p2, p0, Lzcj;->c:Lqie;

    new-instance p2, Loji;

    const/4 v0, 0x4

    invoke-direct {p2, p1, v0}, Loji;-><init>(Landroid/content/Context;B)V

    iput-object p2, p0, Lzcj;->d:Loji;

    return-void
.end method

.method public static a(Ljava/lang/String;)Landroid/util/Pair;
    .registers 4

    const/4 v0, 0x1

    const/16 v1, 0x3a

    invoke-static {v0, p0, v1}, Laik;->r(ZLjava/lang/String;C)Ljava/util/ArrayList;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x2

    if-eq v1, v2, :cond_10

    const/4 p0, 0x0

    return-object p0

    :cond_10
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-static {v1, p0}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object p0

    return-object p0
.end method

.method public static d(Ljava/util/ArrayList;)Ljava/util/HashMap;
    .registers 6

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    :goto_a
    if-ge v2, v1, :cond_1c

    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Lan8;

    invoke-interface {v3}, Lwcj;->getId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_a

    :cond_1c
    return-object v0
.end method


# virtual methods
.method public final b(Landroid/content/Intent;Ljava/util/HashMap;)V
    .registers 6

    :try_start_0
    iget-object v0, p0, Lzcj;->a:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_f
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_28

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/pm/ResolveInfo;

    new-instance v2, Lidb;

    invoke-direct {v2, p1, v1, p0}, Lidb;-><init>(Landroid/content/Intent;Landroid/content/pm/ResolveInfo;Lzcj;)V

    invoke-virtual {v2}, Lidb;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_27
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_27} :catch_28

    goto :goto_f

    :catch_28
    :cond_28
    return-void
.end method

.method public final c(Landroid/content/Intent;Lb2l;)Ljava/util/ArrayList;
    .registers 8

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    if-eqz p2, :cond_3f

    move-object v2, p2

    check-cast v2, Ld7l;

    iget-object v3, v2, Ld7l;->j:Le7l;

    invoke-interface {v3}, Le7l;->a0()Lorg/chromium/ui/base/WindowAndroid;

    move-result-object v3

    if-eqz v3, :cond_3f

    iget-object v3, v2, Ld7l;->j:Le7l;

    invoke-interface {v3}, Le7l;->a0()Lorg/chromium/ui/base/WindowAndroid;

    move-result-object v3

    invoke-static {v3}, Llyg;->c(Lorg/chromium/ui/base/WindowAndroid;)Llyg;

    move-result-object v3

    invoke-virtual {v2}, Ld7l;->o0()Z

    move-result v4

    if-nez v4, :cond_3f

    iget-object v4, v2, Ld7l;->j:Le7l;

    invoke-interface {v4}, Lb9l;->r()Z

    move-result v4

    if-nez v4, :cond_3f

    iget-object v2, v2, Ld7l;->j:Le7l;

    invoke-interface {v2}, Lb9l;->c0()Z

    move-result v2

    if-nez v2, :cond_3f

    invoke-virtual {v3}, Llyg;->d()Z

    move-result v2

    if-nez v2, :cond_3f

    new-instance v2, Lkyg;

    invoke-direct {v2, p0, p2}, Lkyg;-><init>(Lzcj;Lb2l;)V

    goto :goto_40

    :cond_3f
    move-object v2, v1

    :goto_40
    if-eqz v2, :cond_45

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_45
    invoke-static {p1}, Locp;->j(Landroid/content/Intent;)Ljava/lang/String;

    move-result-object p2

    if-eqz p2, :cond_59

    sget-object v2, Lwqm;->a:[Ljava/lang/String;

    invoke-static {p2}, LJ/N;->Mhbidx2d(Ljava/lang/Object;)I

    move-result p2

    const/4 v2, 0x3

    if-ne p2, v2, :cond_59

    new-instance v1, Lofh;

    invoke-direct {v1, p0, p1}, Lofh;-><init>(Lzcj;Landroid/content/Intent;)V

    :cond_59
    if-eqz v1, :cond_5e

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_5e
    return-object v0
.end method

.method public final e(Ljava/lang/String;)V
    .registers 4

    new-instance v0, Ljri;

    const/16 v1, 0x8

    invoke-direct {v0, p0, p1, v1}, Ljri;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p1, p0, Lzcj;->b:Lumi;

    invoke-interface {p1, v0}, Ltcl;->c(Ljava/lang/Runnable;)Lnml;

    move-result-object p1

    new-instance v0, Loml;

    invoke-direct {v0, p1}, Loml;-><init>(Lnml;)V

    const/4 p1, 0x0

    iget-object p0, p0, Lzcj;->c:Lqie;

    invoke-virtual {p0, v0, p1}, Lqie;->n(Loml;Ljava/lang/Object;)Lp1j;

    return-void
.end method
