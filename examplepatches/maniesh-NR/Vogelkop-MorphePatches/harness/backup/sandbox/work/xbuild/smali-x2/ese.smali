.class public final synthetic Lese;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:J

.field public final synthetic d:Landroidx/work/Worker;


# direct methods
.method public synthetic constructor <init>(Landroidx/work/Worker;Ljava/lang/String;JB)V
    .registers 6

    iput-byte p5, p0, Lese;->a:B

    iput-object p1, p0, Lese;->d:Landroidx/work/Worker;

    iput-object p2, p0, Lese;->b:Ljava/lang/String;

    iput-wide p3, p0, Lese;->c:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 5

    iget-byte v0, p0, Lese;->a:B

    packed-switch v0, :pswitch_data_74

    iget-object v0, p0, Lese;->d:Landroidx/work/Worker;

    check-cast v0, Lcom/opera/android/news/newsfeed/internal/NewsPushTrackEventsUploaderWorker;

    iget-object v1, p0, Lese;->b:Ljava/lang/String;

    iget-wide v2, p0, Lese;->c:J

    sget-object p0, Lcom/opera/android/news/newsfeed/internal/NewsPushTrackEventsUploaderWorker;->f:Lesd;

    iget-object p0, v0, Lajc;->a:Landroid/content/Context;

    sget-object v0, Lhd;->h:Lhd;

    if-eqz v0, :cond_2d

    iget-object v0, v0, Lhd;->e:Ljava/lang/Object;

    monitor-enter v0

    :try_start_18
    sget-object p0, Lhd;->h:Lhd;

    iget-object p0, p0, Lhd;->d:Ljava/lang/Object;

    check-cast p0, Lfse;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lmse;

    invoke-virtual {p0, v2, v3, v1}, Lmse;->f(JLjava/lang/String;)V

    monitor-exit v0

    goto :goto_3e

    :goto_29
    monitor-exit v0
    :try_end_2a
    .catchall {:try_start_18 .. :try_end_2a} :catchall_2b

    throw p0

    :catchall_2b
    move-exception p0

    goto :goto_29

    :cond_2d
    invoke-static {p0}, Lhd;->j(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "npt_unsent_push_track_events"

    invoke-interface {p0, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    :goto_3e
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_41
    iget-object v0, p0, Lese;->d:Landroidx/work/Worker;

    check-cast v0, Lcom/opera/android/news/newsfeed/internal/NewsPushTokenUploaderWorker;

    iget-object v1, p0, Lese;->b:Ljava/lang/String;

    iget-wide v2, p0, Lese;->c:J

    sget-object p0, Lcom/opera/android/news/newsfeed/internal/NewsPushTokenUploaderWorker;->f:Lesd;

    iget-object p0, v0, Lajc;->a:Landroid/content/Context;

    sget-object v0, Lhd;->h:Lhd;

    if-eqz v0, :cond_5f

    iget-object p0, v0, Lhd;->c:Ljava/lang/Object;

    check-cast p0, Lfse;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lmse;

    invoke-virtual {p0, v2, v3, v1}, Lmse;->f(JLjava/lang/String;)V

    goto :goto_70

    :cond_5f
    invoke-static {p0}, Lhd;->j(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "npt_unsent_token_track_events"

    invoke-interface {p0, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    :goto_70
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_74
    .packed-switch 0x0
        :pswitch_41
    .end packed-switch
.end method
