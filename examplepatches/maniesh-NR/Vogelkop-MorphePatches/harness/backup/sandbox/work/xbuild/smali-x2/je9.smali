.class public final Lje9;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:J

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:Ljava/lang/String;

.field public final e:Ljava/lang/String;

.field public final f:Ljava/lang/String;

.field public final g:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lorb;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "id"

    iget-object v1, p1, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lje9;->a:J

    const-string v0, "created_by"

    invoke-virtual {p1, v0}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lje9;->b:Ljava/lang/String;

    const-string v0, "metadata"

    invoke-virtual {p1, v0}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lje9;->c:Ljava/lang/String;

    const-string v0, "content"

    invoke-virtual {p1, v0}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lje9;->d:Ljava/lang/String;

    const-string v0, "content_url"

    const-string v1, ""

    invoke-virtual {p1, v0, v1}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lje9;->e:Ljava/lang/String;

    const-string v0, "iv_metadata"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "iv_content"

    invoke-virtual {p1, v2, v1}, Lorb;->m(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v0, :cond_45

    if-eqz v1, :cond_45

    iput-object v0, p0, Lje9;->f:Ljava/lang/String;

    iput-object v1, p0, Lje9;->g:Ljava/lang/String;

    return-void

    :cond_45
    const-string v0, "iv"

    invoke-virtual {p1, v0}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lje9;->g:Ljava/lang/String;

    iput-object p1, p0, Lje9;->f:Ljava/lang/String;

    return-void
.end method
