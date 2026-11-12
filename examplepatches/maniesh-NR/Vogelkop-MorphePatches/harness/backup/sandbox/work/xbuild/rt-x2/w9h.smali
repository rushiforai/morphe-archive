.class public final Lw9h;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:Ljava/lang/String;

.field public final e:Ljava/lang/String;

.field public final f:J

.field public final g:I

.field public final h:I

.field public final i:Ljava/lang/String;

.field public final j:Lsa2;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JIILjava/lang/String;)V
    .registers 14

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lsa2;

    const/16 v1, 0xa

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lsa2;-><init>(BZ)V

    iput-object v0, p0, Lw9h;->j:Lsa2;

    iput-object p1, p0, Lw9h;->a:Ljava/lang/String;

    iput-object p2, p0, Lw9h;->b:Ljava/lang/String;

    iput-object p3, p0, Lw9h;->c:Ljava/lang/String;

    iput-object p4, p0, Lw9h;->d:Ljava/lang/String;

    iput-object p5, p0, Lw9h;->e:Ljava/lang/String;

    iput-wide p6, p0, Lw9h;->f:J

    iput p8, p0, Lw9h;->g:I

    iput p9, p0, Lw9h;->h:I

    iput-object p10, p0, Lw9h;->i:Ljava/lang/String;

    return-void
.end method

.method public static a(Lorb;)Lw9h;
    .registers 13

    const-string v0, "publisher_id"

    invoke-virtual {p0, v0}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_75

    const-string v0, "publisher_name"

    invoke-virtual {p0, v0}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_6f

    const-string v0, "publisher_logo"

    invoke-virtual {p0, v0}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_69

    const-string v0, "description"

    const-string v5, ""

    invoke-virtual {p0, v0, v5}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_34

    move-object v0, v1

    :cond_34
    const-string v6, "reason"

    invoke-virtual {p0, v6, v5}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_41

    move-object v6, v1

    :cond_41
    const-string v7, "infra_feedback"

    invoke-virtual {p0, v7, v5}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_4f

    move-object v11, v1

    goto :goto_50

    :cond_4f
    move-object v11, v5

    :goto_50
    const-string v1, "lastupdate_time"

    invoke-virtual {p0, v1}, Lorb;->j(Ljava/lang/String;)J

    move-result-wide v7

    const-string v1, "subscribers"

    invoke-virtual {p0, v1}, Lorb;->g(Ljava/lang/String;)I

    move-result v9

    const-string v1, "posts"

    invoke-virtual {p0, v1}, Lorb;->g(Ljava/lang/String;)I

    move-result v10

    new-instance v1, Lw9h;

    move-object v5, v0

    invoke-direct/range {v1 .. v11}, Lw9h;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JIILjava/lang/String;)V

    return-object v1

    :cond_69
    const-string p0, "no logo url"

    invoke-static {p0}, Lcom/appsflyer/internal/o;->a(Ljava/lang/String;)V

    return-object v1

    :cond_6f
    const-string p0, "no publisher name"

    invoke-static {p0}, Lcom/appsflyer/internal/o;->a(Ljava/lang/String;)V

    return-object v1

    :cond_75
    const-string p0, "no publisher id"

    invoke-static {p0}, Lcom/appsflyer/internal/o;->a(Ljava/lang/String;)V

    return-object v1
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 3

    instance-of v0, p1, Lw9h;

    if-eqz v0, :cond_12

    check-cast p1, Lw9h;

    iget-object p1, p1, Lw9h;->a:Ljava/lang/String;

    iget-object p0, p0, Lw9h;->a:Ljava/lang/String;

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_12

    const/4 p0, 0x1

    return p0

    :cond_12
    const/4 p0, 0x0

    return p0
.end method

.method public final hashCode()I
    .registers 1

    iget-object p0, p0, Lw9h;->a:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result p0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 3

    iget-object v0, p0, Lw9h;->j:Lsa2;

    iget v0, v0, Lsa2;->b:I

    new-instance v1, Ljava/lang/StringBuilder;

    iget-object p0, p0, Lw9h;->a:Ljava/lang/String;

    invoke-direct {v1, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    if-eqz v0, :cond_12

    invoke-static {v0}, Lo18;->g(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_13

    :cond_12
    const/4 p0, 0x0

    :goto_13
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
