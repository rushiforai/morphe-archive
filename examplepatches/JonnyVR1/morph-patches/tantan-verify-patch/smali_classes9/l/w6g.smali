.class public Ll/w6g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/x6g;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ll/x6g;

.field public final b:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyViewGroup;

.field public final c:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;

.field public final d:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;

.field public final e:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;

.field public final f:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyViewGroup;Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/w6g;->b:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyViewGroup;

    .line 5
    .line 6
    iput-object p2, p0, Ll/w6g;->c:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;

    .line 7
    .line 8
    iput-object p3, p0, Ll/w6g;->d:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;

    .line 9
    .line 10
    iput-object p4, p0, Ll/w6g;->e:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;

    .line 11
    .line 12
    iput-object p5, p0, Ll/w6g;->f:Ljava/lang/String;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/w6g;->c:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public a(Ll/x6g;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/w6g;->a:Ll/x6g;

    .line 2
    .line 3
    return-void
.end method

.method public b()V
    .locals 0

    .line 1
    return-void
.end method

.method public c(Ll/aeg;)V
    .locals 10

    .line 1
    iget-object v0, p1, Ll/aeg;->h:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Ll/w6g;->c:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;->k0()V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Ll/w6g;->d:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;

    .line 15
    .line 16
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;->k0()V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Ll/w6g;->e:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;->k0()V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    iget-object p1, p1, Ll/aeg;->g:Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasksProgress;

    .line 26
    .line 27
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasksProgress;->current:I

    .line 28
    .line 29
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasksProgress;->max:I

    .line 30
    .line 31
    const/4 v2, 0x0

    .line 32
    const/4 v3, 0x1

    .line 33
    if-lt v1, p1, :cond_1

    .line 34
    .line 35
    move v7, v3

    .line 36
    goto :goto_0

    .line 37
    :cond_1
    move v7, v2

    .line 38
    :goto_0
    iget-object v4, p0, Ll/w6g;->c:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;

    .line 39
    .line 40
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    move-object v5, p1

    .line 45
    check-cast v5, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasks;

    .line 46
    .line 47
    iget-object v6, p0, Ll/w6g;->a:Ll/x6g;

    .line 48
    .line 49
    iget-object v8, p0, Ll/w6g;->f:Ljava/lang/String;

    .line 50
    .line 51
    const/4 v9, 0x1

    .line 52
    invoke-virtual/range {v4 .. v9}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;->l0(Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasks;Ll/x6g;ZLjava/lang/String;I)V

    .line 53
    .line 54
    .line 55
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    iget-object v4, p0, Ll/w6g;->d:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;

    .line 60
    .line 61
    if-le p1, v3, :cond_2

    .line 62
    .line 63
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    move-object v5, p1

    .line 68
    check-cast v5, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasks;

    .line 69
    .line 70
    iget-object v6, p0, Ll/w6g;->a:Ll/x6g;

    .line 71
    .line 72
    iget-object v8, p0, Ll/w6g;->f:Ljava/lang/String;

    .line 73
    .line 74
    const/4 v9, 0x2

    .line 75
    invoke-virtual/range {v4 .. v9}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;->l0(Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasks;Ll/x6g;ZLjava/lang/String;I)V

    .line 76
    .line 77
    .line 78
    goto :goto_1

    .line 79
    :cond_2
    invoke-virtual {v4}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;->k0()V

    .line 80
    .line 81
    .line 82
    :goto_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    iget-object v4, p0, Ll/w6g;->e:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;

    .line 87
    .line 88
    const/4 v1, 0x2

    .line 89
    if-le p1, v1, :cond_3

    .line 90
    .line 91
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    move-object v5, p1

    .line 96
    check-cast v5, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasks;

    .line 97
    .line 98
    iget-object v6, p0, Ll/w6g;->a:Ll/x6g;

    .line 99
    .line 100
    iget-object v8, p0, Ll/w6g;->f:Ljava/lang/String;

    .line 101
    .line 102
    const/4 v9, 0x3

    .line 103
    invoke-virtual/range {v4 .. v9}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;->l0(Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTasks;Ll/x6g;ZLjava/lang/String;I)V

    .line 104
    .line 105
    .line 106
    return-void

    .line 107
    :cond_3
    invoke-virtual {v4}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;->k0()V

    .line 108
    .line 109
    .line 110
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/x6g;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/w6g;->a(Ll/x6g;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method
