.class public final Lvo7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Las6;
.implements Lq9g;


# static fields
.field public static final j:J


# instance fields
.field public final a:Lesk;

.field public final b:Lesk;

.field public final c:Lkotlin/jvm/functions/Function1;

.field public final d:Lyqa;

.field public final e:Lesk;

.field public final f:Lc37;

.field public final g:Lx77;

.field public h:Luo7;

.field public i:Ljava/lang/Long;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    sget-object v0, Lpn7;->b:Lon7;

    const/16 v0, 0x3c

    sget-object v1, Lun7;->e:Lun7;

    invoke-static {v0, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    invoke-static {v0, v1}, Lpn7;->f(J)J

    move-result-wide v0

    sput-wide v0, Lvo7;->j:J

    return-void
.end method

.method public constructor <init>(Lesk;Lesk;Lkotlin/jvm/functions/Function1;Lyqa;Lesk;Lqq6;Lesk;)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lvo7;->a:Lesk;

    iput-object p2, p0, Lvo7;->b:Lesk;

    iput-object p3, p0, Lvo7;->c:Lkotlin/jvm/functions/Function1;

    iput-object p4, p0, Lvo7;->d:Lyqa;

    iput-object p5, p0, Lvo7;->e:Lesk;

    new-instance p1, Lc37;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p5, p1, Lc37;->a:Ljava/lang/Object;

    new-instance p2, Ljava/util/LinkedHashMap;

    invoke-direct {p2}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object p2, p1, Lc37;->b:Ljava/lang/Object;

    iput-object p1, p0, Lvo7;->f:Lc37;

    new-instance p1, Lx77;

    const/4 p2, 0x3

    invoke-direct {p1, p0, p6, p7, p2}, Lx77;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object p1, p0, Lvo7;->g:Lx77;

    return-void
.end method

.method public static c(Lqo7;Lorg/chromium/url/GURL;)Z
    .registers 5

    iget-object v0, p0, Lqo7;->c:Lnd7;

    invoke-virtual {p1}, Lorg/chromium/url/GURL;->c()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lnd7;->a(Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_44

    iget-object p0, p0, Lqo7;->d:Ljava/util/LinkedHashMap;

    invoke-virtual {p1}, Lorg/chromium/url/GURL;->c()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    const/4 v0, 0x0

    if-eqz p0, :cond_46

    invoke-virtual {p1}, Lorg/chromium/url/GURL;->e()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, p0, v0}, Lkotlin/text/c;->q(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_46

    invoke-virtual {p1}, Lorg/chromium/url/GURL;->e()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-eq v1, v2, :cond_44

    invoke-virtual {p1}, Lorg/chromium/url/GURL;->e()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    invoke-virtual {p1, p0}, Ljava/lang/String;->charAt(I)C

    move-result p0

    const/16 p1, 0x2f

    if-ne p0, p1, :cond_46

    :cond_44
    const/4 p0, 0x1

    return p0

    :cond_46
    return v0
.end method


# virtual methods
.method public final A()V
    .registers 1

    iget-object p0, p0, Lvo7;->f:Lc37;

    iget-object p0, p0, Lc37;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/LinkedHashMap;

    invoke-virtual {p0}, Ljava/util/LinkedHashMap;->clear()V

    return-void
.end method

.method public final W(Lndc;)V
    .registers 5

    iget-object v0, p0, Lvo7;->e:Lesk;

    invoke-interface {v0}, Lesk;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ls9g;

    new-instance v1, Lvme;

    const/16 v2, 0x13

    invoke-direct {v1, v2}, Lvme;-><init>(B)V

    invoke-static {v0, p1, p0, v1}, Laib;->B(Lw6f;Lndc;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)V

    return-void
.end method

.method public final a(Lorg/chromium/url/GURL;Z)Luo7;
    .registers 19

    move-object/from16 v0, p0

    iget-object v1, v0, Lvo7;->f:Lc37;

    iget-object v2, v1, Lc37;->b:Ljava/lang/Object;

    check-cast v2, Ljava/util/LinkedHashMap;

    iget-object v1, v1, Lc37;->a:Ljava/lang/Object;

    check-cast v1, Lesk;

    invoke-virtual/range {p0 .. p1}, Lvo7;->b(Lorg/chromium/url/GURL;)Lto7;

    move-result-object v0

    const/4 v3, 0x0

    if-nez v0, :cond_14

    return-object v3

    :cond_14
    iget-object v6, v0, Lto7;->a:Lqo7;

    iget-object v4, v6, Lqo7;->a:Ljava/lang/String;

    invoke-virtual/range {p1 .. p1}, Lorg/chromium/url/GURL;->d()Lorg/chromium/url/GURL;

    move-result-object v5

    invoke-virtual {v5}, Lorg/chromium/url/GURL;->g()Ljava/lang/String;

    move-result-object v9

    sget-object v10, Llag;->g:Llag;

    const/4 v5, 0x0

    if-eqz p2, :cond_71

    invoke-virtual {v2, v4}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    move-object v13, v7

    check-cast v13, Lwo7;

    if-eqz v13, :cond_71

    iget-object v7, v13, Lwo7;->c:Lc37;

    iget-object v7, v7, Lc37;->a:Ljava/lang/Object;

    move-object v14, v7

    check-cast v14, Lesk;

    iget-boolean v15, v13, Lwo7;->b:Z

    if-nez v15, :cond_64

    invoke-interface {v14}, Lesk;->get()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ls9g;

    invoke-virtual {v7, v9, v5}, Ls9g;->f(Ljava/lang/String;Z)Ljag;

    move-result-object v7

    if-eqz v7, :cond_4a

    invoke-virtual {v7, v10, v3}, Ljag;->a(Llag;Lkag;)Lkag;

    move-result-object v7

    goto :goto_4b

    :cond_4a
    move-object v7, v3

    :goto_4b
    if-nez v7, :cond_64

    invoke-interface {v14}, Lesk;->get()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ls9g;

    iget-object v7, v7, Ls9g;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v7, v10}, Lcom/opera/android/settings/SettingsManager;->k(Llag;)Lkag;

    move-result-object v11

    invoke-interface {v14}, Lesk;->get()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ls9g;

    const/4 v8, 0x0

    const/4 v12, 0x1

    invoke-virtual/range {v7 .. v12}, Ls9g;->o(ZLjava/lang/String;Llag;Lkag;Z)V

    :cond_64
    iget-object v11, v13, Lwo7;->a:Lkag;

    invoke-interface {v14}, Lesk;->get()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ls9g;

    const/4 v8, 0x0

    move v12, v15

    invoke-virtual/range {v7 .. v12}, Ls9g;->o(ZLjava/lang/String;Llag;Lkag;Z)V

    :cond_71
    iget-boolean v7, v6, Lqo7;->e:Z

    iget-boolean v8, v6, Lqo7;->f:Z

    invoke-virtual {v2, v4}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lwo7;

    sget-object v4, Lkag;->d:Lkag;

    const/4 v11, 0x1

    if-eqz v2, :cond_83

    iget-object v2, v2, Lwo7;->a:Lkag;

    goto :goto_aa

    :cond_83
    invoke-interface {v1}, Lesk;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ls9g;

    invoke-virtual {v2, v10, v9, v5}, Ls9g;->g(Llag;Ljava/lang/String;Z)Lkag;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    move-result v2

    sget-object v12, Lkag;->b:Lkag;

    if-eqz v2, :cond_a9

    if-eq v2, v11, :cond_a4

    const/4 v13, 0x2

    if-ne v2, v13, :cond_a0

    if-nez v7, :cond_a9

    if-nez v8, :cond_a9

    move-object v2, v4

    goto :goto_aa

    :cond_a0
    invoke-static {}, Lh9o;->p()V

    return-object v3

    :cond_a4
    if-nez v7, :cond_a9

    sget-object v2, Lkag;->c:Lkag;

    goto :goto_aa

    :cond_a9
    move-object v2, v12

    :goto_aa
    if-nez v7, :cond_bc

    if-eqz v8, :cond_bc

    invoke-interface {v1}, Lesk;->get()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ls9g;

    invoke-virtual {v7, v10, v9, v5}, Ls9g;->g(Llag;Ljava/lang/String;Z)Lkag;

    move-result-object v7

    if-ne v7, v4, :cond_bc

    move v4, v11

    goto :goto_bd

    :cond_bc
    move v4, v5

    :goto_bd
    new-instance v7, Luo7;

    iget-boolean v0, v0, Lto7;->b:Z

    invoke-interface {v1}, Lesk;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ls9g;

    invoke-virtual {v1, v9, v5}, Ls9g;->f(Ljava/lang/String;Z)Ljag;

    move-result-object v1

    if-eqz v1, :cond_d1

    invoke-virtual {v1, v10, v3}, Ljag;->a(Llag;Lkag;)Lkag;

    move-result-object v3

    :cond_d1
    if-eqz v3, :cond_db

    move v10, v11

    move-object/from16 v5, p1

    move-object v8, v2

    move v9, v4

    move-object v4, v7

    :goto_d9
    move v7, v0

    goto :goto_e2

    :cond_db
    move v10, v5

    move-object v8, v2

    move v9, v4

    move-object v4, v7

    move-object/from16 v5, p1

    goto :goto_d9

    :goto_e2
    invoke-direct/range {v4 .. v10}, Luo7;-><init>(Lorg/chromium/url/GURL;Lqo7;ZLkag;ZZ)V

    return-object v4
.end method

.method public final b(Lorg/chromium/url/GURL;)Lto7;
    .registers 7

    iget-boolean v0, p1, Lorg/chromium/url/GURL;->b:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_76

    invoke-virtual {p1}, Lorg/chromium/url/GURL;->f()Ljava/lang/String;

    move-result-object v0

    const-string v2, "http"

    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1d

    invoke-virtual {p1}, Lorg/chromium/url/GURL;->f()Ljava/lang/String;

    move-result-object v0

    const-string v2, "https"

    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_76

    :cond_1d
    invoke-virtual {p1}, Lorg/chromium/url/GURL;->c()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_76

    iget-object v0, p0, Lvo7;->a:Lesk;

    invoke-interface {v0}, Lesk;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lro7;

    iget-object v0, v0, Lro7;->a:Ljava/util/Set;

    check-cast v0, Ljava/lang/Iterable;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_37
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4b

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    move-object v3, v2

    check-cast v3, Lqo7;

    invoke-static {v3, p1}, Lvo7;->c(Lqo7;Lorg/chromium/url/GURL;)Z

    move-result v3

    if-eqz v3, :cond_37

    goto :goto_4c

    :cond_4b
    move-object v2, v1

    :goto_4c
    check-cast v2, Lqo7;

    if-eqz v2, :cond_76

    new-instance p1, Lto7;

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1f

    if-ge v0, v1, :cond_71

    iget-object p0, p0, Lvo7;->b:Lesk;

    invoke-interface {p0}, Lesk;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/pm/PackageManager;

    const/4 v0, 0x0

    :try_start_61
    sget-object v1, Lrab;->a:Lqab;

    iget-object v1, v2, Lqo7;->a:Ljava/lang/String;

    iget-object v3, v2, Lqo7;->b:Lp4j;

    sget-object v4, Lqab;->b:Lqab;

    invoke-static {p0, v1, v3, v4}, Lrab;->d(Landroid/content/pm/PackageManager;Ljava/lang/String;Ljava/util/Set;Lqab;)Z

    move-result p0
    :try_end_6d
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_61 .. :try_end_6d} :catch_6e

    goto :goto_6f

    :catch_6e
    move p0, v0

    :goto_6f
    if-eqz p0, :cond_72

    :cond_71
    const/4 v0, 0x1

    :cond_72
    invoke-direct {p1, v2, v0}, Lto7;-><init>(Lqo7;Z)V

    return-object p1

    :cond_76
    return-object v1
