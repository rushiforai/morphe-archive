.class public final Lay8;
.super Ldy8;
.source "SourceFile"


# instance fields
.field public final c:Ljava/lang/String;

.field public final d:Ljava/lang/String;

.field public final e:J

.field public final f:J

.field public final g:Ljava/lang/String;

.field public final h:Ljava/lang/String;

.field public final i:J

.field public final j:Ljava/lang/String;

.field public final k:Ljava/lang/String;

.field public final l:Ljava/lang/String;


# direct methods
.method public constructor <init>(JJLjava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 12

    .line 82
    const-string v0, "post_action"

    invoke-direct {p0, v0}, Ldy8;-><init>(Ljava/lang/String;)V

    .line 83
    iput-object p5, p0, Lay8;->c:Ljava/lang/String;

    .line 84
    const-string p5, "podcast_float"

    iput-object p5, p0, Lay8;->d:Ljava/lang/String;

    .line 85
    iput-wide p1, p0, Lay8;->e:J

    .line 86
    iput-wide p3, p0, Lay8;->f:J

    .line 87
    const-string p1, "click"

    iput-object p1, p0, Lay8;->g:Ljava/lang/String;

    .line 88
    const-string p1, "podcast"

    iput-object p1, p0, Lay8;->h:Ljava/lang/String;

    .line 89
    iput-wide p6, p0, Lay8;->i:J

    .line 90
    iput-object p8, p0, Lay8;->j:Ljava/lang/String;

    .line 91
    iput-object p9, p0, Lay8;->k:Ljava/lang/String;

    .line 92
    iput-object p10, p0, Lay8;->l:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lorb;Ljava/lang/String;)V
    .registers 5

    const-string v0, "post_action"

    invoke-direct {p0, p1, v0}, Ldy8;-><init>(Lorb;Ljava/lang/String;)V

    iput-object p2, p0, Lay8;->c:Ljava/lang/String;

    const-string p2, "action_source"

    invoke-virtual {p1, p2}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lay8;->d:Ljava/lang/String;

    iget-object p2, p1, Lorb;->a:Lorg/json/JSONObject;

    const-string v0, "action_time"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lay8;->e:J

    const-string v0, "duration"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lay8;->f:J

    const-string v0, "play_mode"

    invoke-virtual {p1, v0}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lay8;->g:Ljava/lang/String;

    const-string v0, "play_style"

    invoke-virtual {p1, v0}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lay8;->h:Ljava/lang/String;

    const-string v0, "player_time"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lay8;->i:J

    const-string p2, "news_entry_id"

    invoke-virtual {p1, p2}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lay8;->j:Ljava/lang/String;

    const-string p2, "news_type"

    invoke-virtual {p1, p2}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lay8;->k:Ljava/lang/String;

    const-string p2, "request_id"

    invoke-virtual {p1, p2}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lay8;->l:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final a(Lorb;)V
    .registers 5

    invoke-super {p0, p1}, Ldy8;->a(Lorb;)V

    const-string v0, "action"

    iget-object v1, p0, Lay8;->c:Ljava/lang/String;

    invoke-virtual {p1, v1, v0}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "action_source"

    iget-object v1, p0, Lay8;->d:Ljava/lang/String;

    invoke-virtual {p1, v1, v0}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "action_time"

    iget-wide v1, p0, Lay8;->e:J

    invoke-virtual {p1, v1, v2, v0}, Lorb;->o(JLjava/lang/String;)V

    const-string v0, "duration"

    iget-wide v1, p0, Lay8;->f:J

    invoke-virtual {p1, v1, v2, v0}, Lorb;->o(JLjava/lang/String;)V

    const-string v0, "play_mode"

    iget-object v1, p0, Lay8;->g:Ljava/lang/String;

    invoke-virtual {p1, v1, v0}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "play_style"

    iget-object v1, p0, Lay8;->h:Ljava/lang/String;

    invoke-virtual {p1, v1, v0}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "player_time"

    iget-wide v1, p0, Lay8;->i:J

    invoke-virtual {p1, v1, v2, v0}, Lorb;->o(JLjava/lang/String;)V

    const-string v0, "news_entry_id"

    iget-object v1, p0, Lay8;->j:Ljava/lang/String;

    invoke-virtual {p1, v1, v0}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "news_type"

    iget-object v1, p0, Lay8;->k:Ljava/lang/String;

    invoke-virtual {p1, v1, v0}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "request_id"

    iget-object p0, p0, Lay8;->l:Ljava/lang/String;

    invoke-virtual {p1, p0, v0}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method
