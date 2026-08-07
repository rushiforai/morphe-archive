.class public final Lcom/google/android/exoplayer2/source/t;
.super Lcom/google/android/exoplayer2/source/a;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/exoplayer2/source/t$b;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final a:Lcom/google/android/exoplayer2/upstream/a;

.field public final b:Ll/g6c$a;

.field public final c:Lcom/google/android/exoplayer2/k;

.field public final d:J

.field public final e:Lcom/google/android/exoplayer2/upstream/c;

.field public final f:Z

.field public final g:Lcom/google/android/exoplayer2/c0;

.field public final h:Lcom/google/android/exoplayer2/n;

.field public i:Ll/pgj0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/google/android/exoplayer2/n$k;Ll/g6c$a;JLcom/google/android/exoplayer2/upstream/c;ZLjava/lang/Object;)V
    .locals 8
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p8    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Lcom/google/android/exoplayer2/source/a;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Lcom/google/android/exoplayer2/source/t;->b:Ll/g6c$a;

    .line 5
    .line 6
    iput-wide p4, p0, Lcom/google/android/exoplayer2/source/t;->d:J

    .line 7
    .line 8
    iput-object p6, p0, Lcom/google/android/exoplayer2/source/t;->e:Lcom/google/android/exoplayer2/upstream/c;

    .line 9
    .line 10
    iput-boolean p7, p0, Lcom/google/android/exoplayer2/source/t;->f:Z

    .line 11
    .line 12
    new-instance p3, Lcom/google/android/exoplayer2/n$c;

    .line 13
    .line 14
    invoke-direct {p3}, Lcom/google/android/exoplayer2/n$c;-><init>()V

    .line 15
    .line 16
    .line 17
    sget-object p6, Landroid/net/Uri;->EMPTY:Landroid/net/Uri;

    .line 18
    .line 19
    invoke-virtual {p3, p6}, Lcom/google/android/exoplayer2/n$c;->f(Landroid/net/Uri;)Lcom/google/android/exoplayer2/n$c;

    .line 20
    .line 21
    .line 22
    move-result-object p3

    .line 23
    iget-object p6, p2, Lcom/google/android/exoplayer2/n$k;->a:Landroid/net/Uri;

    .line 24
    .line 25
    invoke-virtual {p6}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p6

    .line 29
    invoke-virtual {p3, p6}, Lcom/google/android/exoplayer2/n$c;->c(Ljava/lang/String;)Lcom/google/android/exoplayer2/n$c;

    .line 30
    .line 31
    .line 32
    move-result-object p3

    .line 33
    invoke-static {p2}, Lcom/google/common/collect/ImmutableList;->of(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList;

    .line 34
    .line 35
    .line 36
    move-result-object p6

    .line 37
    invoke-virtual {p3, p6}, Lcom/google/android/exoplayer2/n$c;->d(Ljava/util/List;)Lcom/google/android/exoplayer2/n$c;

    .line 38
    .line 39
    .line 40
    move-result-object p3

    .line 41
    move-object/from16 p6, p8

    .line 42
    .line 43
    invoke-virtual {p3, p6}, Lcom/google/android/exoplayer2/n$c;->e(Ljava/lang/Object;)Lcom/google/android/exoplayer2/n$c;

    .line 44
    .line 45
    .line 46
    move-result-object p3

    .line 47
    invoke-virtual {p3}, Lcom/google/android/exoplayer2/n$c;->a()Lcom/google/android/exoplayer2/n;

    .line 48
    .line 49
    .line 50
    move-result-object v7

    .line 51
    iput-object v7, p0, Lcom/google/android/exoplayer2/source/t;->h:Lcom/google/android/exoplayer2/n;

    .line 52
    .line 53
    new-instance p3, Lcom/google/android/exoplayer2/k$b;

    .line 54
    .line 55
    invoke-direct {p3}, Lcom/google/android/exoplayer2/k$b;-><init>()V

    .line 56
    .line 57
    .line 58
    iget-object p6, p2, Lcom/google/android/exoplayer2/n$k;->b:Ljava/lang/String;

    .line 59
    .line 60
    const-string p7, "text/x-unknown"

    .line 61
    .line 62
    invoke-static {p6, p7}, Lcom/google/common/base/a;->a(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object p6

    .line 66
    check-cast p6, Ljava/lang/String;

    .line 67
    .line 68
    invoke-virtual {p3, p6}, Lcom/google/android/exoplayer2/k$b;->g0(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 69
    .line 70
    .line 71
    move-result-object p3

    .line 72
    iget-object p6, p2, Lcom/google/android/exoplayer2/n$k;->c:Ljava/lang/String;

    .line 73
    .line 74
    invoke-virtual {p3, p6}, Lcom/google/android/exoplayer2/k$b;->X(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 75
    .line 76
    .line 77
    move-result-object p3

    .line 78
    iget p6, p2, Lcom/google/android/exoplayer2/n$k;->d:I

    .line 79
    .line 80
    invoke-virtual {p3, p6}, Lcom/google/android/exoplayer2/k$b;->i0(I)Lcom/google/android/exoplayer2/k$b;

    .line 81
    .line 82
    .line 83
    move-result-object p3

    .line 84
    iget p6, p2, Lcom/google/android/exoplayer2/n$k;->e:I

    .line 85
    .line 86
    invoke-virtual {p3, p6}, Lcom/google/android/exoplayer2/k$b;->e0(I)Lcom/google/android/exoplayer2/k$b;

    .line 87
    .line 88
    .line 89
    move-result-object p3

    .line 90
    iget-object p6, p2, Lcom/google/android/exoplayer2/n$k;->f:Ljava/lang/String;

    .line 91
    .line 92
    invoke-virtual {p3, p6}, Lcom/google/android/exoplayer2/k$b;->W(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 93
    .line 94
    .line 95
    move-result-object p3

    .line 96
    iget-object p6, p2, Lcom/google/android/exoplayer2/n$k;->g:Ljava/lang/String;

    .line 97
    .line 98
    if-eqz p6, :cond_0

    .line 99
    .line 100
    move-object p1, p6

    .line 101
    :cond_0
    invoke-virtual {p3, p1}, Lcom/google/android/exoplayer2/k$b;->U(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/k$b;->G()Lcom/google/android/exoplayer2/k;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/t;->c:Lcom/google/android/exoplayer2/k;

    .line 110
    .line 111
    new-instance p1, Lcom/google/android/exoplayer2/upstream/a$b;

    .line 112
    .line 113
    invoke-direct {p1}, Lcom/google/android/exoplayer2/upstream/a$b;-><init>()V

    .line 114
    .line 115
    .line 116
    iget-object p2, p2, Lcom/google/android/exoplayer2/n$k;->a:Landroid/net/Uri;

    .line 117
    .line 118
    invoke-virtual {p1, p2}, Lcom/google/android/exoplayer2/upstream/a$b;->i(Landroid/net/Uri;)Lcom/google/android/exoplayer2/upstream/a$b;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    const/4 p2, 0x1

    .line 123
    invoke-virtual {p1, p2}, Lcom/google/android/exoplayer2/upstream/a$b;->b(I)Lcom/google/android/exoplayer2/upstream/a$b;

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/upstream/a$b;->a()Lcom/google/android/exoplayer2/upstream/a;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/t;->a:Lcom/google/android/exoplayer2/upstream/a;

    .line 132
    .line 133
    new-instance v0, Ll/lqf0;

    .line 134
    .line 135
    const/4 v5, 0x0

    .line 136
    const/4 v6, 0x0

    .line 137
    const/4 v3, 0x1

    .line 138
    const/4 v4, 0x0

    .line 139
    move-wide v1, p4

    .line 140
    invoke-direct/range {v0 .. v7}, Ll/lqf0;-><init>(JZZZLjava/lang/Object;Lcom/google/android/exoplayer2/n;)V

    .line 141
    .line 142
    .line 143
    iput-object v0, p0, Lcom/google/android/exoplayer2/source/t;->g:Lcom/google/android/exoplayer2/c0;

    .line 144
    .line 145
    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;Lcom/google/android/exoplayer2/n$k;Ll/g6c$a;JLcom/google/android/exoplayer2/upstream/c;ZLjava/lang/Object;Lcom/google/android/exoplayer2/source/t$a;)V
    .locals 0

    .line 146
    invoke-direct/range {p0 .. p8}, Lcom/google/android/exoplayer2/source/t;-><init>(Ljava/lang/String;Lcom/google/android/exoplayer2/n$k;Ll/g6c$a;JLcom/google/android/exoplayer2/upstream/c;ZLjava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public createPeriod(Lcom/google/android/exoplayer2/source/i$b;Ll/oj0;J)Lcom/google/android/exoplayer2/source/h;
    .locals 10

    .line 1
    new-instance v0, Lcom/google/android/exoplayer2/source/s;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/t;->a:Lcom/google/android/exoplayer2/upstream/a;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/google/android/exoplayer2/source/t;->b:Ll/g6c$a;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/google/android/exoplayer2/source/t;->i:Ll/pgj0;

    .line 8
    .line 9
    iget-object v4, p0, Lcom/google/android/exoplayer2/source/t;->c:Lcom/google/android/exoplayer2/k;

    .line 10
    .line 11
    iget-wide v5, p0, Lcom/google/android/exoplayer2/source/t;->d:J

    .line 12
    .line 13
    iget-object v7, p0, Lcom/google/android/exoplayer2/source/t;->e:Lcom/google/android/exoplayer2/upstream/c;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/source/a;->createEventDispatcher(Lcom/google/android/exoplayer2/source/i$b;)Lcom/google/android/exoplayer2/source/j$a;

    .line 16
    .line 17
    .line 18
    move-result-object v8

    .line 19
    iget-boolean v9, p0, Lcom/google/android/exoplayer2/source/t;->f:Z

    .line 20
    .line 21
    invoke-direct/range {v0 .. v9}, Lcom/google/android/exoplayer2/source/s;-><init>(Lcom/google/android/exoplayer2/upstream/a;Ll/g6c$a;Ll/pgj0;Lcom/google/android/exoplayer2/k;JLcom/google/android/exoplayer2/upstream/c;Lcom/google/android/exoplayer2/source/j$a;Z)V

    .line 22
    .line 23
    .line 24
    return-object v0
.end method

.method public getMediaItem()Lcom/google/android/exoplayer2/n;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/t;->h:Lcom/google/android/exoplayer2/n;

    .line 2
    .line 3
    return-object p0
.end method

.method public maybeThrowSourceInfoRefreshError()V
    .locals 0

    return-void
.end method

.method public prepareSourceInternal(Ll/pgj0;)V
    .locals 0
    .param p1    # Ll/pgj0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/t;->i:Ll/pgj0;

    .line 2
    .line 3
    iget-object p1, p0, Lcom/google/android/exoplayer2/source/t;->g:Lcom/google/android/exoplayer2/c0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/source/a;->refreshSourceInfo(Lcom/google/android/exoplayer2/c0;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public releasePeriod(Lcom/google/android/exoplayer2/source/h;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/google/android/exoplayer2/source/s;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/source/s;->l()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public releaseSourceInternal()V
    .locals 0

    return-void
.end method
