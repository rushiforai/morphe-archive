.class public Lcom/momo/mcamera/mask/EffectGroupFilter;
.super Ll/ogk;
.source "SourceFile"

# interfaces
.implements Ll/suf;
.implements Ll/gam;
.implements Lcom/momo/mcamera/mask/StickerAdjustFilter$IOrderable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/mcamera/mask/EffectGroupFilter$EffectRenderFinishListener;
    }
.end annotation


# instance fields
.field private final INVALID_MODEL_TYPE:I

.field private mEffectFilterMap:Ljava/util/concurrent/ConcurrentHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap<",
            "Ljava/lang/String;",
            "Ll/i4;",
            ">;"
        }
    .end annotation
.end field

.field private mFiltersToDestroy:Ljava/util/concurrent/CopyOnWriteArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArrayList<",
            "Ll/wej;",
            ">;"
        }
    .end annotation
.end field

.field private mNormalFilter:Lcom/momo/mcamera/mask/NormalFilter;

.field private mRenderFinishListener:Lcom/momo/mcamera/mask/EffectGroupFilter$EffectRenderFinishListener;

.field private mTerminalFilter:Ll/jt2;

.field private orderedIndex:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/ogk;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/momo/mcamera/mask/EffectGroupFilter;->INVALID_MODEL_TYPE:I

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput v0, p0, Lcom/momo/mcamera/mask/EffectGroupFilter;->orderedIndex:I

    .line 9
    .line 10
    new-instance v0, Lcom/momo/mcamera/mask/NormalFilter;

    .line 11
    .line 12
    invoke-direct {v0}, Lcom/momo/mcamera/mask/NormalFilter;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Lcom/momo/mcamera/mask/EffectGroupFilter;->mNormalFilter:Lcom/momo/mcamera/mask/NormalFilter;

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/momo/mcamera/mask/EffectGroupFilter;->mNormalFilter:Lcom/momo/mcamera/mask/NormalFilter;

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Ll/ogk;->registerInitialFilter(Ll/jt2;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/momo/mcamera/mask/EffectGroupFilter;->mNormalFilter:Lcom/momo/mcamera/mask/NormalFilter;

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Ll/ogk;->registerTerminalFilter(Ll/jt2;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/momo/mcamera/mask/EffectGroupFilter;->mNormalFilter:Lcom/momo/mcamera/mask/NormalFilter;

    .line 31
    .line 32
    iput-object v0, p0, Lcom/momo/mcamera/mask/EffectGroupFilter;->mTerminalFilter:Ll/jt2;

    .line 33
    .line 34
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 35
    .line 36
    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 37
    .line 38
    .line 39
    iput-object v0, p0, Lcom/momo/mcamera/mask/EffectGroupFilter;->mFiltersToDestroy:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 40
    .line 41
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 42
    .line 43
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 44
    .line 45
    .line 46
    iput-object v0, p0, Lcom/momo/mcamera/mask/EffectGroupFilter;->mEffectFilterMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 47
    .line 48
    return-void
.end method

.method public static synthetic access$000(Lcom/momo/mcamera/mask/EffectGroupFilter;Ll/i4;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/momo/mcamera/mask/EffectGroupFilter;->removeEffectFilter(Ll/i4;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private addTerminalFilter(Ll/i4;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/EffectGroupFilter;->mTerminalFilter:Ll/jt2;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/momo/mcamera/mask/EffectGroupFilter;->mTerminalFilter:Ll/jt2;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/momo/mcamera/mask/EffectGroupFilter;->mTerminalFilter:Ll/jt2;

    .line 12
    .line 13
    iput-object v0, p1, Ll/jt2;->parentFilter:Ll/jt2;

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Ll/ogk;->removeTerminalFilter(Ll/jt2;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/momo/mcamera/mask/EffectGroupFilter;->mTerminalFilter:Ll/jt2;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/ogk;->registerFilter(Ll/jt2;)V

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, Lcom/momo/mcamera/mask/EffectGroupFilter;->mTerminalFilter:Ll/jt2;

    .line 24
    .line 25
    invoke-virtual {p1, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Lcom/momo/mcamera/mask/EffectGroupFilter;->mTerminalFilter:Ll/jt2;

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Ll/ogk;->registerTerminalFilter(Ll/jt2;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method private removeEffectFilter(Ll/i4;)V
    .locals 3

    .line 1
    iget-object v0, p1, Ll/jt2;->parentFilter:Ll/jt2;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/momo/mcamera/mask/EffectGroupFilter;->mTerminalFilter:Ll/jt2;

    .line 7
    .line 8
    if-ne v1, p1, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ll/ogk;->removeTerminalFilter(Ll/jt2;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, v0}, Ll/ogk;->registerTerminalFilter(Ll/jt2;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lcom/momo/mcamera/mask/EffectGroupFilter;->mTerminalFilter:Ll/jt2;

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-virtual {p0, p1}, Ll/ogk;->removeFilter(Ll/jt2;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1}, Ll/gfj;->getTargets()Ljava/util/List;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    const/4 v2, 0x0

    .line 30
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    check-cast v1, Ll/jt2;

    .line 35
    .line 36
    invoke-virtual {p1, v1}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 37
    .line 38
    .line 39
    iput-object v0, v1, Ll/jt2;->parentFilter:Ll/jt2;

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 42
    .line 43
    .line 44
    :goto_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/EffectGroupFilter;->mFiltersToDestroy:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 45
    .line 46
    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Lcom/momo/mcamera/mask/EffectGroupFilter;->mEffectFilterMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 50
    .line 51
    invoke-virtual {p1}, Ll/i4;->getFilterOptions()Lproject/android/imageprocessing/model/FilterOptions;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-virtual {p1}, Lproject/android/imageprocessing/model/FilterOptions;->getName()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    iget-object p1, p0, Lcom/momo/mcamera/mask/EffectGroupFilter;->mEffectFilterMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 63
    .line 64
    invoke-virtual {p1}, Ljava/util/concurrent/ConcurrentHashMap;->size()I

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    if-nez p1, :cond_1

    .line 69
    .line 70
    iget-object p0, p0, Lcom/momo/mcamera/mask/EffectGroupFilter;->mRenderFinishListener:Lcom/momo/mcamera/mask/EffectGroupFilter$EffectRenderFinishListener;

    .line 71
    .line 72
    if-eqz p0, :cond_1

    .line 73
    .line 74
    invoke-interface {p0}, Lcom/momo/mcamera/mask/EffectGroupFilter$EffectRenderFinishListener;->onRenderFinish()V

    .line 75
    .line 76
    .line 77
    :cond_1
    return-void
.end method


# virtual methods
.method public addEffectFilterItem(Lcom/momo/mcamera/mask/bean/EffectFilterItem;)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/EffectGroupFilter;->mEffectFilterMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/bean/EffectFilterItem;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ll/i4;

    .line 12
    .line 13
    const-wide v1, 0x174876e7ffL

    .line 14
    .line 15
    .line 16
    .line 17
    .line 18
    const-wide/16 v3, 0x0

    .line 19
    .line 20
    if-eqz v0, :cond_2

    .line 21
    .line 22
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/bean/EffectFilterItem;->getImageFolderPath()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    if-eqz p0, :cond_0

    .line 27
    .line 28
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/bean/EffectFilterItem;->getImageFolderPath()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {v0}, Ll/i4;->getFilterOptions()Lproject/android/imageprocessing/model/FilterOptions;

    .line 33
    .line 34
    .line 35
    move-result-object v5

    .line 36
    invoke-virtual {v5}, Lproject/android/imageprocessing/model/FilterOptions;->getImageFolderPath()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v5

    .line 40
    invoke-virtual {p0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    if-eqz p0, :cond_0

    .line 45
    .line 46
    invoke-virtual {v0}, Ll/i4;->getDuration()J

    .line 47
    .line 48
    .line 49
    move-result-wide v1

    .line 50
    invoke-virtual {v0}, Ll/i4;->getEscapedTime()J

    .line 51
    .line 52
    .line 53
    move-result-wide v3

    .line 54
    sub-long/2addr v1, v3

    .line 55
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/bean/EffectFilterItem;->getDuration()J

    .line 56
    .line 57
    .line 58
    move-result-wide p0

    .line 59
    add-long/2addr v1, p0

    .line 60
    invoke-virtual {v0, v1, v2}, Ll/i4;->setDuration(J)V

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :cond_0
    invoke-static {p1}, Lcom/momo/mcamera/filtermanager/EffectFilterCreator;->getFilterOptions(Lcom/momo/mcamera/mask/bean/EffectFilterItem;)Lproject/android/imageprocessing/model/FilterOptions;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    if-eqz p0, :cond_3

    .line 69
    .line 70
    invoke-virtual {v0, p0}, Ll/i4;->resetFilterOptions(Lproject/android/imageprocessing/model/FilterOptions;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/bean/EffectFilterItem;->getDuration()J

    .line 74
    .line 75
    .line 76
    move-result-wide v5

    .line 77
    cmp-long p0, v5, v3

    .line 78
    .line 79
    if-lez p0, :cond_1

    .line 80
    .line 81
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/bean/EffectFilterItem;->getDuration()J

    .line 82
    .line 83
    .line 84
    move-result-wide v1

    .line 85
    :cond_1
    invoke-virtual {v0, v1, v2}, Ll/i4;->setDuration(J)V

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :cond_2
    invoke-static {p1}, Lcom/momo/mcamera/filtermanager/EffectFilterCreator;->getProcessFilter(Lcom/momo/mcamera/mask/bean/EffectFilterItem;)Ll/i4;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    if-nez v0, :cond_4

    .line 94
    .line 95
    :cond_3
    return-void

    .line 96
    :cond_4
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/bean/EffectFilterItem;->getDuration()J

    .line 97
    .line 98
    .line 99
    move-result-wide v5

    .line 100
    cmp-long v3, v5, v3

    .line 101
    .line 102
    if-lez v3, :cond_5

    .line 103
    .line 104
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/bean/EffectFilterItem;->getDuration()J

    .line 105
    .line 106
    .line 107
    move-result-wide v1

    .line 108
    :cond_5
    invoke-virtual {v0, v1, v2}, Ll/i4;->setDuration(J)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {v0}, Ll/i4;->getFilterOptions()Lproject/android/imageprocessing/model/FilterOptions;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    invoke-virtual {p1}, Lcom/momo/mcamera/mask/bean/EffectFilterItem;->getModelType()I

    .line 116
    .line 117
    .line 118
    move-result p1

    .line 119
    invoke-virtual {v1, p1}, Lproject/android/imageprocessing/model/FilterOptions;->setModelType(I)V

    .line 120
    .line 121
    .line 122
    invoke-direct {p0, v0}, Lcom/momo/mcamera/mask/EffectGroupFilter;->addTerminalFilter(Ll/i4;)V

    .line 123
    .line 124
    .line 125
    iget-object p1, p0, Lcom/momo/mcamera/mask/EffectGroupFilter;->mEffectFilterMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 126
    .line 127
    invoke-virtual {v0}, Ll/i4;->getFilterOptions()Lproject/android/imageprocessing/model/FilterOptions;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    invoke-virtual {v1}, Lproject/android/imageprocessing/model/FilterOptions;->getName()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v1

    .line 135
    invoke-virtual {p1, v1, v0}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 136
    .line 137
    .line 138
    new-instance p1, Lcom/momo/mcamera/mask/EffectGroupFilter$1;

    .line 139
    .line 140
    invoke-direct {p1, p0, v0}, Lcom/momo/mcamera/mask/EffectGroupFilter$1;-><init>(Lcom/momo/mcamera/mask/EffectGroupFilter;Ll/i4;)V

    .line 141
    .line 142
    .line 143
    invoke-virtual {v0, p1}, Ll/i4;->setRenderFinishListener(Ll/ssl;)V

    .line 144
    .line 145
    .line 146
    return-void
.end method

.method public clearAll()V
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    invoke-virtual {p0, v0}, Lcom/momo/mcamera/mask/EffectGroupFilter;->clearWithModelType(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public clearWithModelType(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/EffectGroupFilter;->mEffectFilterMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/EffectGroupFilter;->mEffectFilterMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_2

    .line 25
    .line 26
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Ll/i4;

    .line 31
    .line 32
    const/4 v2, -0x1

    .line 33
    if-eq p1, v2, :cond_1

    .line 34
    .line 35
    invoke-virtual {v1}, Ll/i4;->getFilterOptions()Lproject/android/imageprocessing/model/FilterOptions;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-virtual {v2}, Lproject/android/imageprocessing/model/FilterOptions;->getModelType()I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    if-eq v2, p1, :cond_1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    invoke-direct {p0, v1}, Lcom/momo/mcamera/mask/EffectGroupFilter;->removeEffectFilter(Ll/i4;)V

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_2
    :goto_1
    return-void
.end method

.method public declared-synchronized destroy()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-super {p0}, Ll/ogk;->destroy()V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Lcom/momo/mcamera/mask/EffectGroupFilter;->mEffectFilterMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->clear()V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/momo/mcamera/mask/EffectGroupFilter;->mFiltersToDestroy:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->size()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-lez v0, :cond_1

    .line 17
    .line 18
    iget-object v0, p0, Lcom/momo/mcamera/mask/EffectGroupFilter;->mFiltersToDestroy:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-eqz v1, :cond_0

    .line 29
    .line 30
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    check-cast v1, Ll/wej;

    .line 35
    .line 36
    invoke-virtual {v1}, Ll/wej;->destroy()V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :catchall_0
    move-exception v0

    .line 41
    goto :goto_1

    .line 42
    :cond_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/EffectGroupFilter;->mFiltersToDestroy:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 43
    .line 44
    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->clear()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 45
    .line 46
    .line 47
    :cond_1
    monitor-exit p0

    .line 48
    return-void

    .line 49
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 50
    throw v0
.end method

.method public getOrderedIndex()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/EffectGroupFilter;->orderedIndex:I

    .line 2
    .line 3
    return p0
.end method

.method public newTextureReady(ILl/gfj;Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/EffectGroupFilter;->mFiltersToDestroy:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/momo/mcamera/mask/EffectGroupFilter;->mFiltersToDestroy:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    check-cast v1, Ll/wej;

    .line 26
    .line 27
    invoke-virtual {v1}, Ll/wej;->destroy()V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/EffectGroupFilter;->mFiltersToDestroy:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->clear()V

    .line 34
    .line 35
    .line 36
    :cond_1
    invoke-super {p0, p1, p2, p3}, Ll/ogk;->newTextureReady(ILl/gfj;Z)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public setMMCVInfo(Ll/omw;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/EffectGroupFilter;->mEffectFilterMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_0
    iget-object p0, p0, Lcom/momo/mcamera/mask/EffectGroupFilter;->mEffectFilterMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 11
    .line 12
    invoke-virtual {p0}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    :cond_1
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Ll/i4;

    .line 31
    .line 32
    instance-of v1, v0, Ll/suf;

    .line 33
    .line 34
    if-eqz v1, :cond_1

    .line 35
    .line 36
    check-cast v0, Ll/suf;

    .line 37
    .line 38
    invoke-interface {v0, p1}, Ll/suf;->setMMCVInfo(Ll/omw;)V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_2
    :goto_1
    return-void
.end method

.method public setOrderedIndex(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/EffectGroupFilter;->orderedIndex:I

    .line 2
    .line 3
    return-void
.end method

.method public setRenderFinishListener(Lcom/momo/mcamera/mask/EffectGroupFilter$EffectRenderFinishListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/EffectGroupFilter;->mRenderFinishListener:Lcom/momo/mcamera/mask/EffectGroupFilter$EffectRenderFinishListener;

    .line 2
    .line 3
    return-void
.end method

.method public setTimeStamp(J)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/EffectGroupFilter;->mEffectFilterMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-lez v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/momo/mcamera/mask/EffectGroupFilter;->mEffectFilterMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Ll/i4;

    .line 32
    .line 33
    invoke-virtual {v0, p1, p2}, Ll/i4;->setTimeStamp(J)V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    return-void
.end method
