.class public Ll/hgk;
.super Ll/a7;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/a7<",
        "Lcom/p1/mobile/putong/feed/data/Group;",
        ">;"
    }
.end annotation


# instance fields
.field public b:Ljava/lang/String;

.field public c:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/a7;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/hgk;->b:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p1, p0, Ll/hgk;->c:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic c(Ll/hgk;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hgk;->f(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic d(Ll/hgk;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hgk;->e(Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method


# virtual methods
.method public final synthetic e(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 5

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Envelope;->data:Lcom/p1/mobile/putong/data/Data;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/Data;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/FeedData;->groups:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/a7;->b()Ll/l6c;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    new-instance p1, Ljava/lang/Exception;

    .line 24
    .line 25
    const-string v0, "empty data"

    .line 26
    .line 27
    invoke-direct {p1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-interface {p0, p1}, Ll/l6c;->a(Ljava/lang/Throwable;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Envelope;->data:Lcom/p1/mobile/putong/data/Data;

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/Data;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 41
    .line 42
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/FeedData;->groups:Ljava/util/List;

    .line 43
    .line 44
    const/4 v2, 0x0

    .line 45
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    check-cast v0, Lcom/p1/mobile/putong/feed/data/Group;

    .line 50
    .line 51
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Envelope;->data:Lcom/p1/mobile/putong/data/Data;

    .line 52
    .line 53
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/data/Data;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    check-cast v1, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 58
    .line 59
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/FeedData;->momentTopics:Ljava/util/List;

    .line 60
    .line 61
    new-instance v2, Ljava/util/HashMap;

    .line 62
    .line 63
    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 64
    .line 65
    .line 66
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 71
    .line 72
    .line 73
    move-result v3

    .line 74
    if-eqz v3, :cond_1

    .line 75
    .line 76
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v3

    .line 80
    check-cast v3, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 81
    .line 82
    iget-object v4, v3, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 83
    .line 84
    invoke-interface {v2, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_1
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/data/Group;->hotTopics:Ljava/util/List;

    .line 89
    .line 90
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    :cond_2
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 95
    .line 96
    .line 97
    move-result v3

    .line 98
    if-eqz v3, :cond_3

    .line 99
    .line 100
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object v3

    .line 104
    check-cast v3, Lcom/p1/mobile/putong/data/TopicMomentIdBox;

    .line 105
    .line 106
    iget-object v3, v3, Lcom/p1/mobile/putong/data/TopicMomentIdBox;->id:Ljava/lang/String;

    .line 107
    .line 108
    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    move-result-object v3

    .line 112
    check-cast v3, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 113
    .line 114
    if-eqz v3, :cond_2

    .line 115
    .line 116
    iget-object v4, v0, Lcom/p1/mobile/putong/feed/data/Group;->hotTopicsModels:Ljava/util/List;

    .line 117
    .line 118
    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 119
    .line 120
    .line 121
    goto :goto_1

    .line 122
    :cond_3
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/data/Group;->topics:Ljava/util/List;

    .line 123
    .line 124
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 125
    .line 126
    .line 127
    move-result-object v1

    .line 128
    :cond_4
    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 129
    .line 130
    .line 131
    move-result v3

    .line 132
    if-eqz v3, :cond_5

    .line 133
    .line 134
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 135
    .line 136
    .line 137
    move-result-object v3

    .line 138
    check-cast v3, Lcom/p1/mobile/putong/data/TopicMomentIdBox;

    .line 139
    .line 140
    iget-object v3, v3, Lcom/p1/mobile/putong/data/TopicMomentIdBox;->id:Ljava/lang/String;

    .line 141
    .line 142
    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 143
    .line 144
    .line 145
    move-result-object v3

    .line 146
    check-cast v3, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 147
    .line 148
    if-eqz v3, :cond_4

    .line 149
    .line 150
    iget-object v4, v0, Lcom/p1/mobile/putong/feed/data/Group;->relatedTopics:Ljava/util/List;

    .line 151
    .line 152
    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 153
    .line 154
    .line 155
    goto :goto_2

    .line 156
    :cond_5
    invoke-virtual {p0}, Ll/a7;->b()Ll/l6c;

    .line 157
    .line 158
    .line 159
    move-result-object p0

    .line 160
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Envelope;->pagination:Lcom/p1/mobile/putong/data/Pagination;

    .line 161
    .line 162
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Pagination;->links:Lcom/p1/mobile/putong/data/Links;

    .line 163
    .line 164
    invoke-interface {p0, v0, p1}, Ll/l6c;->z0(Ljava/lang/Object;Lcom/p1/mobile/putong/data/Links;)V

    .line 165
    .line 166
    .line 167
    return-void
.end method

.method public final synthetic f(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/a7;->b()Ll/l6c;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-interface {p0, p1}, Ll/l6c;->a(Ljava/lang/Throwable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public next()V
    .locals 0

    .line 1
    return-void
.end method

.method public previous()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/hgk;->c:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 4
    .line 5
    iget-object v2, p0, Ll/hgk;->b:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v1, v2}, Ll/jka;->B7(Ljava/lang/String;)Lrx/c;

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
    new-instance v1, Ll/fgk;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/fgk;-><init>(Ll/hgk;)V

    .line 18
    .line 19
    .line 20
    new-instance v2, Ll/ggk;

    .line 21
    .line 22
    invoke-direct {v2, p0}, Ll/ggk;-><init>(Ll/hgk;)V

    .line 23
    .line 24
    .line 25
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    return-void
.end method
