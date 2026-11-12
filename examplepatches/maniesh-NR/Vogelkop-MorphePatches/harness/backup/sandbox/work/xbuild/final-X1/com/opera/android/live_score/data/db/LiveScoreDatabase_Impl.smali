.class public final Lcom/opera/android/live_score/data/db/LiveScoreDatabase_Impl;
.super Lcom/opera/android/live_score/data/db/LiveScoreDatabase;
.source "SourceFile"


# instance fields
.field public volatile z:Lwlc;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lcom/opera/android/live_score/data/db/LiveScoreDatabase;-><init>()V

    return-void
.end method


# virtual methods
.method public final e()Lpjb;
    .registers 12

    new-instance v0, Ljava/util/HashMap;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2, v1}, Ljava/util/HashMap;-><init>(I)V

    new-instance v1, Lpjb;

    const-string v9, "odds_provider_config"

    const-string v10, "football_audio_commentary"

    const-string v3, "football_events"

    const-string v4, "notifications"

    const-string v5, "followed_matches"

    const-string v6, "followed_teams"

    const-string v7, "followed_tournaments"

    const-string v8, "event_odds"

    filled-new-array/range {v3 .. v10}, [Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, p0, v0, v2, v3}, Lpjb;-><init>(Ly5i;Ljava/util/HashMap;Ljava/util/HashMap;[Ljava/lang/String;)V

    return-object v1
.end method

.method public final f()Lc6i;
    .registers 2

    new-instance v0, Lsv0;

    invoke-direct {v0, p0}, Lsv0;-><init>(Lcom/opera/android/live_score/data/db/LiveScoreDatabase_Impl;)V

    return-object v0
.end method

.method public final h()Ljava/util/List;
    .registers 1

    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    return-object p0
.end method

.method public final k()Ljava/util/Set;
    .registers 1

    new-instance p0, Ljava/util/HashSet;

    invoke-direct {p0}, Ljava/util/HashSet;-><init>()V

    return-object p0
.end method

.method public final m()Ljava/util/Map;
    .registers 3

    new-instance p0, Ljava/util/HashMap;

    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    const-class v0, Lwlc;

    sget-object v1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0
.end method

.method public final x()Lwlc;
    .registers 2

    iget-object v0, p0, Lcom/opera/android/live_score/data/db/LiveScoreDatabase_Impl;->z:Lwlc;

    if-eqz v0, :cond_7

    iget-object p0, p0, Lcom/opera/android/live_score/data/db/LiveScoreDatabase_Impl;->z:Lwlc;

    return-object p0

    :cond_7
    monitor-enter p0

    :try_start_8
    iget-object v0, p0, Lcom/opera/android/live_score/data/db/LiveScoreDatabase_Impl;->z:Lwlc;

    if-nez v0, :cond_13

    new-instance v0, Lwlc;

    invoke-direct {v0, p0}, Lwlc;-><init>(Lcom/opera/android/live_score/data/db/LiveScoreDatabase_Impl;)V

    iput-object v0, p0, Lcom/opera/android/live_score/data/db/LiveScoreDatabase_Impl;->z:Lwlc;

    :cond_13
    iget-object v0, p0, Lcom/opera/android/live_score/data/db/LiveScoreDatabase_Impl;->z:Lwlc;

    monitor-exit p0

    return-object v0

    :goto_17
    monitor-exit p0
    :try_end_18
    .catchall {:try_start_8 .. :try_end_18} :catchall_19

    throw v0

    :catchall_19
    move-exception v0

    goto :goto_17
.end method
