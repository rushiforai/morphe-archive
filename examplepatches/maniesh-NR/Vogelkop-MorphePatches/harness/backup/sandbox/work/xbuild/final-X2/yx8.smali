.class public final Lyx8;
.super Ldy8;
.source "SourceFile"


# instance fields
.field public final c:J

.field public final d:J


# direct methods
.method public constructor <init>(JJ)V
    .registers 6

    .line 24
    const-string v0, "app_stay"

    invoke-direct {p0, v0}, Ldy8;-><init>(Ljava/lang/String;)V

    .line 25
    iput-wide p1, p0, Lyx8;->c:J

    .line 26
    iput-wide p3, p0, Lyx8;->d:J

    return-void
.end method

.method public constructor <init>(Lorb;)V
    .registers 4

    const-string v0, "app_stay"

    invoke-direct {p0, p1, v0}, Ldy8;-><init>(Lorb;Ljava/lang/String;)V

    iget-object p1, p1, Lorb;->a:Lorg/json/JSONObject;

    const-string v0, "start_ts"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lyx8;->c:J

    const-string v0, "duration"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lyx8;->d:J

    return-void
.end method


# virtual methods
.method public final a(Lorb;)V
    .registers 5

    invoke-super {p0, p1}, Ldy8;->a(Lorb;)V

    const-string v0, "start_ts"

    iget-wide v1, p0, Lyx8;->c:J

    invoke-virtual {p1, v1, v2, v0}, Lorb;->o(JLjava/lang/String;)V

    const-string v0, "duration"

    iget-wide v1, p0, Lyx8;->d:J

    invoke-virtual {p1, v1, v2, v0}, Lorb;->o(JLjava/lang/String;)V

    return-void
.end method
