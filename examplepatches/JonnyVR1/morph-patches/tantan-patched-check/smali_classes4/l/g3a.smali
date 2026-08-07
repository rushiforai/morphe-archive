.class public Ll/g3a;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ll/r2a;

.field public b:Lcom/p1/mobile/android/app/Act;

.field public c:Lcom/p1/mobile/putong/data/Links;


# direct methods
.method public constructor <init>(Ll/r2a;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/g3a;->a:Ll/r2a;

    .line 5
    .line 6
    iput-object p2, p0, Ll/g3a;->b:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a(Ll/g3a;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/g3a;->c(Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method


# virtual methods
.method public b()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/g3a;->c:Lcom/p1/mobile/putong/data/Links;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/g3a;->b:Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iget-object v2, p0, Ll/g3a;->c:Lcom/p1/mobile/putong/data/Links;

    .line 20
    .line 21
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 22
    .line 23
    invoke-interface {v1, v2}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->xl(Ljava/lang/String;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v1, Ll/e3a;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Ll/e3a;-><init>(Ll/g3a;)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Ll/g3a;->a:Ll/r2a;

    .line 37
    .line 38
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    new-instance v2, Ll/f3a;

    .line 42
    .line 43
    invoke-direct {v2, p0}, Ll/f3a;-><init>(Ll/r2a;)V

    .line 44
    .line 45
    .line 46
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 51
    .line 52
    .line 53
    :cond_0
    return-void
.end method

.method public final c(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 6

    .line 1
    const-class v0, Lcom/p1/mobile/putong/data/CommonData;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/data/CommonData;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/data/CommonData;->users:Ljava/util/List;

    .line 10
    .line 11
    new-instance v1, Ljava/util/HashMap;

    .line 12
    .line 13
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 14
    .line 15
    .line 16
    const-class v2, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 17
    .line 18
    invoke-virtual {p1, v2}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    check-cast v2, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 23
    .line 24
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/CoreData;->moments:Ljava/util/List;

    .line 25
    .line 26
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    if-nez v3, :cond_1

    .line 31
    .line 32
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    if-eqz v3, :cond_1

    .line 41
    .line 42
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    check-cast v3, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 47
    .line 48
    iget-object v4, v3, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->owner:Ljava/lang/String;

    .line 49
    .line 50
    invoke-interface {v1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v5

    .line 54
    check-cast v5, Ljava/util/List;

    .line 55
    .line 56
    if-nez v5, :cond_0

    .line 57
    .line 58
    new-instance v5, Ljava/util/ArrayList;

    .line 59
    .line 60
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 61
    .line 62
    .line 63
    :cond_0
    invoke-interface {v5, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    invoke-interface {v1, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_1
    new-instance v2, Ljava/util/ArrayList;

    .line 71
    .line 72
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 73
    .line 74
    .line 75
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 80
    .line 81
    .line 82
    move-result v3

    .line 83
    if-eqz v3, :cond_2

    .line 84
    .line 85
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object v3

    .line 89
    check-cast v3, Lcom/p1/mobile/putong/data/User;

    .line 90
    .line 91
    new-instance v4, Ll/f59;

    .line 92
    .line 93
    invoke-direct {v4}, Ll/f59;-><init>()V

    .line 94
    .line 95
    .line 96
    invoke-virtual {v4, v3}, Ll/f59;->j(Lcom/p1/mobile/putong/data/User;)V

    .line 97
    .line 98
    .line 99
    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 100
    .line 101
    invoke-interface {v1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object v3

    .line 105
    check-cast v3, Ljava/util/List;

    .line 106
    .line 107
    invoke-virtual {v4, v3}, Ll/f59;->h(Ljava/util/List;)V

    .line 108
    .line 109
    .line 110
    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    goto :goto_1

    .line 114
    :cond_2
    iget-object v0, p0, Ll/g3a;->a:Ll/r2a;

    .line 115
    .line 116
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Envelope;->pagination:Lcom/p1/mobile/putong/data/Pagination;

    .line 117
    .line 118
    iget v3, v1, Lcom/p1/mobile/putong/data/Pagination;->total:I

    .line 119
    .line 120
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Pagination;->links:Lcom/p1/mobile/putong/data/Links;

    .line 121
    .line 122
    invoke-interface {v0, v3, v2, v1}, Ll/r2a;->c(ILjava/util/List;Lcom/p1/mobile/putong/data/Links;)V

    .line 123
    .line 124
    .line 125
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Envelope;->pagination:Lcom/p1/mobile/putong/data/Pagination;

    .line 126
    .line 127
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Pagination;->links:Lcom/p1/mobile/putong/data/Links;

    .line 128
    .line 129
    iput-object p1, p0, Ll/g3a;->c:Lcom/p1/mobile/putong/data/Links;

    .line 130
    .line 131
    return-void
.end method

.method public d()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/g3a;->b:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-interface {v1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Ke()Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/e3a;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/e3a;-><init>(Ll/g3a;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/g3a;->a:Ll/r2a;

    .line 21
    .line 22
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    new-instance v2, Ll/f3a;

    .line 26
    .line 27
    invoke-direct {v2, p0}, Ll/f3a;-><init>(Ll/r2a;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 35
    .line 36
    .line 37
    return-void
.end method
