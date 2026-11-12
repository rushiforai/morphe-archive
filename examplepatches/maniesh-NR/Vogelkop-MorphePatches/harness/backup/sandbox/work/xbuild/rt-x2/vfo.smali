.class public final synthetic Lvfo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Lzfo;

.field public final synthetic b:J

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:J

.field public final synthetic e:J


# direct methods
.method public synthetic constructor <init>(Lzfo;JLjava/lang/String;JJ)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lvfo;->a:Lzfo;

    iput-wide p2, p0, Lvfo;->b:J

    iput-object p4, p0, Lvfo;->c:Ljava/lang/String;

    iput-wide p5, p0, Lvfo;->d:J

    iput-wide p7, p0, Lvfo;->e:J

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5

    check-cast p1, Lspa;

    sget-object v0, Lapa;->b:Lapa;

    const-string v0, "GET"

    invoke-static {v0}, Lz4o;->i0(Ljava/lang/String;)Lapa;

    move-result-object v0

    iput-object v0, p1, Lspa;->b:Lapa;

    iget-object v0, p1, Lspa;->a:Ltgm;

    iget-object v1, p0, Lvfo;->a:Lzfo;

    iget-object v1, v1, Lzfo;->a:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "q/team_events"

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lugm;->b(Ltgm;Ljava/lang/String;)Ltgm;

    const-string v0, "team_id"

    iget-wide v1, p0, Lvfo;->b:J

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v0, v1}, Lynh;->g(Lspa;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v0, p0, Lvfo;->c:Ljava/lang/String;

    if-eqz v0, :cond_3a

    const-string v1, "user_preferred_language"

    invoke-static {p1, v1, v0}, Lynh;->g(Lspa;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_3a
    const-string v0, "start_timestamp"

    iget-wide v1, p0, Lvfo;->d:J

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v0, v1}, Lynh;->g(Lspa;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v0, "end_timestamp"

    iget-wide v1, p0, Lvfo;->e:J

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, v0, p0}, Lynh;->g(Lspa;Ljava/lang/String;Ljava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method
