.class public Ll/bno0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ano0;


# instance fields
.field public a:Ll/v4n0;

.field public b:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/bno0;->b:Lrx/subjects/b;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    .line 1
    sget p0, Ll/xec0;->a2:I

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p1, p0, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public b(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bno0;->b:Lrx/subjects/b;

    .line 2
    .line 3
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public c(ILandroid/view/View;Lcom/p1/mobile/putong/data/PushMessage;)V
    .locals 2

    .line 1
    const/high16 v0, 0x41a00000    # 20.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-static {p2, v0}, Ll/qnp0;->d1(Landroid/view/View;I)V

    .line 8
    .line 9
    .line 10
    if-nez p1, :cond_1

    .line 11
    .line 12
    if-eqz p3, :cond_1

    .line 13
    .line 14
    :try_start_0
    iget-object v0, p0, Ll/bno0;->a:Ll/v4n0;

    .line 15
    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    iget-object v0, p3, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 19
    .line 20
    iget-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->liveId:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->userId:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {p0, v1, v0}, Ll/bno0;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    new-instance v0, Ll/v4n0;

    .line 28
    .line 29
    invoke-direct {v0, p0, p2, p1, p3}, Ll/v4n0;-><init>(Ll/bno0;Landroid/view/View;ILcom/p1/mobile/putong/data/PushMessage;)V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Ll/bno0;->a:Ll/v4n0;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 33
    .line 34
    return-void

    .line 35
    :catch_0
    move-exception p0

    .line 36
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 40
    .line 41
    .line 42
    :cond_1
    return-void
.end method

.method public d()Lrx/subjects/b;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/b<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/bno0;->b:Lrx/subjects/b;

    .line 2
    .line 3
    return-object p0
.end method

.method public final e(Ljava/lang/String;Ljava/lang/String;)V
    .locals 10

    .line 1
    new-instance p0, Ll/q4f;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/q4f;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v0, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->PAGE_VIEW:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 7
    .line 8
    iput-object v0, p0, Ll/q4f;->d:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 9
    .line 10
    const-string v0, "p_suggest_users_home_view"

    .line 11
    .line 12
    iput-object v0, p0, Ll/q4f;->n:Ljava/lang/String;

    .line 13
    .line 14
    const-string v0, "suggest_card_type"

    .line 15
    .line 16
    const-string v1, "audio_room"

    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    const-string v0, "liveId"

    .line 23
    .line 24
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    const-string p1, "anchorId"

    .line 29
    .line 30
    invoke-static {p1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 31
    .line 32
    .line 33
    move-result-object v4

    .line 34
    const-string p1, "audio_card_type"

    .line 35
    .line 36
    const-string p2, "swipe_card"

    .line 37
    .line 38
    invoke-static {p1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 39
    .line 40
    .line 41
    move-result-object v5

    .line 42
    const-string p1, "audio_room_label"

    .line 43
    .line 44
    const-string p2, "NA"

    .line 45
    .line 46
    invoke-static {p1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 47
    .line 48
    .line 49
    move-result-object v6

    .line 50
    const-string p1, "audio_room_type"

    .line 51
    .line 52
    const-string v0, "\u666e\u901a"

    .line 53
    .line 54
    invoke-static {p1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 55
    .line 56
    .line 57
    move-result-object v7

    .line 58
    const-string p1, "topic_id"

    .line 59
    .line 60
    invoke-static {p1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 61
    .line 62
    .line 63
    move-result-object v8

    .line 64
    const-string p1, "audio_tab_id"

    .line 65
    .line 66
    invoke-static {p1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 67
    .line 68
    .line 69
    move-result-object v9

    .line 70
    filled-new-array/range {v2 .. v9}, [Ll/pf60;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    invoke-static {p0, p1}, Ll/i4g0;->o(Ll/q4f;[Ll/pf60;)V

    .line 75
    .line 76
    .line 77
    return-void
.end method
