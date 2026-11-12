.class public final Lfve;
.super Lpue;
.source "SourceFile"


# instance fields
.field public final f:Ljava/util/List;

.field public final g:Z

.field public final h:Z

.field public final i:Z

.field public final j:Z

.field public final k:Z


# direct methods
.method public constructor <init>(Loqe;Ljava/util/List;Ljava/lang/String;)V
    .registers 5

    const/4 v0, 0x0

    invoke-direct {p0, p1, p3, v0}, Lj82;-><init>(Loqe;Ljava/lang/String;Z)V

    const-string p3, "top_news_group"

    iget-object v0, p1, Loqe;->c:Ljava/lang/String;

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    iput-boolean p3, p0, Lfve;->g:Z

    iget-object p3, p1, Loqe;->c:Ljava/lang/String;

    const-string v0, "roundups"

    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    iput-boolean v0, p0, Lfve;->h:Z

    const-string v0, "audios"

    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    iput-boolean v0, p0, Lfve;->i:Z

    invoke-virtual {p1}, Loqe;->a()Z

    move-result p1

    iput-boolean p1, p0, Lfve;->j:Z

    const-string p1, "carousel"

    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    iput-boolean p1, p0, Lfve;->k:Z

    check-cast p2, Ljava/util/List;

    iput-object p2, p0, Lfve;->f:Ljava/util/List;

    return-void
.end method
