.class public final Lqrc;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lurc;

.field public final b:Ldnb;

.field public final c:Lwnm;


# direct methods
.method public constructor <init>(Lurc;Lcp7;Ldnb;)V
    .registers 13

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lqrc;->a:Lurc;

    iput-object p3, p0, Lqrc;->b:Ldnb;

    new-instance p3, Lprc;

    sget-object v0, Lorc;->a:Lorc;

    invoke-direct {p3, v0}, Lprc;-><init>(Lorc;)V

    iget-object v0, p1, Lurc;->g:Lode;

    invoke-interface {p2}, Lcp7;->getState()Lekc;

    move-result-object p2

    iget-object p1, p1, Lurc;->j:Lkze;

    new-instance v1, Lr31;

    const/4 v7, 0x0

    const/4 v8, 0x4

    const/4 v2, 0x3

    const-class v4, Lqrc;

    const-string v5, "computeNewState"

    const-string v6, "computeNewState(Lcom/opera/android/genapi/livescorerpc/LiveScoreState;Lcom/opera/android/dynamic_feature/DynamicFeatureInstance$State;Lcom/opera/android/live_score/rpc/LivescoreWebBinding$LoadState;)Lcom/opera/android/live_score/LivescoreSheetViewModel$ViewState;"

    move-object v3, p0

    invoke-direct/range {v1 .. v8}, Lr31;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    invoke-static {p3, v0, p2, p1, v1}, Lxf8;->X(Ljava/lang/Object;Lekc;Lekc;Lekc;Lcr9;)Lwnm;

    move-result-object p0

    iput-object p0, v3, Lqrc;->c:Lwnm;

    return-void
.end method


# virtual methods
.method public final a(Lirc;)V
    .registers 7

    sget-object v0, Lcrc;->a:Lcrc;

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c

    const-string p1, "/"

    goto/16 :goto_b5

    :cond_c
    instance-of v0, p1, Lfrc;

    const-string v1, "/#/matches/"

    if-eqz v0, :cond_30

    new-instance v0, Ljava/lang/StringBuilder;

    check-cast p1, Lfrc;

    iget-wide v2, p1, Lfrc;->a:J

    const-string v4, "/info?redirect=true&sportType=football"

    invoke-static {v2, v3, v1, v4}, Lz1m;->j(JLjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-boolean p1, p1, Lfrc;->b:Z

    if-eqz p1, :cond_2a

    const-string p1, "&play_audio=true"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_2a
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto/16 :goto_b5

    :cond_30
    instance-of v0, p1, Lgrc;

    if-eqz v0, :cond_6f

    check-cast p1, Lgrc;

    iget-object p1, p1, Lgrc;->a:Ljava/lang/Long;

    if-eqz p1, :cond_6c

    invoke-virtual {p1}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    sget-object p1, Lr7o;->e:Lavj;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p1, Lr7o;->f:Ljava/util/LinkedHashMap;

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lr7o;

    if-eqz p1, :cond_6c

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    const/16 v1, 0x10

    if-eq v0, v1, :cond_63

    const/16 v1, 0x24

    if-eq v0, v1, :cond_60

    iget-object p1, p1, Lr7o;->a:Ljava/lang/String;

    goto :goto_65

    :cond_60
    const-string p1, "sco"

    goto :goto_65

    :cond_63
    const-string p1, "gb"

    :goto_65
    const-string v0, "/#/onboarding/follow-teams?team="

    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_b5

    :cond_6c
    const-string p1, "/#/onboarding/follow-teams"

    goto :goto_b5

    :cond_6f
    instance-of v0, p1, Lerc;

    if-eqz v0, :cond_96

    new-instance v0, Ljava/lang/StringBuilder;

    check-cast p1, Lerc;

    iget-wide v1, p1, Lerc;->a:J

    const-string v3, "/#/competition/"

    const-string v4, "/matches?redirect=true"

    invoke-static {v1, v2, v3, v4}, Lz1m;->j(JLjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p1, p1, Lerc;->b:Ljava/lang/String;

    if-eqz p1, :cond_91

    const-string v1, "&phaseName="

    invoke-virtual {v1, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_91
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_b5

    :cond_96
    instance-of v0, p1, Ldrc;

    if-eqz v0, :cond_a5

    check-cast p1, Ldrc;

    iget-wide v2, p1, Ldrc;->a:J

    const-string p1, "/info?redirect=true&sportType=basketball"

    invoke-static {v2, v3, v1, p1}, Lz1m;->j(JLjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_b5

    :cond_a5
    instance-of v0, p1, Lhrc;

    if-eqz v0, :cond_bd

    check-cast p1, Lhrc;

    iget-wide v0, p1, Lhrc;->a:J

    const-string p1, "/#/team/"

    const-string v2, "/info?redirect=true"

    invoke-static {v0, v1, p1, v2}, Lz1m;->j(JLjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    :goto_b5
    iget-object p0, p0, Lqrc;->a:Lurc;

    iput-object p1, p0, Lurc;->k:Ljava/lang/String;

    invoke-virtual {p0}, Lurc;->a()V

    return-void

    :cond_bd
    invoke-static {}, Lh9o;->p()V

    return-void
.end method
