.class public final Ll/a;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ll/h;

.field public b:Ll/h;

.field public c:Ll/j;

.field public final synthetic d:I

.field public final synthetic e:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;)V
    .locals 0

    iput p1, p0, Ll/a;->d:I

    iput-object p2, p0, Ll/a;->e:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static h(Ljava/util/Set;Ljava/lang/Object;)Z
    .locals 2

    if-ne p0, p1, :cond_0

    goto :goto_0

    :cond_0
    instance-of v0, p1, Ljava/util/Set;

    if-eqz v0, :cond_1

    check-cast p1, Ljava/util/Set;

    :try_start_0
    invoke-interface {p0}, Ljava/util/Set;->size()I

    move-result v0

    invoke-interface {p1}, Ljava/util/Set;->size()I

    move-result v1

    if-ne v0, v1, :cond_1

    invoke-interface {p0, p1}, Ljava/util/Set;->containsAll(Ljava/util/Collection;)Z

    move-result p0
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz p0, :cond_1

    :goto_0
    const/4 p0, 0x1

    return p0

    :catch_0
    :cond_1
    const/4 p0, 0x0

    return p0
.end method


# virtual methods
.method public final a()V
    .locals 1

    iget v0, p0, Ll/a;->d:I

    packed-switch v0, :pswitch_data_0

    iget-object v0, p0, Ll/a;->e:Ljava/lang/Object;

    check-cast v0, Ll/c;

    invoke-virtual {v0}, Ll/c;->clear()V

    return-void

    :pswitch_0
    iget-object v0, p0, Ll/a;->e:Ljava/lang/Object;

    check-cast v0, Ll/b;

    invoke-virtual {v0}, Ll/k;->clear()V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final b(II)Ljava/lang/Object;
    .locals 1

    iget v0, p0, Ll/a;->d:I

    packed-switch v0, :pswitch_data_0

    iget-object p2, p0, Ll/a;->e:Ljava/lang/Object;

    check-cast p2, Ll/c;

    iget-object p2, p2, Ll/c;->b:[Ljava/lang/Object;

    aget-object p1, p2, p1

    return-object p1

    :pswitch_0
    iget-object v0, p0, Ll/a;->e:Ljava/lang/Object;

    check-cast v0, Ll/b;

    iget-object v0, v0, Ll/k;->b:[Ljava/lang/Object;

    shl-int/lit8 p1, p1, 0x1

    add-int/2addr p1, p2

    aget-object p1, v0, p1

    return-object p1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final c()Ljava/util/Map;
    .locals 2

    iget v0, p0, Ll/a;->d:I

    packed-switch v0, :pswitch_data_0

    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "not a map"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_0
    iget-object v0, p0, Ll/a;->e:Ljava/lang/Object;

    check-cast v0, Ll/b;

    return-object v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final d()I
    .locals 1

    iget v0, p0, Ll/a;->d:I

    packed-switch v0, :pswitch_data_0

    iget-object v0, p0, Ll/a;->e:Ljava/lang/Object;

    check-cast v0, Ll/c;

    iget v0, v0, Ll/c;->c:I

    return v0

    :pswitch_0
    iget-object v0, p0, Ll/a;->e:Ljava/lang/Object;

    check-cast v0, Ll/b;

    iget v0, v0, Ll/k;->c:I

    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final e(Ljava/lang/Object;)I
    .locals 2

    iget v0, p0, Ll/a;->d:I

    packed-switch v0, :pswitch_data_0

    iget-object v0, p0, Ll/a;->e:Ljava/lang/Object;

    check-cast v0, Ll/c;

    if-nez p1, :cond_0

    invoke-virtual {v0}, Ll/c;->d()I

    move-result p1

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    invoke-virtual {v0, v1, p1}, Ll/c;->c(ILjava/lang/Object;)I

    move-result p1

    :goto_0
    return p1

    :pswitch_0
    iget-object v0, p0, Ll/a;->e:Ljava/lang/Object;

    check-cast v0, Ll/b;

    invoke-virtual {v0, p1}, Ll/k;->d(Ljava/lang/Object;)I

    move-result p1

    return p1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final f(Ljava/lang/Object;)I
    .locals 2

    iget v0, p0, Ll/a;->d:I

    packed-switch v0, :pswitch_data_0

    iget-object v0, p0, Ll/a;->e:Ljava/lang/Object;

    check-cast v0, Ll/c;

    if-nez p1, :cond_0

    invoke-virtual {v0}, Ll/c;->d()I

    move-result p1

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    invoke-virtual {v0, v1, p1}, Ll/c;->c(ILjava/lang/Object;)I

    move-result p1

    :goto_0
    return p1

    :pswitch_0
    iget-object v0, p0, Ll/a;->e:Ljava/lang/Object;

    check-cast v0, Ll/b;

    invoke-virtual {v0, p1}, Ll/k;->f(Ljava/lang/Object;)I

    move-result p1

    return p1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final g(I)V
    .locals 1

    iget v0, p0, Ll/a;->d:I

    packed-switch v0, :pswitch_data_0

    iget-object v0, p0, Ll/a;->e:Ljava/lang/Object;

    check-cast v0, Ll/c;

    invoke-virtual {v0, p1}, Ll/c;->e(I)V

    return-void

    :pswitch_0
    iget-object v0, p0, Ll/a;->e:Ljava/lang/Object;

    check-cast v0, Ll/b;

    invoke-virtual {v0, p1}, Ll/k;->h(I)Ljava/lang/Object;

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final i([Ljava/lang/Object;I)[Ljava/lang/Object;
    .locals 3

    invoke-virtual {p0}, Ll/a;->d()I

    move-result v0

    array-length v1, p1

    if-ge v1, v0, :cond_0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object p1

    invoke-static {p1, v0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Ljava/lang/Object;

    :cond_0
    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    invoke-virtual {p0, v1, p2}, Ll/a;->b(II)Ljava/lang/Object;

    move-result-object v2

    aput-object v2, p1, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    array-length p2, p1

    if-le p2, v0, :cond_2

    const/4 p2, 0x0

    aput-object p2, p1, v0

    :cond_2
    return-object p1
.end method
