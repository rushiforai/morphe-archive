.class public final Lpfb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ltfb;


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:J

.field public final d:J

.field public final e:J

.field public final f:J


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;JJJJ)V
    .registers 11

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lpfb;->a:Ljava/lang/String;

    iput-object p2, p0, Lpfb;->b:Ljava/lang/String;

    iput-wide p3, p0, Lpfb;->c:J

    iput-wide p5, p0, Lpfb;->d:J

    iput-wide p7, p0, Lpfb;->e:J

    iput-wide p9, p0, Lpfb;->f:J

    return-void
.end method


# virtual methods
.method public final a()Lorb;
    .registers 5

    new-instance v0, Lorb;

    invoke-direct {v0}, Lorb;-><init>()V

    iget-object v1, p0, Lpfb;->a:Ljava/lang/String;

    const-string v2, "type"

    invoke-virtual {v0, v1, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v1, p0, Lpfb;->b:Ljava/lang/String;

    const-string v2, "blob"

    invoke-virtual {v0, v1, v2}, Lorb;->p(Ljava/lang/Object;Ljava/lang/String;)V

    iget-wide v1, p0, Lpfb;->c:J

    const-string v3, "chatItemId"

    invoke-virtual {v0, v1, v2, v3}, Lorb;->o(JLjava/lang/String;)V

    iget-wide v1, p0, Lpfb;->d:J

    const-string v3, "chatId"

    invoke-virtual {v0, v1, v2, v3}, Lorb;->o(JLjava/lang/String;)V

    iget-wide v1, p0, Lpfb;->e:J

    const-string v3, "created"

    invoke-virtual {v0, v1, v2, v3}, Lorb;->o(JLjava/lang/String;)V

    iget-wide v1, p0, Lpfb;->f:J

    const-string p0, "modified"

    invoke-virtual {v0, v1, v2, p0}, Lorb;->o(JLjava/lang/String;)V

    return-object v0
.end method

.method public final b()J
    .registers 3

    iget-wide v0, p0, Lpfb;->d:J

    return-wide v0
.end method

.method public final c()J
    .registers 3

    iget-wide v0, p0, Lpfb;->c:J

    return-wide v0
.end method
