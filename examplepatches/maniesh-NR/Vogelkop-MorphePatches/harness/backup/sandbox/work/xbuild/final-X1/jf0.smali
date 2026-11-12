.class public abstract Ljf0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/nio/charset/Charset;

.field public final b:S

.field public final c:I

.field public final d:[Ldf0;

.field public e:Ljava/util/HashMap;


# direct methods
.method public constructor <init>(III)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "UTF-8"

    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    iput-object v0, p0, Ljf0;->a:Ljava/nio/charset/Charset;

    iput-short p1, p0, Ljf0;->b:S

    iput p2, p0, Ljf0;->c:I

    new-array p1, p3, [Ldf0;

    iput-object p1, p0, Ljf0;->d:[Ldf0;

    return-void
.end method

.method public static c(Ljava/lang/Object;)B
    .registers 2

    if-nez p0, :cond_4

    const/4 p0, 0x0

    return p0

    :cond_4
    instance-of v0, p0, Ljava/lang/String;

    if-eqz v0, :cond_a

    const/4 p0, 0x6

    return p0

    :cond_a
    instance-of v0, p0, Ljava/lang/Long;

    if-eqz v0, :cond_10

    const/4 p0, 0x3

    return p0

    :cond_10
    instance-of v0, p0, Ljf0;

    if-eqz v0, :cond_17

    const/16 p0, 0x8

    return p0

    :cond_17
    instance-of v0, p0, Ljava/lang/Boolean;

    if-eqz v0, :cond_1d

    const/4 p0, 0x1

    return p0

    :cond_1d
    instance-of v0, p0, Lyc0;

    if-eqz v0, :cond_24

    const/16 p0, 0xb

    return p0

    :cond_24
    instance-of v0, p0, Ljava/util/List;

    if-eqz v0, :cond_2b

    const/16 p0, 0x9

    return p0

    :cond_2b
    instance-of v0, p0, Ljava/lang/Integer;

    if-eqz v0, :cond_31

    const/4 p0, 0x2

    return p0

    :cond_31
    instance-of v0, p0, Ljava/util/Map;

    if-eqz v0, :cond_38

    const/16 p0, 0xa

    return p0

    :cond_38
    instance-of v0, p0, Ljava/lang/Float;

    if-eqz v0, :cond_3e

    const/4 p0, 0x4

    return p0

    :cond_3e
    instance-of p0, p0, Ljava/lang/Double;

    if-eqz p0, :cond_44

    const/4 p0, 0x5

    return p0

    :cond_44
    const/4 p0, 0x7

    return p0
.end method

.method public static f(Ljf0;Ljf0;)Ljf0;
    .registers 2

    if-nez p0, :cond_3

    return-object p1

    :cond_3
    if-nez p1, :cond_6

    return-object p0

    :cond_6
    invoke-virtual {p1, p0}, Ljf0;->m(Ljf0;)Ljf0;

    move-result-object p0

    return-object p0
.end method

.method public static g(Ljava/lang/Integer;Ljava/lang/Integer;)Ljava/lang/Integer;
    .registers 2

    if-nez p0, :cond_3

    return-object p1

    :cond_3
    if-nez p1, :cond_6

    return-object p0

    :cond_6
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    add-int/2addr p1, p0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public static h(Ljava/lang/Long;Ljava/lang/Long;)Ljava/lang/Long;
    .registers 4

    if-nez p0, :cond_3

    return-object p1

    :cond_3
    if-nez p1, :cond_6

    return-object p0

    :cond_6
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide p0

    add-long/2addr p0, v0

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    return-object p0
.end method

.method public static i(Ljava/util/List;Ljava/util/List;)Ljava/util/List;
    .registers 5

    if-nez p0, :cond_3

    return-object p1

    :cond_3
    if-nez p1, :cond_6

    return-object p0

    :cond_6
    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    add-int/2addr v2, v1

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    return-object v0
.end method

.method public static j(Ljava/util/Map;Ljava/util/Map;)Ljava/util/Map;
    .registers 4

    if-nez p0, :cond_3

    return-object p1

    :cond_3
    if-nez p1, :cond_6

    return-object p0

    :cond_6
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, p0}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_13
    :goto_13
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_33

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Map$Entry;

    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_13

    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_13

    :cond_33
    return-object v0
.end method

.method public static k(Ljava/util/Map;Ljava/util/Map;)Ljava/util/Map;
    .registers 9

    if-nez p0, :cond_3

    return-object p1

    :cond_3
    if-nez p1, :cond_6

    return-object p0

    :cond_6
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, p0}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_13
    :goto_13
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_5e

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Map$Entry;

    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_13

    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    if-nez v1, :cond_41

    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Long;

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_13

    :cond_41
    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Long;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    add-long/2addr v5, v3

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {v0, v2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_13

    :cond_5e
    return-object v0
.end method

.method public static l(Ljava/util/Map;Ljava/util/Map;)Ljava/util/Map;
    .registers 5

    if-nez p0, :cond_3

    return-object p1

    :cond_3
    if-nez p1, :cond_6

    return-object p0

    :cond_6
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, p0}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_13
    :goto_13
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_43

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Map$Entry;

    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_13

    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljf0;

    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljf0;

    invoke-static {v1, p1}, Ljf0;->f(Ljf0;Ljf0;)Ljf0;

    move-result-object p1

    invoke-virtual {v0, v2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_13

    :cond_43
    return-object v0
.end method

.method public static s(Ljava/util/List;)V
    .registers 3

    if-eqz p0, :cond_17

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    const/16 v1, 0xa

    if-le v0, v1, :cond_17

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    sub-int/2addr v0, v1

    const/4 v1, 0x0

    invoke-interface {p0, v1, v0}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->clear()V

    :cond_17
    return-void
.end method

.method public static v(Ljava/io/ByteArrayOutputStream;J)V
    .registers 8

    const/4 v0, 0x1

    shl-long v0, p1, v0

    const/16 v2, 0x3f

    shr-long/2addr p1, v2

    xor-long/2addr v0, p1

    const-wide/16 p1, -0x80

    and-long/2addr p1, v0

    const-wide/16 v2, 0x0

    cmp-long p1, p1, v2

    if-eqz p1, :cond_29

    const-wide/16 p1, 0x7f

    and-long v2, v0, p1

    long-to-int v2, v2

    or-int/lit16 v2, v2, 0x80

    invoke-virtual {p0, v2}, Ljava/io/OutputStream;->write(I)V

    const/4 v2, 0x7

    :goto_1b
    ushr-long/2addr v0, v2

    cmp-long v3, v0, p1

    if-lez v3, :cond_29

    and-long v3, v0, p1

    long-to-int v3, v3

    or-int/lit16 v3, v3, 0x80

    invoke-virtual {p0, v3}, Ljava/io/OutputStream;->write(I)V

    goto :goto_1b

    :cond_29
    long-to-int p1, v0

    invoke-virtual {p0, p1}, Ljava/io/OutputStream;->write(I)V

    return-void
.end method


# virtual methods
.method public a(I)Ldf0;
    .registers 2

    sget-object p0, Ln50;->g:[Ldf0;

    aget-object p0, p0, p1

    return-object p0
.end method

.method public b(I)Lef0;
    .registers 2

    sget-object p0, Ln50;->f:[Lef0;

    aget-object p0, p0, p1

    return-object p0
.end method

.method public final d(II)V
    .registers 4

    invoke-virtual {p0, p1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    if-nez v0, :cond_d

    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    :cond_d
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, p1, p2, v0}, Ljf0;->q(IILjava/lang/Object;)V

    return-void
.end method

.method public final e(I)V
    .registers 6

    invoke-virtual {p0, p1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    if-nez v0, :cond_e

    const-wide/16 v0, 0x0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    :cond_e
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v1, v0}, Ljf0;->q(IILjava/lang/Object;)V

    return-void
.end method

.method public m(Ljf0;)Ljf0;
    .registers 6

    check-cast p1, Ln50;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Long;

    invoke-static {v1, v2}, Ljf0;->h(Ljava/lang/Long;Ljava/lang/Long;)Ljava/lang/Long;

    move-result-object v1

    const/4 v2, 0x1

    if-eqz v1, :cond_19

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_19
    invoke-virtual {p1, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {p0, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    invoke-static {v0, v1}, Ljf0;->h(Ljava/lang/Long;Ljava/lang/Long;)Ljava/lang/Long;

    move-result-object v0

    if-eqz v0, :cond_2e

    invoke-virtual {p0, v2, v2, v0}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_2e
    const/4 v0, 0x2

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Long;

    invoke-static {v1, v3}, Ljf0;->h(Ljava/lang/Long;Ljava/lang/Long;)Ljava/lang/Long;

    move-result-object v1

    if-eqz v1, :cond_44

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_44
    const/4 v0, 0x3

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Long;

    invoke-static {v1, v3}, Ljf0;->h(Ljava/lang/Long;Ljava/lang/Long;)Ljava/lang/Long;

    move-result-object v1

    if-eqz v1, :cond_5a

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_5a
    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Long;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    invoke-static {p1, v1}, Ljf0;->h(Ljava/lang/Long;Ljava/lang/Long;)Ljava/lang/Long;

    move-result-object p1

    if-eqz p1, :cond_70

    invoke-virtual {p0, v0, v2, p1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_70
    return-object p0
.end method

.method public final n(I)Ljava/lang/Object;
    .registers 3

    iget-object v0, p0, Ljf0;->d:[Ldf0;

    aget-object v0, v0, p1

    if-nez v0, :cond_a

    invoke-virtual {p0, p1}, Ljf0;->a(I)Ldf0;

    move-result-object v0

    :cond_a
    if-eqz v0, :cond_f

    iget-object p0, v0, Ldf0;->c:Ljava/lang/Object;

    return-object p0

    :cond_f
    const/4 p0, 0x0

    return-object p0
.end method

.method public final o(III)V
    .registers 6

    new-instance v0, Ldf0;

    const/4 v1, 0x2

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-direct {v0, p2, p3, v1}, Ldf0;-><init>(ILjava/lang/Object;B)V

    iget-object p0, p0, Ljf0;->d:[Ldf0;

    aput-object v0, p0, p1

    return-void
.end method

.method public final p(IIJ)V
    .registers 7

    new-instance v0, Ldf0;

    const/4 v1, 0x3

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p3

    invoke-direct {v0, p2, p3, v1}, Ldf0;-><init>(ILjava/lang/Object;B)V

    iget-object p0, p0, Ljf0;->d:[Ldf0;

    aput-object v0, p0, p1

    return-void
.end method

.method public final q(IILjava/lang/Object;)V
    .registers 6

    if-nez p3, :cond_26

    if-gez p2, :cond_26

    new-instance p2, Ljava/lang/IllegalArgumentException;

    sget-object p3, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    new-instance p3, Ljava/lang/StringBuilder;

    const-string v0, "null value on non-nullable field["

    invoke-direct {p3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, "]: "

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p2, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    :cond_26
    new-instance v0, Ldf0;

    invoke-static {p3}, Ljf0;->c(Ljava/lang/Object;)B

    move-result v1

    invoke-direct {v0, p2, p3, v1}, Ldf0;-><init>(ILjava/lang/Object;B)V

    iget-object p0, p0, Ljf0;->d:[Ldf0;

    aput-object v0, p0, p1

    return-void
.end method

.method public final r(IIZ)V
    .registers 6

    new-instance v0, Ldf0;

    const/4 v1, 0x1

    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p3

    invoke-direct {v0, p2, p3, v1}, Ldf0;-><init>(ILjava/lang/Object;B)V

    iget-object p0, p0, Ljf0;->d:[Ldf0;

    aput-object v0, p0, p1

    return-void
.end method

.method public final t(Ljava/io/ByteArrayOutputStream;J)V
    .registers 6

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write(I)V

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write(I)V

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write(I)V

    iget-short v0, p0, Ljf0;->b:S

    shr-int/lit8 v1, v0, 0x8

    invoke-virtual {p1, v1}, Ljava/io/OutputStream;->write(I)V

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write(I)V

    iget v0, p0, Ljf0;->c:I

    if-ltz v0, :cond_1c

    int-to-long v0, v0

    invoke-static {p1, v0, v1}, Ljf0;->v(Ljava/io/ByteArrayOutputStream;J)V

    :cond_1c
    invoke-virtual {p0, p1, p2, p3}, Ljf0;->u(Ljava/io/ByteArrayOutputStream;J)V

    return-void
.end method

.method public final u(Ljava/io/ByteArrayOutputStream;J)V
    .registers 15

    const/4 v0, 0x0

    move v1, v0

    :goto_2
    iget-object v2, p0, Ljf0;->d:[Ldf0;

    array-length v3, v2

    if-ge v1, v3, :cond_56

    aget-object v2, v2, v1

    invoke-virtual {p0, v1}, Ljf0;->b(I)Lef0;

    move-result-object v3

    iget-short v3, v3, Lef0;->a:S

    int-to-long v3, v3

    and-long v5, v3, p2

    cmp-long v3, v5, v3

    if-eqz v3, :cond_18

    const/4 v3, 0x1

    goto :goto_19

    :cond_18
    move v3, v0

    :goto_19
    if-eqz v2, :cond_1d

    if-eqz v3, :cond_21

    :cond_1d
    invoke-virtual {p0, v1}, Ljf0;->a(I)Ldf0;

    move-result-object v2

    :cond_21
    if-eqz v2, :cond_38

    iget-byte v3, v2, Ldf0;->b:B

    if-ltz v3, :cond_2b

    int-to-long v3, v3

    invoke-static {p1, v3, v4}, Ljf0;->v(Ljava/io/ByteArrayOutputStream;J)V

    :cond_2b
    iget-byte v9, v2, Ldf0;->a:B

    iget-object v10, v2, Ldf0;->c:Ljava/lang/Object;

    move-object v5, p0

    move-object v6, p1

    move-wide v7, p2

    invoke-virtual/range {v5 .. v10}, Ljf0;->w(Ljava/io/ByteArrayOutputStream;JBLjava/lang/Object;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_38
    move-object v5, p0

    new-instance p0, Ljava/lang/RuntimeException;

    const-string p1, "Field #"

    const-string p2, " is not set in "

    invoke-static {v1, p1, p2}, Lp3p;->o(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_56
    return-void
.end method

.method public final w(Ljava/io/ByteArrayOutputStream;JBLjava/lang/Object;)V
    .registers 18

    iget-object v0, p0, Ljf0;->a:Ljava/nio/charset/Charset;

    const/16 v1, 0x18

    const-wide/16 v2, 0x0

    packed-switch p4, :pswitch_data_158

    return-void

    :pswitch_a
    invoke-static/range {p5 .. p5}, Lsko;->g(Ljava/lang/Object;)Ljava/lang/ClassCastException;

    move-result-object p0

    throw p0

    :pswitch_f
    move-object/from16 p0, p5

    check-cast p0, Lyc0;

    invoke-interface {p0}, Lyc0;->getValue()I

    move-result p0

    int-to-long p2, p0

    invoke-static {p1, p2, p3}, Ljf0;->v(Ljava/io/ByteArrayOutputStream;J)V

    return-void

    :pswitch_1c
    move-object/from16 v1, p5

    check-cast v1, Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_6d

    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v4

    int-to-long v4, v4

    invoke-static {p1, v4, v5}, Ljf0;->v(Ljava/io/ByteArrayOutputStream;J)V

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    invoke-static {v5}, Ljf0;->c(Ljava/lang/Object;)B

    move-result v10

    :goto_44
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v5, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v5

    array-length v6, v5

    int-to-long v6, v6

    invoke-static {p1, v6, v7}, Ljf0;->v(Ljava/io/ByteArrayOutputStream;J)V

    invoke-virtual {p1, v5}, Ljava/io/OutputStream;->write([B)V

    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v11

    move-object v6, p0

    move-object v7, p1

    move-wide v8, p2

    invoke-virtual/range {v6 .. v11}, Ljf0;->w(Ljava/io/ByteArrayOutputStream;JBLjava/lang/Object;)V

    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_6d

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    goto :goto_44

    :cond_6d
    invoke-static {p1, v2, v3}, Ljf0;->v(Ljava/io/ByteArrayOutputStream;J)V

    return-void

    :pswitch_71
    move-object/from16 v0, p5

    check-cast v0, Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_a4

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Ljf0;->c(Ljava/lang/Object;)B

    move-result v8

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    int-to-long v6, v1

    invoke-static {p1, v6, v7}, Ljf0;->v(Ljava/io/ByteArrayOutputStream;J)V

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_93
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_a4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    move-object v4, p0

    move-object v5, p1

    move-wide v6, p2

    invoke-virtual/range {v4 .. v9}, Ljf0;->w(Ljava/io/ByteArrayOutputStream;JBLjava/lang/Object;)V

    goto :goto_93

    :cond_a4
    invoke-static {p1, v2, v3}, Ljf0;->v(Ljava/io/ByteArrayOutputStream;J)V

    return-void

    :pswitch_a8
    move-object/from16 p0, p5

    check-cast p0, Ljf0;

    invoke-virtual {p0, p1, p2, p3}, Ljf0;->u(Ljava/io/ByteArrayOutputStream;J)V

    return-void

    :pswitch_b0
    move-object/from16 p0, p5

    check-cast p0, [B

    array-length p2, p0

    int-to-long p2, p2

    invoke-static {p1, p2, p3}, Ljf0;->v(Ljava/io/ByteArrayOutputStream;J)V

    invoke-virtual {p1, p0}, Ljava/io/OutputStream;->write([B)V

    return-void

    :pswitch_bd
    move-object/from16 p0, p5

    check-cast p0, Ljava/lang/String;

    invoke-virtual {p0, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p0

    array-length p2, p0

    int-to-long p2, p2

    invoke-static {p1, p2, p3}, Ljf0;->v(Ljava/io/ByteArrayOutputStream;J)V

    invoke-virtual {p1, p0}, Ljava/io/OutputStream;->write([B)V

    return-void

    :pswitch_ce
    move-object/from16 p0, p5

    check-cast p0, Ljava/lang/Double;

    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide p2

    invoke-static {p2, p3}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide p2

    long-to-int p0, p2

    invoke-virtual {p1, p0}, Ljava/io/OutputStream;->write(I)V

    const/16 p0, 0x8

    shr-long v2, p2, p0

    long-to-int p0, v2

    invoke-virtual {p1, p0}, Ljava/io/OutputStream;->write(I)V

    const/16 p0, 0x10

    shr-long v2, p2, p0

    long-to-int p0, v2

    invoke-virtual {p1, p0}, Ljava/io/OutputStream;->write(I)V

    shr-long v0, p2, v1

    long-to-int p0, v0

    invoke-virtual {p1, p0}, Ljava/io/OutputStream;->write(I)V

    const/16 p0, 0x20

    shr-long v0, p2, p0

    long-to-int p0, v0

    invoke-virtual {p1, p0}, Ljava/io/OutputStream;->write(I)V

    const/16 p0, 0x28

    shr-long v0, p2, p0

    long-to-int p0, v0

    invoke-virtual {p1, p0}, Ljava/io/OutputStream;->write(I)V

    const/16 p0, 0x30

    shr-long v0, p2, p0

    long-to-int p0, v0

    invoke-virtual {p1, p0}, Ljava/io/OutputStream;->write(I)V

    const/16 p0, 0x38

    shr-long/2addr p2, p0

    long-to-int p0, p2

    invoke-virtual {p1, p0}, Ljava/io/OutputStream;->write(I)V

    return-void

    :pswitch_114
    move-object/from16 p0, p5

    check-cast p0, Ljava/lang/Float;

    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    move-result p0

    invoke-static {p0}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result p0

    invoke-virtual {p1, p0}, Ljava/io/OutputStream;->write(I)V

    shr-int/lit8 p2, p0, 0x8

    invoke-virtual {p1, p2}, Ljava/io/OutputStream;->write(I)V

    shr-int/lit8 p2, p0, 0x10

    invoke-virtual {p1, p2}, Ljava/io/OutputStream;->write(I)V

    shr-int/2addr p0, v1

    invoke-virtual {p1, p0}, Ljava/io/OutputStream;->write(I)V

    return-void

    :pswitch_132
    move-object/from16 p0, p5

    check-cast p0, Ljava/lang/Long;

    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide p2

    invoke-static {p1, p2, p3}, Ljf0;->v(Ljava/io/ByteArrayOutputStream;J)V

    return-void

    :pswitch_13e
    move-object/from16 p0, p5

    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    int-to-long p2, p0

    invoke-static {p1, p2, p3}, Ljf0;->v(Ljava/io/ByteArrayOutputStream;J)V

    return-void

    :pswitch_14b
    move-object/from16 p0, p5

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    invoke-virtual {p1, p0}, Ljava/io/OutputStream;->write(I)V

    return-void

    nop

    :pswitch_data_158
    .packed-switch 0x1
        :pswitch_14b
        :pswitch_13e
        :pswitch_132
        :pswitch_114
        :pswitch_ce
        :pswitch_bd
        :pswitch_b0
        :pswitch_a8
        :pswitch_71
        :pswitch_1c
        :pswitch_f
        :pswitch_a
    .end packed-switch
.end method
