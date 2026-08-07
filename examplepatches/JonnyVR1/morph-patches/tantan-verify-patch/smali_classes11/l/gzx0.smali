.class public final Ll/gzx0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Iterator;


# instance fields
.field public a:I

.field public b:Z

.field public c:Ljava/util/Iterator;

.field public final synthetic d:Ll/uzx0;


# direct methods
.method public synthetic constructor <init>(Ll/uzx0;Ll/qzx0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/gzx0;->d:Ll/uzx0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, -0x1

    .line 7
    iput p1, p0, Ll/gzx0;->a:I

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final a()Ljava/util/Iterator;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gzx0;->c:Ljava/util/Iterator;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/gzx0;->d:Ll/uzx0;

    .line 6
    .line 7
    invoke-static {v0}, Ll/uzx0;->h(Ll/uzx0;)Ljava/util/Map;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Ll/gzx0;->c:Ljava/util/Iterator;

    .line 20
    .line 21
    :cond_0
    iget-object p0, p0, Ll/gzx0;->c:Ljava/util/Iterator;

    .line 22
    .line 23
    return-object p0
.end method

.method public final hasNext()Z
    .locals 4

    .line 1
    iget v0, p0, Ll/gzx0;->a:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    add-int/2addr v0, v1

    .line 5
    iget-object v2, p0, Ll/gzx0;->d:Ll/uzx0;

    .line 6
    .line 7
    invoke-static {v2}, Ll/uzx0;->b(Ll/uzx0;)I

    .line 8
    .line 9
    .line 10
    move-result v3

    .line 11
    if-lt v0, v3, :cond_1

    .line 12
    .line 13
    invoke-static {v2}, Ll/uzx0;->h(Ll/uzx0;)Ljava/util/Map;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    const/4 v2, 0x0

    .line 22
    if-nez v0, :cond_0

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/gzx0;->a()Ljava/util/Iterator;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-eqz p0, :cond_0

    .line 33
    .line 34
    return v1

    .line 35
    :cond_0
    return v2

    .line 36
    :cond_1
    return v1
.end method

.method public final bridge synthetic next()Ljava/lang/Object;
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/gzx0;->b:Z

    .line 3
    .line 4
    iget v1, p0, Ll/gzx0;->a:I

    .line 5
    .line 6
    add-int/2addr v1, v0

    .line 7
    iput v1, p0, Ll/gzx0;->a:I

    .line 8
    .line 9
    iget-object v0, p0, Ll/gzx0;->d:Ll/uzx0;

    .line 10
    .line 11
    invoke-static {v0}, Ll/uzx0;->b(Ll/uzx0;)I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    if-ge v1, v2, :cond_0

    .line 16
    .line 17
    invoke-static {v0}, Ll/uzx0;->k(Ll/uzx0;)[Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    aget-object p0, p0, v1

    .line 22
    .line 23
    check-cast p0, Ll/czx0;

    .line 24
    .line 25
    return-object p0

    .line 26
    :cond_0
    invoke-virtual {p0}, Ll/gzx0;->a()Ljava/util/Iterator;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    check-cast p0, Ljava/util/Map$Entry;

    .line 35
    .line 36
    return-object p0
.end method

.method public final remove()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/gzx0;->b:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Ll/gzx0;->b:Z

    .line 7
    .line 8
    iget-object v0, p0, Ll/gzx0;->d:Ll/uzx0;

    .line 9
    .line 10
    invoke-static {v0}, Ll/uzx0;->i(Ll/uzx0;)V

    .line 11
    .line 12
    .line 13
    iget v0, p0, Ll/gzx0;->a:I

    .line 14
    .line 15
    iget-object v1, p0, Ll/gzx0;->d:Ll/uzx0;

    .line 16
    .line 17
    invoke-static {v1}, Ll/uzx0;->b(Ll/uzx0;)I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-ge v0, v2, :cond_0

    .line 22
    .line 23
    add-int/lit8 v2, v0, -0x1

    .line 24
    .line 25
    iput v2, p0, Ll/gzx0;->a:I

    .line 26
    .line 27
    invoke-static {v1, v0}, Ll/uzx0;->e(Ll/uzx0;I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    invoke-virtual {p0}, Ll/gzx0;->a()Ljava/util/Iterator;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-interface {p0}, Ljava/util/Iterator;->remove()V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_1
    const-string p0, "remove() was called before next()"

    .line 40
    .line 41
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method
