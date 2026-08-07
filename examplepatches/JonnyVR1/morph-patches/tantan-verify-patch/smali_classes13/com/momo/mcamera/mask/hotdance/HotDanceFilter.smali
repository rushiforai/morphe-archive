.class public Lcom/momo/mcamera/mask/hotdance/HotDanceFilter;
.super Ll/lt2;
.source "SourceFile"

# interfaces
.implements Landroid/os/Handler$Callback;


# instance fields
.field private count:I

.field private final danceNineGridFilter:Lcom/momo/mcamera/mask/hotdance/DanceNineGridFilter;

.field private final danceOffsetFilter:Lcom/momo/mcamera/mask/hotdance/DanceOffsetFilter;

.field private final danceScaleFilter:Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;

.field private final danceSoulFilter:Lcom/momo/mcamera/mask/hotdance/DanceSoulFilter;

.field private final danceTranslateFilter:Lcom/momo/mcamera/mask/hotdance/DanceTranslateFilter;

.field private handler:Landroid/os/Handler;

.field private hotDance:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lproject/android/imageprocessing/model/FilterOptions$HotDanceBean;",
            ">;"
        }
    .end annotation
.end field

.field private index:I

.field private final runnable:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>()V
    .locals 5

    .line 1
    invoke-direct {p0}, Ll/lt2;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/momo/mcamera/mask/hotdance/HotDanceFilter;->count:I

    .line 6
    .line 7
    iput v0, p0, Lcom/momo/mcamera/mask/hotdance/HotDanceFilter;->index:I

    .line 8
    .line 9
    new-instance v0, Lcom/momo/mcamera/mask/hotdance/HotDanceFilter$1;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Lcom/momo/mcamera/mask/hotdance/HotDanceFilter$1;-><init>(Lcom/momo/mcamera/mask/hotdance/HotDanceFilter;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/momo/mcamera/mask/hotdance/HotDanceFilter;->runnable:Ljava/lang/Runnable;

    .line 15
    .line 16
    new-instance v0, Lcom/momo/mcamera/mask/hotdance/DanceSoulFilter;

    .line 17
    .line 18
    invoke-direct {v0}, Lcom/momo/mcamera/mask/hotdance/DanceSoulFilter;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Lcom/momo/mcamera/mask/hotdance/HotDanceFilter;->danceSoulFilter:Lcom/momo/mcamera/mask/hotdance/DanceSoulFilter;

    .line 22
    .line 23
    new-instance v1, Lcom/momo/mcamera/mask/hotdance/DanceTranslateFilter;

    .line 24
    .line 25
    invoke-direct {v1}, Lcom/momo/mcamera/mask/hotdance/DanceTranslateFilter;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object v1, p0, Lcom/momo/mcamera/mask/hotdance/HotDanceFilter;->danceTranslateFilter:Lcom/momo/mcamera/mask/hotdance/DanceTranslateFilter;

    .line 29
    .line 30
    new-instance v2, Lcom/momo/mcamera/mask/hotdance/DanceOffsetFilter;

    .line 31
    .line 32
    invoke-direct {v2}, Lcom/momo/mcamera/mask/hotdance/DanceOffsetFilter;-><init>()V

    .line 33
    .line 34
    .line 35
    iput-object v2, p0, Lcom/momo/mcamera/mask/hotdance/HotDanceFilter;->danceOffsetFilter:Lcom/momo/mcamera/mask/hotdance/DanceOffsetFilter;

    .line 36
    .line 37
    new-instance v3, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;

    .line 38
    .line 39
    invoke-direct {v3}, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;-><init>()V

    .line 40
    .line 41
    .line 42
    iput-object v3, p0, Lcom/momo/mcamera/mask/hotdance/HotDanceFilter;->danceScaleFilter:Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;

    .line 43
    .line 44
    new-instance v4, Lcom/momo/mcamera/mask/hotdance/DanceNineGridFilter;

    .line 45
    .line 46
    invoke-direct {v4}, Lcom/momo/mcamera/mask/hotdance/DanceNineGridFilter;-><init>()V

    .line 47
    .line 48
    .line 49
    iput-object v4, p0, Lcom/momo/mcamera/mask/hotdance/HotDanceFilter;->danceNineGridFilter:Lcom/momo/mcamera/mask/hotdance/DanceNineGridFilter;

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v1, v2}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v2, v3}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v3, v4}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v4, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0, v0}, Ll/lt2;->registerInitialFilter(Ll/jt2;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0, v1}, Ll/lt2;->registerFilter(Ll/jt2;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0, v2}, Ll/lt2;->registerFilter(Ll/jt2;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0, v3}, Ll/lt2;->registerFilter(Ll/jt2;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p0, v4}, Ll/lt2;->registerTerminalFilter(Ll/jt2;)V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public static synthetic access$000(Lcom/momo/mcamera/mask/hotdance/HotDanceFilter;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/momo/mcamera/mask/hotdance/HotDanceFilter;->clear()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private clear()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/hotdance/HotDanceFilter;->danceNineGridFilter:Lcom/momo/mcamera/mask/hotdance/DanceNineGridFilter;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/hotdance/DanceNineGridFilter;->clear()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/hotdance/HotDanceFilter;->danceScaleFilter:Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->clear()V

    .line 13
    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/momo/mcamera/mask/hotdance/HotDanceFilter;->danceOffsetFilter:Lcom/momo/mcamera/mask/hotdance/DanceOffsetFilter;

    .line 16
    .line 17
    if-eqz v0, :cond_2

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/hotdance/DanceOffsetFilter;->clear()V

    .line 20
    .line 21
    .line 22
    :cond_2
    iget-object v0, p0, Lcom/momo/mcamera/mask/hotdance/HotDanceFilter;->danceTranslateFilter:Lcom/momo/mcamera/mask/hotdance/DanceTranslateFilter;

    .line 23
    .line 24
    if-eqz v0, :cond_3

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/hotdance/DanceTranslateFilter;->clear()V

    .line 27
    .line 28
    .line 29
    :cond_3
    iget-object v0, p0, Lcom/momo/mcamera/mask/hotdance/HotDanceFilter;->danceSoulFilter:Lcom/momo/mcamera/mask/hotdance/DanceSoulFilter;

    .line 30
    .line 31
    if-eqz v0, :cond_4

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/hotdance/DanceSoulFilter;->clear()V

    .line 34
    .line 35
    .line 36
    :cond_4
    iget-object p0, p0, Lcom/momo/mcamera/mask/hotdance/HotDanceFilter;->handler:Landroid/os/Handler;

    .line 37
    .line 38
    const/4 v0, 0x0

    .line 39
    invoke-virtual {p0, v0}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method private driveEffect(Landroid/os/Message;)V
    .locals 1

    .line 1
    iget p1, p1, Landroid/os/Message;->what:I

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/momo/mcamera/mask/hotdance/HotDanceFilter;->danceScaleFilter:Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->onMusicBeatDetect(I)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    const/4 v0, 0x1

    .line 12
    if-ne p1, v0, :cond_1

    .line 13
    .line 14
    iget-object p0, p0, Lcom/momo/mcamera/mask/hotdance/HotDanceFilter;->danceNineGridFilter:Lcom/momo/mcamera/mask/hotdance/DanceNineGridFilter;

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/hotdance/DanceNineGridFilter;->onMusicBeatDetect(I)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_1
    const/4 v0, 0x2

    .line 21
    if-ne p1, v0, :cond_2

    .line 22
    .line 23
    iget-object p0, p0, Lcom/momo/mcamera/mask/hotdance/HotDanceFilter;->danceNineGridFilter:Lcom/momo/mcamera/mask/hotdance/DanceNineGridFilter;

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/hotdance/DanceNineGridFilter;->onMusicBeatDetect(I)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_2
    const/4 v0, 0x3

    .line 30
    if-ne p1, v0, :cond_3

    .line 31
    .line 32
    iget-object p0, p0, Lcom/momo/mcamera/mask/hotdance/HotDanceFilter;->danceScaleFilter:Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;

    .line 33
    .line 34
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->onMusicBeatDetect(I)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_3
    const/4 v0, 0x4

    .line 39
    if-ne p1, v0, :cond_4

    .line 40
    .line 41
    iget-object p0, p0, Lcom/momo/mcamera/mask/hotdance/HotDanceFilter;->danceScaleFilter:Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;

    .line 42
    .line 43
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/hotdance/DanceScaleFilter;->onMusicBeatDetect(I)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_4
    const/4 v0, 0x5

    .line 48
    if-ne p1, v0, :cond_5

    .line 49
    .line 50
    iget-object p0, p0, Lcom/momo/mcamera/mask/hotdance/HotDanceFilter;->danceOffsetFilter:Lcom/momo/mcamera/mask/hotdance/DanceOffsetFilter;

    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/hotdance/DanceOffsetFilter;->onMusicBeatDetect()V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_5
    const/4 v0, 0x6

    .line 57
    if-ne p1, v0, :cond_6

    .line 58
    .line 59
    iget-object p0, p0, Lcom/momo/mcamera/mask/hotdance/HotDanceFilter;->danceTranslateFilter:Lcom/momo/mcamera/mask/hotdance/DanceTranslateFilter;

    .line 60
    .line 61
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/hotdance/DanceTranslateFilter;->onMusicBeatDetect()V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_6
    const/4 v0, 0x7

    .line 66
    if-ne p1, v0, :cond_7

    .line 67
    .line 68
    iget-object p0, p0, Lcom/momo/mcamera/mask/hotdance/HotDanceFilter;->danceSoulFilter:Lcom/momo/mcamera/mask/hotdance/DanceSoulFilter;

    .line 69
    .line 70
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/hotdance/DanceSoulFilter;->onMusicBeatDetect()V

    .line 71
    .line 72
    .line 73
    :cond_7
    return-void
.end method


# virtual methods
.method public declared-synchronized destroy()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-super {p0}, Ll/lt2;->destroy()V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Lcom/momo/mcamera/mask/hotdance/HotDanceFilter;->handler:Landroid/os/Handler;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v1, p0, Lcom/momo/mcamera/mask/hotdance/HotDanceFilter;->runnable:Ljava/lang/Runnable;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :catchall_0
    move-exception v0

    .line 16
    goto :goto_1

    .line 17
    :cond_0
    :goto_0
    monitor-exit p0

    .line 18
    return-void

    .line 19
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 20
    throw v0
.end method

.method public handleMessage(Landroid/os/Message;)Z
    .locals 4

    .line 1
    invoke-direct {p0, p1}, Lcom/momo/mcamera/mask/hotdance/HotDanceFilter;->driveEffect(Landroid/os/Message;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/momo/mcamera/mask/hotdance/HotDanceFilter;->handler:Landroid/os/Handler;

    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iget v0, p0, Lcom/momo/mcamera/mask/hotdance/HotDanceFilter;->index:I

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    add-int/2addr v0, v1

    .line 14
    iput v0, p0, Lcom/momo/mcamera/mask/hotdance/HotDanceFilter;->index:I

    .line 15
    .line 16
    iget v2, p0, Lcom/momo/mcamera/mask/hotdance/HotDanceFilter;->count:I

    .line 17
    .line 18
    rem-int/2addr v0, v2

    .line 19
    iput v0, p0, Lcom/momo/mcamera/mask/hotdance/HotDanceFilter;->index:I

    .line 20
    .line 21
    iget-object v2, p0, Lcom/momo/mcamera/mask/hotdance/HotDanceFilter;->hotDance:Ljava/util/List;

    .line 22
    .line 23
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Lproject/android/imageprocessing/model/FilterOptions$HotDanceBean;

    .line 28
    .line 29
    invoke-virtual {v0}, Lproject/android/imageprocessing/model/FilterOptions$HotDanceBean;->getName()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-static {v0}, Lcom/momo/mcamera/mask/hotdance/HotDanceConfig;->unwrap(Ljava/lang/String;)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    iput v0, p1, Landroid/os/Message;->what:I

    .line 38
    .line 39
    iget-object v0, p0, Lcom/momo/mcamera/mask/hotdance/HotDanceFilter;->hotDance:Ljava/util/List;

    .line 40
    .line 41
    iget v2, p0, Lcom/momo/mcamera/mask/hotdance/HotDanceFilter;->index:I

    .line 42
    .line 43
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    check-cast v0, Lproject/android/imageprocessing/model/FilterOptions$HotDanceBean;

    .line 48
    .line 49
    invoke-virtual {v0}, Lproject/android/imageprocessing/model/FilterOptions$HotDanceBean;->getInterval()F

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    const/high16 v2, 0x447a0000    # 1000.0f

    .line 54
    .line 55
    mul-float/2addr v0, v2

    .line 56
    iget-object p0, p0, Lcom/momo/mcamera/mask/hotdance/HotDanceFilter;->handler:Landroid/os/Handler;

    .line 57
    .line 58
    float-to-long v2, v0

    .line 59
    invoke-virtual {p0, p1, v2, v3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 60
    .line 61
    .line 62
    return v1
.end method

.method public setFilterOptions(Lproject/android/imageprocessing/model/FilterOptions;)V
    .locals 3

    .line 1
    invoke-super {p0, p1}, Ll/i4;->setFilterOptions(Lproject/android/imageprocessing/model/FilterOptions;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lproject/android/imageprocessing/model/FilterOptions;->getHotDance()Ljava/util/List;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    if-eqz v0, :cond_2

    .line 9
    .line 10
    invoke-virtual {p1}, Lproject/android/imageprocessing/model/FilterOptions;->getHotDance()Ljava/util/List;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-gtz v0, :cond_0

    .line 19
    .line 20
    goto :goto_1

    .line 21
    :cond_0
    invoke-virtual {p1}, Lproject/android/imageprocessing/model/FilterOptions;->getHotDance()Ljava/util/List;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iput-object p1, p0, Lcom/momo/mcamera/mask/hotdance/HotDanceFilter;->hotDance:Ljava/util/List;

    .line 26
    .line 27
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    iput p1, p0, Lcom/momo/mcamera/mask/hotdance/HotDanceFilter;->count:I

    .line 32
    .line 33
    iget-object p1, p0, Lcom/momo/mcamera/mask/hotdance/HotDanceFilter;->hotDance:Ljava/util/List;

    .line 34
    .line 35
    iget v0, p0, Lcom/momo/mcamera/mask/hotdance/HotDanceFilter;->index:I

    .line 36
    .line 37
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    check-cast p1, Lproject/android/imageprocessing/model/FilterOptions$HotDanceBean;

    .line 42
    .line 43
    invoke-virtual {p1}, Lproject/android/imageprocessing/model/FilterOptions$HotDanceBean;->getName()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-static {p1}, Lcom/momo/mcamera/mask/hotdance/HotDanceConfig;->unwrap(Ljava/lang/String;)I

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    iget-object v0, p0, Lcom/momo/mcamera/mask/hotdance/HotDanceFilter;->hotDance:Ljava/util/List;

    .line 52
    .line 53
    iget v1, p0, Lcom/momo/mcamera/mask/hotdance/HotDanceFilter;->index:I

    .line 54
    .line 55
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    check-cast v0, Lproject/android/imageprocessing/model/FilterOptions$HotDanceBean;

    .line 60
    .line 61
    invoke-virtual {v0}, Lproject/android/imageprocessing/model/FilterOptions$HotDanceBean;->getInterval()F

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    const/high16 v1, 0x447a0000    # 1000.0f

    .line 66
    .line 67
    mul-float/2addr v0, v1

    .line 68
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    if-nez v1, :cond_1

    .line 73
    .line 74
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    goto :goto_0

    .line 79
    :cond_1
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    :goto_0
    new-instance v2, Landroid/os/Handler;

    .line 84
    .line 85
    invoke-direct {v2, v1, p0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    .line 86
    .line 87
    .line 88
    iput-object v2, p0, Lcom/momo/mcamera/mask/hotdance/HotDanceFilter;->handler:Landroid/os/Handler;

    .line 89
    .line 90
    float-to-long v0, v0

    .line 91
    invoke-virtual {v2, p1, v0, v1}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 92
    .line 93
    .line 94
    :cond_2
    :goto_1
    return-void
.end method
