.class public abstract Ll/j410;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wzl;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/j410$b;
    }
.end annotation


# instance fields
.field protected a:Ljava/lang/String;

.field protected b:Ljava/lang/String;

.field protected c:Ljava/lang/String;

.field protected d:Ljava/lang/String;

.field protected e:Ljava/lang/String;

.field protected f:Ljava/lang/String;

.field protected g:Ljava/lang/String;

.field protected h:I

.field private i:I

.field protected j:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected k:I

.field protected l:Ljava/lang/String;

.field protected m:Ll/j410$b;

.field protected n:Ljava/lang/Thread;

.field private volatile o:Z

.field private final p:Ljava/lang/Object;

.field protected q:Ll/eql;

.field protected r:Ll/wyl;

.field protected s:Ll/drl;

.field private volatile t:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "v2.pushWatch"

    .line 5
    .line 6
    iput-object v0, p0, Ll/j410;->a:Ljava/lang/String;

    .line 7
    .line 8
    const-string v0, "v2.pullWatch"

    .line 9
    .line 10
    iput-object v0, p0, Ll/j410;->b:Ljava/lang/String;

    .line 11
    .line 12
    const-string v0, "v2.pushStart"

    .line 13
    .line 14
    iput-object v0, p0, Ll/j410;->c:Ljava/lang/String;

    .line 15
    .line 16
    const-string v0, "v2.pushStop"

    .line 17
    .line 18
    iput-object v0, p0, Ll/j410;->d:Ljava/lang/String;

    .line 19
    .line 20
    const-string v0, "v2.pushBitrateChange"

    .line 21
    .line 22
    iput-object v0, p0, Ll/j410;->e:Ljava/lang/String;

    .line 23
    .line 24
    const-string v0, "v2.pushNetworkWarning"

    .line 25
    .line 26
    iput-object v0, p0, Ll/j410;->f:Ljava/lang/String;

    .line 27
    .line 28
    const-string v0, "v2.pushFocus"

    .line 29
    .line 30
    iput-object v0, p0, Ll/j410;->g:Ljava/lang/String;

    .line 31
    .line 32
    const/4 v0, 0x5

    .line 33
    iput v0, p0, Ll/j410;->h:I

    .line 34
    .line 35
    const/16 v0, 0x1e

    .line 36
    .line 37
    iput v0, p0, Ll/j410;->i:I

    .line 38
    .line 39
    new-instance v0, Ljava/util/ArrayList;

    .line 40
    .line 41
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 42
    .line 43
    .line 44
    iput-object v0, p0, Ll/j410;->j:Ljava/util/ArrayList;

    .line 45
    .line 46
    const/4 v0, 0x0

    .line 47
    iput v0, p0, Ll/j410;->k:I

    .line 48
    .line 49
    iput-boolean v0, p0, Ll/j410;->o:Z

    .line 50
    .line 51
    new-instance v1, Ljava/lang/Object;

    .line 52
    .line 53
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 54
    .line 55
    .line 56
    iput-object v1, p0, Ll/j410;->p:Ljava/lang/Object;

    .line 57
    .line 58
    iput-boolean v0, p0, Ll/j410;->t:Z

    .line 59
    .line 60
    iput-object p1, p0, Ll/j410;->l:Ljava/lang/String;

    .line 61
    .line 62
    return-void
.end method

