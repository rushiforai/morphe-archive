.class public Ll/c5g0;
.super Ll/pgk;
.source "SourceFile"

# interfaces
.implements Ll/ham;
.implements Ll/ruf;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/c5g0$a;
    }
.end annotation


# instance fields
.field public H:Ll/w4g0;

.field public I:Ll/c5g0$a;

.field J:Ll/qjj0;

.field K:Ll/puf;

.field L:Ll/ctf0;

.field private M:Z

.field private N:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List;",
            ">;"
        }
    .end annotation
.end field


# virtual methods
.method public W()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c5g0;->K:Ll/puf;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/puf;->O()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public X()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/c5g0;->M:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Ll/c5g0;->I:Ll/c5g0$a;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Ll/c5g0;->H:Ll/w4g0;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/w4g0;->d()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-lez v0, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Ll/c5g0;->I:Ll/c5g0$a;

    .line 19
    .line 20
    iget-object v2, p0, Ll/c5g0;->H:Ll/w4g0;

    .line 21
    .line 22
    invoke-virtual {v2}, Ll/w4g0;->d()I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    invoke-interface {v0, v2, v1}, Ll/c5g0$a;->playStateChanged(IZ)V

    .line 27
    .line 28
    .line 29
    :cond_0
    iput-boolean v1, p0, Ll/c5g0;->M:Z

    .line 30
    .line 31
    :cond_1
    return-void
.end method

.method public c(ILl/hfj;Z)V
    .locals 2

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/pgk;->c(ILl/hfj;Z)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/c5g0;->J:Ll/qjj0;

    .line 5
    .line 6
    instance-of p1, p1, Ll/f11;

    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    iget-object p1, p0, Ll/c5g0;->K:Ll/puf;

    .line 11
    .line 12
    check-cast p1, Ll/o5g0;

    .line 13
    .line 14
    invoke-virtual {p1}, Ll/o5g0;->S()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    iget-object p1, p0, Ll/c5g0;->K:Ll/puf;

    .line 21
    .line 22
    check-cast p1, Ll/o5g0;

    .line 23
    .line 24
    invoke-virtual {p1}, Ll/o5g0;->S()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    const-string p2, "/"

    .line 29
    .line 30
    invoke-virtual {p1, p2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    iget-object p2, p0, Ll/c5g0;->N:Ljava/util/Map;

    .line 35
    .line 36
    array-length p3, p1

    .line 37
    const/4 v0, 0x1

    .line 38
    sub-int/2addr p3, v0

    .line 39
    aget-object p3, p1, p3

    .line 40
    .line 41
    invoke-interface {p2, p3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result p2

    .line 45
    if-eqz p2, :cond_0

    .line 46
    .line 47
    iget-object p2, p0, Ll/c5g0;->J:Ll/qjj0;

    .line 48
    .line 49
    check-cast p2, Ll/f11;

    .line 50
    .line 51
    iget-object p3, p0, Ll/c5g0;->N:Ljava/util/Map;

    .line 52
    .line 53
    array-length v1, p1

    .line 54
    sub-int/2addr v1, v0

    .line 55
    aget-object v1, p1, v1

    .line 56
    .line 57
    invoke-interface {p3, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object p3

    .line 61
    check-cast p3, Ljava/util/List;

    .line 62
    .line 63
    const/4 v1, 0x0

    .line 64
    invoke-interface {p3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object p3

    .line 68
    check-cast p3, Ljava/lang/Float;

    .line 69
    .line 70
    invoke-virtual {p3}, Ljava/lang/Float;->floatValue()F

    .line 71
    .line 72
    .line 73
    move-result p3

    .line 74
    iget-object p0, p0, Ll/c5g0;->N:Ljava/util/Map;

    .line 75
    .line 76
    array-length v1, p1

    .line 77
    sub-int/2addr v1, v0

    .line 78
    aget-object p1, p1, v1

    .line 79
    .line 80
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    check-cast p0, Ljava/util/List;

    .line 85
    .line 86
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    check-cast p0, Ljava/lang/Float;

    .line 91
    .line 92
    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    .line 93
    .line 94
    .line 95
    move-result p0

    .line 96
    invoke-virtual {p2, p3, p0}, Ll/f11;->S(FF)V

    .line 97
    .line 98
    .line 99
    :cond_0
    return-void
.end method

.method public d(Lcom/immomo/components/interfaces/IProcessOutput;)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    iget-object v0, p0, Ll/c5g0;->J:Ll/qjj0;

    .line 5
    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ll/qjj0;->d(Lcom/immomo/components/interfaces/IProcessOutput;)V

    .line 9
    .line 10
    .line 11
    :cond_1
    iget-object v0, p0, Ll/c5g0;->L:Ll/ctf0;

    .line 12
    .line 13
    if-eqz v0, :cond_2

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-interface {p1, v0}, Lcom/immomo/components/interfaces/IProcessOutput;->b(I)Ll/ftl;

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Ll/c5g0;->L:Ll/ctf0;

    .line 20
    .line 21
    invoke-virtual {v1, v0}, Ll/ctf0;->O(Z)V

    .line 22
    .line 23
    .line 24
    :cond_2
    invoke-interface {p1}, Lcom/immomo/components/interfaces/IProcessOutput;->a()I

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-nez p1, :cond_3

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/c5g0;->X()V

    .line 31
    .line 32
    .line 33
    :cond_3
    :goto_0
    return-void
.end method

.method public f()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/pgk;->f()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/c5g0;->W()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public setTimeStamp(J)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/c5g0;->K:Ll/puf;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    instance-of v0, p0, Ll/ham;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    check-cast p0, Ll/ham;

    .line 10
    .line 11
    invoke-interface {p0, p1, p2}, Ll/ham;->setTimeStamp(J)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method
