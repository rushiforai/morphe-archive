.class public Ll/f030;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/core/data/CoreGiftInfo;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/CoreGiftInfo;",
            ">;"
        }
    .end annotation
.end field

.field public final d:Ll/b030;

.field public e:Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;

.field public f:I

.field public g:I


# direct methods
.method public constructor <init>(Ll/b030;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/f030;->c:Ljava/util/List;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput v0, p0, Ll/f030;->f:I

    .line 13
    .line 14
    iput-object p1, p0, Ll/f030;->d:Ll/b030;

    .line 15
    .line 16
    return-void
.end method

.method public static synthetic E(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->quota:I

    .line 2
    .line 3
    if-lez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic F(Ll/f030;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/f030;->L(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic G(Ll/f030;Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/f030;->K(Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;ILandroid/view/View;)V

    return-void
.end method

.method private synthetic L(Landroid/view/View;)V
    .locals 1

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v0, p0, Ll/f030;->d:Ll/b030;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/b030;->v()Ll/pz20;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/pz20;->N()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p1, v0}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    iget-object v0, p0, Ll/f030;->d:Ll/b030;

    .line 26
    .line 27
    invoke-virtual {v0}, Ll/b030;->A()V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Ll/f030;->d:Ll/b030;

    .line 31
    .line 32
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    xor-int/lit8 p1, p1, 0x1

    .line 45
    .line 46
    invoke-interface {v0, p1}, Ll/r97;->n3(Z)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {p0, p1}, Ll/b030;->z(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    :cond_0
    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/f030;->H(Landroid/view/View;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f030;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget p2, Ll/qec0;->M:I

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public H(Landroid/view/View;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;II)V
    .locals 3

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;

    .line 2
    .line 3
    iget p3, p0, Ll/f030;->f:I

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    const/4 v1, 0x1

    .line 7
    if-ne p4, p3, :cond_0

    .line 8
    .line 9
    move p3, v1

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    move p3, v0

    .line 12
    :goto_0
    iget v2, p0, Ll/f030;->g:I

    .line 13
    .line 14
    if-gt v2, p4, :cond_1

    .line 15
    .line 16
    move v0, v1

    .line 17
    :cond_1
    iget-object v1, p0, Ll/f030;->d:Ll/b030;

    .line 18
    .line 19
    invoke-virtual {p1, v1, p2, p3, v0}, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->m0(Ll/b030;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;ZZ)V

    .line 20
    .line 21
    .line 22
    if-eqz p3, :cond_2

    .line 23
    .line 24
    iget-object p3, p0, Ll/f030;->e:Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;

    .line 25
    .line 26
    if-nez p3, :cond_2

    .line 27
    .line 28
    iput-object p1, p0, Ll/f030;->e:Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;

    .line 29
    .line 30
    :cond_2
    iget p3, p2, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->quota:I

    .line 31
    .line 32
    if-eqz p3, :cond_3

    .line 33
    .line 34
    iget p3, p0, Ll/f030;->g:I

    .line 35
    .line 36
    if-gt p3, p4, :cond_3

    .line 37
    .line 38
    new-instance p3, Ll/c030;

    .line 39
    .line 40
    invoke-direct {p3, p0, p1, p2, p4}, Ll/c030;-><init>(Ll/f030;Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;I)V

    .line 41
    .line 42
    .line 43
    invoke-static {p1, p3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_3
    new-instance p2, Ll/d030;

    .line 48
    .line 49
    invoke-direct {p2, p0}, Ll/d030;-><init>(Ll/f030;)V

    .line 50
    .line 51
    .line 52
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public I()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/f030;->e:Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/f030;->e:Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->isChecked()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Ll/f030;->e:Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->toggle()V

    .line 20
    .line 21
    .line 22
    :cond_0
    const/4 v0, 0x0

    .line 23
    iput-object v0, p0, Ll/f030;->e:Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;

    .line 24
    .line 25
    :cond_1
    const/4 v0, 0x0

    .line 26
    iput v0, p0, Ll/f030;->f:I

    .line 27
    .line 28
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public J(I)Lcom/p1/mobile/putong/core/data/CoreGiftInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f030;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 8
    .line 9
    return-object p0
.end method

.method public final synthetic K(Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;Lcom/p1/mobile/putong/core/data/CoreGiftInfo;ILandroid/view/View;)V
    .locals 7

    .line 1
    iget-object p4, p1, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->n:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 2
    .line 3
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p4

    .line 7
    if-eqz p4, :cond_6

    .line 8
    .line 9
    iget-object p4, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 10
    .line 11
    iget-object v0, p1, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->n:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p4

    .line 19
    if-eqz p4, :cond_6

    .line 20
    .line 21
    iget-object p4, p0, Ll/f030;->e:Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;

    .line 22
    .line 23
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p4

    .line 27
    const-string v0, "picks_say_hi"

    .line 28
    .line 29
    const-string v1, "from_meet_picks"

    .line 30
    .line 31
    const-string v2, "I_like_say_hi"

    .line 32
    .line 33
    const-string v3, "from_meet_liked"

    .line 34
    .line 35
    const-string v4, "showfrom_meet_sayhi"

    .line 36
    .line 37
    const-string v5, "e_chat_gift_bar_gift"

    .line 38
    .line 39
    const-string v6, "chat_gift_id"

    .line 40
    .line 41
    if-eqz p4, :cond_3

    .line 42
    .line 43
    iget p4, p0, Ll/f030;->f:I

    .line 44
    .line 45
    if-eq p4, p3, :cond_6

    .line 46
    .line 47
    iget-object p4, p0, Ll/f030;->d:Ll/b030;

    .line 48
    .line 49
    invoke-virtual {p4}, Ll/b030;->v()Ll/pz20;

    .line 50
    .line 51
    .line 52
    move-result-object p4

    .line 53
    invoke-virtual {p4}, Ll/pz20;->F()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p4

    .line 57
    invoke-static {p4, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 58
    .line 59
    .line 60
    move-result p4

    .line 61
    iget-object v3, p0, Ll/f030;->d:Ll/b030;

    .line 62
    .line 63
    if-eqz p4, :cond_0

    .line 64
    .line 65
    invoke-virtual {v3}, Ll/b030;->v()Ll/pz20;

    .line 66
    .line 67
    .line 68
    move-result-object p4

    .line 69
    invoke-virtual {p4}, Ll/pz20;->L()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p4

    .line 73
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 74
    .line 75
    invoke-static {v6, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 76
    .line 77
    .line 78
    move-result-object p2

    .line 79
    invoke-static {v4, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    filled-new-array {p2, v0}, [Ll/pf60;

    .line 84
    .line 85
    .line 86
    move-result-object p2

    .line 87
    invoke-static {v5, p4, p2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 88
    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_0
    invoke-virtual {v3}, Ll/b030;->v()Ll/pz20;

    .line 92
    .line 93
    .line 94
    move-result-object p4

    .line 95
    invoke-virtual {p4}, Ll/pz20;->F()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object p4

    .line 99
    invoke-static {p4, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 100
    .line 101
    .line 102
    move-result p4

    .line 103
    iget-object v1, p0, Ll/f030;->d:Ll/b030;

    .line 104
    .line 105
    if-eqz p4, :cond_1

    .line 106
    .line 107
    invoke-virtual {v1}, Ll/b030;->v()Ll/pz20;

    .line 108
    .line 109
    .line 110
    move-result-object p4

    .line 111
    invoke-virtual {p4}, Ll/pz20;->L()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object p4

    .line 115
    iget-object v1, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 116
    .line 117
    invoke-static {v6, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 122
    .line 123
    invoke-static {v6, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 124
    .line 125
    .line 126
    move-result-object p2

    .line 127
    invoke-static {v4, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    filled-new-array {v1, p2, v0}, [Ll/pf60;

    .line 132
    .line 133
    .line 134
    move-result-object p2

    .line 135
    invoke-static {v5, p4, p2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 136
    .line 137
    .line 138
    goto :goto_0

    .line 139
    :cond_1
    invoke-virtual {v1}, Ll/b030;->v()Ll/pz20;

    .line 140
    .line 141
    .line 142
    move-result-object p4

    .line 143
    invoke-virtual {p4}, Ll/pz20;->L()Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object p4

    .line 147
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 148
    .line 149
    invoke-static {v6, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 150
    .line 151
    .line 152
    move-result-object p2

    .line 153
    filled-new-array {p2}, [Ll/pf60;

    .line 154
    .line 155
    .line 156
    move-result-object p2

    .line 157
    invoke-static {v5, p4, p2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 158
    .line 159
    .line 160
    :goto_0
    iget-object p2, p0, Ll/f030;->e:Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;

    .line 161
    .line 162
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->isChecked()Z

    .line 163
    .line 164
    .line 165
    move-result p2

    .line 166
    if-eqz p2, :cond_2

    .line 167
    .line 168
    iget-object p2, p0, Ll/f030;->e:Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;

    .line 169
    .line 170
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->toggle()V

    .line 171
    .line 172
    .line 173
    :cond_2
    iput-object p1, p0, Ll/f030;->e:Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;

    .line 174
    .line 175
    iput p3, p0, Ll/f030;->f:I

    .line 176
    .line 177
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->isChecked()Z

    .line 178
    .line 179
    .line 180
    move-result p1

    .line 181
    if-nez p1, :cond_6

    .line 182
    .line 183
    iget-object p0, p0, Ll/f030;->e:Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;

    .line 184
    .line 185
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->toggle()V

    .line 186
    .line 187
    .line 188
    return-void

    .line 189
    :cond_3
    iget-object p4, p0, Ll/f030;->d:Ll/b030;

    .line 190
    .line 191
    invoke-virtual {p4}, Ll/b030;->v()Ll/pz20;

    .line 192
    .line 193
    .line 194
    move-result-object p4

    .line 195
    invoke-virtual {p4}, Ll/pz20;->F()Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object p4

    .line 199
    invoke-static {p4, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 200
    .line 201
    .line 202
    move-result p4

    .line 203
    iget-object v3, p0, Ll/f030;->d:Ll/b030;

    .line 204
    .line 205
    if-eqz p4, :cond_4

    .line 206
    .line 207
    invoke-virtual {v3}, Ll/b030;->v()Ll/pz20;

    .line 208
    .line 209
    .line 210
    move-result-object p4

    .line 211
    invoke-virtual {p4}, Ll/pz20;->L()Ljava/lang/String;

    .line 212
    .line 213
    .line 214
    move-result-object p4

    .line 215
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 216
    .line 217
    invoke-static {v6, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 218
    .line 219
    .line 220
    move-result-object p2

    .line 221
    invoke-static {v4, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 222
    .line 223
    .line 224
    move-result-object v0

    .line 225
    filled-new-array {p2, v0}, [Ll/pf60;

    .line 226
    .line 227
    .line 228
    move-result-object p2

    .line 229
    invoke-static {v5, p4, p2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 230
    .line 231
    .line 232
    goto :goto_1

    .line 233
    :cond_4
    invoke-virtual {v3}, Ll/b030;->v()Ll/pz20;

    .line 234
    .line 235
    .line 236
    move-result-object p4

    .line 237
    invoke-virtual {p4}, Ll/pz20;->F()Ljava/lang/String;

    .line 238
    .line 239
    .line 240
    move-result-object p4

    .line 241
    invoke-static {p4, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 242
    .line 243
    .line 244
    move-result p4

    .line 245
    iget-object v1, p0, Ll/f030;->d:Ll/b030;

    .line 246
    .line 247
    if-eqz p4, :cond_5

    .line 248
    .line 249
    invoke-virtual {v1}, Ll/b030;->v()Ll/pz20;

    .line 250
    .line 251
    .line 252
    move-result-object p4

    .line 253
    invoke-virtual {p4}, Ll/pz20;->L()Ljava/lang/String;

    .line 254
    .line 255
    .line 256
    move-result-object p4

    .line 257
    iget-object v1, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 258
    .line 259
    invoke-static {v6, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 260
    .line 261
    .line 262
    move-result-object v1

    .line 263
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 264
    .line 265
    invoke-static {v6, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 266
    .line 267
    .line 268
    move-result-object p2

    .line 269
    invoke-static {v4, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 270
    .line 271
    .line 272
    move-result-object v0

    .line 273
    filled-new-array {v1, p2, v0}, [Ll/pf60;

    .line 274
    .line 275
    .line 276
    move-result-object p2

    .line 277
    invoke-static {v5, p4, p2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 278
    .line 279
    .line 280
    goto :goto_1

    .line 281
    :cond_5
    invoke-virtual {v1}, Ll/b030;->v()Ll/pz20;

    .line 282
    .line 283
    .line 284
    move-result-object p4

    .line 285
    invoke-virtual {p4}, Ll/pz20;->L()Ljava/lang/String;

    .line 286
    .line 287
    .line 288
    move-result-object p4

    .line 289
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 290
    .line 291
    invoke-static {v6, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 292
    .line 293
    .line 294
    move-result-object p2

    .line 295
    filled-new-array {p2}, [Ll/pf60;

    .line 296
    .line 297
    .line 298
    move-result-object p2

    .line 299
    invoke-static {v5, p4, p2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 300
    .line 301
    .line 302
    :goto_1
    iput p3, p0, Ll/f030;->f:I

    .line 303
    .line 304
    iput-object p1, p0, Ll/f030;->e:Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;

    .line 305
    .line 306
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->isChecked()Z

    .line 307
    .line 308
    .line 309
    move-result p1

    .line 310
    if-nez p1, :cond_6

    .line 311
    .line 312
    iget-object p0, p0, Ll/f030;->e:Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;

    .line 313
    .line 314
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/gift/panel/NewGiftPanelItemView;->toggle()V

    .line 315
    .line 316
    .line 317
    :cond_6
    return-void
.end method

.method public M(Ljava/util/List;I)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/CoreGiftInfo;",
            ">;I)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Ll/f030;->c:Ljava/util/List;

    .line 9
    .line 10
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Ll/f030;->c:Ljava/util/List;

    .line 14
    .line 15
    iget-object v0, p0, Ll/f030;->d:Ll/b030;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/b030;->v()Ll/pz20;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ll/pz20;->G()Lcom/p1/mobile/putong/data/CoreGiftPanelName;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "note"

    .line 26
    .line 27
    invoke-static {v1}, Lcom/p1/mobile/putong/data/CoreGiftPanelName;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/CoreGiftPanelName;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    if-ne v0, v1, :cond_1

    .line 32
    .line 33
    iget p2, p0, Ll/f030;->f:I

    .line 34
    .line 35
    new-instance v0, Ll/e030;

    .line 36
    .line 37
    invoke-direct {v0}, Ll/e030;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-static {p1, v0}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    invoke-static {p2, p1}, Ljava/lang/Math;->max(II)I

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    iput p1, p0, Ll/f030;->f:I

    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_1
    iget-object p1, p0, Ll/f030;->d:Ll/b030;

    .line 52
    .line 53
    invoke-virtual {p1}, Ll/b030;->v()Ll/pz20;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    invoke-virtual {p1}, Ll/pz20;->G()Lcom/p1/mobile/putong/data/CoreGiftPanelName;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    const-string v0, "greet"

    .line 62
    .line 63
    invoke-static {v0}, Lcom/p1/mobile/putong/data/CoreGiftPanelName;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/CoreGiftPanelName;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    if-ne p1, v0, :cond_3

    .line 68
    .line 69
    add-int/lit8 p1, p2, -0x1

    .line 70
    .line 71
    iput p1, p0, Ll/f030;->g:I

    .line 72
    .line 73
    const/4 v0, 0x1

    .line 74
    if-le p2, v0, :cond_2

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_2
    move p1, v0

    .line 78
    :goto_0
    iput p1, p0, Ll/f030;->f:I

    .line 79
    .line 80
    :cond_3
    :goto_1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/f030;->J(I)Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
