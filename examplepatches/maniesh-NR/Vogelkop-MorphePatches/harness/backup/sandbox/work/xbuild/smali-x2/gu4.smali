.class public final Lgu4;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:J

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:Lru4;

.field public final e:Lsu4;

.field public final f:Z

.field public final g:Ljava/lang/Boolean;

.field public final h:Lqu4;

.field public final i:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>(JLjava/lang/String;Ljava/lang/String;Lru4;Lsu4;ZLjava/lang/Boolean;Lqu4;Ljava/util/ArrayList;)V
    .registers 11

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lgu4;->a:J

    iput-object p3, p0, Lgu4;->b:Ljava/lang/String;

    iput-object p4, p0, Lgu4;->c:Ljava/lang/String;

    iput-object p5, p0, Lgu4;->d:Lru4;

    iput-object p6, p0, Lgu4;->e:Lsu4;

    iput-boolean p7, p0, Lgu4;->f:Z

    iput-object p8, p0, Lgu4;->g:Ljava/lang/Boolean;

    iput-object p9, p0, Lgu4;->h:Lqu4;

    iput-object p10, p0, Lgu4;->i:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    if-eq p0, p1, :cond_56

    instance-of v0, p1, Lgu4;

    if-eqz v0, :cond_54

    check-cast p1, Lgu4;

    iget-wide v0, p0, Lgu4;->a:J

    iget-wide v2, p1, Lgu4;->a:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_54

    iget-object v0, p0, Lgu4;->b:Ljava/lang/String;

    iget-object v1, p1, Lgu4;->b:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_54

    iget-object v0, p0, Lgu4;->c:Ljava/lang/String;

    iget-object v1, p1, Lgu4;->c:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_54

    iget-object v0, p0, Lgu4;->d:Lru4;

    iget-object v1, p1, Lgu4;->d:Lru4;

    if-ne v0, v1, :cond_54

    iget-object v0, p0, Lgu4;->e:Lsu4;

    iget-object v1, p1, Lgu4;->e:Lsu4;

    if-ne v0, v1, :cond_54

    iget-boolean v0, p0, Lgu4;->f:Z

    iget-boolean v1, p1, Lgu4;->f:Z

    if-ne v0, v1, :cond_54

    iget-object v0, p0, Lgu4;->g:Ljava/lang/Boolean;

    iget-object v1, p1, Lgu4;->g:Ljava/lang/Boolean;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_54

    iget-object v0, p0, Lgu4;->h:Lqu4;

    iget-object v1, p1, Lgu4;->h:Lqu4;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_54

    iget-object p0, p0, Lgu4;->i:Ljava/util/ArrayList;

    iget-object p1, p1, Lgu4;->i:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_56

    :cond_54
    const/4 p0, 0x0

    return p0

    :cond_56
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 5

    iget-wide v0, p0, Lgu4;->a:J

    invoke-static {v0, v1}, Ljava/lang/Long;->hashCode(J)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Lgu4;->b:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    const/4 v2, 0x0

    iget-object v3, p0, Lgu4;->c:Ljava/lang/String;

    if-nez v3, :cond_16

    move v3, v2

    goto :goto_1a

    :cond_16
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_1a
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Lgu4;->d:Lru4;

    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    add-int/2addr v3, v0

    mul-int/2addr v3, v1

    iget-object v0, p0, Lgu4;->e:Lsu4;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-boolean v3, p0, Lgu4;->f:Z

    invoke-static {v0, v1, v3}, Lfki;->k(IIZ)I

    move-result v0

    iget-object v3, p0, Lgu4;->g:Ljava/lang/Boolean;

    if-nez v3, :cond_38

    move v3, v2

    goto :goto_3c

    :cond_38
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    :goto_3c
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Lgu4;->h:Lqu4;

    if-eqz v3, :cond_46

    invoke-virtual {v3}, Lqu4;->hashCode()I

    move-result v2

    :cond_46
    add-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget-object p0, p0, Lgu4;->i:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 6

    const-string v0, "Chat(chatId="

    const-string v1, ", title="

    iget-wide v2, p0, Lgu4;->a:J

    iget-object v4, p0, Lgu4;->b:Ljava/lang/String;

    invoke-static {v2, v3, v0, v1, v4}, Lsko;->q(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", userId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lgu4;->c:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", position="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lgu4;->d:Lru4;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", state="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lgu4;->e:Lsu4;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", hasContent="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lgu4;->f:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", isPrivate="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lgu4;->g:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", modifiers="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lgu4;->h:Lqu4;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", messages="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lgu4;->i:Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, ")"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
