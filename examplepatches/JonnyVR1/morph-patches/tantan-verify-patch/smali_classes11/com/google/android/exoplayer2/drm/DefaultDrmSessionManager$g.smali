.class public Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager$g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/exoplayer2/drm/DefaultDrmSession$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "g"
.end annotation


# instance fields
.field public final synthetic a:Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager$g;->a:Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager$a;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager$g;-><init>(Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;)V

    return-void
.end method

.method public static synthetic c(Lcom/google/android/exoplayer2/drm/DefaultDrmSession;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/drm/DefaultDrmSession;->b(Lcom/google/android/exoplayer2/drm/b$a;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method


# virtual methods
.method public a(Lcom/google/android/exoplayer2/drm/DefaultDrmSession;I)V
    .locals 5

    .line 1
    const/4 v0, 0x1

    .line 2
    const-wide v1, -0x7fffffffffffffffL    # -4.9E-324

    .line 3
    .line 4
    .line 5
    .line 6
    .line 7
    if-ne p2, v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager$g;->a:Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;->p(Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-lez v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager$g;->a:Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;->m(Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;)J

    .line 20
    .line 21
    .line 22
    move-result-wide v3

    .line 23
    cmp-long v0, v3, v1

    .line 24
    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    iget-object p2, p0, Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager$g;->a:Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;

    .line 28
    .line 29
    invoke-static {p2}, Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;->n(Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;)Ljava/util/Set;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    invoke-interface {p2, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    iget-object p2, p0, Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager$g;->a:Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;

    .line 37
    .line 38
    invoke-static {p2}, Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;->o(Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;)Landroid/os/Handler;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    invoke-static {p2}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    check-cast p2, Landroid/os/Handler;

    .line 47
    .line 48
    new-instance v0, Ll/iod;

    .line 49
    .line 50
    invoke-direct {v0, p1}, Ll/iod;-><init>(Lcom/google/android/exoplayer2/drm/DefaultDrmSession;)V

    .line 51
    .line 52
    .line 53
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 54
    .line 55
    .line 56
    move-result-wide v1

    .line 57
    iget-object v3, p0, Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager$g;->a:Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;

    .line 58
    .line 59
    invoke-static {v3}, Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;->m(Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;)J

    .line 60
    .line 61
    .line 62
    move-result-wide v3

    .line 63
    add-long/2addr v1, v3

    .line 64
    invoke-virtual {p2, v0, p1, v1, v2}, Landroid/os/Handler;->postAtTime(Ljava/lang/Runnable;Ljava/lang/Object;J)Z

    .line 65
    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_0
    if-nez p2, :cond_3

    .line 69
    .line 70
    iget-object p2, p0, Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager$g;->a:Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;

    .line 71
    .line 72
    invoke-static {p2}, Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;->l(Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;)Ljava/util/List;

    .line 73
    .line 74
    .line 75
    move-result-object p2

    .line 76
    invoke-interface {p2, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    iget-object p2, p0, Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager$g;->a:Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;

    .line 80
    .line 81
    invoke-static {p2}, Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;->q(Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;)Lcom/google/android/exoplayer2/drm/DefaultDrmSession;

    .line 82
    .line 83
    .line 84
    move-result-object p2

    .line 85
    const/4 v0, 0x0

    .line 86
    if-ne p2, p1, :cond_1

    .line 87
    .line 88
    iget-object p2, p0, Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager$g;->a:Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;

    .line 89
    .line 90
    invoke-static {p2, v0}, Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;->r(Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;Lcom/google/android/exoplayer2/drm/DefaultDrmSession;)Lcom/google/android/exoplayer2/drm/DefaultDrmSession;

    .line 91
    .line 92
    .line 93
    :cond_1
    iget-object p2, p0, Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager$g;->a:Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;

    .line 94
    .line 95
    invoke-static {p2}, Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;->e(Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;)Lcom/google/android/exoplayer2/drm/DefaultDrmSession;

    .line 96
    .line 97
    .line 98
    move-result-object p2

    .line 99
    if-ne p2, p1, :cond_2

    .line 100
    .line 101
    iget-object p2, p0, Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager$g;->a:Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;

    .line 102
    .line 103
    invoke-static {p2, v0}, Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;->f(Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;Lcom/google/android/exoplayer2/drm/DefaultDrmSession;)Lcom/google/android/exoplayer2/drm/DefaultDrmSession;

    .line 104
    .line 105
    .line 106
    :cond_2
    iget-object p2, p0, Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager$g;->a:Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;

    .line 107
    .line 108
    invoke-static {p2}, Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;->g(Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;)Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager$f;

    .line 109
    .line 110
    .line 111
    move-result-object p2

    .line 112
    invoke-virtual {p2, p1}, Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager$f;->d(Lcom/google/android/exoplayer2/drm/DefaultDrmSession;)V

    .line 113
    .line 114
    .line 115
    iget-object p2, p0, Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager$g;->a:Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;

    .line 116
    .line 117
    invoke-static {p2}, Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;->m(Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;)J

    .line 118
    .line 119
    .line 120
    move-result-wide v3

    .line 121
    cmp-long p2, v3, v1

    .line 122
    .line 123
    if-eqz p2, :cond_3

    .line 124
    .line 125
    iget-object p2, p0, Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager$g;->a:Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;

    .line 126
    .line 127
    invoke-static {p2}, Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;->o(Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;)Landroid/os/Handler;

    .line 128
    .line 129
    .line 130
    move-result-object p2

    .line 131
    invoke-static {p2}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 132
    .line 133
    .line 134
    move-result-object p2

    .line 135
    check-cast p2, Landroid/os/Handler;

    .line 136
    .line 137
    invoke-virtual {p2, p1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 138
    .line 139
    .line 140
    iget-object p2, p0, Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager$g;->a:Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;

    .line 141
    .line 142
    invoke-static {p2}, Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;->n(Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;)Ljava/util/Set;

    .line 143
    .line 144
    .line 145
    move-result-object p2

    .line 146
    invoke-interface {p2, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 147
    .line 148
    .line 149
    :cond_3
    :goto_0
    iget-object p0, p0, Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager$g;->a:Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;

    .line 150
    .line 151
    invoke-static {p0}, Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;->h(Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;)V

    .line 152
    .line 153
    .line 154
    return-void
.end method

.method public b(Lcom/google/android/exoplayer2/drm/DefaultDrmSession;I)V
    .locals 4

    .line 1
    iget-object p2, p0, Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager$g;->a:Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;

    .line 2
    .line 3
    invoke-static {p2}, Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;->m(Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;)J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    .line 8
    .line 9
    .line 10
    .line 11
    .line 12
    cmp-long p2, v0, v2

    .line 13
    .line 14
    if-eqz p2, :cond_0

    .line 15
    .line 16
    iget-object p2, p0, Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager$g;->a:Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;

    .line 17
    .line 18
    invoke-static {p2}, Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;->n(Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;)Ljava/util/Set;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    invoke-interface {p2, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager$g;->a:Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;

    .line 26
    .line 27
    invoke-static {p0}, Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;->o(Lcom/google/android/exoplayer2/drm/DefaultDrmSessionManager;)Landroid/os/Handler;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {p0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    check-cast p0, Landroid/os/Handler;

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void
.end method
