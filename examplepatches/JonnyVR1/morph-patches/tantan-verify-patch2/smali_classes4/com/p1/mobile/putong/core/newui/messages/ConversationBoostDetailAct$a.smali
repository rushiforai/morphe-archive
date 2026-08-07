.class public Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct$a;
.super Ll/lb2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field public e:Z

.field public f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation
.end field

.field public g:Ljava/util/Stack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Stack<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public h:I

.field public i:I

.field public final synthetic j:Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct$a;->j:Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/lb2;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct$a;->f:Ljava/util/List;

    .line 12
    .line 13
    new-instance p1, Ljava/util/Stack;

    .line 14
    .line 15
    invoke-direct {p1}, Ljava/util/Stack;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct$a;->g:Ljava/util/Stack;

    .line 19
    .line 20
    const/4 p1, -0x1

    .line 21
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct$a;->h:I

    .line 22
    .line 23
    const/4 p1, 0x0

    .line 24
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct$a;->i:I

    .line 25
    .line 26
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct$a;->f:Ljava/util/List;

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

.method public getItemPosition(Ljava/lang/Object;)I
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct$a;->i:I

    .line 2
    .line 3
    if-lez v0, :cond_0

    .line 4
    .line 5
    add-int/lit8 v0, v0, -0x1

    .line 6
    .line 7
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct$a;->i:I

    .line 8
    .line 9
    const/4 p0, -0x2

    .line 10
    return p0

    .line 11
    :cond_0
    invoke-super {p0, p1}, Ll/cf60;->getItemPosition(Ljava/lang/Object;)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z
    .locals 0

    if-ne p1, p2, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public o(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct$a;->e:Z

    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct$a;->j:Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;

    .line 5
    .line 6
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;->h:Lv/VPager;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-ne p2, v0, :cond_0

    .line 13
    .line 14
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct$a;->j:Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;

    .line 15
    .line 16
    iget-object p2, p2, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;->h:Lv/VPager;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    invoke-static {p2, v0}, Ll/hkl0;->a(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    :cond_0
    move-object p2, p3

    .line 23
    check-cast p2, Landroid/view/View;

    .line 24
    .line 25
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 26
    .line 27
    .line 28
    instance-of p1, p3, Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 29
    .line 30
    if-eqz p1, :cond_1

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct$a;->g:Ljava/util/Stack;

    .line 33
    .line 34
    check-cast p3, Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 35
    .line 36
    invoke-virtual {p0, p3}, Ljava/util/AbstractCollection;->add(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    :cond_1
    return-void
.end method

.method public p(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct$a;->g:Ljava/util/Stack;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/AbstractCollection;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct$a;->g:Ljava/util/Stack;

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct$a;->j:Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    sget v2, Ll/kec0;->Ge:I

    .line 28
    .line 29
    invoke-virtual {v0, v2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    check-cast v0, Lcom/p1/mobile/putong/core/ui/PictureView;

    .line 34
    .line 35
    :goto_0
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/PictureView;->A:Landroid/widget/LinearLayout;

    .line 36
    .line 37
    const/16 v3, 0x8

    .line 38
    .line 39
    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 40
    .line 41
    .line 42
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/PictureView;->B:Landroid/view/View;

    .line 43
    .line 44
    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 45
    .line 46
    .line 47
    const/4 v2, 0x1

    .line 48
    invoke-virtual {v0, v2, v1}, Lcom/p1/mobile/putong/core/ui/PictureView;->j0(ZZ)V

    .line 49
    .line 50
    .line 51
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/PictureView;->a:Lv/VDraweeView;

    .line 52
    .line 53
    invoke-virtual {v3}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v3

    .line 61
    if-eqz v3, :cond_1

    .line 62
    .line 63
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/PictureView;->a:Lv/VDraweeView;

    .line 64
    .line 65
    invoke-virtual {v3}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    check-cast v3, Ll/wlj;

    .line 70
    .line 71
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct$a;->j:Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;

    .line 72
    .line 73
    invoke-virtual {v4}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 74
    .line 75
    .line 76
    move-result-object v4

    .line 77
    invoke-virtual {v4}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 78
    .line 79
    .line 80
    move-result-object v4

    .line 81
    sget v5, Ll/dbc0;->U7:I

    .line 82
    .line 83
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 84
    .line 85
    .line 86
    move-result-object v4

    .line 87
    invoke-virtual {v3, v4}, Ll/wlj;->A(Landroid/graphics/drawable/Drawable;)V

    .line 88
    .line 89
    .line 90
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/PictureView;->a:Lv/VDraweeView;

    .line 91
    .line 92
    invoke-virtual {v3}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 93
    .line 94
    .line 95
    move-result-object v3

    .line 96
    check-cast v3, Ll/wlj;

    .line 97
    .line 98
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct$a;->j:Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;

    .line 99
    .line 100
    invoke-virtual {v4}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 101
    .line 102
    .line 103
    move-result-object v4

    .line 104
    invoke-virtual {v4}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 105
    .line 106
    .line 107
    move-result-object v4

    .line 108
    sget v5, Ll/dbc0;->U7:I

    .line 109
    .line 110
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 111
    .line 112
    .line 113
    move-result-object v4

    .line 114
    invoke-virtual {v3, v4}, Ll/wlj;->E(Landroid/graphics/drawable/Drawable;)V

    .line 115
    .line 116
    .line 117
    :cond_1
    invoke-virtual {v0, v2, v1}, Lcom/p1/mobile/putong/core/ui/PictureView;->J(ZZ)V

    .line 118
    .line 119
    .line 120
    const v1, 0x3f4ccccd    # 0.8f

    .line 121
    .line 122
    .line 123
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/PictureView;->setAspectRateFitWidth(F)V

    .line 124
    .line 125
    .line 126
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/PictureView;->a:Lv/VDraweeView;

    .line 127
    .line 128
    invoke-virtual {v1}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    check-cast v1, Ll/wlj;

    .line 133
    .line 134
    sget-object v2, Ll/h1e0;->i:Ll/h1e0;

    .line 135
    .line 136
    invoke-virtual {v1, v2}, Ll/wlj;->w(Ll/h1e0;)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/PictureView;->k0()V

    .line 140
    .line 141
    .line 142
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct$a;->f:Ljava/util/List;

    .line 143
    .line 144
    invoke-interface {v1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 145
    .line 146
    .line 147
    move-result-object v1

    .line 148
    check-cast v1, Lcom/p1/mobile/putong/data/Media;

    .line 149
    .line 150
    const/16 v2, 0x64

    .line 151
    .line 152
    invoke-virtual {p0, v0, v1, v2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct$a;->r(Lcom/p1/mobile/putong/core/ui/PictureView;Lcom/p1/mobile/putong/data/Media;I)V

    .line 153
    .line 154
    .line 155
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 156
    .line 157
    .line 158
    move-result-object p0

    .line 159
    invoke-virtual {v0, p0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 160
    .line 161
    .line 162
    const/4 p0, 0x0

    .line 163
    invoke-virtual {v0, p0}, Landroid/view/View;->setPivotX(F)V

    .line 164
    .line 165
    .line 166
    invoke-virtual {v0, p0}, Landroid/view/View;->setPivotY(F)V

    .line 167
    .line 168
    .line 169
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 170
    .line 171
    .line 172
    return-object v0
.end method

.method public q()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct$a;->j:Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;->h:Lv/VPager;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public r(Lcom/p1/mobile/putong/core/ui/PictureView;Lcom/p1/mobile/putong/data/Media;I)V
    .locals 0

    .line 1
    invoke-virtual {p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/PictureView;->Y(Lcom/p1/mobile/putong/data/Media;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public s(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct$a;->f:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p1, v0}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct$a;->e:Z

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct$a;->j:Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;

    .line 14
    .line 15
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;->e2(Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;)Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct$a;->q()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct$a;->t(Lcom/p1/mobile/putong/data/User;I)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    const/4 v0, 0x0

    .line 28
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct$a;->e:Z

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct$a;->getCount()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct$a;->i:I

    .line 35
    .line 36
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct$a;->f:Ljava/util/List;

    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct$a;->j:Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;

    .line 39
    .line 40
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;->d2(Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct;)Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct$a;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {p0}, Ll/cf60;->notifyDataSetChanged()V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public t(Lcom/p1/mobile/putong/data/User;I)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-ge p2, p1, :cond_0

    .line 14
    .line 15
    iget p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct$a;->h:I

    .line 16
    .line 17
    if-eq p1, p2, :cond_0

    .line 18
    .line 19
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationBoostDetailAct$a;->h:I

    .line 20
    .line 21
    :cond_0
    return-void
.end method
