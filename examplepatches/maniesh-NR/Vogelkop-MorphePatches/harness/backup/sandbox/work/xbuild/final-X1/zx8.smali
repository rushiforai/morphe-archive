.class public abstract Lzx8;
.super Ldy8;
.source "SourceFile"


# instance fields
.field public final c:Ljava/lang/String;

.field public final d:Ljava/lang/String;

.field public final e:Ljava/lang/String;

.field public final f:Ljava/lang/String;

.field public final g:Ljava/lang/String;

.field public final h:Ljava/lang/String;

.field public final i:Ljava/lang/String;

.field public final j:Ljava/lang/String;

.field public final k:Ljava/lang/String;

.field public final l:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lmsh;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5

    invoke-direct {p0, p2}, Ldy8;-><init>(Ljava/lang/String;)V

    iget-object p2, p1, Lmsh;->v:Lp12;

    iget-object v0, p2, Lp12;->a:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lzx8;->c:Ljava/lang/String;

    instance-of v0, p1, Ldre;

    if-eqz v0, :cond_2b

    check-cast p1, Ldre;

    iget-object p1, p1, Ldre;->D:Llog;

    iget-object p2, p1, Llog;->b:Ljava/lang/String;

    iput-object p2, p0, Lzx8;->d:Ljava/lang/String;

    const-string p2, "clip"

    iput-object p2, p0, Lzx8;->g:Ljava/lang/String;

    iget-object p1, p1, Lou9;->a:Ljava/lang/String;

    iput-object p1, p0, Lzx8;->k:Ljava/lang/String;

    const/4 p3, 0x0

    iput-object p3, p0, Lzx8;->e:Ljava/lang/String;

    iput-object p3, p0, Lzx8;->f:Ljava/lang/String;

    iput-object p3, p0, Lzx8;->h:Ljava/lang/String;

    iput-object p3, p0, Lzx8;->i:Ljava/lang/String;

    iput-object p3, p0, Lzx8;->j:Ljava/lang/String;

    goto :goto_59

    :cond_2b
    iget-object v0, p2, Lp12;->b:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lzx8;->d:Ljava/lang/String;

    iget-object v0, p2, Lp12;->f:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lzx8;->e:Ljava/lang/String;

    iget-object v0, p2, Lp12;->e:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lzx8;->f:Ljava/lang/String;

    iget-object p1, p1, Loqe;->c:Ljava/lang/String;

    iput-object p1, p0, Lzx8;->g:Ljava/lang/String;

    iget-object p1, p2, Lp12;->d:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    iput-object p1, p0, Lzx8;->h:Ljava/lang/String;

    iget-object p1, p2, Lp12;->c:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    iput-object p1, p0, Lzx8;->i:Ljava/lang/String;

    iget-object p1, p2, Lp12;->h:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    iput-object p1, p0, Lzx8;->j:Ljava/lang/String;

    iget-object p1, p2, Lp12;->g:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    iput-object p1, p0, Lzx8;->k:Ljava/lang/String;

    :goto_59
    iput-object p3, p0, Lzx8;->l:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lorb;Ljava/lang/String;)V
    .registers 4

    .line 92
    invoke-direct {p0, p1, p2}, Ldy8;-><init>(Lorb;Ljava/lang/String;)V

    .line 93
    const-string p2, "request_id"

    invoke-virtual {p1, p2}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lzx8;->c:Ljava/lang/String;

    .line 94
    const-string p2, "news_entry_id"

    invoke-virtual {p1, p2}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lzx8;->d:Ljava/lang/String;

    .line 95
    const-string p2, "recommend_type"

    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lzx8;->e:Ljava/lang/String;

    .line 96
    const-string p2, "category"

    invoke-virtual {p1, p2, v0}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lzx8;->f:Ljava/lang/String;

    .line 97
    const-string p2, "news_type"

    invoke-virtual {p1, p2}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lzx8;->g:Ljava/lang/String;

    .line 98
    const-string p2, "hot_topic_id"

    invoke-virtual {p1, p2, v0}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lzx8;->h:Ljava/lang/String;

    .line 99
    const-string p2, "more_id"

    invoke-virtual {p1, p2, v0}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lzx8;->i:Ljava/lang/String;

    .line 100
    const-string p2, "related_original_news_entry_id"

    invoke-virtual {p1, p2, v0}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lzx8;->j:Ljava/lang/String;

    .line 101
    const-string p2, "infra_feedback"

    invoke-virtual {p1, p2, v0}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lzx8;->k:Ljava/lang/String;

    .line 102
    const-string p2, "origin"

    invoke-virtual {p1, p2, v0}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lzx8;->l:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public a(Lorb;)V
    .registers 4

    invoke-super {p0, p1}, Ldy8;->a(Lorb;)V

    const-string v0, "request_id"

    iget-object v1, p0, Lzx8;->c:Ljava/lang/String;

    invoke-virtual {p1, v1, v0}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "news_entry_id"

    iget-object v1, p0, Lzx8;->d:Ljava/lang/String;

    invoke-virtual {p1, v1, v0}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lzx8;->e:Ljava/lang/String;

    if-eqz v0, :cond_1a

    const-string v1, "recommend_type"

    invoke-virtual {p1, v0, v1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_1a
    iget-object v0, p0, Lzx8;->f:Ljava/lang/String;

    if-eqz v0, :cond_23

    const-string v1, "category"

    invoke-virtual {p1, v0, v1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_23
    const-string v0, "news_type"

    iget-object v1, p0, Lzx8;->g:Ljava/lang/String;

    invoke-virtual {p1, v1, v0}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lzx8;->h:Ljava/lang/String;

    if-eqz v0, :cond_33

    const-string v1, "hot_topic_id"

    invoke-virtual {p1, v0, v1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_33
    iget-object v0, p0, Lzx8;->i:Ljava/lang/String;

    if-eqz v0, :cond_3c

    const-string v1, "more_id"

    invoke-virtual {p1, v0, v1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_3c
    iget-object v0, p0, Lzx8;->j:Ljava/lang/String;

    if-eqz v0, :cond_45

    const-string v1, "related_original_news_entry_id"

    invoke-virtual {p1, v0, v1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_45
    iget-object v0, p0, Lzx8;->k:Ljava/lang/String;

    if-eqz v0, :cond_4e

    const-string v1, "infra_feedback"

    invoke-virtual {p1, v0, v1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_4e
    iget-object p0, p0, Lzx8;->l:Ljava/lang/String;

    if-eqz p0, :cond_57

    const-string v0, "origin"

    invoke-virtual {p1, p0, v0}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_57
    return-void
.end method
