.class public final Lky8;
.super Ldy8;
.source "SourceFile"


# instance fields
.field public final c:J

.field public final d:J

.field public final e:Ljava/lang/String;

.field public final f:Ljava/lang/String;


# direct methods
.method public constructor <init>(JJLjava/lang/String;Ljava/lang/String;)V
    .registers 8

    .line 40
    const-string v0, "podcast_stay"

    invoke-direct {p0, v0}, Ldy8;-><init>(Ljava/lang/String;)V

    .line 41
    iput-wide p1, p0, Lky8;->c:J

    .line 42
    iput-wide p3, p0, Lky8;->d:J

    .line 43
    iput-object p5, p0, Lky8;->e:Ljava/lang/String;

    .line 44
    iput-object p6, p0, Lky8;->f:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lorb;)V
    .registers 5

    const-string v0, "podcast_stay"

    invoke-direct {p0, p1, v0}, Ldy8;-><init>(Lorb;Ljava/lang/String;)V

    iget-object v0, p1, Lorb;->a:Lorg/json/JSONObject;

    const-string v1, "start_ts"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v1

    iput-wide v1, p0, Lky8;->c:J

    const-string v1, "duration"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lky8;->d:J

    const-string v0, "id"

    invoke-virtual {p1, v0}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lky8;->e:Ljava/lang/String;

    const-string v0, "request_id"

    invoke-virtual {p1, v0}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lky8;->f:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final a(Lorb;)V
    .registers 5

    invoke-super {p0, p1}, Ldy8;->a(Lorb;)V

    const-string v0, "start_ts"

    iget-wide v1, p0, Lky8;->c:J

    invoke-virtual {p1, v1, v2, v0}, Lorb;->o(JLjava/lang/String;)V

    const-string v0, "duration"

    iget-wide v1, p0, Lky8;->d:J

    invoke-virtual {p1, v1, v2, v0}, Lorb;->o(JLjava/lang/String;)V

    const-string v0, "id"

    iget-object v1, p0, Lky8;->e:Ljava/lang/String;

    invoke-virtual {p1, v1, v0}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "request_id"

    iget-object p0, p0, Lky8;->f:Ljava/lang/String;

    invoke-virtual {p1, p0, v0}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method
