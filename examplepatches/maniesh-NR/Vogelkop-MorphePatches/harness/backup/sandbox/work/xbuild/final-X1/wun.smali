.class public final Lwun;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lumi;

.field public final c:Ljava/util/LinkedHashMap;

.field public final d:Ljava/util/HashMap;

.field public final e:Ljava/util/ArrayList;

.field public final f:Ljava/util/ArrayList;

.field public final g:Lko7;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lumi;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lwun;->c:Ljava/util/LinkedHashMap;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lwun;->d:Ljava/util/HashMap;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lwun;->e:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lwun;->f:Ljava/util/ArrayList;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lwun;->a:Landroid/content/Context;

    iput-object p2, p0, Lwun;->b:Lumi;

    new-instance p1, Lko7;

    invoke-direct {p1, p0, p2}, Lko7;-><init>(Lwun;Lumi;)V

    iput-object p1, p0, Lwun;->g:Lko7;

    invoke-virtual {p1}, Lldk;->h()V

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;Lp6l;Lzun;)Luun;
    .registers 10

    new-instance v0, Luun;

    invoke-direct {v0, p3}, Luun;-><init>(Lzun;)V

    iget-object p3, p0, Lwun;->f:Ljava/util/ArrayList;

    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    move v3, v2

    :cond_d
    if-ge v3, v1, :cond_28

    invoke-virtual {p3, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v3, v3, 0x1

    check-cast v4, Lvun;

    iget-object v5, v4, Lvun;->a:Ljava/lang/String;

    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_d

    iget-object v5, v4, Lvun;->b:Lp6l;

    invoke-virtual {v5, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_d

    goto :goto_52

    :cond_28
    iget-object p3, p0, Lwun;->e:Ljava/util/ArrayList;

    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result v1

    :cond_2e
    if-ge v2, v1, :cond_4a

    invoke-virtual {p3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    move-object v4, v3

    check-cast v4, Lvun;

    iget-object v3, v4, Lvun;->a:Ljava/lang/String;

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2e

    iget-object v3, v4, Lvun;->b:Lp6l;

    invoke-virtual {v3, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2e

    goto :goto_52

    :cond_4a
    new-instance v4, Lvun;

    invoke-direct {v4, p1, p2}, Lvun;-><init>(Ljava/lang/String;Lp6l;)V

    invoke-virtual {p3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_52
    iget-object p1, v4, Lvun;->c:Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lwun;->c()V

    return-object v0
.end method

.method public final b(Ljava/lang/String;Lp6l;)Ltun;
    .registers 4

    sget-object v0, Lp6l;->a:Lp6l;

    if-ne p2, v0, :cond_12

    iget-object p2, p0, Lwun;->g:Lko7;

    invoke-virtual {p2}, Lldk;->i()V

    iget-object p0, p0, Lwun;->c:Ljava/util/LinkedHashMap;

    invoke-virtual {p0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ltun;

    return-object p0

    :cond_12
    iget-object p0, p0, Lwun;->d:Ljava/util/HashMap;

    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ltun;

    return-object p0
.end method

.method public final c()V
    .registers 10

    new-instance v0, Lo00;

    const/16 v1, 0xc

    invoke-direct {v0, v1}, Lo00;-><init>(B)V

    iget-object v1, p0, Lwun;->e:Ljava/util/ArrayList;

    invoke-static {v1, v0}, Lsfe;->A0(Ljava/lang/Iterable;Lsrg;)Z

    iget-object v0, p0, Lwun;->f:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x2

    if-ge v2, v3, :cond_38

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_38

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lvun;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v5, v1, Lvun;->a:Ljava/lang/String;

    iget-object v6, v1, Lvun;->b:Lp6l;

    new-instance v7, Lqsh;

    const/16 v0, 0xb

    invoke-direct {v7, v0, p0, v1, v2}, Lqsh;-><init>(BLjava/lang/Object;Ljava/lang/Object;Z)V

    new-instance v3, Lcom/opera/android/browser/b;

    iget-object v4, p0, Lwun;->b:Lumi;

    const/4 v8, 0x1

    invoke-direct/range {v3 .. v8}, Lcom/opera/android/browser/b;-><init>(Ltcl;Ljava/lang/String;Lp6l;Lzun;Z)V

    :cond_38
    return-void
.end method

.method public final d()V
    .registers 7

    iget-object v0, p0, Lwun;->c:Ljava/util/LinkedHashMap;

    iget-object p0, p0, Lwun;->g:Lko7;

    invoke-virtual {p0}, Lldk;->i()V

    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    new-instance v2, Ljava/io/DataOutputStream;

    invoke-direct {v2, v1}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    const/4 v3, 0x1

    :try_start_12
    invoke-virtual {v2, v3}, Ljava/io/DataOutputStream;->writeInt(I)V

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v3

    const/16 v4, 0x64

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v4

    sub-int/2addr v4, v3

    invoke-virtual {v2, v3}, Ljava/io/DataOutputStream;->writeInt(I)V

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_2f
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_53

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    if-lez v4, :cond_40

    add-int/lit8 v4, v4, -0x1

    goto :goto_2f

    :cond_40
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v2, v5}, Ljava/io/DataOutputStream;->writeUTF(Ljava/lang/String;)V

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ltun;

    invoke-virtual {v3, v2}, Ltun;->g(Ljava/io/DataOutputStream;)V
    :try_end_52
    .catch Ljava/io/IOException; {:try_start_12 .. :try_end_52} :catch_60
    .catchall {:try_start_12 .. :try_end_52} :catchall_5b

    goto :goto_2f

    :cond_53
    invoke-static {v2}, Lxvg;->l(Ljava/io/Closeable;)V

    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    goto :goto_64

    :catchall_5b
    move-exception p0

    invoke-static {v2}, Lxvg;->l(Ljava/io/Closeable;)V

    throw p0

    :catch_60
    invoke-static {v2}, Lxvg;->l(Ljava/io/Closeable;)V

    const/4 v0, 0x0

    :goto_64
    invoke-virtual {p0, v0}, Lldk;->g(Ljava/lang/Object;)V

    return-void
.end method
