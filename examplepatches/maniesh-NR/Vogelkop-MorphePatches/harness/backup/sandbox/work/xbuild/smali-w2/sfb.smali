.class public final Lsfb;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:J

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:Z

.field public final e:Ljava/lang/Boolean;

.field public final f:Lqu4;

.field public final g:Ljava/lang/String;

.field public final h:Ljava/util/ArrayList;

.field public final i:J

.field public final j:J

.field public final k:Lwfb;

.field public final l:Ljava/util/ArrayList;

.field public final m:Ljava/lang/String;


# direct methods
.method public constructor <init>(JLjava/lang/String;Ljava/lang/String;ZLjava/lang/Boolean;Lqu4;Ljava/lang/String;Ljava/util/ArrayList;JJLwfb;Ljava/util/ArrayList;Ljava/lang/String;)V
    .registers 17

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lsfb;->a:J

    iput-object p3, p0, Lsfb;->b:Ljava/lang/String;

    iput-object p4, p0, Lsfb;->c:Ljava/lang/String;

    iput-boolean p5, p0, Lsfb;->d:Z

    iput-object p6, p0, Lsfb;->e:Ljava/lang/Boolean;

    iput-object p7, p0, Lsfb;->f:Lqu4;

    iput-object p8, p0, Lsfb;->g:Ljava/lang/String;

    iput-object p9, p0, Lsfb;->h:Ljava/util/ArrayList;

    iput-wide p10, p0, Lsfb;->i:J

    iput-wide p12, p0, Lsfb;->j:J

    iput-object p14, p0, Lsfb;->k:Lwfb;

    iput-object p15, p0, Lsfb;->l:Ljava/util/ArrayList;

    move-object/from16 p1, p16

    iput-object p1, p0, Lsfb;->m:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final a()Lorb;
    .registers 11

    new-instance v0, Lorb;

    invoke-direct {v0}, Lorb;-><init>()V

    iget-wide v1, p0, Lsfb;->a:J

    const-string v3, "chatId"

    invoke-virtual {v0, v1, v2, v3}, Lorb;->o(JLjava/lang/String;)V

    iget-object v1, p0, Lsfb;->b:Ljava/lang/String;

    const-string v2, "title"

    invoke-virtual {v0, v1, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v1, p0, Lsfb;->c:Ljava/lang/String;

    const-string v2, "userId"

    invoke-virtual {v0, v1, v2}, Lorb;->s(Ljava/lang/Object;Ljava/lang/String;)V

    iget-boolean v1, p0, Lsfb;->d:Z

    const-string v2, "hasContent"

    invoke-virtual {v0, v2, v1}, Lorb;->r(Ljava/lang/String;Z)V

    iget-object v1, p0, Lsfb;->e:Ljava/lang/Boolean;

    const-string v2, "isPrivate"

    invoke-virtual {v0, v1, v2}, Lorb;->s(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v1, 0x0

    iget-object v2, p0, Lsfb;->f:Lqu4;

    if-eqz v2, :cond_32

    invoke-virtual {v2}, Lqu4;->a()Lorb;

    move-result-object v2

    goto :goto_33

    :cond_32
    move-object v2, v1

    :goto_33
    const-string v3, "modifiers"

    invoke-virtual {v0, v2, v3}, Lorb;->s(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v2, p0, Lsfb;->g:Ljava/lang/String;

    const-string v3, "conversationId"

    invoke-virtual {v0, v2, v3}, Lorb;->s(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v2, Lvpb;

    invoke-direct {v2}, Lvpb;-><init>()V

    iget-object v3, p0, Lsfb;->h:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/4 v5, 0x0

    move v6, v5

    :goto_4c
    if-ge v6, v4, :cond_60

    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    add-int/lit8 v6, v6, 0x1

    check-cast v7, Ljava/lang/Number;

    invoke-virtual {v7}, Ljava/lang/Number;->longValue()J

    move-result-wide v7

    iget-object v9, v2, Lvpb;->a:Lorg/json/JSONArray;

    invoke-virtual {v9, v7, v8}, Lorg/json/JSONArray;->put(J)Lorg/json/JSONArray;

    goto :goto_4c

    :cond_60
    const-string v3, "items"

    invoke-virtual {v0, v2, v3}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-wide v2, p0, Lsfb;->i:J

    const-string v4, "created"

    invoke-virtual {v0, v2, v3, v4}, Lorb;->o(JLjava/lang/String;)V

    iget-wide v2, p0, Lsfb;->j:J

    const-string v4, "modified"

    invoke-virtual {v0, v2, v3, v4}, Lorb;->o(JLjava/lang/String;)V

    sget-object v2, Lwfb;->b:Lwfb;

    iget-object v3, p0, Lsfb;->k:Lwfb;

    if-eq v3, v2, :cond_bb

    iget-object v2, v3, Lwfb;->a:Ljava/lang/String;

    const-string v3, "state"

    invoke-virtual {v0, v2, v3}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v2, p0, Lsfb;->l:Ljava/util/ArrayList;

    if-eqz v2, :cond_89

    new-instance v1, Lvpb;

    invoke-direct {v1}, Lvpb;-><init>()V

    :cond_89
    if-eqz v1, :cond_ae

    if-eqz v2, :cond_ae

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    :goto_91
    if-ge v5, v3, :cond_ae

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v5, v5, 0x1

    check-cast v4, Lxfb;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v6, Lorb;

    invoke-direct {v6}, Lorb;-><init>()V

    iget-object v4, v4, Lxfb;->a:Ljava/lang/String;

    const-string v7, "id"

    invoke-virtual {v6, v4, v7}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v1, v6}, Lvpb;->a(Ljava/lang/Object;)V

    goto :goto_91

    :cond_ae
    const-string v2, "webpageContext"

    invoke-virtual {v0, v1, v2}, Lorb;->s(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object p0, p0, Lsfb;->m:Ljava/lang/String;

    const-string v1, "blob"

    invoke-virtual {v0, p0, v1}, Lorb;->s(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v0

    :cond_bb
    const-string p0, "Undefined"

    invoke-static {p0}, Lcom/appsflyer/internal/o;->a(Ljava/lang/String;)V

    return-object v1
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    if-eq p0, p1, :cond_7e

    instance-of v0, p1, Lsfb;

    if-eqz v0, :cond_7c

    check-cast p1, Lsfb;

    iget-wide v0, p0, Lsfb;->a:J

    iget-wide v2, p1, Lsfb;->a:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_7c

    iget-object v0, p0, Lsfb;->b:Ljava/lang/String;

    iget-object v1, p1, Lsfb;->b:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7c

    iget-object v0, p0, Lsfb;->c:Ljava/lang/String;

    iget-object v1, p1, Lsfb;->c:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7c

    iget-boolean v0, p0, Lsfb;->d:Z

    iget-boolean v1, p1, Lsfb;->d:Z

    if-ne v0, v1, :cond_7c

    iget-object v0, p0, Lsfb;->e:Ljava/lang/Boolean;

    iget-object v1, p1, Lsfb;->e:Ljava/lang/Boolean;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7c

    iget-object v0, p0, Lsfb;->f:Lqu4;

    iget-object v1, p1, Lsfb;->f:Lqu4;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7c

    iget-object v0, p0, Lsfb;->g:Ljava/lang/String;

    iget-object v1, p1, Lsfb;->g:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7c

    iget-object v0, p0, Lsfb;->h:Ljava/util/ArrayList;

    iget-object v1, p1, Lsfb;->h:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7c

    iget-wide v0, p0, Lsfb;->i:J

    iget-wide v2, p1, Lsfb;->i:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_7c

    iget-wide v0, p0, Lsfb;->j:J

    iget-wide v2, p1, Lsfb;->j:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_7c

    iget-object v0, p0, Lsfb;->k:Lwfb;

    iget-object v1, p1, Lsfb;->k:Lwfb;

    if-ne v0, v1, :cond_7c

    iget-object v0, p0, Lsfb;->l:Ljava/util/ArrayList;

    iget-object v1, p1, Lsfb;->l:Ljava/util/ArrayList;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7c

    iget-object p0, p0, Lsfb;->m:Ljava/lang/String;

    iget-object p1, p1, Lsfb;->m:Ljava/lang/String;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_7e

    :cond_7c
    const/4 p0, 0x0

    return p0

    :cond_7e
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 6

    iget-wide v0, p0, Lsfb;->a:J

    invoke-static {v0, v1}, Ljava/lang/Long;->hashCode(J)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Lsfb;->b:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    const/4 v2, 0x0

    iget-object v3, p0, Lsfb;->c:Ljava/lang/String;

    if-nez v3, :cond_16

    move v3, v2

    goto :goto_1a

    :cond_16
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_1a
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-boolean v3, p0, Lsfb;->d:Z

    invoke-static {v0, v1, v3}, Lfki;->k(IIZ)I

    move-result v0

    iget-object v3, p0, Lsfb;->e:Ljava/lang/Boolean;

    if-nez v3, :cond_28

    move v3, v2

    goto :goto_2c

    :cond_28
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    :goto_2c
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Lsfb;->f:Lqu4;

    if-nez v3, :cond_34

    move v3, v2

    goto :goto_38

    :cond_34
    invoke-virtual {v3}, Lqu4;->hashCode()I

    move-result v3

    :goto_38
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Lsfb;->g:Ljava/lang/String;

    if-nez v3, :cond_40

    move v3, v2

    goto :goto_44

    :cond_40
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_44
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Lsfb;->h:Ljava/util/ArrayList;

    invoke-static {v3, v0, v1}, Lz1m;->g(Ljava/util/ArrayList;II)I

    move-result v0

    iget-wide v3, p0, Lsfb;->i:J

    invoke-static {v0, v1, v3, v4}, Lz1m;->e(IIJ)I

    move-result v0

    iget-wide v3, p0, Lsfb;->j:J

    invoke-static {v0, v1, v3, v4}, Lz1m;->e(IIJ)I

    move-result v0

    iget-object v3, p0, Lsfb;->k:Lwfb;

    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    add-int/2addr v3, v0

    mul-int/2addr v3, v1

    iget-object v0, p0, Lsfb;->l:Ljava/util/ArrayList;

    if-nez v0, :cond_66

    move v0, v2

    goto :goto_6a

    :cond_66
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    :goto_6a
    add-int/2addr v3, v0

    mul-int/2addr v3, v1

    iget-object p0, p0, Lsfb;->m:Ljava/lang/String;

    if-eqz p0, :cond_74

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v2

    :cond_74
    add-int/2addr v3, v2

    return v3
.end method

.method public final toString()Ljava/lang/String;
    .registers 6

    const-string v0, "InternalChat(chatId="

    const-string v1, ", title="

    iget-wide v2, p0, Lsfb;->a:J

    iget-object v4, p0, Lsfb;->b:Ljava/lang/String;

    invoke-static {v2, v3, v0, v1, v4}, Lsko;->q(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", userId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lsfb;->c:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", hasContent="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lsfb;->d:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", isPrivate="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lsfb;->e:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", modifiers="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lsfb;->f:Lqu4;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", conversationId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lsfb;->g:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", items="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lsfb;->h:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", created="

    const-string v2, ", modified="

    iget-wide v3, p0, Lsfb;->i:J

    invoke-static {v0, v1, v3, v4, v2}, Lp3p;->u(Ljava/lang/StringBuilder;Ljava/lang/String;JLjava/lang/String;)V

    iget-wide v1, p0, Lsfb;->j:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ", state="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lsfb;->k:Lwfb;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", webpageContext="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lsfb;->l:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", blob="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lsfb;->m:Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, ")"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
