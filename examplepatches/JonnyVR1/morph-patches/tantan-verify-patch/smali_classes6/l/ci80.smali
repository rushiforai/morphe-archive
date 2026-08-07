.class public Ll/ci80;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static f:I = 0x5265c00

.field public static volatile g:Ll/ci80;


# instance fields
.field public a:Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;

.field public b:Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;

.field public c:Ll/x20;

.field public d:I

.field public e:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/ci80;->d:I

    .line 6
    .line 7
    iput v0, p0, Ll/ci80;->e:I

    .line 8
    .line 9
    invoke-static {}, Ll/ikh;->b()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iput v0, p0, Ll/ci80;->d:I

    .line 14
    .line 15
    invoke-static {}, Ll/ikh;->c()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iput v0, p0, Ll/ci80;->e:I

    .line 20
    .line 21
    return-void
.end method

.method public static synthetic a(Ll/ci80;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ci80;->p()V

    return-void
.end method

.method public static synthetic b(Ll/ci80;Lcom/p1/mobile/putong/data/MessageLocation;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ci80;->o(Lcom/p1/mobile/putong/data/MessageLocation;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->i:Ll/qzg;

    .line 2
    .line 3
    iget-object v0, v0, Ll/qzg;->g:Ll/fi80;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/wzh0;->upsert(Lcom/tantanapp/common/data/DbObject;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic d(Ll/ci80;Lcom/p1/mobile/putong/data/MessageLocation;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ci80;->q(Lcom/p1/mobile/putong/data/MessageLocation;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static h()Ll/ci80;
    .locals 2

    .line 1
    sget-object v0, Ll/ci80;->g:Ll/ci80;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/ci80;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/ci80;->g:Ll/ci80;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/ci80;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/ci80;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/ci80;->g:Ll/ci80;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Ll/ci80;->g:Ll/ci80;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public e(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ci80;->c:Ll/x20;

    .line 2
    .line 3
    return-void
.end method

.method public f(Lcom/p1/mobile/android/app/Act;)Z
    .locals 5

    .line 1
    iget-object v0, p0, Ll/ci80;->a:Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    if-nez p1, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/ci80;->g()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    :cond_1
    if-nez p1, :cond_2

    .line 14
    .line 15
    return v1

    .line 16
    :cond_2
    invoke-virtual {p0}, Ll/ci80;->j()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_3

    .line 21
    .line 22
    return v1

    .line 23
    :cond_3
    invoke-virtual {p0}, Ll/ci80;->i()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_4

    .line 28
    .line 29
    return v1

    .line 30
    :cond_4
    invoke-virtual {p0}, Ll/ci80;->l()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_5

    .line 35
    .line 36
    return v1

    .line 37
    :cond_5
    iget-object v0, p0, Ll/ci80;->a:Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;

    .line 38
    .line 39
    iget-boolean v0, v0, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->firstTimeShow:Z

    .line 40
    .line 41
    if-eqz v0, :cond_7

    .line 42
    .line 43
    invoke-static {}, Ll/rkh;->d()Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_7

    .line 48
    .line 49
    iget-object v0, p0, Ll/ci80;->a:Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;

    .line 50
    .line 51
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->type:Lcom/p1/mobile/putong/feed/data/PoiGuidePopType;

    .line 52
    .line 53
    const-string v2, "share"

    .line 54
    .line 55
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    const/4 v2, 0x0

    .line 60
    const/4 v3, 0x1

    .line 61
    if-eqz v0, :cond_6

    .line 62
    .line 63
    invoke-static {}, Ll/ci80;->h()Ll/ci80;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {v0}, Ll/ci80;->v()V

    .line 68
    .line 69
    .line 70
    iget-object p0, p0, Ll/ci80;->a:Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;

    .line 71
    .line 72
    invoke-static {p1, p0, v3, v2}, Ll/xh80;->c(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;ZLl/uul;)V

    .line 73
    .line 74
    .line 75
    return v3

    .line 76
    :cond_6
    iget-object v0, p0, Ll/ci80;->a:Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;

    .line 77
    .line 78
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->type:Lcom/p1/mobile/putong/feed/data/PoiGuidePopType;

    .line 79
    .line 80
    const-string v4, "poi"

    .line 81
    .line 82
    invoke-static {v0, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    if-eqz v0, :cond_7

    .line 87
    .line 88
    invoke-static {}, Ll/ci80;->h()Ll/ci80;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-virtual {v0}, Ll/ci80;->u()V

    .line 93
    .line 94
    .line 95
    iget-object p0, p0, Ll/ci80;->a:Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;

    .line 96
    .line 97
    invoke-static {p1, p0, v3, v2}, Ll/xh80;->b(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;ZLl/uul;)V

    .line 98
    .line 99
    .line 100
    return v3

    .line 101
    :cond_7
    return v1
.end method

.method public g()Lcom/p1/mobile/android/app/Act;
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->globalLifeCycle_()Ljava/util/HashMap;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_2

    .line 18
    .line 19
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Ljava/util/ArrayList;

    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_0

    .line 34
    .line 35
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    check-cast v1, Lcom/p1/mobile/android/app/Act$r;

    .line 40
    .line 41
    iget-object v1, v1, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 42
    .line 43
    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    check-cast v1, Landroid/app/Activity;

    .line 48
    .line 49
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    if-eqz v2, :cond_1

    .line 54
    .line 55
    instance-of v2, v1, Lcom/p1/mobile/android/app/Act;

    .line 56
    .line 57
    if-eqz v2, :cond_1

    .line 58
    .line 59
    check-cast v1, Lcom/p1/mobile/android/app/Act;

    .line 60
    .line 61
    return-object v1

    .line 62
    :cond_2
    const/4 p0, 0x0

    .line 63
    return-object p0
.end method

.method public i()Z
    .locals 6

    .line 1
    iget-object v0, p0, Ll/ci80;->b:Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-static {}, Ll/pzi0;->o()J

    .line 11
    .line 12
    .line 13
    move-result-wide v2

    .line 14
    iget-object v0, p0, Ll/ci80;->b:Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;

    .line 15
    .line 16
    iget-wide v4, v0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->punchInDate:J

    .line 17
    .line 18
    sub-long/2addr v2, v4

    .line 19
    iget p0, p0, Ll/ci80;->e:I

    .line 20
    .line 21
    sget v0, Ll/ci80;->f:I

    .line 22
    .line 23
    mul-int/2addr p0, v0

    .line 24
    int-to-long v4, p0

    .line 25
    sub-long/2addr v2, v4

    .line 26
    const-wide/16 v4, 0x0

    .line 27
    .line 28
    cmp-long p0, v2, v4

    .line 29
    .line 30
    if-gez p0, :cond_0

    .line 31
    .line 32
    const/4 p0, 0x1

    .line 33
    return p0

    .line 34
    :cond_0
    return v1
.end method

.method public j()Z
    .locals 6

    .line 1
    iget-object v0, p0, Ll/ci80;->b:Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-static {}, Ll/pzi0;->o()J

    .line 11
    .line 12
    .line 13
    move-result-wide v2

    .line 14
    iget-object v0, p0, Ll/ci80;->b:Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;

    .line 15
    .line 16
    iget-wide v4, v0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->triggerDate:J

    .line 17
    .line 18
    sub-long/2addr v2, v4

    .line 19
    iget p0, p0, Ll/ci80;->d:I

    .line 20
    .line 21
    sget v0, Ll/ci80;->f:I

    .line 22
    .line 23
    mul-int/2addr p0, v0

    .line 24
    int-to-long v4, p0

    .line 25
    sub-long/2addr v2, v4

    .line 26
    const-wide/16 v4, 0x0

    .line 27
    .line 28
    cmp-long p0, v2, v4

    .line 29
    .line 30
    if-gez p0, :cond_0

    .line 31
    .line 32
    const/4 p0, 0x1

    .line 33
    return p0

    .line 34
    :cond_0
    return v1
.end method

.method public k()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ci80;->a:Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public l()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ci80;->m()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ci80;->n()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method public m()Z
    .locals 4

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    iget-object p0, p0, Ll/jka;->M:Ll/byd0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ljava/lang/Long;

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    const-wide/16 v2, 0x0

    .line 16
    .line 17
    cmp-long p0, v0, v2

    .line 18
    .line 19
    if-lez p0, :cond_0

    .line 20
    .line 21
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 22
    .line 23
    iget-object p0, p0, Ll/jka;->M:Ll/byd0;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    check-cast p0, Ljava/lang/Long;

    .line 30
    .line 31
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 32
    .line 33
    .line 34
    move-result-wide v0

    .line 35
    invoke-static {v0, v1}, Ll/pzi0;->D(J)Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    return p0

    .line 40
    :cond_0
    const/4 p0, 0x0

    .line 41
    return p0
.end method

.method public n()Z
    .locals 4

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    iget-object p0, p0, Ll/jka;->N:Ll/byd0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ljava/lang/Long;

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    const-wide/16 v2, 0x0

    .line 16
    .line 17
    cmp-long p0, v0, v2

    .line 18
    .line 19
    if-lez p0, :cond_0

    .line 20
    .line 21
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 22
    .line 23
    iget-object p0, p0, Ll/jka;->N:Ll/byd0;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    check-cast p0, Ljava/lang/Long;

    .line 30
    .line 31
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 32
    .line 33
    .line 34
    move-result-wide v0

    .line 35
    invoke-static {v0, v1}, Ll/pzi0;->D(J)Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    return p0

    .line 40
    :cond_0
    const/4 p0, 0x0

    .line 41
    return p0
.end method

.method public final synthetic o(Lcom/p1/mobile/putong/data/MessageLocation;)Ljava/lang/Boolean;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ci80;->b:Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/ci80;->b:Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->poiName:Ljava/lang/String;

    .line 12
    .line 13
    iget-object v1, p1, Lcom/p1/mobile/putong/data/MessageLocation;->name:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Ll/ci80;->b:Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;

    .line 22
    .line 23
    goto :goto_1

    .line 24
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->i:Ll/qzg;

    .line 25
    .line 26
    iget-object p0, p0, Ll/qzg;->g:Ll/fi80;

    .line 27
    .line 28
    sget-object v0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->POINAME:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 29
    .line 30
    iget-object v1, p1, Lcom/p1/mobile/putong/data/MessageLocation;->name:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    sget-object v1, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->_ID:Lcom/tantanapp/common/data/orm/LongColumn;

    .line 37
    .line 38
    iget-object v1, v1, Lcom/tantanapp/common/data/orm/OrderedColumn;->DESC:Lcom/tantanapp/common/data/orm/Order;

    .line 39
    .line 40
    const/4 v2, 0x1

    .line 41
    invoke-virtual {p0, v0, v1, v2}, Ll/wzh0;->query(Lcom/tantanapp/common/data/orm/Filter;Lcom/tantanapp/common/data/orm/Order;I)Ljava/util/List;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    const/4 v1, 0x0

    .line 50
    if-nez v0, :cond_1

    .line 51
    .line 52
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    check-cast p0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_1
    const/4 p0, 0x0

    .line 60
    :goto_0
    if-nez p0, :cond_2

    .line 61
    .line 62
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->new_()Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    sget-object v0, Lcom/p1/mobile/android/app/App;->i:Ll/vxd0;

    .line 67
    .line 68
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    check-cast v0, Ljava/lang/Integer;

    .line 73
    .line 74
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    invoke-static {v0}, Lcom/tantanapp/common/data/DbObject;->GENERATE_UNIQUE_FAKE_ID(I)Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    iput-object v0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 83
    .line 84
    iget-object v0, p1, Lcom/p1/mobile/putong/data/MessageLocation;->name:Ljava/lang/String;

    .line 85
    .line 86
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->poiName:Ljava/lang/String;

    .line 87
    .line 88
    iget-object v0, p1, Lcom/p1/mobile/putong/data/MessageLocation;->address:Ljava/lang/String;

    .line 89
    .line 90
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->address:Ljava/lang/String;

    .line 91
    .line 92
    iget-object p1, p1, Lcom/p1/mobile/putong/data/MessageLocation;->coordinates:Lcom/p1/mobile/putong/data/DoublePair;

    .line 93
    .line 94
    iget-wide v2, p1, Lcom/p1/mobile/putong/data/DoublePair;->first:D

    .line 95
    .line 96
    iput-wide v2, p0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->latitude:D

    .line 97
    .line 98
    iget-wide v2, p1, Lcom/p1/mobile/putong/data/DoublePair;->second:D

    .line 99
    .line 100
    iput-wide v2, p0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->longitude:D

    .line 101
    .line 102
    const-wide/16 v2, 0x0

    .line 103
    .line 104
    iput-wide v2, p0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->triggerDate:J

    .line 105
    .line 106
    iput v1, p0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->triggerTimes:I

    .line 107
    .line 108
    :cond_2
    :goto_1
    invoke-static {}, Ll/pzi0;->o()J

    .line 109
    .line 110
    .line 111
    move-result-wide v0

    .line 112
    iput-wide v0, p0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->punchInDate:J

    .line 113
    .line 114
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->clone()Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    invoke-static {}, Ll/l9c;->o()Ll/l9c;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    new-instance v0, Ll/bi80;

    .line 123
    .line 124
    invoke-direct {v0, p0}, Ll/bi80;-><init>(Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {p1, v0}, Ll/l9c;->B(Ll/x20;)V

    .line 128
    .line 129
    .line 130
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 131
    .line 132
    return-object p0
.end method

.method public final synthetic p()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->i:Ll/qzg;

    .line 2
    .line 3
    iget-object v0, v0, Ll/qzg;->g:Ll/fi80;

    .line 4
    .line 5
    iget-object p0, p0, Ll/ci80;->b:Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->clone()Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {v0, p0}, Ll/wzh0;->upsert(Lcom/tantanapp/common/data/DbObject;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic q(Lcom/p1/mobile/putong/data/MessageLocation;)Ljava/lang/Boolean;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ci80;->b:Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->new_()Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Ll/ci80;->b:Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;

    .line 11
    .line 12
    sget-object v2, Lcom/p1/mobile/android/app/App;->i:Ll/vxd0;

    .line 13
    .line 14
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    check-cast v2, Ljava/lang/Integer;

    .line 19
    .line 20
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    invoke-static {v2}, Lcom/tantanapp/common/data/DbObject;->GENERATE_UNIQUE_FAKE_ID(I)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    iput-object v2, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 29
    .line 30
    iget-object v0, p0, Ll/ci80;->b:Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;

    .line 31
    .line 32
    iget-object v2, p1, Lcom/p1/mobile/putong/data/MessageLocation;->name:Ljava/lang/String;

    .line 33
    .line 34
    iput-object v2, v0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->poiName:Ljava/lang/String;

    .line 35
    .line 36
    iget-object v2, p1, Lcom/p1/mobile/putong/data/MessageLocation;->address:Ljava/lang/String;

    .line 37
    .line 38
    iput-object v2, v0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->address:Ljava/lang/String;

    .line 39
    .line 40
    iget-object p1, p1, Lcom/p1/mobile/putong/data/MessageLocation;->coordinates:Lcom/p1/mobile/putong/data/DoublePair;

    .line 41
    .line 42
    iget-wide v2, p1, Lcom/p1/mobile/putong/data/DoublePair;->first:D

    .line 43
    .line 44
    iput-wide v2, v0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->latitude:D

    .line 45
    .line 46
    iget-wide v2, p1, Lcom/p1/mobile/putong/data/DoublePair;->second:D

    .line 47
    .line 48
    iput-wide v2, v0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->longitude:D

    .line 49
    .line 50
    invoke-static {}, Ll/pzi0;->o()J

    .line 51
    .line 52
    .line 53
    move-result-wide v2

    .line 54
    iput-wide v2, v0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->triggerDate:J

    .line 55
    .line 56
    iget-object p1, p0, Ll/ci80;->b:Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;

    .line 57
    .line 58
    const-wide/16 v2, 0x0

    .line 59
    .line 60
    iput-wide v2, p1, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->punchInDate:J

    .line 61
    .line 62
    iput v1, p1, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->triggerTimes:I

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_0
    invoke-static {}, Ll/pzi0;->o()J

    .line 66
    .line 67
    .line 68
    move-result-wide v2

    .line 69
    iput-wide v2, v0, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->triggerDate:J

    .line 70
    .line 71
    iget-object p1, p0, Ll/ci80;->b:Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;

    .line 72
    .line 73
    iget v0, p1, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->triggerTimes:I

    .line 74
    .line 75
    add-int/2addr v0, v1

    .line 76
    iput v0, p1, Lcom/p1/mobile/putong/feed/data/PoiMarkInfoData;->triggerTimes:I

    .line 77
    .line 78
    :goto_0
    invoke-static {}, Ll/l9c;->o()Ll/l9c;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    new-instance v0, Ll/zh80;

    .line 83
    .line 84
    invoke-direct {v0, p0}, Ll/zh80;-><init>(Ll/ci80;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p1, v0}, Ll/l9c;->B(Ll/x20;)V

    .line 88
    .line 89
    .line 90
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 91
    .line 92
    return-object p0
.end method

.method public r(Lcom/p1/mobile/putong/data/MessageLocation;)V
    .locals 1

    .line 1
    new-instance v0, Ll/ai80;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/ai80;-><init>(Ll/ci80;Lcom/p1/mobile/putong/data/MessageLocation;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lrx/c;->fromCallable(Ljava/util/concurrent/Callable;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p0, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-static {}, Ll/psd0;->B()Ll/gcg0;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/gcg0;)Ll/kcg0;

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final s()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ci80;->a:Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ll/ci80;->t(Lcom/p1/mobile/putong/data/MessageLocation;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public t(Lcom/p1/mobile/putong/data/MessageLocation;)V
    .locals 1

    .line 1
    new-instance v0, Ll/yh80;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/yh80;-><init>(Ll/ci80;Lcom/p1/mobile/putong/data/MessageLocation;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lrx/c;->fromCallable(Ljava/util/concurrent/Callable;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p0, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-static {}, Ll/psd0;->B()Ll/gcg0;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/gcg0;)Ll/kcg0;

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public u()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    iget-object v0, v0, Ll/jka;->M:Ll/byd0;

    .line 4
    .line 5
    invoke-static {}, Ll/pzi0;->o()J

    .line 6
    .line 7
    .line 8
    move-result-wide v1

    .line 9
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Ll/ci80;->s()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public v()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    iget-object v0, v0, Ll/jka;->N:Ll/byd0;

    .line 4
    .line 5
    invoke-static {}, Ll/pzi0;->o()J

    .line 6
    .line 7
    .line 8
    move-result-wide v1

    .line 9
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Ll/ci80;->s()V

    .line 17
    .line 18
    .line 19
    return-void
.end method
