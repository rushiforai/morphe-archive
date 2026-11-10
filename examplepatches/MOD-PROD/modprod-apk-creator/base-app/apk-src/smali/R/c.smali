.class public final LR/c;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:J

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:J

.field public final e:J

.field public final f:J

.field public final g:J

.field public final h:Ljava/util/List;


# direct methods
.method public constructor <init>(Ljava/lang/String;LQ/b;)V
    .locals 13

    iget-object v2, p2, LQ/b;->b:Ljava/lang/String;

    iget-wide v3, p2, LQ/b;->c:J

    iget-wide v5, p2, LQ/b;->d:J

    iget-wide v7, p2, LQ/b;->e:J

    iget-wide v9, p2, LQ/b;->f:J

    iget-object v0, p2, LQ/b;->h:Ljava/util/List;

    if-eqz v0, :cond_1

    :cond_0
    move-object v1, p1

    move-object v11, v0

    move-object v0, p0

    goto :goto_1

    :cond_1
    iget-object p2, p2, LQ/b;->g:Ljava/util/Map;

    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p2}, Ljava/util/Map;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    new-instance v11, LQ/i;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-direct {v11, v12, v1}, LQ/i;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :goto_1
    invoke-direct/range {v0 .. v11}, LR/c;-><init>(Ljava/lang/String;Ljava/lang/String;JJJJLjava/util/List;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;JJJJLjava/util/List;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, LR/c;->b:Ljava/lang/String;

    const-string p1, ""

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p2, 0x0

    :cond_0
    iput-object p2, p0, LR/c;->c:Ljava/lang/String;

    iput-wide p3, p0, LR/c;->d:J

    iput-wide p5, p0, LR/c;->e:J

    iput-wide p7, p0, LR/c;->f:J

    iput-wide p9, p0, LR/c;->g:J

    iput-object p11, p0, LR/c;->h:Ljava/util/List;

    return-void
.end method

.method public static a(LR/d;)LR/c;
    .locals 16

    invoke-static/range {p0 .. p0}, LR/e;->i(LR/d;)I

    move-result v0

    const v1, 0x20150306

    if-ne v0, v1, :cond_3

    invoke-static/range {p0 .. p0}, LR/e;->k(LR/d;)Ljava/lang/String;

    move-result-object v3

    invoke-static/range {p0 .. p0}, LR/e;->k(LR/d;)Ljava/lang/String;

    move-result-object v4

    invoke-static/range {p0 .. p0}, LR/e;->j(LR/d;)J

    move-result-wide v5

    invoke-static/range {p0 .. p0}, LR/e;->j(LR/d;)J

    move-result-wide v7

    invoke-static/range {p0 .. p0}, LR/e;->j(LR/d;)J

    move-result-wide v9

    invoke-static/range {p0 .. p0}, LR/e;->j(LR/d;)J

    move-result-wide v11

    invoke-static/range {p0 .. p0}, LR/e;->i(LR/d;)I

    move-result v0

    if-ltz v0, :cond_2

    if-nez v0, :cond_0

    sget-object v1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    :goto_0
    move-object v13, v1

    goto :goto_1

    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    goto :goto_0

    :goto_1
    const/4 v1, 0x0

    :goto_2
    if-ge v1, v0, :cond_1

    invoke-static/range {p0 .. p0}, LR/e;->k(LR/d;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v2

    invoke-static/range {p0 .. p0}, LR/e;->k(LR/d;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v14

    new-instance v15, LQ/i;

    invoke-direct {v15, v2, v14}, LQ/i;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v13, v15}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_1
    new-instance v2, LR/c;

    invoke-direct/range {v2 .. v13}, LR/c;-><init>(Ljava/lang/String;Ljava/lang/String;JJJJLjava/util/List;)V

    return-object v2

    :cond_2
    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "readHeaderList size="

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_3
    new-instance v0, Ljava/io/IOException;

    invoke-direct {v0}, Ljava/io/IOException;-><init>()V

    throw v0
.end method


# virtual methods
.method public final b([B)LQ/b;
    .locals 5

    new-instance v0, LQ/b;

    invoke-direct {v0}, LQ/b;-><init>()V

    iput-object p1, v0, LQ/b;->a:[B

    iget-object p1, p0, LR/c;->c:Ljava/lang/String;

    iput-object p1, v0, LQ/b;->b:Ljava/lang/String;

    iget-wide v1, p0, LR/c;->d:J

    iput-wide v1, v0, LQ/b;->c:J

    iget-wide v1, p0, LR/c;->e:J

    iput-wide v1, v0, LQ/b;->d:J

    iget-wide v1, p0, LR/c;->f:J

    iput-wide v1, v0, LQ/b;->e:J

    iget-wide v1, p0, LR/c;->g:J

    iput-wide v1, v0, LQ/b;->f:J

    new-instance p1, Ljava/util/TreeMap;

    sget-object v1, Ljava/lang/String;->CASE_INSENSITIVE_ORDER:Ljava/util/Comparator;

    invoke-direct {p1, v1}, Ljava/util/TreeMap;-><init>(Ljava/util/Comparator;)V

    iget-object v1, p0, LR/c;->h:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, LQ/i;

    iget-object v4, v3, LQ/i;->a:Ljava/lang/String;

    iget-object v3, v3, LQ/i;->b:Ljava/lang/String;

    invoke-virtual {p1, v4, v3}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_0
    iput-object p1, v0, LQ/b;->g:Ljava/util/Map;

    invoke-static {v1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    iput-object p1, v0, LQ/b;->h:Ljava/util/List;

    return-object v0
.end method

.method public final c(Ljava/io/BufferedOutputStream;)Z
    .locals 4

    const v0, 0x20150306

    const/4 v1, 0x0

    :try_start_0
    invoke-static {p1, v0}, LR/e;->m(Ljava/io/BufferedOutputStream;I)V

    iget-object v0, p0, LR/c;->b:Ljava/lang/String;

    invoke-static {p1, v0}, LR/e;->o(Ljava/io/BufferedOutputStream;Ljava/lang/String;)V

    iget-object v0, p0, LR/c;->c:Ljava/lang/String;

    if-nez v0, :cond_0

    const-string v0, ""

    goto :goto_0

    :catch_0
    move-exception p1

    goto :goto_2

    :cond_0
    :goto_0
    invoke-static {p1, v0}, LR/e;->o(Ljava/io/BufferedOutputStream;Ljava/lang/String;)V

    iget-wide v2, p0, LR/c;->d:J

    invoke-static {p1, v2, v3}, LR/e;->n(Ljava/io/BufferedOutputStream;J)V

    iget-wide v2, p0, LR/c;->e:J

    invoke-static {p1, v2, v3}, LR/e;->n(Ljava/io/BufferedOutputStream;J)V

    iget-wide v2, p0, LR/c;->f:J

    invoke-static {p1, v2, v3}, LR/e;->n(Ljava/io/BufferedOutputStream;J)V

    iget-wide v2, p0, LR/c;->g:J

    invoke-static {p1, v2, v3}, LR/e;->n(Ljava/io/BufferedOutputStream;J)V

    iget-object v0, p0, LR/c;->h:Ljava/util/List;

    if-eqz v0, :cond_1

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    invoke-static {p1, v2}, LR/e;->m(Ljava/io/BufferedOutputStream;I)V

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, LQ/i;

    iget-object v3, v2, LQ/i;->a:Ljava/lang/String;

    invoke-static {p1, v3}, LR/e;->o(Ljava/io/BufferedOutputStream;Ljava/lang/String;)V

    iget-object v2, v2, LQ/i;->b:Ljava/lang/String;

    invoke-static {p1, v2}, LR/e;->o(Ljava/io/BufferedOutputStream;Ljava/lang/String;)V

    goto :goto_1

    :cond_1
    invoke-static {p1, v1}, LR/e;->m(Ljava/io/BufferedOutputStream;I)V

    :cond_2
    invoke-virtual {p1}, Ljava/io/OutputStream;->flush()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 p1, 0x1

    return p1

    :goto_2
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    const-string v0, "%s"

    invoke-static {v0, p1}, LQ/s;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    return v1
.end method
