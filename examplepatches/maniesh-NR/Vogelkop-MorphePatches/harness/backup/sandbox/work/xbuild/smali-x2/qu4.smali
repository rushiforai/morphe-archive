.class public final Lqu4;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Z

.field public final b:Ljava/util/List;

.field public final c:Ljava/util/List;


# direct methods
.method public constructor <init>(Ljava/util/List;Ljava/util/List;Z)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p3, p0, Lqu4;->a:Z

    iput-object p1, p0, Lqu4;->b:Ljava/util/List;

    iput-object p2, p0, Lqu4;->c:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final a()Lorb;
    .registers 8

    new-instance v0, Lorb;

    invoke-direct {v0}, Lorb;-><init>()V

    iget-boolean v1, p0, Lqu4;->a:Z

    const-string v2, "thinkHarder"

    invoke-virtual {v0, v2, v1}, Lorb;->r(Ljava/lang/String;Z)V

    new-instance v1, Lvpb;

    invoke-direct {v1}, Lvpb;-><init>()V

    iget-object v2, p0, Lqu4;->b:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_17
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_44

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lspj;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v4, Lorb;

    invoke-direct {v4}, Lorb;-><init>()V

    iget-object v5, v3, Lspj;->a:Ljava/lang/String;

    const-string v6, "name"

    invoke-virtual {v4, v5, v6}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v5, v3, Lspj;->b:Ljava/lang/String;

    const-string v6, "description"

    invoke-virtual {v4, v5, v6}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v3, v3, Lspj;->c:Ljava/lang/String;

    const-string v5, "prompt"

    invoke-virtual {v4, v3, v5}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v1, v4}, Lvpb;->a(Ljava/lang/Object;)V

    goto :goto_17

    :cond_44
    const-string v2, "skills"

    invoke-virtual {v0, v1, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v1, Lvpb;

    invoke-direct {v1}, Lvpb;-><init>()V

    iget-object p0, p0, Lqu4;->c:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_54
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_73

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lvfb;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v3, Lorb;

    invoke-direct {v3}, Lorb;-><init>()V

    iget-object v2, v2, Lvfb;->a:Ljava/lang/String;

    const-string v4, "id"

    invoke-virtual {v3, v2, v4}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v1, v3}, Lvpb;->a(Ljava/lang/Object;)V

    goto :goto_54

    :cond_73
    const-string p0, "webpageContext"

    invoke-virtual {v0, v1, p0}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lqu4;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lqu4;

    iget-boolean v1, p0, Lqu4;->a:Z

    iget-boolean v3, p1, Lqu4;->a:Z

    if-eq v1, v3, :cond_13

    return v2

    :cond_13
    iget-object v1, p0, Lqu4;->b:Ljava/util/List;

    iget-object v3, p1, Lqu4;->b:Ljava/util/List;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1e

    return v2

    :cond_1e
    iget-object p0, p0, Lqu4;->c:Ljava/util/List;

    iget-object p1, p1, Lqu4;->c:Ljava/util/List;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_29

    return v2

    :cond_29
    return v0
.end method

.method public final hashCode()I
    .registers 4

    iget-boolean v0, p0, Lqu4;->a:Z

    invoke-static {v0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Lqu4;->b:Ljava/util/List;

    invoke-static {v0, v1, v2}, Lrfp;->f(IILjava/util/List;)I

    move-result v0

    iget-object p0, p0, Lqu4;->c:Ljava/util/List;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "ChatModifiers(thinkHarder="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-boolean v1, p0, Lqu4;->a:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", skills="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lqu4;->b:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", webpageContext="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lqu4;->c:Ljava/util/List;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, ")"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
