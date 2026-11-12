.class public final synthetic Lzx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lry;
.implements Ldid;
.implements Lcom/google/android/gms/tasks/OnCompleteListener;
.implements Lwdi;
.implements Lyyk;


# instance fields
.field public final synthetic a:J

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(JLjava/lang/Object;Ljava/lang/Object;)V
    .registers 5

    iput-object p3, p0, Lzx;->b:Ljava/lang/Object;

    iput-object p4, p0, Lzx;->c:Ljava/lang/Object;

    iput-wide p1, p0, Lzx;->a:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lu55;JLcom/opera/api/Callback;)V
    .registers 5

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lzx;->b:Ljava/lang/Object;

    iput-wide p2, p0, Lzx;->a:J

    iput-object p4, p0, Lzx;->c:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;Ljava/lang/String;Ltn;)V
    .registers 10

    iget-object v0, p0, Lzx;->b:Ljava/lang/Object;

    check-cast v0, Lcy;

    iget-object v1, p0, Lzx;->c:Ljava/lang/Object;

    check-cast v1, Lr9i;

    iget-object v2, v0, Lcy;->h:Ljava/lang/Object;

    check-cast v2, Lwjh;

    iget-object v3, v0, Lcy;->b:Ljava/lang/Object;

    check-cast v3, Lay;

    const/4 v4, 0x0

    iput-boolean v4, v0, Lcy;->a:Z

    sget-object v4, Lie0;->c:Lie0;

    if-nez p1, :cond_1b

    invoke-virtual {v2, v4}, Lwjh;->y(Lie0;)V

    return-void

    :cond_1b
    iget-object v5, v0, Lcy;->c:Ljava/lang/Object;

    check-cast v5, Ltw2;

    iget-object v5, v5, Ltw2;->b:Ljava/lang/Object;

    check-cast v5, Lwy;

    invoke-virtual {v5}, Lwy;->T()Z

    move-result v5

    if-nez v5, :cond_97

    invoke-virtual {v3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lml;

    invoke-virtual {v5, p1, p3}, Lml;->d(Ljava/lang/String;Lgm;)Z

    move-result p3

    if-eqz p3, :cond_98

    invoke-virtual {v0}, Lcy;->b()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    iget-object v2, v0, Lcy;->d:Ljava/lang/Object;

    check-cast v2, Lb59;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/SharedPreferences;

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string v4, "controller_config_data"

    invoke-interface {v2, v4, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    iget-object v1, v1, Lr9i;->b:Ljava/lang/Object;

    check-cast v1, Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "controller_config_url"

    invoke-interface {p1, v2, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string v1, "controller_config_full_url"

    invoke-interface {p1, v1, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string p2, "controller_config_timestamp"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-interface {p1, p2, v1, v2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string p2, "controller_config_request_time"

    iget-wide v1, p0, Lzx;->a:J

    invoke-interface {p1, p2, v1, v2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-virtual {v3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lml;

    iget-object p1, p1, Lml;->b:Ljava/lang/String;

    const-string p2, "ads_config_last_ip_address"

    invoke-interface {p0, p2, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    if-nez p3, :cond_97

    iget-object p0, v0, Lcy;->g:Ljava/lang/Object;

    check-cast p0, Lrx;

    invoke-virtual {v3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lml;

    invoke-virtual {p0, p1}, Lrx;->s(Lml;)V

    :cond_97
    return-void

    :cond_98
    invoke-virtual {v2, v4}, Lwjh;->y(Lie0;)V

    return-void
.end method

.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8

    iget-object v0, p0, Lzx;->b:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    iget-object v1, p0, Lzx;->c:Ljava/lang/Object;

    check-cast v1, Lxyc;

    check-cast p1, Landroid/database/sqlite/SQLiteDatabase;

    iget-byte v1, v1, Lxyc;->a:B

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    filled-new-array {v0, v2}, [Ljava/lang/String;

    move-result-object v2

    const-string v3, "SELECT 1 FROM log_event_dropped WHERE log_source = ? AND reason = ?"

    invoke-virtual {p1, v3, v2}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    :try_start_1a
    move-object v3, v2

    check-cast v3, Landroid/database/Cursor;

    invoke-interface {v3}, Landroid/database/Cursor;->getCount()I

    move-result v3
    :try_end_21
    .catchall {:try_start_1a .. :try_end_21} :catchall_64

    if-lez v3, :cond_25

    const/4 v3, 0x1

    goto :goto_26

    :cond_25
    const/4 v3, 0x0

    :goto_26
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    iget-wide v4, p0, Lzx;->a:J

    const/4 p0, 0x0

    if-nez v3, :cond_50

    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    const-string v3, "log_source"

    invoke-virtual {v2, v3, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "reason"

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v2, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v0, "events_dropped_count"

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v2, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v0, "log_event_dropped"

    invoke-virtual {p1, v0, p0, v2}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    return-object p0

    :cond_50
    const-string v2, "UPDATE log_event_dropped SET events_dropped_count = events_dropped_count + "

    const-string v3, " WHERE log_source = ? AND reason = ?"

    invoke-static {v4, v5, v2, v3}, Lz1m;->j(JLjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v2, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;[Ljava/lang/Object;)V

    return-object p0

    :catchall_64
    move-exception p0

    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    throw p0
.end method

.method public final c(Lssa;I)V
    .registers 11

    iget-object v0, p0, Lzx;->b:Ljava/lang/Object;

    check-cast v0, Lgid;

    iget-object v1, p0, Lzx;->c:Ljava/lang/Object;

    check-cast v1, Lqjd;

    iget-object v3, v0, Lgid;->c:Llid;

    const/4 v0, 0x1

    invoke-virtual {v1, v0}, Lqjd;->c(Z)Landroid/os/Bundle;

    move-result-object v5

    iget-wide v6, p0, Lzx;->a:J

    move-object v2, p1

    move v4, p2

    invoke-interface/range {v2 .. v7}, Lssa;->Y(Lksa;ILandroid/os/Bundle;J)V

    return-void
.end method

.method public final execute()Ljava/lang/Object;
    .registers 8

    iget-object v0, p0, Lzx;->b:Ljava/lang/Object;

    check-cast v0, Lks3;

    iget-object v1, p0, Lzx;->c:Ljava/lang/Object;

    check-cast v1, Ldp2;

    iget-object v2, v0, Lks3;->c:Ljava/lang/Object;

    check-cast v2, Lydi;

    iget-object v0, v0, Lks3;->g:Ljava/lang/Object;

    check-cast v0, Lt55;

    invoke-interface {v0}, Lt55;->d()J

    move-result-wide v3

    iget-wide v5, p0, Lzx;->a:J

    add-long/2addr v3, v5

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p0, Lqhd;

    invoke-direct {p0, v3, v4, v1}, Lqhd;-><init>(JLdp2;)V

    invoke-virtual {v2, p0}, Lydi;->l(Lwdi;)Ljava/lang/Object;

    const/4 p0, 0x0

    return-object p0
.end method

.method public final onComplete(Lcom/google/android/gms/tasks/Task;)V
    .registers 6

    iget-object v0, p0, Lzx;->b:Ljava/lang/Object;

    check-cast v0, Lu55;

    iget-object v1, p0, Lzx;->c:Ljava/lang/Object;

    check-cast v1, Lcom/opera/api/Callback;

    iget-wide v2, p0, Lzx;->a:J

    invoke-static {v0, v2, v3, v1, p1}, Lcom/leanplum/messagetemplates/OperaRateSheet;->b(Lu55;JLcom/opera/api/Callback;Lcom/google/android/gms/tasks/Task;)V

    return-void
.end method
