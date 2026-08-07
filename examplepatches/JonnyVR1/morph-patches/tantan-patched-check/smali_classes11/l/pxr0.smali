.class public final Ll/pxr0;
.super Ll/mpr0;
.source "SourceFile"

# interfaces
.implements Ll/eor0;


# instance fields
.field public final c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/ewr0;",
            ">;"
        }
    .end annotation
.end field

.field public e:Ll/gix0;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ll/gix0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ll/ewr0;",
            ">;",
            "Ljava/util/List<",
            "Ll/ewr0;",
            ">;",
            "Ll/gix0;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/mpr0;-><init>(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/pxr0;->c:Ljava/util/List;

    .line 10
    .line 11
    iput-object p4, p0, Ll/pxr0;->e:Ll/gix0;

    .line 12
    .line 13
    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 24
    .line 25
    .line 26
    move-result p2

    .line 27
    if-eqz p2, :cond_0

    .line 28
    .line 29
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    check-cast p2, Ll/ewr0;

    .line 34
    .line 35
    iget-object p4, p0, Ll/pxr0;->c:Ljava/util/List;

    .line 36
    .line 37
    invoke-interface {p2}, Ll/ewr0;->zzf()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    invoke-interface {p4, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_0
    new-instance p1, Ljava/util/ArrayList;

    .line 46
    .line 47
    invoke-direct {p1, p3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 48
    .line 49
    .line 50
    iput-object p1, p0, Ll/pxr0;->d:Ljava/util/List;

    .line 51
    .line 52
    return-void
.end method

.method public constructor <init>(Ll/pxr0;)V
    .locals 2

    .line 53
    iget-object v0, p1, Ll/mpr0;->a:Ljava/lang/String;

    invoke-direct {p0, v0}, Ll/mpr0;-><init>(Ljava/lang/String;)V

    .line 54
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p1, Ll/pxr0;->c:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Ll/pxr0;->c:Ljava/util/List;

    .line 55
    iget-object v1, p1, Ll/pxr0;->c:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 56
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p1, Ll/pxr0;->d:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Ll/pxr0;->d:Ljava/util/List;

    .line 57
    iget-object v1, p1, Ll/pxr0;->d:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 58
    iget-object p1, p1, Ll/pxr0;->e:Ll/gix0;

    iput-object p1, p0, Ll/pxr0;->e:Ll/gix0;

    return-void
.end method


# virtual methods
.method public final d(Ll/gix0;Ljava/util/List;)Ll/ewr0;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gix0;",
            "Ljava/util/List<",
            "Ll/ewr0;",
            ">;)",
            "Ll/ewr0;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/pxr0;->e:Ll/gix0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/gix0;->d()Ll/gix0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    :goto_0
    iget-object v2, p0, Ll/pxr0;->c:Ljava/util/List;

    .line 9
    .line 10
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    if-ge v1, v2, :cond_1

    .line 15
    .line 16
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    iget-object v3, p0, Ll/pxr0;->c:Ljava/util/List;

    .line 21
    .line 22
    if-ge v1, v2, :cond_0

    .line 23
    .line 24
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    check-cast v2, Ljava/lang/String;

    .line 29
    .line 30
    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    check-cast v3, Ll/ewr0;

    .line 35
    .line 36
    invoke-virtual {p1, v3}, Ll/gix0;->c(Ll/ewr0;)Ll/ewr0;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    invoke-virtual {v0, v2, v3}, Ll/gix0;->e(Ljava/lang/String;Ll/ewr0;)V

    .line 41
    .line 42
    .line 43
    goto :goto_1

    .line 44
    :cond_0
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    check-cast v2, Ljava/lang/String;

    .line 49
    .line 50
    sget-object v3, Ll/ewr0;->w0:Ll/ewr0;

    .line 51
    .line 52
    invoke-virtual {v0, v2, v3}, Ll/gix0;->e(Ljava/lang/String;Ll/ewr0;)V

    .line 53
    .line 54
    .line 55
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_1
    iget-object p0, p0, Ll/pxr0;->d:Ljava/util/List;

    .line 59
    .line 60
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    :cond_2
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    if-eqz p1, :cond_4

    .line 69
    .line 70
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    check-cast p1, Ll/ewr0;

    .line 75
    .line 76
    invoke-virtual {v0, p1}, Ll/gix0;->c(Ll/ewr0;)Ll/ewr0;

    .line 77
    .line 78
    .line 79
    move-result-object p2

    .line 80
    instance-of v1, p2, Ll/xzr0;

    .line 81
    .line 82
    if-eqz v1, :cond_3

    .line 83
    .line 84
    invoke-virtual {v0, p1}, Ll/gix0;->c(Ll/ewr0;)Ll/ewr0;

    .line 85
    .line 86
    .line 87
    move-result-object p2

    .line 88
    :cond_3
    instance-of p1, p2, Ll/rmr0;

    .line 89
    .line 90
    if-eqz p1, :cond_2

    .line 91
    .line 92
    check-cast p2, Ll/rmr0;

    .line 93
    .line 94
    invoke-virtual {p2}, Ll/rmr0;->a()Ll/ewr0;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    return-object p0

    .line 99
    :cond_4
    sget-object p0, Ll/ewr0;->w0:Ll/ewr0;

    .line 100
    .line 101
    return-object p0
.end method

.method public final zzc()Ll/ewr0;
    .locals 1

    .line 1
    new-instance v0, Ll/pxr0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/pxr0;-><init>(Ll/pxr0;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method
