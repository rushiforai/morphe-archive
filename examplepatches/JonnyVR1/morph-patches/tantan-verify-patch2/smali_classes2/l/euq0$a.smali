.class Ll/euq0$a;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/app/Application$ActivityLifecycleCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/euq0;->V()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/euq0;


# direct methods
.method public constructor <init>(Ll/euq0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/euq0$a;->a:Ll/euq0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/euq0$a;->a:Ll/euq0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-static {v0, p1}, Ll/euq0;->f(Ll/euq0;Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Ll/euq0$a;->a:Ll/euq0;

    .line 15
    .line 16
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 17
    .line 18
    .line 19
    move-result-wide v0

    .line 20
    invoke-static {p1, v0, v1}, Ll/euq0;->d(Ll/euq0;J)J

    .line 21
    .line 22
    .line 23
    const/4 p1, 0x1

    .line 24
    if-eqz p2, :cond_0

    .line 25
    .line 26
    move p2, p1

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const/4 p2, 0x0

    .line 29
    :goto_0
    invoke-static {p2}, Ll/euq0;->m(Z)Z

    .line 30
    .line 31
    .line 32
    invoke-static {p1}, Ll/euq0;->r(Z)Z

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Ll/euq0$a;->a:Ll/euq0;

    .line 36
    .line 37
    invoke-static {p1}, Ll/euq0;->q(Ll/euq0;)Ljava/util/List;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iget-object p2, p0, Ll/euq0$a;->a:Ll/euq0;

    .line 42
    .line 43
    invoke-static {p2}, Ll/euq0;->e(Ll/euq0;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Ll/euq0$a;->a:Ll/euq0;

    .line 51
    .line 52
    invoke-static {p1}, Ll/euq0;->z(Ll/euq0;)Ljava/util/List;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    iget-object p2, p0, Ll/euq0$a;->a:Ll/euq0;

    .line 57
    .line 58
    invoke-static {p2}, Ll/euq0;->t(Ll/euq0;)J

    .line 59
    .line 60
    .line 61
    move-result-wide v0

    .line 62
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 63
    .line 64
    .line 65
    move-result-object p2

    .line 66
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    iget-object p1, p0, Ll/euq0$a;->a:Ll/euq0;

    .line 70
    .line 71
    invoke-static {p1}, Ll/euq0;->e(Ll/euq0;)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p2

    .line 75
    iget-object p0, p0, Ll/euq0$a;->a:Ll/euq0;

    .line 76
    .line 77
    invoke-static {p0}, Ll/euq0;->t(Ll/euq0;)J

    .line 78
    .line 79
    .line 80
    move-result-wide v0

    .line 81
    const-string p0, "onCreate"

    .line 82
    .line 83
    invoke-static {p1, p2, v0, v1, p0}, Ll/euq0;->k(Ll/euq0;Ljava/lang/String;JLjava/lang/String;)V

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method public onActivityDestroyed(Landroid/app/Activity;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object v0, p0, Ll/euq0$a;->a:Ll/euq0;

    .line 10
    .line 11
    invoke-static {v0}, Ll/euq0;->q(Ll/euq0;)Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const/4 v1, -0x1

    .line 20
    if-le v0, v1, :cond_0

    .line 21
    .line 22
    iget-object v1, p0, Ll/euq0$a;->a:Ll/euq0;

    .line 23
    .line 24
    invoke-static {v1}, Ll/euq0;->q(Ll/euq0;)Ljava/util/List;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-ge v0, v1, :cond_0

    .line 33
    .line 34
    iget-object v1, p0, Ll/euq0$a;->a:Ll/euq0;

    .line 35
    .line 36
    invoke-static {v1}, Ll/euq0;->q(Ll/euq0;)Ljava/util/List;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-interface {v1, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    iget-object v1, p0, Ll/euq0$a;->a:Ll/euq0;

    .line 44
    .line 45
    invoke-static {v1}, Ll/euq0;->z(Ll/euq0;)Ljava/util/List;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-interface {v1, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    :cond_0
    iget-object v0, p0, Ll/euq0$a;->a:Ll/euq0;

    .line 53
    .line 54
    invoke-static {v0}, Ll/euq0;->b0(Ll/euq0;)Ljava/util/List;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 62
    .line 63
    .line 64
    move-result-wide v0

    .line 65
    iget-object v2, p0, Ll/euq0$a;->a:Ll/euq0;

    .line 66
    .line 67
    invoke-static {v2}, Ll/euq0;->c0(Ll/euq0;)Ljava/util/List;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 72
    .line 73
    .line 74
    move-result-object v3

    .line 75
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    iget-object p0, p0, Ll/euq0$a;->a:Ll/euq0;

    .line 79
    .line 80
    const-string v2, "onDestroy"

    .line 81
    .line 82
    invoke-static {p0, p1, v0, v1, v2}, Ll/euq0;->k(Ll/euq0;Ljava/lang/String;JLjava/lang/String;)V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public onActivityPaused(Landroid/app/Activity;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/euq0$a;->a:Ll/euq0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-static {v0, p1}, Ll/euq0;->y(Ll/euq0;Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Ll/euq0$a;->a:Ll/euq0;

    .line 15
    .line 16
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 17
    .line 18
    .line 19
    move-result-wide v0

    .line 20
    invoke-static {p1, v0, v1}, Ll/euq0;->x(Ll/euq0;J)J

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Ll/euq0$a;->a:Ll/euq0;

    .line 24
    .line 25
    invoke-static {p1}, Ll/euq0;->S(Ll/euq0;)I

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Ll/euq0$a;->a:Ll/euq0;

    .line 29
    .line 30
    invoke-static {p1}, Ll/euq0;->U(Ll/euq0;)I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    iget-object v0, p0, Ll/euq0$a;->a:Ll/euq0;

    .line 35
    .line 36
    const/4 v1, 0x0

    .line 37
    if-nez p1, :cond_0

    .line 38
    .line 39
    invoke-static {v0, v1}, Ll/euq0;->l(Ll/euq0;Z)Z

    .line 40
    .line 41
    .line 42
    :goto_0
    invoke-static {v1}, Ll/euq0;->r(Z)Z

    .line 43
    .line 44
    .line 45
    iget-object p1, p0, Ll/euq0$a;->a:Ll/euq0;

    .line 46
    .line 47
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 48
    .line 49
    .line 50
    move-result-wide v0

    .line 51
    invoke-static {p1, v0, v1}, Ll/euq0;->C(Ll/euq0;J)J

    .line 52
    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_0
    invoke-static {v0}, Ll/euq0;->U(Ll/euq0;)I

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    if-gez p1, :cond_1

    .line 60
    .line 61
    iget-object p1, p0, Ll/euq0$a;->a:Ll/euq0;

    .line 62
    .line 63
    invoke-static {p1, v1}, Ll/euq0;->b(Ll/euq0;I)I

    .line 64
    .line 65
    .line 66
    iget-object p1, p0, Ll/euq0$a;->a:Ll/euq0;

    .line 67
    .line 68
    invoke-static {p1, v1}, Ll/euq0;->l(Ll/euq0;Z)Z

    .line 69
    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_1
    :goto_1
    iget-object p1, p0, Ll/euq0$a;->a:Ll/euq0;

    .line 73
    .line 74
    invoke-static {p1}, Ll/euq0;->O(Ll/euq0;)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    iget-object p0, p0, Ll/euq0$a;->a:Ll/euq0;

    .line 79
    .line 80
    invoke-static {p0}, Ll/euq0;->W(Ll/euq0;)J

    .line 81
    .line 82
    .line 83
    move-result-wide v1

    .line 84
    const-string p0, "onPause"

    .line 85
    .line 86
    invoke-static {p1, v0, v1, v2, p0}, Ll/euq0;->k(Ll/euq0;Ljava/lang/String;JLjava/lang/String;)V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public onActivityResumed(Landroid/app/Activity;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/euq0$a;->a:Ll/euq0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-static {v0, p1}, Ll/euq0;->v(Ll/euq0;Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Ll/euq0$a;->a:Ll/euq0;

    .line 15
    .line 16
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 17
    .line 18
    .line 19
    move-result-wide v0

    .line 20
    invoke-static {p1, v0, v1}, Ll/euq0;->u(Ll/euq0;J)J

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Ll/euq0$a;->a:Ll/euq0;

    .line 24
    .line 25
    invoke-static {p1}, Ll/euq0;->I(Ll/euq0;)I

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Ll/euq0$a;->a:Ll/euq0;

    .line 29
    .line 30
    invoke-static {p1}, Ll/euq0;->L(Ll/euq0;)Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-nez p1, :cond_3

    .line 35
    .line 36
    iget-object p1, p0, Ll/euq0$a;->a:Ll/euq0;

    .line 37
    .line 38
    const/4 v0, 0x1

    .line 39
    invoke-static {p1, v0}, Ll/euq0;->l(Ll/euq0;Z)Z

    .line 40
    .line 41
    .line 42
    invoke-static {}, Ll/euq0;->P()Z

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    if-eqz p1, :cond_0

    .line 47
    .line 48
    const/4 p1, 0x0

    .line 49
    invoke-static {p1}, Ll/euq0;->w(Z)Z

    .line 50
    .line 51
    .line 52
    invoke-static {v0}, Ll/euq0;->a(I)I

    .line 53
    .line 54
    .line 55
    iget-object p1, p0, Ll/euq0$a;->a:Ll/euq0;

    .line 56
    .line 57
    invoke-static {p1}, Ll/euq0;->M(Ll/euq0;)J

    .line 58
    .line 59
    .line 60
    move-result-wide v0

    .line 61
    invoke-static {v0, v1}, Ll/euq0;->c(J)J

    .line 62
    .line 63
    .line 64
    :cond_0
    iget-object p1, p0, Ll/euq0$a;->a:Ll/euq0;

    .line 65
    .line 66
    invoke-static {p1}, Ll/euq0;->Q(Ll/euq0;)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    iget-object v0, p0, Ll/euq0$a;->a:Ll/euq0;

    .line 71
    .line 72
    invoke-static {v0}, Ll/euq0;->O(Ll/euq0;)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    if-nez p1, :cond_1

    .line 81
    .line 82
    goto :goto_1

    .line 83
    :cond_1
    invoke-static {}, Ll/euq0;->R()Z

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    if-eqz p1, :cond_2

    .line 88
    .line 89
    invoke-static {}, Ll/euq0;->T()Z

    .line 90
    .line 91
    .line 92
    move-result p1

    .line 93
    if-nez p1, :cond_2

    .line 94
    .line 95
    const/4 p1, 0x4

    .line 96
    :goto_0
    invoke-static {p1}, Ll/euq0;->a(I)I

    .line 97
    .line 98
    .line 99
    iget-object p1, p0, Ll/euq0$a;->a:Ll/euq0;

    .line 100
    .line 101
    invoke-static {p1}, Ll/euq0;->M(Ll/euq0;)J

    .line 102
    .line 103
    .line 104
    move-result-wide v0

    .line 105
    invoke-static {v0, v1}, Ll/euq0;->c(J)J

    .line 106
    .line 107
    .line 108
    goto :goto_1

    .line 109
    :cond_2
    invoke-static {}, Ll/euq0;->R()Z

    .line 110
    .line 111
    .line 112
    move-result p1

    .line 113
    if-nez p1, :cond_3

    .line 114
    .line 115
    const/4 p1, 0x3

    .line 116
    goto :goto_0

    .line 117
    :cond_3
    :goto_1
    iget-object p1, p0, Ll/euq0$a;->a:Ll/euq0;

    .line 118
    .line 119
    invoke-static {p1}, Ll/euq0;->Q(Ll/euq0;)Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    iget-object p0, p0, Ll/euq0$a;->a:Ll/euq0;

    .line 124
    .line 125
    invoke-static {p0}, Ll/euq0;->M(Ll/euq0;)J

    .line 126
    .line 127
    .line 128
    move-result-wide v1

    .line 129
    const-string p0, "onResume"

    .line 130
    .line 131
    invoke-static {p1, v0, v1, v2, p0}, Ll/euq0;->k(Ll/euq0;Ljava/lang/String;JLjava/lang/String;)V

    .line 132
    .line 133
    .line 134
    return-void
.end method

.method public onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onActivityStarted(Landroid/app/Activity;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/euq0$a;->a:Ll/euq0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-static {v0, p1}, Ll/euq0;->p(Ll/euq0;Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Ll/euq0$a;->a:Ll/euq0;

    .line 15
    .line 16
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 17
    .line 18
    .line 19
    move-result-wide v0

    .line 20
    invoke-static {p1, v0, v1}, Ll/euq0;->o(Ll/euq0;J)J

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Ll/euq0$a;->a:Ll/euq0;

    .line 24
    .line 25
    invoke-static {p1}, Ll/euq0;->D(Ll/euq0;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object p0, p0, Ll/euq0$a;->a:Ll/euq0;

    .line 30
    .line 31
    invoke-static {p0}, Ll/euq0;->F(Ll/euq0;)J

    .line 32
    .line 33
    .line 34
    move-result-wide v1

    .line 35
    const-string p0, "onStart"

    .line 36
    .line 37
    invoke-static {p1, v0, v1, v2, p0}, Ll/euq0;->k(Ll/euq0;Ljava/lang/String;JLjava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public onActivityStopped(Landroid/app/Activity;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/euq0$a;->a:Ll/euq0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-static {v0, p1}, Ll/euq0;->E(Ll/euq0;Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Ll/euq0$a;->a:Ll/euq0;

    .line 15
    .line 16
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 17
    .line 18
    .line 19
    move-result-wide v0

    .line 20
    invoke-static {p1, v0, v1}, Ll/euq0;->G(Ll/euq0;J)J

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Ll/euq0$a;->a:Ll/euq0;

    .line 24
    .line 25
    invoke-static {p1}, Ll/euq0;->Y(Ll/euq0;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object p0, p0, Ll/euq0$a;->a:Ll/euq0;

    .line 30
    .line 31
    invoke-static {p0}, Ll/euq0;->a0(Ll/euq0;)J

    .line 32
    .line 33
    .line 34
    move-result-wide v1

    .line 35
    const-string p0, "onStop"

    .line 36
    .line 37
    invoke-static {p1, v0, v1, v2, p0}, Ll/euq0;->k(Ll/euq0;Ljava/lang/String;JLjava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method
