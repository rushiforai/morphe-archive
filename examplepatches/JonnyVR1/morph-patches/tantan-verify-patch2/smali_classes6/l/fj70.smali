.class public Ll/fj70;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ll/dj70;


# direct methods
.method public constructor <init>(Ll/dj70;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/fj70;->a:Ll/dj70;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Z)Ljava/lang/String;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const-string p0, "e_follow"

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "e_cancelfollow"

    .line 7
    .line 8
    return-object p0
.end method

.method public b()[Ll/pf60;
    .locals 6

    .line 1
    iget-object v0, p0, Ll/fj70;->a:Ll/dj70;

    .line 2
    .line 3
    iget-object v0, v0, Ll/dj70;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x0

    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-array p0, v2, [Ll/pf60;

    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 18
    .line 19
    .line 20
    new-instance v3, Ll/pf60;

    .line 21
    .line 22
    const-string v4, "owner_id"

    .line 23
    .line 24
    iget-object v5, v0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 25
    .line 26
    invoke-direct {v3, v4, v5}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    iget-boolean v3, v0, Lcom/p1/mobile/putong/feed/data/Moment;->isLive:Z

    .line 33
    .line 34
    if-eqz v3, :cond_1

    .line 35
    .line 36
    new-instance v3, Ll/pf60;

    .line 37
    .line 38
    iget-object v4, v0, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    .line 39
    .line 40
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Live;->id:Ljava/lang/String;

    .line 41
    .line 42
    const-string v5, "liveId"

    .line 43
    .line 44
    invoke-direct {v3, v5, v4}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 45
    .line 46
    .line 47
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    new-instance v3, Ll/pf60;

    .line 51
    .line 52
    iget-object v4, v0, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    .line 53
    .line 54
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Live;->anchor:Lcom/p1/mobile/putong/data/Owner;

    .line 55
    .line 56
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 57
    .line 58
    const-string v5, "anchorId"

    .line 59
    .line 60
    invoke-direct {v3, v5, v4}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 61
    .line 62
    .line 63
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_1
    new-instance v3, Ll/pf60;

    .line 68
    .line 69
    const-string v4, "moment_id"

    .line 70
    .line 71
    iget-object v5, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 72
    .line 73
    invoke-direct {v3, v4, v5}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 74
    .line 75
    .line 76
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    :goto_0
    iget-object v3, p0, Ll/fj70;->a:Ll/dj70;

    .line 80
    .line 81
    iget-object v3, v3, Ll/dj70;->f:Lcom/p1/mobile/putong/data/User;

    .line 82
    .line 83
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result v3

    .line 87
    if-eqz v3, :cond_2

    .line 88
    .line 89
    new-instance v3, Ll/pf60;

    .line 90
    .line 91
    iget-object p0, p0, Ll/fj70;->a:Ll/dj70;

    .line 92
    .line 93
    iget-object p0, p0, Ll/dj70;->f:Lcom/p1/mobile/putong/data/User;

    .line 94
    .line 95
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 96
    .line 97
    const-string v4, "moment_user_id"

    .line 98
    .line 99
    invoke-direct {v3, v4, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 100
    .line 101
    .line 102
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    :cond_2
    new-instance p0, Ll/pf60;

    .line 106
    .line 107
    iget-boolean v3, v0, Lcom/p1/mobile/putong/feed/data/Moment;->isLive:Z

    .line 108
    .line 109
    if-eqz v3, :cond_3

    .line 110
    .line 111
    const-string v3, "live"

    .line 112
    .line 113
    goto :goto_1

    .line 114
    :cond_3
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 115
    .line 116
    .line 117
    move-result-object v3

    .line 118
    invoke-virtual {v3, v0}, Ll/er60;->y(Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v3

    .line 122
    :goto_1
    const-string v4, "moment_type"

    .line 123
    .line 124
    invoke-direct {p0, v4, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 125
    .line 126
    .line 127
    invoke-interface {v1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 128
    .line 129
    .line 130
    new-instance p0, Ll/pf60;

    .line 131
    .line 132
    const-string v3, "receiver_user_id"

    .line 133
    .line 134
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 135
    .line 136
    invoke-direct {p0, v3, v0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 137
    .line 138
    .line 139
    invoke-interface {v1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 140
    .line 141
    .line 142
    new-array p0, v2, [Ll/pf60;

    .line 143
    .line 144
    invoke-interface {v1, p0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 145
    .line 146
    .line 147
    move-result-object p0

    .line 148
    check-cast p0, [Ll/pf60;

    .line 149
    .line 150
    return-object p0
.end method

.method public c()Ljava/lang/String;
    .locals 3
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/fj70;->a:Ll/dj70;

    .line 2
    .line 3
    iget-boolean v1, v0, Ll/dj70;->c:Z

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    const-string v1, "from_discover_dating"

    .line 8
    .line 9
    iget-object v0, v0, Ll/dj70;->b:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    const-string v0, "p_discover_dating"

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const-string v0, ""

    .line 21
    .line 22
    :goto_0
    iget-object v1, p0, Ll/fj70;->a:Ll/dj70;

    .line 23
    .line 24
    iget-boolean v2, v1, Ll/dj70;->c:Z

    .line 25
    .line 26
    if-nez v2, :cond_1

    .line 27
    .line 28
    const-string v2, "from_discover_discussion"

    .line 29
    .line 30
    iget-object v1, v1, Ll/dj70;->b:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-eqz v1, :cond_1

    .line 37
    .line 38
    const-string v0, "p_discover_discussion"

    .line 39
    .line 40
    :cond_1
    iget-object v1, p0, Ll/fj70;->a:Ll/dj70;

    .line 41
    .line 42
    iget-boolean v2, v1, Ll/dj70;->c:Z

    .line 43
    .line 44
    if-nez v2, :cond_2

    .line 45
    .line 46
    iget-object v1, v1, Ll/dj70;->b:Ljava/lang/String;

    .line 47
    .line 48
    const-string v2, "from_activity_tab_one"

    .line 49
    .line 50
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    if-eqz v1, :cond_2

    .line 55
    .line 56
    invoke-static {v2}, Ll/pu20;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    :cond_2
    iget-object p0, p0, Ll/fj70;->a:Ll/dj70;

    .line 61
    .line 62
    iget-boolean v1, p0, Ll/dj70;->c:Z

    .line 63
    .line 64
    if-nez v1, :cond_3

    .line 65
    .line 66
    iget-object p0, p0, Ll/dj70;->b:Ljava/lang/String;

    .line 67
    .line 68
    const-string v1, "from_activity_tab_two"

    .line 69
    .line 70
    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    move-result p0

    .line 74
    if-eqz p0, :cond_3

    .line 75
    .line 76
    invoke-static {v1}, Ll/pu20;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    return-object p0

    .line 81
    :cond_3
    return-object v0
.end method

.method public d(Landroid/view/View;)Z
    .locals 2

    .line 1
    instance-of p1, p1, Lv/VDraweeView;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object p0, p0, Ll/fj70;->a:Ll/dj70;

    .line 10
    .line 11
    iget-object v0, p0, Ll/dj70;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 12
    .line 13
    iget-object v1, p0, Ll/dj70;->b:Ljava/lang/String;

    .line 14
    .line 15
    iget-boolean p0, p0, Ll/dj70;->c:Z

    .line 16
    .line 17
    invoke-virtual {p1, v0, v1, p0}, Ll/er60;->m(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;Z)V

    .line 18
    .line 19
    .line 20
    const/4 p0, 0x1

    .line 21
    return p0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return p0
.end method
