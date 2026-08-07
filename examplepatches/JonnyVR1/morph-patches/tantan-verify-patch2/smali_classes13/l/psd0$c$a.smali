.class public Ll/psd0$c$a;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/psd0$c;->e(Ll/gcg0;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/gcg0<",
        "Landroid/util/Pair<",
        "Ljava/lang/Boolean;",
        "Ljava/lang/Boolean;",
        ">;>;"
    }
.end annotation


# instance fields
.field public final synthetic e:Ll/gcg0;

.field public final synthetic f:Ll/psd0$c;


# direct methods
.method public constructor <init>(Ll/psd0$c;Ll/gcg0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/psd0$c$a;->f:Ll/psd0$c;

    .line 2
    .line 3
    iput-object p2, p0, Ll/psd0$c$a;->e:Ll/gcg0;

    .line 4
    .line 5
    invoke-direct {p0}, Ll/gcg0;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public g(Landroid/util/Pair;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Pair<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/psd0$c$a;->f:Ll/psd0$c;

    .line 2
    .line 3
    iget-object v1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v1, Ljava/lang/Boolean;

    .line 6
    .line 7
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const/4 v2, 0x1

    .line 12
    xor-int/2addr v1, v2

    .line 13
    iput-boolean v1, v0, Ll/psd0$c;->h:Z

    .line 14
    .line 15
    iget-object v0, p0, Ll/psd0$c$a;->f:Ll/psd0$c;

    .line 16
    .line 17
    iget-boolean v1, v0, Ll/psd0$c;->d:Z

    .line 18
    .line 19
    if-nez v1, :cond_0

    .line 20
    .line 21
    iput-boolean v2, v0, Ll/psd0$c;->d:Z

    .line 22
    .line 23
    invoke-static {v0}, Ll/psd0$c;->c(Ll/psd0$c;)Ll/pcj;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-interface {v1}, Ll/pcj;->call()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    check-cast v1, Lrx/c;

    .line 32
    .line 33
    new-instance v2, Ll/psd0$c$a$a;

    .line 34
    .line 35
    invoke-direct {v2, p0}, Ll/psd0$c$a$a;-><init>(Ll/psd0$c$a;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v1, v2}, Lrx/c;->subscribe(Ll/gcg0;)Ll/kcg0;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    iput-object v1, v0, Ll/psd0$c;->e:Ll/kcg0;

    .line 43
    .line 44
    :cond_0
    invoke-virtual {p0}, Ll/gcg0;->isUnsubscribed()Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    iget-object v1, p0, Ll/psd0$c$a;->f:Ll/psd0$c;

    .line 49
    .line 50
    if-eqz v0, :cond_1

    .line 51
    .line 52
    invoke-static {v1}, Ll/psd0$c;->d(Ll/psd0$c;)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_1
    iget-boolean v0, v1, Ll/psd0$c;->h:Z

    .line 57
    .line 58
    if-eqz v0, :cond_2

    .line 59
    .line 60
    iget-object p1, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 61
    .line 62
    check-cast p1, Ljava/lang/Boolean;

    .line 63
    .line 64
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    if-eqz p1, :cond_4

    .line 69
    .line 70
    iget-object p1, p0, Ll/psd0$c$a;->f:Ll/psd0$c;

    .line 71
    .line 72
    iget-object p1, p1, Ll/psd0$c;->e:Ll/kcg0;

    .line 73
    .line 74
    if-eqz p1, :cond_4

    .line 75
    .line 76
    invoke-interface {p1}, Ll/kcg0;->isUnsubscribed()Z

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    if-nez p1, :cond_4

    .line 81
    .line 82
    iget-object p0, p0, Ll/psd0$c$a;->f:Ll/psd0$c;

    .line 83
    .line 84
    iget-object p0, p0, Ll/psd0$c;->e:Ll/kcg0;

    .line 85
    .line 86
    invoke-interface {p0}, Ll/kcg0;->unsubscribe()V

    .line 87
    .line 88
    .line 89
    return-void

    .line 90
    :cond_2
    iget-object p1, v1, Ll/psd0$c;->g:Ljava/lang/Object;

    .line 91
    .line 92
    if-eqz p1, :cond_4

    .line 93
    .line 94
    invoke-virtual {p0}, Ll/gcg0;->isUnsubscribed()Z

    .line 95
    .line 96
    .line 97
    move-result p1

    .line 98
    if-nez p1, :cond_3

    .line 99
    .line 100
    iget-object p1, p0, Ll/psd0$c$a;->e:Ll/gcg0;

    .line 101
    .line 102
    iget-object v0, p0, Ll/psd0$c$a;->f:Ll/psd0$c;

    .line 103
    .line 104
    iget-object v0, v0, Ll/psd0$c;->g:Ljava/lang/Object;

    .line 105
    .line 106
    invoke-interface {p1, v0}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 107
    .line 108
    .line 109
    iget-object p1, p0, Ll/psd0$c$a;->f:Ll/psd0$c;

    .line 110
    .line 111
    iget-boolean p1, p1, Ll/psd0$c;->i:Z

    .line 112
    .line 113
    if-eqz p1, :cond_3

    .line 114
    .line 115
    iget-object p1, p0, Ll/psd0$c$a;->e:Ll/gcg0;

    .line 116
    .line 117
    invoke-interface {p1}, Ll/bb50;->onCompleted()V

    .line 118
    .line 119
    .line 120
    :cond_3
    iget-object p0, p0, Ll/psd0$c$a;->f:Ll/psd0$c;

    .line 121
    .line 122
    const/4 p1, 0x0

    .line 123
    iput-object p1, p0, Ll/psd0$c;->g:Ljava/lang/Object;

    .line 124
    .line 125
    :cond_4
    return-void
.end method

.method public onCompleted()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/psd0$c$a;->f:Ll/psd0$c;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iput-object v1, v0, Ll/psd0$c;->g:Ljava/lang/Object;

    .line 5
    .line 6
    iget-object v0, v0, Ll/psd0$c;->e:Ll/kcg0;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-interface {v0}, Ll/kcg0;->isUnsubscribed()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Ll/psd0$c$a;->f:Ll/psd0$c;

    .line 17
    .line 18
    iget-object v0, v0, Ll/psd0$c;->e:Ll/kcg0;

    .line 19
    .line 20
    invoke-interface {v0}, Ll/kcg0;->unsubscribe()V

    .line 21
    .line 22
    .line 23
    :cond_0
    iget-object p0, p0, Ll/psd0$c$a;->f:Ll/psd0$c;

    .line 24
    .line 25
    const/4 v0, 0x1

    .line 26
    iput-boolean v0, p0, Ll/psd0$c;->d:Z

    .line 27
    .line 28
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/psd0$c$a;->f:Ll/psd0$c;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iput-object v1, v0, Ll/psd0$c;->g:Ljava/lang/Object;

    .line 5
    .line 6
    iget-object p0, p0, Ll/psd0$c$a;->e:Ll/gcg0;

    .line 7
    .line 8
    invoke-interface {p0, p1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public bridge synthetic onNext(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Landroid/util/Pair;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/psd0$c$a;->g(Landroid/util/Pair;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
