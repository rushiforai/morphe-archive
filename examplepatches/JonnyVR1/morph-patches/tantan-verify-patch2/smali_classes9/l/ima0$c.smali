.class public Ll/ima0$c;
.super Landroidx/recyclerview/widget/RecyclerView$t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/ima0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:I

.field public final synthetic b:Ll/ima0;


# direct methods
.method public constructor <init>(Ll/ima0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ima0$c;->b:Ll/ima0;

    .line 2
    .line 3
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$t;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput p1, p0, Ll/ima0$c;->a:I

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V
    .locals 1
    .param p1    # Landroidx/recyclerview/widget/RecyclerView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroidx/recyclerview/widget/RecyclerView$t;->onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V

    .line 2
    .line 3
    .line 4
    iget-object p2, p0, Ll/ima0$c;->b:Ll/ima0;

    .line 5
    .line 6
    invoke-static {p2}, Ll/ima0;->K(Ll/ima0;)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    add-int/2addr v0, p3

    .line 11
    invoke-static {p2, v0}, Ll/ima0;->L(Ll/ima0;I)V

    .line 12
    .line 13
    .line 14
    iget-object p2, p0, Ll/ima0$c;->b:Ll/ima0;

    .line 15
    .line 16
    iget-object p3, p2, Ll/ima0;->o:Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder;

    .line 17
    .line 18
    invoke-static {p2}, Ll/ima0;->K(Ll/ima0;)I

    .line 19
    .line 20
    .line 21
    move-result p2

    .line 22
    invoke-virtual {p3, p2}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder;->S1(I)V

    .line 23
    .line 24
    .line 25
    invoke-static {}, Ll/lik0;->a()Z

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    if-nez p2, :cond_2

    .line 30
    .line 31
    iget-object p2, p0, Ll/ima0$c;->b:Ll/ima0;

    .line 32
    .line 33
    iget-object p2, p2, Ll/ima0;->r:Ll/zq90;

    .line 34
    .line 35
    iget-object p2, p2, Ll/zq90;->b:Ljava/lang/String;

    .line 36
    .line 37
    const-string p3, "share_profile"

    .line 38
    .line 39
    invoke-static {p3, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 40
    .line 41
    .line 42
    move-result p2

    .line 43
    if-nez p2, :cond_0

    .line 44
    .line 45
    iget-object p2, p0, Ll/ima0$c;->b:Ll/ima0;

    .line 46
    .line 47
    iget-object p2, p2, Ll/ima0;->r:Ll/zq90;

    .line 48
    .line 49
    invoke-virtual {p2}, Ll/zq90;->o()Z

    .line 50
    .line 51
    .line 52
    move-result p2

    .line 53
    if-nez p2, :cond_0

    .line 54
    .line 55
    iget-object p2, p0, Ll/ima0$c;->b:Ll/ima0;

    .line 56
    .line 57
    iget-object p2, p2, Ll/ima0;->r:Ll/zq90;

    .line 58
    .line 59
    invoke-virtual {p2}, Ll/zq90;->F()Z

    .line 60
    .line 61
    .line 62
    move-result p2

    .line 63
    if-eqz p2, :cond_2

    .line 64
    .line 65
    :cond_0
    iget-object p2, p0, Ll/ima0$c;->b:Ll/ima0;

    .line 66
    .line 67
    iget-object p2, p2, Ll/ima0;->r:Ll/zq90;

    .line 68
    .line 69
    iget-object p2, p2, Ll/zq90;->d:Ljava/lang/String;

    .line 70
    .line 71
    invoke-static {p2}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    .line 72
    .line 73
    .line 74
    move-result p2

    .line 75
    if-nez p2, :cond_2

    .line 76
    .line 77
    iget-object p2, p0, Ll/ima0$c;->b:Ll/ima0;

    .line 78
    .line 79
    iget-object p2, p2, Ll/ima0;->r:Ll/zq90;

    .line 80
    .line 81
    invoke-virtual {p2}, Ll/zq90;->K()Z

    .line 82
    .line 83
    .line 84
    move-result p2

    .line 85
    if-nez p2, :cond_2

    .line 86
    .line 87
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 88
    .line 89
    .line 90
    move-result-object p2

    .line 91
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result p2

    .line 95
    if-eqz p2, :cond_2

    .line 96
    .line 97
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 98
    .line 99
    .line 100
    move-result-object p2

    .line 101
    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemCount()I

    .line 102
    .line 103
    .line 104
    move-result p2

    .line 105
    const/4 p3, 0x1

    .line 106
    if-lt p2, p3, :cond_2

    .line 107
    .line 108
    iget-object p2, p0, Ll/ima0$c;->b:Ll/ima0;

    .line 109
    .line 110
    invoke-static {p2}, Ll/ima0;->I(Ll/ima0;)Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 111
    .line 112
    .line 113
    move-result-object p2

    .line 114
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    move-result p2

    .line 118
    if-eqz p2, :cond_1

    .line 119
    .line 120
    iget-object p2, p0, Ll/ima0$c;->b:Ll/ima0;

    .line 121
    .line 122
    invoke-static {p2}, Ll/ima0;->I(Ll/ima0;)Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 123
    .line 124
    .line 125
    move-result-object p2

    .line 126
    invoke-virtual {p2}, Landroidx/recyclerview/widget/LinearLayoutManager;->findLastVisibleItemPosition()I

    .line 127
    .line 128
    .line 129
    move-result p2

    .line 130
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemCount()I

    .line 135
    .line 136
    .line 137
    move-result v0

    .line 138
    sub-int/2addr v0, p3

    .line 139
    if-ne p2, v0, :cond_1

    .line 140
    .line 141
    iget p2, p0, Ll/ima0$c;->a:I

    .line 142
    .line 143
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemCount()I

    .line 148
    .line 149
    .line 150
    move-result p1

    .line 151
    sub-int/2addr p1, p3

    .line 152
    if-eq p2, p1, :cond_1

    .line 153
    .line 154
    iget-object p1, p0, Ll/ima0$c;->b:Ll/ima0;

    .line 155
    .line 156
    invoke-static {p1}, Ll/ima0;->J(Ll/ima0;)Ll/cla0;

    .line 157
    .line 158
    .line 159
    move-result-object p1

    .line 160
    invoke-virtual {p1}, Ll/cla0;->pageId()Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object p1

    .line 164
    const-string p2, "e_suggest_user_profile_info_view_share"

    .line 165
    .line 166
    invoke-static {p2, p1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 167
    .line 168
    .line 169
    :cond_1
    iget-object p1, p0, Ll/ima0$c;->b:Ll/ima0;

    .line 170
    .line 171
    invoke-static {p1}, Ll/ima0;->I(Ll/ima0;)Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 172
    .line 173
    .line 174
    move-result-object p1

    .line 175
    invoke-virtual {p1}, Landroidx/recyclerview/widget/LinearLayoutManager;->findLastVisibleItemPosition()I

    .line 176
    .line 177
    .line 178
    move-result p1

    .line 179
    iput p1, p0, Ll/ima0$c;->a:I

    .line 180
    .line 181
    :cond_2
    return-void
.end method
