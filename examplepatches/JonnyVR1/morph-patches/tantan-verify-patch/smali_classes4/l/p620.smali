.class public Ll/p620;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/v1b0;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/v1b0<",
        "Ll/m620;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroid/widget/LinearLayout;

.field public b:Lcom/p1/mobile/putong/core/newui/newmeet/feed/view/MeetItemEntryHeadViewMyTabStyle;

.field public c:Landroid/widget/FrameLayout;

.field public d:Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;

.field public e:Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;

.field public f:Lv/VFrame;

.field public g:Lv/VImage;

.field public h:Lv/VText;

.field public i:Landroid/content/Context;

.field public j:Ll/m620;

.field public k:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;

.field public l:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "unknown"

    .line 5
    .line 6
    iput-object v0, p0, Ll/p620;->l:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p1, p0, Ll/p620;->i:Landroid/content/Context;

    .line 9
    .line 10
    return-void
.end method

.method public static synthetic a(Ll/p620;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/p620;->e()V

    return-void
.end method

.method public static synthetic b(Ll/p620;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/p620;->f(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/p620;->i:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public D1()V
    .locals 0

    .line 1
    return-void
.end method

.method public c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/q620;->b(Ll/p620;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public d(Ll/m620;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/p620;->j:Ll/m620;

    .line 2
    .line 3
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic e()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/p620;->d:Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic f(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/p620;->j:Ll/m620;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/m620;->G0()Lcom/p1/mobile/android/app/Frag;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/TaskCenterAct;->Z1(Landroid/content/Context;)Landroid/content/Intent;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p1, v0}, Landroidx/fragment/app/Fragment;->startActivity(Landroid/content/Intent;)V

    .line 16
    .line 17
    .line 18
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const-string p1, "e_task_entrance"

    .line 27
    .line 28
    invoke-static {p1, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public i(Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedLikersItemData;Ll/dzl;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/p620;->d:Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;

    .line 2
    .line 3
    iget v1, p1, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedLikersItemData;->likersTotalCount:I

    .line 4
    .line 5
    if-lez v1, :cond_0

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 v1, 0x0

    .line 10
    :goto_0
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget v0, p1, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedLikersItemData;->likersTotalCount:I

    .line 14
    .line 15
    if-lez v0, :cond_1

    .line 16
    .line 17
    iget-object v0, p0, Ll/p620;->d:Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;

    .line 18
    .line 19
    new-instance v1, Ll/o620;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/o620;-><init>(Ll/p620;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, p1, p2, v1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->s(Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedLikersItemData;Ll/dzl;Ll/x20;)V

    .line 25
    .line 26
    .line 27
    :cond_1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/m620;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/p620;->d(Ll/m620;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/p620;->c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    sget v0, Ll/kec0;->w1:I

    .line 6
    .line 7
    iget-object v1, p0, Ll/p620;->c:Landroid/widget/FrameLayout;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-virtual {p1, v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    check-cast p1, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;

    .line 15
    .line 16
    iput-object p1, p0, Ll/p620;->k:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;

    .line 17
    .line 18
    iget-object v0, p0, Ll/p620;->c:Landroid/widget/FrameLayout;

    .line 19
    .line 20
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ll/p620;->r()V

    .line 24
    .line 25
    .line 26
    return-object p2
.end method

.method public j(Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedNearbyItemData;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/p620;->e:Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedNearbyItemData;->users:Ljava/util/List;

    .line 4
    .line 5
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x1

    .line 10
    xor-int/2addr v1, v2

    .line 11
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p1, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedNearbyItemData;->users:Ljava/util/List;

    .line 15
    .line 16
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    iget-object v0, p0, Ll/p620;->e:Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;

    .line 23
    .line 24
    iget-object p0, p0, Ll/p620;->j:Ll/m620;

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/m620;->G0()Lcom/p1/mobile/android/app/Frag;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {v0, p1, p0, v2}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->x(Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedNearbyItemData;Lcom/p1/mobile/android/app/Frag;Z)V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public k(Lcom/p1/mobile/putong/core/data/MyTabTask;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/p620;->a:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    move v2, v1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 v2, 0x0

    .line 9
    :goto_0
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    if-eqz p1, :cond_2

    .line 13
    .line 14
    iget-object v0, p0, Ll/p620;->b:Lcom/p1/mobile/putong/core/newui/newmeet/feed/view/MeetItemEntryHeadViewMyTabStyle;

    .line 15
    .line 16
    const-string v2, "\u63a5\u4e0b\u6765\uff0c\u4f60\u8fd8\u53ef\u4ee5"

    .line 17
    .line 18
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/view/MeetItemEntryHeadViewMyTabStyle;->b(Ljava/lang/CharSequence;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/p620;->l:Ljava/lang/String;

    .line 22
    .line 23
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/MyTabTask;->type:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_1

    .line 30
    .line 31
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    const-string v2, "e_task_entrance"

    .line 40
    .line 41
    invoke-static {v2, v0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MyTabTask;->type:Ljava/lang/String;

    .line 45
    .line 46
    iput-object v0, p0, Ll/p620;->l:Ljava/lang/String;

    .line 47
    .line 48
    iget-object v0, p0, Ll/p620;->b:Lcom/p1/mobile/putong/core/newui/newmeet/feed/view/MeetItemEntryHeadViewMyTabStyle;

    .line 49
    .line 50
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/newmeet/feed/view/MeetItemEntryHeadViewMyTabStyle;->b:Lv/VText;

    .line 51
    .line 52
    new-instance v2, Ll/n620;

    .line 53
    .line 54
    invoke-direct {v2, p0}, Ll/n620;-><init>(Ll/p620;)V

    .line 55
    .line 56
    .line 57
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 58
    .line 59
    .line 60
    iget-object p0, p0, Ll/p620;->k:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;

    .line 61
    .line 62
    const/4 v0, 0x0

    .line 63
    invoke-virtual {p0, v0, p1, v1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->k(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/a$a;Lcom/p1/mobile/putong/core/data/MyTabTask;Z)V

    .line 64
    .line 65
    .line 66
    :cond_2
    return-void
.end method

.method public l(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p620;->f:Lv/VFrame;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public m()V
    .locals 11

    .line 1
    iget-object v0, p0, Ll/p620;->b:Lcom/p1/mobile/putong/core/newui/newmeet/feed/view/MeetItemEntryHeadViewMyTabStyle;

    .line 2
    .line 3
    const-string v1, "\u63a5\u4e0b\u6765\uff0c\u4f60\u8fd8\u53ef\u4ee5"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/view/MeetItemEntryHeadViewMyTabStyle;->b(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/p620;->a:Landroid/widget/LinearLayout;

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    new-instance v0, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    const-string v2, "res://"

    .line 17
    .line 18
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object v2, p0, Ll/p620;->i:Landroid/content/Context;

    .line 22
    .line 23
    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string v2, "/"

    .line 31
    .line 32
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    sget v2, Ll/dbc0;->If:I

    .line 36
    .line 37
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iget-object v2, p0, Ll/p620;->i:Landroid/content/Context;

    .line 45
    .line 46
    sget v3, Ll/dbc0;->Rf:I

    .line 47
    .line 48
    invoke-virtual {v2, v3}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 49
    .line 50
    .line 51
    move-result-object v8

    .line 52
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 53
    .line 54
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 55
    .line 56
    invoke-virtual {v2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    iget-object v4, p0, Ll/p620;->k:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;

    .line 73
    .line 74
    filled-new-array {v2, v0}, [Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 79
    .line 80
    .line 81
    move-result-object v7

    .line 82
    const-string v0, "#FF6298"

    .line 83
    .line 84
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 85
    .line 86
    .line 87
    move-result v10

    .line 88
    const-string v5, "\u4e0a\u4f20\u66f4\u4e30\u5bcc\u7684\u751f\u6d3b\u7167"

    .line 89
    .line 90
    const-string v6, "\u83b7\u5f97\u4ef7\u503c68\u5143\u7684\u4f18\u5148\u63a8\u8350\uff0c\u8ba9\u4f60\u7684\u914d\u5bf9\u8fc5\u901f\u66b4\u589e"

    .line 91
    .line 92
    const-string v9, "\u7acb\u5373\u4e0a\u4f20"

    .line 93
    .line 94
    invoke-virtual/range {v4 .. v10}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->l(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/util/List;Landroid/graphics/drawable/Drawable;Ljava/lang/CharSequence;I)V

    .line 95
    .line 96
    .line 97
    iget-object p0, p0, Ll/p620;->k:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;

    .line 98
    .line 99
    const/4 v0, 0x0

    .line 100
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->o(Ljava/util/List;Z)V

    .line 101
    .line 102
    .line 103
    return-void
.end method

.method public n()V
    .locals 11

    .line 1
    iget-object v0, p0, Ll/p620;->b:Lcom/p1/mobile/putong/core/newui/newmeet/feed/view/MeetItemEntryHeadViewMyTabStyle;

    .line 2
    .line 3
    const-string v1, "\u63a5\u4e0b\u6765\uff0c\u4f60\u8fd8\u53ef\u4ee5"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/view/MeetItemEntryHeadViewMyTabStyle;->b(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/p620;->a:Landroid/widget/LinearLayout;

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    new-instance v0, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    const-string v2, "res://"

    .line 17
    .line 18
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object v2, p0, Ll/p620;->i:Landroid/content/Context;

    .line 22
    .line 23
    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string v2, "/"

    .line 31
    .line 32
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    sget v2, Ll/dbc0;->og:I

    .line 36
    .line 37
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iget-object v2, p0, Ll/p620;->i:Landroid/content/Context;

    .line 45
    .line 46
    sget v3, Ll/dbc0;->Rf:I

    .line 47
    .line 48
    invoke-virtual {v2, v3}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 49
    .line 50
    .line 51
    move-result-object v8

    .line 52
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 53
    .line 54
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 55
    .line 56
    invoke-virtual {v2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    iget-object v4, p0, Ll/p620;->k:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;

    .line 73
    .line 74
    filled-new-array {v0}, [Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 79
    .line 80
    .line 81
    move-result-object v7

    .line 82
    const-string v0, "#FE7E1D"

    .line 83
    .line 84
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 85
    .line 86
    .line 87
    move-result v10

    .line 88
    const-string v5, "\u6dfb\u52a0\u4f60\u7684\u6e38\u620f\u65e5\u5e38"

    .line 89
    .line 90
    const-string v6, "\u8ba4\u8bc6\u66f4\u591a\u6e38\u620f\u642d\u5b50"

    .line 91
    .line 92
    const-string v9, "\u7acb\u5373\u5b8c\u5584"

    .line 93
    .line 94
    invoke-virtual/range {v4 .. v10}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->l(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/util/List;Landroid/graphics/drawable/Drawable;Ljava/lang/CharSequence;I)V

    .line 95
    .line 96
    .line 97
    new-instance v0, Ljava/util/ArrayList;

    .line 98
    .line 99
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 100
    .line 101
    .line 102
    new-instance v3, Lcom/p1/mobile/putong/core/data/TaskAvatarDesc;

    .line 103
    .line 104
    invoke-direct {v3}, Lcom/p1/mobile/putong/core/data/TaskAvatarDesc;-><init>()V

    .line 105
    .line 106
    .line 107
    filled-new-array {v2, v2, v2, v2}, [Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v4

    .line 111
    invoke-static {v4}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 112
    .line 113
    .line 114
    move-result-object v4

    .line 115
    iput-object v4, v3, Lcom/p1/mobile/putong/core/data/TaskAvatarDesc;->avatars:Ljava/util/List;

    .line 116
    .line 117
    const-string v4, "\u5979\u4eec\u5728\u5bfb\u627e\u201c\u738b\u8005\u8363\u8000\u201d\u7684\u642d\u5b50"

    .line 118
    .line 119
    iput-object v4, v3, Lcom/p1/mobile/putong/core/data/TaskAvatarDesc;->text:Ljava/lang/String;

    .line 120
    .line 121
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 122
    .line 123
    .line 124
    new-instance v3, Lcom/p1/mobile/putong/core/data/TaskAvatarDesc;

    .line 125
    .line 126
    invoke-direct {v3}, Lcom/p1/mobile/putong/core/data/TaskAvatarDesc;-><init>()V

    .line 127
    .line 128
    .line 129
    filled-new-array {v2, v2, v2, v2}, [Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v2

    .line 133
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 134
    .line 135
    .line 136
    move-result-object v2

    .line 137
    iput-object v2, v3, Lcom/p1/mobile/putong/core/data/TaskAvatarDesc;->avatars:Ljava/util/List;

    .line 138
    .line 139
    const-string v2, "\u5979\u4eec\u5728\u5bfb\u627e\u201c\u539f\u795e\u201d\u7684\u642d\u5b50"

    .line 140
    .line 141
    iput-object v2, v3, Lcom/p1/mobile/putong/core/data/TaskAvatarDesc;->text:Ljava/lang/String;

    .line 142
    .line 143
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 144
    .line 145
    .line 146
    iget-object p0, p0, Ll/p620;->k:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;

    .line 147
    .line 148
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->n(Ljava/util/List;Z)V

    .line 149
    .line 150
    .line 151
    return-void
.end method

.method public o()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public p()V
    .locals 11

    .line 1
    iget-object v0, p0, Ll/p620;->b:Lcom/p1/mobile/putong/core/newui/newmeet/feed/view/MeetItemEntryHeadViewMyTabStyle;

    .line 2
    .line 3
    const-string v1, "\u63a5\u4e0b\u6765\uff0c\u4f60\u8fd8\u53ef\u4ee5"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/view/MeetItemEntryHeadViewMyTabStyle;->b(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/p620;->a:Landroid/widget/LinearLayout;

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    new-instance v0, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    const-string v2, "res://"

    .line 17
    .line 18
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object v2, p0, Ll/p620;->i:Landroid/content/Context;

    .line 22
    .line 23
    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string v2, "/"

    .line 31
    .line 32
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    sget v2, Ll/dbc0;->Kf:I

    .line 36
    .line 37
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iget-object v2, p0, Ll/p620;->i:Landroid/content/Context;

    .line 45
    .line 46
    sget v3, Ll/dbc0;->Rf:I

    .line 47
    .line 48
    invoke-virtual {v2, v3}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 49
    .line 50
    .line 51
    move-result-object v8

    .line 52
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 53
    .line 54
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 55
    .line 56
    invoke-virtual {v2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    iget-object v4, p0, Ll/p620;->k:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;

    .line 73
    .line 74
    filled-new-array {v0}, [Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 79
    .line 80
    .line 81
    move-result-object v7

    .line 82
    const-string v0, "#FE7E1D"

    .line 83
    .line 84
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 85
    .line 86
    .line 87
    move-result v10

    .line 88
    const-string v5, "\u6d4b\u8bd5\u4f60\u7684 MBTI"

    .line 89
    .line 90
    const-string v6, "\u4f18\u5148\u4e3a\u4f60\u63a8\u8350\u6700\u5339\u914d\u7684\u4eba\u683c"

    .line 91
    .line 92
    const-string v9, "\u7acb\u5373\u5b8c\u5584"

    .line 93
    .line 94
    invoke-virtual/range {v4 .. v10}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->l(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/util/List;Landroid/graphics/drawable/Drawable;Ljava/lang/CharSequence;I)V

    .line 95
    .line 96
    .line 97
    iget-object p0, p0, Ll/p620;->k:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;

    .line 98
    .line 99
    filled-new-array {v2, v2, v2, v2}, [Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    const-string v2, "\u5979\u4eec\u5df2\u5b8c\u6210\u6d4b\u8bd5"

    .line 108
    .line 109
    invoke-virtual {p0, v0, v2, v1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->p(Ljava/util/List;Ljava/lang/CharSequence;Z)V

    .line 110
    .line 111
    .line 112
    return-void
.end method

.method public q()V
    .locals 11

    .line 1
    iget-object v0, p0, Ll/p620;->b:Lcom/p1/mobile/putong/core/newui/newmeet/feed/view/MeetItemEntryHeadViewMyTabStyle;

    .line 2
    .line 3
    const-string v1, "\u63a5\u4e0b\u6765\uff0c\u4f60\u8fd8\u53ef\u4ee5"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/view/MeetItemEntryHeadViewMyTabStyle;->b(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/p620;->a:Landroid/widget/LinearLayout;

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    new-instance v0, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    const-string v2, "res://"

    .line 17
    .line 18
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object v2, p0, Ll/p620;->i:Landroid/content/Context;

    .line 22
    .line 23
    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string v2, "/"

    .line 31
    .line 32
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    sget v2, Ll/dbc0;->Yf:I

    .line 36
    .line 37
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iget-object v2, p0, Ll/p620;->i:Landroid/content/Context;

    .line 45
    .line 46
    sget v3, Ll/dbc0;->Rf:I

    .line 47
    .line 48
    invoke-virtual {v2, v3}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 49
    .line 50
    .line 51
    move-result-object v8

    .line 52
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 53
    .line 54
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 55
    .line 56
    invoke-virtual {v2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    iget-object v4, p0, Ll/p620;->k:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;

    .line 73
    .line 74
    filled-new-array {v0}, [Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 79
    .line 80
    .line 81
    move-result-object v7

    .line 82
    const-string v0, "#3CB9F0"

    .line 83
    .line 84
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 85
    .line 86
    .line 87
    move-result v10

    .line 88
    const-string v5, "4\u4e2a\u4eba\u9080\u8bf7\u4f60\u8ba4\u8bc1"

    .line 89
    .line 90
    const-string v6, "\u5b8c\u6210\u5934\u50cf\u8ba4\u8bc1\u540e\uff0c\u7acb\u5373\u6536\u5230\u4ed6\u4eec\u7684\u559c\u6b22"

    .line 91
    .line 92
    const-string v9, "\u7acb\u5373\u8ba4\u8bc1"

    .line 93
    .line 94
    invoke-virtual/range {v4 .. v10}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->l(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/util/List;Landroid/graphics/drawable/Drawable;Ljava/lang/CharSequence;I)V

    .line 95
    .line 96
    .line 97
    iget-object p0, p0, Ll/p620;->k:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;

    .line 98
    .line 99
    filled-new-array {v2, v2, v2, v2}, [Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->o(Ljava/util/List;Z)V

    .line 108
    .line 109
    .line 110
    return-void
.end method

.method public r()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/p620;->d:Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/likers/MeetLikersItemView;->setMyTabStyle(Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/p620;->e:Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;

    .line 8
    .line 9
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/nearby/MeetNearbyItemView;->setMyTabStyle(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public s()V
    .locals 10

    .line 1
    iget-object v0, p0, Ll/p620;->b:Lcom/p1/mobile/putong/core/newui/newmeet/feed/view/MeetItemEntryHeadViewMyTabStyle;

    .line 2
    .line 3
    const-string v1, "\u63a5\u4e0b\u6765\uff0c\u4f60\u8fd8\u53ef\u4ee5"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/newmeet/feed/view/MeetItemEntryHeadViewMyTabStyle;->b(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/p620;->a:Landroid/widget/LinearLayout;

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    new-instance v0, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    const-string v1, "res://"

    .line 17
    .line 18
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Ll/p620;->i:Landroid/content/Context;

    .line 22
    .line 23
    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string v1, "/"

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    sget v1, Ll/dbc0;->Yf:I

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iget-object v1, p0, Ll/p620;->i:Landroid/content/Context;

    .line 45
    .line 46
    sget v2, Ll/dbc0;->Rf:I

    .line 47
    .line 48
    invoke-virtual {v1, v2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 49
    .line 50
    .line 51
    move-result-object v7

    .line 52
    iget-object v3, p0, Ll/p620;->k:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;

    .line 53
    .line 54
    filled-new-array {v0}, [Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 59
    .line 60
    .line 61
    move-result-object v6

    .line 62
    const-string v0, "#3CB9F0"

    .line 63
    .line 64
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 65
    .line 66
    .line 67
    move-result v9

    .line 68
    const-string v4, "\u5b8c\u6210\u5934\u50cf\u8ba4\u8bc1"

    .line 69
    .line 70
    const-string v5, "\u89e3\u95016\u9879\u6743\u76ca\uff0c\u66f4\u5feb\u8ba4\u8bc6\u5408\u9002\u7684\u4eba"

    .line 71
    .line 72
    const-string v8, "\u7acb\u5373\u8ba4\u8bc1"

    .line 73
    .line 74
    invoke-virtual/range {v3 .. v9}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->l(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/util/List;Landroid/graphics/drawable/Drawable;Ljava/lang/CharSequence;I)V

    .line 75
    .line 76
    .line 77
    iget-object p0, p0, Ll/p620;->k:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;

    .line 78
    .line 79
    sget v0, Ll/dbc0;->eg:I

    .line 80
    .line 81
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    const-string v1, "\u66f4\u591a\u53f3\u6ed1"

    .line 86
    .line 87
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    sget v1, Ll/dbc0;->ag:I

    .line 92
    .line 93
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    const-string v2, "\u4f18\u5148\u66dd\u5149"

    .line 98
    .line 99
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    sget v2, Ll/dbc0;->gg:I

    .line 104
    .line 105
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    const-string v3, "\u53ea\u770b\u8ba4\u8bc1"

    .line 110
    .line 111
    invoke-static {v2, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    sget v3, Ll/dbc0;->cg:I

    .line 116
    .line 117
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 118
    .line 119
    .line 120
    move-result-object v3

    .line 121
    const-string v4, "\u70b9\u4eae\u52cb\u7ae0"

    .line 122
    .line 123
    invoke-static {v3, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 124
    .line 125
    .line 126
    move-result-object v3

    .line 127
    filled-new-array {v0, v1, v2, v3}, [Ll/pf60;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/task/CommonTaskItemView;->setSubAvatarWithIllustrate(Ljava/util/List;)V

    .line 136
    .line 137
    .line 138
    return-void
.end method

.method public x2()V
    .locals 0

    .line 1
    return-void
.end method
