.class public abstract Lmy8;
.super Ldy8;
.source "SourceFile"


# instance fields
.field public final c:Ljava/lang/String;

.field public final d:Ljava/lang/String;

.field public final e:Ljava/lang/String;

.field public final f:Ljava/lang/String;

.field public final g:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lorb;Ljava/lang/String;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Ldy8;-><init>(Lorb;Ljava/lang/String;)V

    const-string p2, "request_id"

    const-string v0, ""

    invoke-virtual {p1, p2, v0}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lmy8;->c:Ljava/lang/String;

    const-string p2, "publisher_id"

    invoke-virtual {p1, p2}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lmy8;->d:Ljava/lang/String;

    const-string p2, "origin"

    invoke-virtual {p1, p2}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lmy8;->e:Ljava/lang/String;

    const-string p2, "news_entry_id"

    invoke-virtual {p1, p2, v0}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lmy8;->f:Ljava/lang/String;

    const-string p2, "infra_feedback"

    invoke-virtual {p1, p2, v0}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lmy8;->g:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public a(Lorb;)V
    .registers 4

    invoke-super {p0, p1}, Ldy8;->a(Lorb;)V

    iget-object v0, p0, Lmy8;->c:Ljava/lang/String;

    if-eqz v0, :cond_c

    const-string v1, "request_id"

    invoke-virtual {p1, v0, v1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_c
    const-string v0, "publisher_id"

    iget-object v1, p0, Lmy8;->d:Ljava/lang/String;

    invoke-virtual {p1, v1, v0}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "origin"

    iget-object v1, p0, Lmy8;->e:Ljava/lang/String;

    invoke-virtual {p1, v1, v0}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lmy8;->f:Ljava/lang/String;

    if-eqz v0, :cond_23

    const-string v1, "news_entry_id"

    invoke-virtual {p1, v0, v1}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_23
    iget-object p0, p0, Lmy8;->g:Ljava/lang/String;

    if-eqz p0, :cond_2c

    const-string v0, "infra_feedback"

    invoke-virtual {p1, p0, v0}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_2c
    return-void
.end method
