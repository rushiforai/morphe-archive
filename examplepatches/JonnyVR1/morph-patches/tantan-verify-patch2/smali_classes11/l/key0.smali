.class public final Ll/key0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Iterator;


# instance fields
.field public a:I

.field public b:Z

.field public c:Ljava/util/Iterator;

.field public final synthetic d:Ll/scy0;


# direct methods
.method public constructor <init>(Ll/scy0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/key0;->d:Ll/scy0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, -0x1

    .line 7
    iput p1, p0, Ll/key0;->a:I

    .line 8
    .line 9
    return-void
.end method

.method public synthetic constructor <init>(Ll/scy0;Ll/qey0;)V
    .locals 0

    .line 10
    invoke-direct {p0, p1}, Ll/key0;-><init>(Ll/scy0;)V

    return-void
.end method


# virtual methods
.method public final a()Ljava/util/Iterator;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/key0;->c:Ljava/util/Iterator;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/key0;->d:Ll/scy0;

    .line 6
    .line 7
    invoke-static {v0}, Ll/scy0;->i(Ll/scy0;)Ljava/util/Map;

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
    iput-object v0, p0, Ll/key0;->c:Ljava/util/Iterator;

    .line 20
    .line 21
    :cond_0
    iget-object p0, p0, Ll/key0;->c:Ljava/util/Iterator;

    .line 22
    .line 23
    return-object p0
.end method

.method public final hasNext()Z
    .locals 3

    .line 1
    iget v0, p0, Ll/key0;->a:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    add-int/2addr v0, v1

    .line 5
    iget-object v2, p0, Ll/key0;->d:Ll/scy0;

    .line 6
    .line 7
    invoke-static {v2}, Ll/scy0;->c(Ll/scy0;)I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    if-lt v0, v2, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, Ll/key0;->d:Ll/scy0;

    .line 14
    .line 15
    invoke-static {v0}, Ll/scy0;->i(Ll/scy0;)Ljava/util/Map;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/key0;->a()Ljava/util/Iterator;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-eqz p0, :cond_0

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    const/4 p0, 0x0

    .line 37
    return p0

    .line 38
    :cond_1
    :goto_0
    return v1
.end method

.method public final synthetic next()Ljava/lang/Object;
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/key0;->b:Z

    .line 3
    .line 4
    iget v1, p0, Ll/key0;->a:I

    .line 5
    .line 6
    add-int/2addr v1, v0

    .line 7
    iput v1, p0, Ll/key0;->a:I

    .line 8
    .line 9
    iget-object v0, p0, Ll/key0;->d:Ll/scy0;

    .line 10
    .line 11
    invoke-static {v0}, Ll/scy0;->c(Ll/scy0;)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-ge v1, v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Ll/key0;->d:Ll/scy0;

    .line 18
    .line 19
    invoke-static {v0}, Ll/scy0;->o(Ll/scy0;)[Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget p0, p0, Ll/key0;->a:I

    .line 24
    .line 25
    aget-object p0, v0, p0

    .line 26
    .line 27
    check-cast p0, Ll/fdy0;

    .line 28
    .line 29
    return-object p0

    .line 30
    :cond_0
    invoke-virtual {p0}, Ll/key0;->a()Ljava/util/Iterator;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    check-cast p0, Ljava/util/Map$Entry;

    .line 39
    .line 40
    return-object p0
.end method

.method public final remove()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/key0;->b:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Ll/key0;->b:Z

    .line 7
    .line 8
    iget-object v0, p0, Ll/key0;->d:Ll/scy0;

    .line 9
    .line 10
    invoke-static {v0}, Ll/scy0;->m(Ll/scy0;)V

    .line 11
    .line 12
    .line 13
    iget v0, p0, Ll/key0;->a:I

    .line 14
    .line 15
    iget-object v1, p0, Ll/key0;->d:Ll/scy0;

    .line 16
    .line 17
    invoke-static {v1}, Ll/scy0;->c(Ll/scy0;)I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-ge v0, v1, :cond_0

    .line 22
    .line 23
    iget-object v0, p0, Ll/key0;->d:Ll/scy0;

    .line 24
    .line 25
    iget v1, p0, Ll/key0;->a:I

    .line 26
    .line 27
    add-int/lit8 v2, v1, -0x1

    .line 28
    .line 29
    iput v2, p0, Ll/key0;->a:I

    .line 30
    .line 31
    invoke-static {v0, v1}, Ll/scy0;->e(Ll/scy0;I)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    invoke-virtual {p0}, Ll/key0;->a()Ljava/util/Iterator;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-interface {p0}, Ljava/util/Iterator;->remove()V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_1
    const-string p0, "remove() was called before next()"

    .line 44
    .line 45
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method