.end method

.method public final d(Ljava/util/List;)V
    .registers 9

    check-cast p1, Ljava/lang/Iterable;

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_6
    :goto_6
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_56

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lloj;

    iget-object v1, v0, Lloj;->b:Llag;

    sget-object v2, Llag;->g:Llag;

    if-eqz v1, :cond_1d

    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    goto :goto_1e

    :cond_1d
    const/4 v1, 0x1

    :goto_1e
    iget-object v0, v0, Lloj;->a:Ljava/lang/String;

    if-eqz v1, :cond_6

    new-instance v1, Lorg/chromium/url/GURL;

    invoke-direct {v1, v0}, Lorg/chromium/url/GURL;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v1}, Lvo7;->b(Lorg/chromium/url/GURL;)Lto7;

    move-result-object v1

    if-eqz v1, :cond_6

    iget-object v1, v1, Lto7;->a:Lqo7;

    iget-object v1, v1, Lqo7;->a:Ljava/lang/String;

    iget-object v3, p0, Lvo7;->f:Lc37;

    iget-object v4, v3, Lc37;->b:Ljava/lang/Object;

    check-cast v4, Ljava/util/LinkedHashMap;

    invoke-virtual {v4, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lwo7;

    if-eqz v5, :cond_6

    iget-object v3, v3, Lc37;->a:Ljava/lang/Object;

    check-cast v3, Lesk;

    invoke-interface {v3}, Lesk;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ls9g;

    const/4 v6, 0x0

    invoke-virtual {v3, v2, v0, v6}, Ls9g;->g(Llag;Ljava/lang/String;Z)Lkag;

    move-result-object v0

    iget-object v2, v5, Lwo7;->a:Lkag;

    if-eq v0, v2, :cond_6

    invoke-interface {v4, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_6

    :cond_56
    return-void
.end method

.method public final onResume(Lndc;)V
    .registers 11

    iget-object p0, p0, Lvo7;->g:Lx77;

    iget-object p1, p0, Lx77;->d:Ljava/lang/Object;

    check-cast p1, Lvo7;

    iget-object v0, p0, Lx77;->c:Ljava/lang/Object;

    check-cast v0, Lesk;

    invoke-interface {v0}, Lesk;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lru9;

    iget-object v1, v1, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v2, "dynamic_external_apps.open_in_opera_timestamp"

    const-wide/16 v3, -0x1

    invoke-interface {v1, v2, v3, v4}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v5

    cmp-long v1, v5, v3

    const/4 v3, 0x0

    if-nez v1, :cond_21

    move-object v1, v3

    goto :goto_25

    :cond_21
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    :goto_25
    const-string v4, "dynamic_external_apps.open_in_opera_url"

    if-eqz v1, :cond_5e

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    sub-long/2addr v7, v5

    const-wide/16 v5, 0x1

    cmp-long v1, v5, v7

    if-gtz v1, :cond_54

    sget-wide v5, Lvo7;->j:J

    cmp-long v1, v7, v5

    if-gez v1, :cond_54

    invoke-interface {v0}, Lesk;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lru9;

    const-string v5, ""

    iget-object v1, v1, Lru9;->a:Landroid/content/SharedPreferences;

    invoke-interface {v1, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_54

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v5

    if-nez v5, :cond_55

    :cond_54
    move-object v1, v3

    :cond_55
    if-eqz v1, :cond_5e

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v5

    if-eqz v5, :cond_5e

    move-object v3, v1

    :cond_5e
    if-eqz v3, :cond_a0

    invoke-interface {v0}, Lesk;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lru9;

    invoke-virtual {v0}, Lru9;->b()Lnv6;

    move-result-object v0

    iget-object v1, v0, Lnv6;->a:Ljava/lang/Object;

    check-cast v1, Landroid/content/SharedPreferences$Editor;

    invoke-interface {v1, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v1, v4}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v0}, Lnv6;->w()V

    new-instance v0, Lorg/chromium/url/GURL;

    invoke-direct {v0, v3}, Lorg/chromium/url/GURL;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lx77;->b:Ljava/lang/Object;

    check-cast v1, Lqq6;

    invoke-virtual {v0}, Lorg/chromium/url/GURL;->c()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lg77;

    invoke-direct {v3, p0, v0, p1}, Lg77;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object p0, v1, Lqq6;->b:Ljava/lang/Object;

    check-cast p0, Lesk;

    invoke-interface {p0}, Lesk;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lz77;

    new-instance p1, Ls12;

    invoke-direct {p1, v3, v2}, Ls12;-><init>(Lg77;Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lijm;->b:Lijm;

    invoke-virtual {p0, p1, v0}, Lr22;->b(Ljjm;Lijm;)V

    :cond_a0
    return-void
.end method
