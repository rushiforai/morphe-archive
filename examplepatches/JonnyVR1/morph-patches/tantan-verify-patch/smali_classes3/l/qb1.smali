.class public final Ll/qb1;
.super Ll/pb1;
.source "SourceFile"


# instance fields
.field public volatile b:Ll/bkj0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/bkj0<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/util/audio/AudioBusinessType;",
            "Ll/ga1;",
            ">;"
        }
    .end annotation
.end field

.field public final c:Ljava/util/Deque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Deque<",
            "Ll/bkj0<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/util/audio/AudioBusinessType;",
            "Ljava/lang/ref/WeakReference<",
            "Ll/ga1;",
            ">;>;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/pb1;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/LinkedList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/qb1;->c:Ljava/util/Deque;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/qb1;->b:Ll/bkj0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/qb1;->b:Ll/bkj0;

    .line 6
    .line 7
    iget-object v0, v0, Ll/bkj0;->a:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v0, Ljava/lang/CharSequence;

    .line 10
    .line 11
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    iput-object v0, p0, Ll/qb1;->b:Ll/bkj0;

    .line 19
    .line 20
    :cond_0
    iget-object v0, p0, Ll/qb1;->c:Ljava/util/Deque;

    .line 21
    .line 22
    invoke-interface {v0}, Ljava/util/Deque;->size()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-lez v0, :cond_5

    .line 27
    .line 28
    iget-object v0, p0, Ll/qb1;->c:Ljava/util/Deque;

    .line 29
    .line 30
    invoke-interface {v0}, Ljava/util/Deque;->pop()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Ll/bkj0;

    .line 35
    .line 36
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-eqz v1, :cond_3

    .line 41
    .line 42
    iget-object v1, v0, Ll/bkj0;->a:Ljava/lang/Object;

    .line 43
    .line 44
    check-cast v1, Ljava/lang/CharSequence;

    .line 45
    .line 46
    invoke-static {v1, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    if-eqz v1, :cond_3

    .line 51
    .line 52
    :cond_1
    :goto_0
    iget-object p1, p0, Ll/qb1;->c:Ljava/util/Deque;

    .line 53
    .line 54
    invoke-interface {p1}, Ljava/util/Deque;->size()I

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    iget-object v1, p0, Ll/qb1;->c:Ljava/util/Deque;

    .line 59
    .line 60
    if-lez p1, :cond_2

    .line 61
    .line 62
    invoke-interface {v1}, Ljava/util/Deque;->pop()Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    check-cast p1, Ll/bkj0;

    .line 67
    .line 68
    iget-object p1, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 69
    .line 70
    check-cast p1, Ljava/lang/ref/WeakReference;

    .line 71
    .line 72
    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    check-cast p1, Ll/ga1;

    .line 77
    .line 78
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    if-eqz v1, :cond_1

    .line 83
    .line 84
    iget-object v1, v0, Ll/bkj0;->a:Ljava/lang/Object;

    .line 85
    .line 86
    check-cast v1, Ljava/lang/String;

    .line 87
    .line 88
    iget-object v2, v0, Ll/bkj0;->b:Ljava/lang/Object;

    .line 89
    .line 90
    check-cast v2, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 91
    .line 92
    invoke-interface {p1, v1, v2, p1}, Ll/ga1;->a(Ljava/lang/String;Lcom/p1/mobile/putong/util/audio/AudioBusinessType;Ll/ga1;)V

    .line 93
    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_2
    invoke-interface {v1}, Ljava/util/Collection;->clear()V

    .line 97
    .line 98
    .line 99
    return-void

    .line 100
    :cond_3
    iget-object v1, v0, Ll/bkj0;->c:Ljava/lang/Object;

    .line 101
    .line 102
    check-cast v1, Ljava/lang/ref/WeakReference;

    .line 103
    .line 104
    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    check-cast v1, Ll/ga1;

    .line 109
    .line 110
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    move-result v2

    .line 114
    if-eqz v2, :cond_4

    .line 115
    .line 116
    iget-object v2, v0, Ll/bkj0;->a:Ljava/lang/Object;

    .line 117
    .line 118
    check-cast v2, Ljava/lang/String;

    .line 119
    .line 120
    iget-object v3, v0, Ll/bkj0;->b:Ljava/lang/Object;

    .line 121
    .line 122
    check-cast v3, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 123
    .line 124
    invoke-interface {v1, v2, v3, p1, v1}, Ll/ga1;->c(Ljava/lang/String;Lcom/p1/mobile/putong/util/audio/AudioBusinessType;Ljava/lang/String;Ll/ga1;)V

    .line 125
    .line 126
    .line 127
    :cond_4
    iget-object p0, p0, Ll/qb1;->c:Ljava/util/Deque;

    .line 128
    .line 129
    invoke-interface {p0}, Ljava/util/Collection;->clear()V

    .line 130
    .line 131
    .line 132
    iget-object p0, v0, Ll/bkj0;->a:Ljava/lang/Object;

    .line 133
    .line 134
    check-cast p0, Ljava/lang/String;

    .line 135
    .line 136
    iget-object p0, v0, Ll/bkj0;->b:Ljava/lang/Object;

    .line 137
    .line 138
    invoke-static {p0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    iget-object p0, v0, Ll/bkj0;->c:Ljava/lang/Object;

    .line 142
    .line 143
    invoke-static {p0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    :cond_5
    return-void
.end method

.method public c()Lcom/p1/mobile/putong/util/audio/AudioBusinessType;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/qb1;->b:Ll/bkj0;

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
    iget-object v0, p0, Ll/qb1;->b:Ll/bkj0;

    .line 10
    .line 11
    iget-object v0, v0, Ll/bkj0;->b:Ljava/lang/Object;

    .line 12
    .line 13
    sget-object v1, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->NORMAL:Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 14
    .line 15
    if-eq v0, v1, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Ll/qb1;->b:Ll/bkj0;

    .line 18
    .line 19
    iget-object p0, p0, Ll/bkj0;->b:Ljava/lang/Object;

    .line 20
    .line 21
    check-cast p0, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_0
    iget-object v0, p0, Ll/qb1;->b:Ll/bkj0;

    .line 25
    .line 26
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    const/4 v1, 0x0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    iget-object v0, p0, Ll/qb1;->b:Ll/bkj0;

    .line 34
    .line 35
    iget-object v0, v0, Ll/bkj0;->c:Ljava/lang/Object;

    .line 36
    .line 37
    check-cast v0, Ll/ga1;

    .line 38
    .line 39
    iget-object p0, p0, Ll/qb1;->b:Ll/bkj0;

    .line 40
    .line 41
    iget-object p0, p0, Ll/bkj0;->b:Ljava/lang/Object;

    .line 42
    .line 43
    check-cast p0, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 44
    .line 45
    invoke-interface {v0, p0, v1, v1}, Ll/ga1;->b(Lcom/p1/mobile/putong/util/audio/AudioBusinessType;Ljava/lang/String;Lcom/p1/mobile/putong/util/audio/AudioBusinessType;)V

    .line 46
    .line 47
    .line 48
    :cond_1
    return-object v1
.end method

.method public d(Lcom/p1/mobile/putong/util/audio/AudioBusinessType;)Z
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->NORMAL:Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 2
    .line 3
    if-eq p1, p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public e(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qb1;->b:Ll/bkj0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/qb1;->b:Ll/bkj0;

    .line 6
    .line 7
    iget-object v0, v0, Ll/bkj0;->a:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v0, Ljava/lang/CharSequence;

    .line 10
    .line 11
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    iput-object v0, p0, Ll/qb1;->b:Ll/bkj0;

    .line 19
    .line 20
    :cond_0
    invoke-virtual {p0, p1}, Ll/qb1;->h(Ljava/lang/String;)Ll/bkj0;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    if-eqz p1, :cond_1

    .line 25
    .line 26
    iget-object p0, p0, Ll/qb1;->c:Ljava/util/Deque;

    .line 27
    .line 28
    invoke-interface {p0, p1}, Ljava/util/Deque;->remove(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    :cond_1
    return-void
.end method

.method public f(Ljava/lang/String;Lcom/p1/mobile/putong/util/audio/AudioBusinessType;Ll/ga1;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/qb1;->b:Ll/bkj0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/qb1;->b:Ll/bkj0;

    .line 6
    .line 7
    iget-object v0, v0, Ll/bkj0;->a:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v0, Ljava/lang/CharSequence;

    .line 10
    .line 11
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    :cond_0
    move-object v2, p1

    .line 18
    move-object v3, p2

    .line 19
    move-object v1, p3

    .line 20
    goto/16 :goto_1

    .line 21
    .line 22
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->VIDEO_CHAT:Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 23
    .line 24
    if-ne p2, v0, :cond_2

    .line 25
    .line 26
    iget-object v0, p0, Ll/qb1;->b:Ll/bkj0;

    .line 27
    .line 28
    iget-object v0, v0, Ll/bkj0;->c:Ljava/lang/Object;

    .line 29
    .line 30
    check-cast v0, Ll/ga1;

    .line 31
    .line 32
    iget-object v1, p0, Ll/qb1;->b:Ll/bkj0;

    .line 33
    .line 34
    iget-object v1, v1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 35
    .line 36
    check-cast v1, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 37
    .line 38
    invoke-interface {v0, v1, p1, p2}, Ll/ga1;->b(Lcom/p1/mobile/putong/util/audio/AudioBusinessType;Ljava/lang/String;Lcom/p1/mobile/putong/util/audio/AudioBusinessType;)V

    .line 39
    .line 40
    .line 41
    new-instance v0, Ll/bkj0;

    .line 42
    .line 43
    invoke-direct {v0, p1, p2, p3}, Ll/bkj0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    iput-object v0, p0, Ll/qb1;->b:Ll/bkj0;

    .line 47
    .line 48
    invoke-interface {p3}, Ll/ga1;->success()V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;->LIVE_IN_ROOM:Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 53
    .line 54
    if-ne p2, v0, :cond_3

    .line 55
    .line 56
    iget-object v0, p0, Ll/qb1;->b:Ll/bkj0;

    .line 57
    .line 58
    iget-object v0, v0, Ll/bkj0;->c:Ljava/lang/Object;

    .line 59
    .line 60
    check-cast v0, Ll/ga1;

    .line 61
    .line 62
    iget-object v1, p0, Ll/qb1;->b:Ll/bkj0;

    .line 63
    .line 64
    iget-object v1, v1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 65
    .line 66
    check-cast v1, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 67
    .line 68
    invoke-interface {v0, v1, p1, p2}, Ll/ga1;->b(Lcom/p1/mobile/putong/util/audio/AudioBusinessType;Ljava/lang/String;Lcom/p1/mobile/putong/util/audio/AudioBusinessType;)V

    .line 69
    .line 70
    .line 71
    new-instance v0, Ll/bkj0;

    .line 72
    .line 73
    invoke-direct {v0, p1, p2, p3}, Ll/bkj0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 74
    .line 75
    .line 76
    iput-object v0, p0, Ll/qb1;->b:Ll/bkj0;

    .line 77
    .line 78
    invoke-interface {p3}, Ll/ga1;->success()V

    .line 79
    .line 80
    .line 81
    return-void

    .line 82
    :cond_3
    invoke-virtual {p0, p2}, Ll/qb1;->d(Lcom/p1/mobile/putong/util/audio/AudioBusinessType;)Z

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    if-nez v0, :cond_5

    .line 87
    .line 88
    iget-object v0, p0, Ll/qb1;->b:Ll/bkj0;

    .line 89
    .line 90
    iget-object v0, v0, Ll/bkj0;->b:Ljava/lang/Object;

    .line 91
    .line 92
    check-cast v0, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 93
    .line 94
    invoke-virtual {p0, v0}, Ll/qb1;->d(Lcom/p1/mobile/putong/util/audio/AudioBusinessType;)Z

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    if-nez v0, :cond_5

    .line 99
    .line 100
    iget-object v0, p0, Ll/qb1;->b:Ll/bkj0;

    .line 101
    .line 102
    iget-object v0, v0, Ll/bkj0;->b:Ljava/lang/Object;

    .line 103
    .line 104
    if-ne p2, v0, :cond_4

    .line 105
    .line 106
    goto :goto_0

    .line 107
    :cond_4
    new-instance v0, Ll/bkj0;

    .line 108
    .line 109
    invoke-direct {v0, p1, p2, p3}, Ll/bkj0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 110
    .line 111
    .line 112
    iput-object v0, p0, Ll/qb1;->b:Ll/bkj0;

    .line 113
    .line 114
    invoke-interface {p3}, Ll/ga1;->success()V

    .line 115
    .line 116
    .line 117
    return-void

    .line 118
    :cond_5
    :goto_0
    iget-object v0, p0, Ll/qb1;->b:Ll/bkj0;

    .line 119
    .line 120
    iget-object v0, v0, Ll/bkj0;->a:Ljava/lang/Object;

    .line 121
    .line 122
    check-cast v0, Ljava/lang/String;

    .line 123
    .line 124
    iget-object v0, p0, Ll/qb1;->b:Ll/bkj0;

    .line 125
    .line 126
    iget-object v0, v0, Ll/bkj0;->b:Ljava/lang/Object;

    .line 127
    .line 128
    invoke-static {v0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    iget-object v0, p0, Ll/qb1;->b:Ll/bkj0;

    .line 132
    .line 133
    iget-object v0, v0, Ll/bkj0;->a:Ljava/lang/Object;

    .line 134
    .line 135
    move-object v5, v0

    .line 136
    check-cast v5, Ljava/lang/String;

    .line 137
    .line 138
    iget-object p0, p0, Ll/qb1;->b:Ll/bkj0;

    .line 139
    .line 140
    iget-object p0, p0, Ll/bkj0;->b:Ljava/lang/Object;

    .line 141
    .line 142
    move-object v6, p0

    .line 143
    check-cast v6, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 144
    .line 145
    move-object v4, p3

    .line 146
    move-object v2, p1

    .line 147
    move-object v3, p2

    .line 148
    move-object v1, p3

    .line 149
    invoke-interface/range {v1 .. v6}, Ll/ga1;->d(Ljava/lang/String;Lcom/p1/mobile/putong/util/audio/AudioBusinessType;Ll/ga1;Ljava/lang/String;Lcom/p1/mobile/putong/util/audio/AudioBusinessType;)V

    .line 150
    .line 151
    .line 152
    return-void

    .line 153
    :goto_1
    new-instance p1, Ll/bkj0;

    .line 154
    .line 155
    invoke-direct {p1, v2, v3, v1}, Ll/bkj0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 156
    .line 157
    .line 158
    iput-object p1, p0, Ll/qb1;->b:Ll/bkj0;

    .line 159
    .line 160
    invoke-interface {v1}, Ll/ga1;->success()V

    .line 161
    .line 162
    .line 163
    return-void
.end method

.method public g(Ljava/lang/String;Lcom/p1/mobile/putong/util/audio/AudioBusinessType;Ll/ga1;)V
    .locals 6

    .line 1
    invoke-static {p2}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    invoke-static {p3}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/qb1;->b:Ll/bkj0;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/qb1;->b:Ll/bkj0;

    .line 12
    .line 13
    iget-object v0, v0, Ll/bkj0;->a:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast v0, Ljava/lang/CharSequence;

    .line 16
    .line 17
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    iget-object v0, p0, Ll/qb1;->c:Ljava/util/Deque;

    .line 24
    .line 25
    new-instance v1, Ll/bkj0;

    .line 26
    .line 27
    iget-object v2, p0, Ll/qb1;->b:Ll/bkj0;

    .line 28
    .line 29
    iget-object v2, v2, Ll/bkj0;->a:Ljava/lang/Object;

    .line 30
    .line 31
    check-cast v2, Ljava/lang/String;

    .line 32
    .line 33
    iget-object v3, p0, Ll/qb1;->b:Ll/bkj0;

    .line 34
    .line 35
    iget-object v3, v3, Ll/bkj0;->b:Ljava/lang/Object;

    .line 36
    .line 37
    check-cast v3, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 38
    .line 39
    new-instance v4, Ljava/lang/ref/WeakReference;

    .line 40
    .line 41
    iget-object v5, p0, Ll/qb1;->b:Ll/bkj0;

    .line 42
    .line 43
    iget-object v5, v5, Ll/bkj0;->c:Ljava/lang/Object;

    .line 44
    .line 45
    check-cast v5, Ll/ga1;

    .line 46
    .line 47
    invoke-direct {v4, v5}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    invoke-direct {v1, v2, v3, v4}, Ll/bkj0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    invoke-interface {v0, v1}, Ljava/util/Deque;->push(Ljava/lang/Object;)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Ll/qb1;->b:Ll/bkj0;

    .line 57
    .line 58
    if-eqz v0, :cond_0

    .line 59
    .line 60
    iget-object v0, p0, Ll/qb1;->b:Ll/bkj0;

    .line 61
    .line 62
    iget-object v0, v0, Ll/bkj0;->c:Ljava/lang/Object;

    .line 63
    .line 64
    check-cast v0, Ll/ga1;

    .line 65
    .line 66
    iget-object v1, p0, Ll/qb1;->b:Ll/bkj0;

    .line 67
    .line 68
    iget-object v1, v1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 69
    .line 70
    check-cast v1, Lcom/p1/mobile/putong/util/audio/AudioBusinessType;

    .line 71
    .line 72
    invoke-interface {v0, v1, p1, p2}, Ll/ga1;->b(Lcom/p1/mobile/putong/util/audio/AudioBusinessType;Ljava/lang/String;Lcom/p1/mobile/putong/util/audio/AudioBusinessType;)V

    .line 73
    .line 74
    .line 75
    :cond_0
    new-instance v0, Ll/bkj0;

    .line 76
    .line 77
    invoke-direct {v0, p1, p2, p3}, Ll/bkj0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 78
    .line 79
    .line 80
    iput-object v0, p0, Ll/qb1;->b:Ll/bkj0;

    .line 81
    .line 82
    return-void
.end method

.method public h(Ljava/lang/String;)Ll/bkj0;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ll/bkj0<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/util/audio/AudioBusinessType;",
            "Ljava/lang/ref/WeakReference<",
            "Ll/ga1;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/qb1;->c:Ljava/util/Deque;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/Deque;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object p0, p0, Ll/qb1;->c:Ljava/util/Deque;

    .line 10
    .line 11
    invoke-interface {p0}, Ljava/util/Deque;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Ll/bkj0;

    .line 26
    .line 27
    iget-object v1, v0, Ll/bkj0;->a:Ljava/lang/Object;

    .line 28
    .line 29
    check-cast v1, Ljava/lang/CharSequence;

    .line 30
    .line 31
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eqz v1, :cond_0

    .line 36
    .line 37
    return-object v0

    .line 38
    :cond_1
    const/4 p0, 0x0

    .line 39
    return-object p0
.end method