.method public static synthetic b(Ll/j410;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/j410;->o:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic c(Ll/j410;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/j410;->p:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic d(Ll/j410;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/j410;->h()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private declared-synchronized f()V
    .locals 5

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/j410;->j:Ljava/util/ArrayList;

    .line 3
    .line 4
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 5
    .line 6
    .line 7
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    monitor-exit p0

    .line 11
    return-void

    .line 12
    :cond_0
    :try_start_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 15
    .line 16
    .line 17
    iget-object v1, p0, Ll/j410;->j:Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_3

    .line 24
    .line 25
    const/4 v1, 0x0

    .line 26
    move v2, v1

    .line 27
    :goto_0
    iget-object v3, p0, Ll/j410;->j:Ljava/util/ArrayList;

    .line 28
    .line 29
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 30
    .line 31
    .line 32
    move-result v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 33
    iget-object v4, p0, Ll/j410;->j:Ljava/util/ArrayList;

    .line 34
    .line 35
    if-ge v2, v3, :cond_1

    .line 36
    .line 37
    :try_start_2
    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    check-cast v3, Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    add-int/lit8 v2, v2, 0x1

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :catchall_0
    move-exception v0

    .line 50
    goto :goto_1

    .line 51
    :cond_1
    invoke-virtual {v4}, Ljava/util/ArrayList;->clear()V

    .line 52
    .line 53
    .line 54
    iget-boolean v2, p0, Ll/j410;->o:Z

    .line 55
    .line 56
    if-eqz v2, :cond_2

    .line 57
    .line 58
    iget-object v2, p0, Ll/j410;->a:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    invoke-virtual {p0, v2, v3}, Ll/j410;->k(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 72
    .line 73
    .line 74
    :cond_3
    monitor-exit p0

    .line 75
    return-void

    .line 76
    :goto_1
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 77
    throw v0
.end method

.method private h()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/j410;->j:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget v1, p0, Ll/j410;->i:I

    .line 8
    .line 9
    if-ge v0, v1, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-direct {p0}, Ll/j410;->f()V

    .line 13
    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public A1(Ll/eql;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/j410;->q:Ll/eql;

    .line 2
    .line 3
    return-void
.end method

.method public G1(Ll/wyl;)V
    .locals 3

    .line 1
    iput-object p1, p0, Ll/j410;->r:Ll/wyl;

    .line 2
    .line 3
    invoke-interface {p1, p0}, Ll/wyl;->E0(Ll/wzl;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    const/4 v1, 0x0

    .line 8
    const/16 v2, 0x101a

    .line 9
    .line 10
    invoke-interface {p1, v2, v0, v1}, Ll/wyl;->j1(IILjava/lang/Object;)J

    .line 11
    .line 12
    .line 13
    move-result-wide v0

    .line 14
    long-to-int p1, v0

    .line 15
    iput p1, p0, Ll/j410;->k:I

    .line 16
    .line 17
    return-void
.end method

.method public U(Ll/drl;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/j410;->s:Ll/drl;

    .line 2
    .line 3
    return-void
.end method

.method public a(IILjava/lang/Object;)V
    .locals 2

    .line 1
    const/16 v0, 0x3004

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v1, "onInfo "

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v1, " "

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string p2, " ["

    .line 24
    .line 25
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string p2, "]"

    .line 32
    .line 33
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    const-string v0, "jzheng"

    .line 41
    .line 42
    invoke-static {v0, p2}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 43
    .line 44
    .line 45
    iget-object p2, p0, Ll/j410;->l:Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result p2

    .line 55
    if-eqz p2, :cond_0

    .line 56
    .line 57
    iget-object p2, p0, Ll/j410;->c:Ljava/lang/String;

    .line 58
    .line 59
    invoke-virtual {p0, p3}, Ll/j410;->l(Ljava/lang/Object;)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {p0, p2, v0}, Ll/j410;->k(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    :cond_0
    const/16 p2, 0x300f

    .line 67
    .line 68
    if-eq p1, p2, :cond_4

    .line 69
    .line 70
    const/16 p2, 0x3010

    .line 71
    .line 72
    if-eq p1, p2, :cond_3

    .line 73
    .line 74
    const/16 p2, 0x3012

    .line 75
    .line 76
    if-eq p1, p2, :cond_2

    .line 77
    .line 78
    const/16 p2, 0x3014

    .line 79
    .line 80
    if-eq p1, p2, :cond_1

    .line 81
    .line 82
    return-void

    .line 83
    :cond_1
    const-string p2, "v2.pushRestart"

    .line 84
    .line 85
    invoke-virtual {p0, p3, p1}, Ll/j410;->j(Ljava/lang/Object;I)Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    invoke-virtual {p0, p2, p1}, Ll/j410;->k(Ljava/lang/String;Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    return-void

    .line 93
    :cond_2
    const-string p2, "v2.mediaLogs"

    .line 94
    .line 95
    invoke-virtual {p0, p3, p1}, Ll/j410;->j(Ljava/lang/Object;I)Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    invoke-virtual {p0, p2, p1}, Ll/j410;->k(Ljava/lang/String;Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :cond_3
    iget-object p2, p0, Ll/j410;->g:Ljava/lang/String;

    .line 104
    .line 105
    invoke-virtual {p0, p3, p1}, Ll/j410;->j(Ljava/lang/Object;I)Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    invoke-virtual {p0, p2, p1}, Ll/j410;->k(Ljava/lang/String;Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    return-void

    .line 113
    :cond_4
    iget-object p1, p0, Ll/j410;->f:Ljava/lang/String;

    .line 114
    .line 115
    invoke-virtual {p0, p3}, Ll/j410;->i(Ljava/lang/Object;)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object p2

    .line 119
    invoke-virtual {p0, p1, p2}, Ll/j410;->k(Ljava/lang/String;Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    return-void
.end method

.method public d0(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget v0, p0, Ll/j410;->k:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Ll/j410;->l:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    instance-of v0, p1, Ll/wyl;

    .line 19
    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iget-object v0, p0, Ll/j410;->c:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Ll/j410;->l(Ljava/lang/Object;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p0, v0, p1}, Ll/j410;->k(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public e(Ljava/lang/Object;)Z
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    return p0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    return p0
.end method

.method public f1(Ll/j410$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/j410;->m:Ll/j410$b;

    .line 2
    .line 3
    return-void
.end method

.method public abstract g(Ljava/lang/Object;I)J
.end method

.method public abstract i(Ljava/lang/Object;)Ljava/lang/String;
.end method

.method public abstract j(Ljava/lang/Object;I)Ljava/lang/String;
.end method

.method public j0(Ljava/lang/Object;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/j410;->f()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/j410;->s:Ll/drl;

    .line 5
    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    iget-object v0, p0, Ll/j410;->l:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    iget-object v0, p0, Ll/j410;->s:Ll/drl;

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Ll/j410;->e(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    iget-object v0, p0, Ll/j410;->s:Ll/drl;

    .line 29
    .line 30
    invoke-interface {v0}, Ll/drl;->a()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    goto :goto_0

    .line 35
    :cond_0
    const/4 v0, 0x0

    .line 36
    :goto_0
    iget-boolean v1, p0, Ll/j410;->t:Z

    .line 37
    .line 38
    if-nez v1, :cond_1

    .line 39
    .line 40
    const/4 v1, 0x1

    .line 41
    iput-boolean v1, p0, Ll/j410;->t:Z

    .line 42
    .line 43
    instance-of p1, p1, Ll/wyl;

    .line 44
    .line 45
    if-eqz p1, :cond_1

    .line 46
    .line 47
    iget-object p1, p0, Ll/j410;->d:Ljava/lang/String;

    .line 48
    .line 49
    iget-object v1, p0, Ll/j410;->r:Ll/wyl;

    .line 50
    .line 51
    invoke-virtual {p0, v1, v0}, Ll/j410;->m(Ljava/lang/Object;I)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {p0, p1, v0}, Ll/j410;->k(Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    :cond_1
    iget-boolean p1, p0, Ll/j410;->o:Z

    .line 59
    .line 60
    if-nez p1, :cond_2

    .line 61
    .line 62
    const/4 p1, 0x0

    .line 63
    iput-object p1, p0, Ll/j410;->s:Ll/drl;

    .line 64
    .line 65
    :cond_2
    return-void
.end method

.method public k(Ljava/lang/String;Ljava/lang/String;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/j410;->r:Ll/wyl;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    const/16 v2, 0x1021

    .line 7
    .line 8
    const/4 v3, 0x0

    .line 9
    invoke-interface {v0, v2, v1, v3}, Ll/wyl;->j1(IILjava/lang/Object;)J

    .line 10
    .line 11
    .line 12
    move-result-wide v2

    .line 13
    const-wide/16 v4, 0x1

    .line 14
    .line 15
    cmp-long v0, v2, v4

    .line 16
    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    iget-object p0, p0, Ll/j410;->m:Ll/j410$b;

    .line 21
    .line 22
    if-eqz p0, :cond_3

    .line 23
    .line 24
    const/4 v0, 0x1

    .line 25
    if-eqz p1, :cond_1

    .line 26
    .line 27
    move v2, v0

    .line 28
    goto :goto_0

    .line 29
    :cond_1
    move v2, v1

    .line 30
    :goto_0
    if-eqz p2, :cond_2

    .line 31
    .line 32
    move v1, v0

    .line 33
    :cond_2
    and-int v0, v2, v1

    .line 34
    .line 35
    if-eqz v0, :cond_3

    .line 36
    .line 37
    invoke-interface {p0, p1, p2}, Ll/j410$b;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    :cond_3
    const-string p0, "v3.pullWatch"

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    const-string v0, "["

    .line 47
    .line 48
    const-string v1, "v3logs"

    .line 49
    .line 50
    if-nez p0, :cond_5

    .line 51
    .line 52
    const-string p0, "v3.pushWatch"

    .line 53
    .line 54
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    if-eqz p0, :cond_4

    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_4
    new-instance p0, Ljava/lang/StringBuilder;

    .line 62
    .line 63
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    const-string p1, "] - "

    .line 70
    .line 71
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    invoke-static {v1, p0}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 82
    .line 83
    .line 84
    return-void

    .line 85
    :cond_5
    :goto_1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 86
    .line 87
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    const-string p1, "]"

    .line 94
    .line 95
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    invoke-static {v1, p0}, Ll/t9c;->a(Ljava/lang/String;Ljava/lang/String;)I

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method public abstract l(Ljava/lang/Object;)Ljava/lang/String;
.end method

.method public abstract m(Ljava/lang/Object;I)Ljava/lang/String;
.end method

.method public n(I)V
    .locals 0

    .line 1
    if-gtz p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iput p1, p0, Ll/j410;->i:I

    .line 5
    .line 6
    return-void
.end method

.method public abstract o(Ljava/lang/Object;)Ljava/lang/String;
.end method

.method public start()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/j410;->o:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Ll/j410;->o:Z

    .line 7
    .line 8
    new-instance v0, Ljava/lang/Thread;

    .line 9
    .line 10
    new-instance v1, Ll/j410$a;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/j410$a;-><init>(Ll/j410;)V

    .line 13
    .line 14
    .line 15
    const-string v2, "live-media-WLoThread"

    .line 16
    .line 17
    invoke-direct {v0, v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Ll/j410;->n:Ljava/lang/Thread;

    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public stop()V
    .locals 5

    .line 1
    invoke-direct {p0}, Ll/j410;->f()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/j410;->s:Ll/drl;

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/j410;->e(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/j410;->s:Ll/drl;

    .line 14
    .line 15
    invoke-interface {v0}, Ll/drl;->a()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    move v0, v1

    .line 21
    :goto_0
    iput-boolean v1, p0, Ll/j410;->o:Z

    .line 22
    .line 23
    iget-object v1, p0, Ll/j410;->p:Ljava/lang/Object;

    .line 24
    .line 25
    monitor-enter v1

    .line 26
    :try_start_0
    iget-object v2, p0, Ll/j410;->p:Ljava/lang/Object;

    .line 27
    .line 28
    invoke-virtual {v2}, Ljava/lang/Object;->notifyAll()V

    .line 29
    .line 30
    .line 31
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    iget-object v1, p0, Ll/j410;->n:Ljava/lang/Thread;

    .line 33
    .line 34
    const/4 v2, 0x0

    .line 35
    if-eqz v1, :cond_1

    .line 36
    .line 37
    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    .line 38
    .line 39
    .line 40
    :try_start_1
    iget-object v1, p0, Ll/j410;->n:Ljava/lang/Thread;

    .line 41
    .line 42
    const-wide/16 v3, 0x7d0

    .line 43
    .line 44
    invoke-virtual {v1, v3, v4}, Ljava/lang/Thread;->join(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    .line 45
    .line 46
    .line 47
    goto :goto_1

    .line 48
    :catch_0
    move-exception v1

    .line 49
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 50
    .line 51
    .line 52
    :goto_1
    iput-object v2, p0, Ll/j410;->n:Ljava/lang/Thread;

    .line 53
    .line 54
    :cond_1
    iget-boolean v1, p0, Ll/j410;->t:Z

    .line 55
    .line 56
    if-nez v1, :cond_2

    .line 57
    .line 58
    const/4 v1, 0x1

    .line 59
    iput-boolean v1, p0, Ll/j410;->t:Z

    .line 60
    .line 61
    iget-object v1, p0, Ll/j410;->r:Ll/wyl;

    .line 62
    .line 63
    if-eqz v1, :cond_2

    .line 64
    .line 65
    iget-object v3, p0, Ll/j410;->d:Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {p0, v1, v0}, Ll/j410;->m(Ljava/lang/Object;I)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {p0, v3, v0}, Ll/j410;->k(Ljava/lang/String;Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    :cond_2
    iput-object v2, p0, Ll/j410;->q:Ll/eql;

    .line 75
    .line 76
    iput-object v2, p0, Ll/j410;->r:Ll/wyl;

    .line 77
    .line 78
    return-void

    .line 79
    :catchall_0
    move-exception p0

    .line 80
    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 81
    throw p0
.end method

.method public t(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/j410;->h:I

    .line 2
    .line 3
    return-void
.end method

.method public t0(I)V
    .locals 5

    .line 1
    new-instance v0, Ll/omb0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/omb0;-><init>()V

    .line 4
    .line 5
    .line 6
    sget v1, Ll/omb0;->c:I

    .line 7
    .line 8
    new-instance v2, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 14
    .line 15
    .line 16
    move-result-wide v3

    .line 17
    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    const-string v3, ""

    .line 21
    .line 22
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {v0, v1, v2}, Ll/v310;->a(ILjava/lang/String;)V

    .line 30
    .line 31
    .line 32
    sget v1, Ll/omb0;->d:I

    .line 33
    .line 34
    new-instance v2, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-virtual {v0, v1, p1}, Ll/v310;->a(ILjava/lang/String;)V

    .line 50
    .line 51
    .line 52
    iget-object p1, p0, Ll/j410;->e:Ljava/lang/String;

    .line 53
    .line 54
    invoke-virtual {v0}, Ll/v310;->toString()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {p0, p1, v0}, Ll/j410;->k(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method
