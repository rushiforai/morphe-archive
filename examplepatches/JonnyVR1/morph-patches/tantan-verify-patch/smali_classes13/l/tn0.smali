.class public Ll/tn0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/dpl;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/tn0$b;
    }
.end annotation


# instance fields
.field a:Ll/dpl$a;

.field private b:Ll/qc1;

.field private c:Ll/uow;

.field private d:Z

.field private e:Ll/q210$a;


# direct methods
.method public constructor <init>(Ll/uow;Ll/q210$a;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/tn0;->b:Ll/qc1;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Ll/tn0;->d:Z

    .line 9
    .line 10
    iput-object p1, p0, Ll/tn0;->c:Ll/uow;

    .line 11
    .line 12
    iput-object p2, p0, Ll/tn0;->e:Ll/q210$a;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public F()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tn0;->b:Ll/qc1;

    .line 2
    .line 3
    if-eqz p0, :cond_0

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

.method public declared-synchronized I1()V
    .locals 7

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/tn0;->b:Ll/qc1;

    .line 3
    .line 4
    if-nez v0, :cond_1

    .line 5
    .line 6
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const-string v1, "Pipeline_Normal_pip->PIPLINE"

    .line 11
    .line 12
    const-string v2, " startAudioRecord"

    .line 13
    .line 14
    invoke-virtual {v0, v1, v2}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/tn0;->c:Ll/uow;

    .line 18
    .line 19
    iget v3, v0, Ll/tow;->P:I

    .line 20
    .line 21
    iget v5, v0, Ll/tow;->R:I

    .line 22
    .line 23
    iget v0, v0, Ll/tow;->S:I

    .line 24
    .line 25
    new-instance v0, Ll/qc1;

    .line 26
    .line 27
    const/16 v6, 0x800

    .line 28
    .line 29
    invoke-direct {v0, v3, v5, v6}, Ll/qc1;-><init>(III)V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Ll/tn0;->b:Ll/qc1;

    .line 33
    .line 34
    invoke-virtual {v0, v3}, Ll/qc1;->z2(I)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ll/tn0;->b:Ll/qc1;

    .line 38
    .line 39
    iget-object v1, p0, Ll/tn0;->e:Ll/q210$a;

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Ll/qc1;->A2(Ll/q210$a;)V

    .line 42
    .line 43
    .line 44
    iget-object v1, p0, Ll/tn0;->b:Ll/qc1;

    .line 45
    .line 46
    const-string v2, ""

    .line 47
    .line 48
    const/16 v4, 0x10

    .line 49
    .line 50
    invoke-virtual/range {v1 .. v6}, Ll/qc1;->y2(Ljava/lang/String;IIII)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    iget-object v1, p0, Ll/tn0;->e:Ll/q210$a;

    .line 55
    .line 56
    const/4 v2, 0x0

    .line 57
    if-eqz v1, :cond_0

    .line 58
    .line 59
    if-nez v0, :cond_0

    .line 60
    .line 61
    const v0, 0x9100

    .line 62
    .line 63
    .line 64
    const/4 v3, 0x0

    .line 65
    invoke-interface {v1, v0, v3, v3, v2}, Ll/q210$a;->g(IIILjava/lang/Object;)V

    .line 66
    .line 67
    .line 68
    goto :goto_0

    .line 69
    :catchall_0
    move-exception v0

    .line 70
    goto :goto_1

    .line 71
    :cond_0
    :goto_0
    iget-object v0, p0, Ll/tn0;->b:Ll/qc1;

    .line 72
    .line 73
    new-instance v1, Ll/tn0$b;

    .line 74
    .line 75
    invoke-direct {v1, p0, v2}, Ll/tn0$b;-><init>(Ll/tn0;Ll/tn0$a;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v0, v1}, Ll/jc00;->R(Ll/fb1;)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Ll/tn0;->b:Ll/qc1;

    .line 82
    .line 83
    invoke-virtual {v0}, Ll/qc1;->B2()V

    .line 84
    .line 85
    .line 86
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    const-string v1, "startAudioRecord"

    .line 91
    .line 92
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    invoke-virtual {v0, v1}, Ll/b7y;->g([Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 97
    .line 98
    .line 99
    :cond_1
    monitor-exit p0

    .line 100
    return-void

    .line 101
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 102
    throw v0
.end method

.method public L(Ll/dpl$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tn0;->a:Ll/dpl$a;

    .line 2
    .line 3
    return-void
.end method

.method public declared-synchronized X()V
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/tn0;->b:Ll/qc1;

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const-string v1, "Pipeline_Normal_pip->PIPLINE"

    .line 11
    .line 12
    const-string v2, " stopAudioRecord"

    .line 13
    .line 14
    invoke-virtual {v0, v1, v2}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/tn0;->b:Ll/qc1;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/qc1;->C2()V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/tn0;->b:Ll/qc1;

    .line 23
    .line 24
    invoke-virtual {v0}, Ll/qc1;->p2()V

    .line 25
    .line 26
    .line 27
    const/4 v0, 0x0

    .line 28
    iput-object v0, p0, Ll/tn0;->b:Ll/qc1;

    .line 29
    .line 30
    iput-object v0, p0, Ll/tn0;->a:Ll/dpl$a;

    .line 31
    .line 32
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    const-string v1, "stopAudioRecord"

    .line 37
    .line 38
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v0, v1}, Ll/b7y;->g([Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :catchall_0
    move-exception v0

    .line 47
    goto :goto_1

    .line 48
    :cond_0
    :goto_0
    monitor-exit p0

    .line 49
    return-void

    .line 50
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 51
    throw v0
.end method

.method public a(Ll/uow;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/tn0;->c:Ll/uow;

    .line 2
    .line 3
    return-void
.end method
