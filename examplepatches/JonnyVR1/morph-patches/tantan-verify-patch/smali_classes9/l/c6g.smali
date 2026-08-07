.class public Ll/c6g;
.super Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;
.source "SourceFile"


# instance fields
.field public final j:Ll/nhg;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public final k:Z


# direct methods
.method public constructor <init>(Ll/nhg;)V
    .locals 0
    .param p1    # Ll/nhg;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/c6g;->j:Ll/nhg;

    .line 5
    .line 6
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p1}, Ll/vwt;->K6()Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    iput-boolean p1, p0, Ll/c6g;->k:Z

    .line 15
    .line 16
    return-void
.end method

.method public static synthetic e0(Ll/c6g;Ll/fes;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/c6g;->h0(Ll/fes;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f0(Ll/c6g;Ll/hes;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/c6g;->i0(Ll/hes;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final g0(Ll/dhg;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dhg;",
            ")",
            "Ljava/util/List<",
            "Ll/d3q<",
            "*>;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    move v2, v1

    .line 8
    :goto_0
    invoke-virtual {p1}, Ll/dhg;->b()Ljava/util/List;

    .line 9
    .line 10
    .line 11
    move-result-object v3

    .line 12
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 13
    .line 14
    .line 15
    move-result v3

    .line 16
    if-ge v2, v3, :cond_2

    .line 17
    .line 18
    invoke-virtual {p1}, Ll/dhg;->b()Ljava/util/List;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    check-cast v3, Ll/nsv;

    .line 27
    .line 28
    if-nez v2, :cond_1

    .line 29
    .line 30
    iget-object v4, v3, Ll/nsv;->a:Ljava/lang/Object;

    .line 31
    .line 32
    check-cast v4, Ll/w5g;

    .line 33
    .line 34
    invoke-virtual {v4}, Ll/w5g;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v4

    .line 38
    const-string v5, "FansBoardTAG-FansAdapter-buildModel\uff0cdata="

    .line 39
    .line 40
    invoke-static {v5, v4}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    new-instance v4, Ll/fes;

    .line 44
    .line 45
    invoke-direct {v4, v3}, Ll/fes;-><init>(Ll/nsv;)V

    .line 46
    .line 47
    .line 48
    iget-boolean v5, p0, Ll/c6g;->k:Z

    .line 49
    .line 50
    if-eqz v5, :cond_0

    .line 51
    .line 52
    invoke-virtual {p1}, Ll/dhg;->a()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v5

    .line 56
    iget-object v3, v3, Ll/nsv;->a:Ljava/lang/Object;

    .line 57
    .line 58
    check-cast v3, Ll/w5g;

    .line 59
    .line 60
    iget-object v3, v3, Ll/w5g;->a:Ljava/lang/String;

    .line 61
    .line 62
    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result v3

    .line 66
    if-eqz v3, :cond_0

    .line 67
    .line 68
    const/4 v3, 0x1

    .line 69
    goto :goto_1

    .line 70
    :cond_0
    move v3, v1

    .line 71
    :goto_1
    invoke-virtual {v4, v3}, Ll/fes;->L(Z)V

    .line 72
    .line 73
    .line 74
    new-instance v3, Ll/a6g;

    .line 75
    .line 76
    invoke-direct {v3, p0, v4}, Ll/a6g;-><init>(Ll/c6g;Ll/fes;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v4, v3}, Ll/d3q;->A(Landroid/view/View$OnClickListener;)V

    .line 80
    .line 81
    .line 82
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    goto :goto_2

    .line 86
    :cond_1
    new-instance v4, Ll/hes;

    .line 87
    .line 88
    invoke-direct {v4, v3}, Ll/hes;-><init>(Ll/nsv;)V

    .line 89
    .line 90
    .line 91
    new-instance v3, Ll/b6g;

    .line 92
    .line 93
    invoke-direct {v3, p0, v4}, Ll/b6g;-><init>(Ll/c6g;Ll/hes;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {v4, v3}, Ll/d3q;->A(Landroid/view/View$OnClickListener;)V

    .line 97
    .line 98
    .line 99
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    :goto_2
    add-int/lit8 v2, v2, 0x1

    .line 103
    .line 104
    goto :goto_0

    .line 105
    :cond_2
    return-object v0
.end method

.method public final synthetic h0(Ll/fes;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c6g;->j:Ll/nhg;

    .line 2
    .line 3
    iget-object p1, p1, Ll/hes;->a:Ll/nsv;

    .line 4
    .line 5
    iget-object p1, p1, Ll/nsv;->a:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p1, Ll/w5g;

    .line 8
    .line 9
    iget-object p1, p1, Ll/w5g;->a:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/nhg;->c4(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic i0(Ll/hes;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c6g;->j:Ll/nhg;

    .line 2
    .line 3
    iget-object p1, p1, Ll/hes;->a:Ll/nsv;

    .line 4
    .line 5
    iget-object p1, p1, Ll/nsv;->a:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p1, Ll/w5g;

    .line 8
    .line 9
    iget-object p1, p1, Ll/w5g;->a:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/nhg;->c4(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public j0()V
    .locals 1

    .line 1
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public k0(Ll/dhg;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Ll/c6g;->g0(Ll/dhg;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->a0(Ljava/util/List;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
