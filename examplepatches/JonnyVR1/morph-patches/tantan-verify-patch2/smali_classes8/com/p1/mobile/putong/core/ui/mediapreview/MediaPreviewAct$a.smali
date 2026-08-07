.class public Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a;
.super Ll/lb2;
.source "SourceFile"

# interfaces
.implements Landroidx/viewpager/widget/ViewPager$j;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field public final synthetic e:Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a;->e:Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/lb2;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic q(Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a;Lcom/p1/mobile/putong/core/data/MessageAndMedia;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a;->y(Lcom/p1/mobile/putong/core/data/MessageAndMedia;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic r(Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a;Lcom/p1/mobile/putong/core/data/MessageAndMedia;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a;->w(Lcom/p1/mobile/putong/core/data/MessageAndMedia;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a;Lcom/p1/mobile/putong/core/data/MessageAndMedia;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a;->z(Lcom/p1/mobile/putong/core/data/MessageAndMedia;)Z

    move-result p0

    return p0
.end method

.method public static synthetic t(Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a;Lcom/p1/mobile/putong/core/data/MessageAndMedia;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a;->x(Lcom/p1/mobile/putong/core/data/MessageAndMedia;Landroid/view/View;)Z

    move-result p0

    return p0
.end method

.method public static synthetic u(Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a;Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a;->C(Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;)V

    return-void
.end method

.method public static synthetic v(Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a;->A()V

    return-void
.end method


# virtual methods
.method public final synthetic A()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a;->e:Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->finish()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic C(Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;)V
    .locals 3

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->b:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    new-instance v0, Ll/p2y;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/p2y;-><init>(Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a;)V

    .line 10
    .line 11
    .line 12
    const-wide/16 v1, 0x64

    .line 13
    .line 14
    invoke-virtual {p1, v0, v1, v2}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public getCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a;->e:Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->h:Ll/vg60;

    .line 4
    .line 5
    iget-object p0, p0, Ll/vg60;->a:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public getItemPosition(Ljava/lang/Object;)I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a;->e:Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->h:Ll/vg60;

    .line 4
    .line 5
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {v0, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-ltz v0, :cond_0

    .line 12
    .line 13
    return v0

    .line 14
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a;->e:Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->d:Lv/VPager;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-eqz p1, :cond_1

    .line 27
    .line 28
    instance-of p1, p0, Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 29
    .line 30
    if-eqz p1, :cond_1

    .line 31
    .line 32
    check-cast p0, Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/PlayerView;->C()Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    if-eqz p0, :cond_1

    .line 39
    .line 40
    const/4 p0, -0x1

    .line 41
    return p0

    .line 42
    :cond_1
    const/4 p0, -0x2

    .line 43
    return p0
.end method

.method public isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public o(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .locals 0

    .line 1
    invoke-virtual {p1, p3}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-eqz p2, :cond_1

    .line 10
    .line 11
    instance-of p2, p0, Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 12
    .line 13
    const/4 p3, 0x0

    .line 14
    if-eqz p2, :cond_0

    .line 15
    .line 16
    move-object p2, p0

    .line 17
    check-cast p2, Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 18
    .line 19
    invoke-virtual {p2, p3}, Lcom/p1/mobile/putong/core/ui/PlayerView;->setPlayer(Ll/ie80;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    invoke-virtual {p0, p3}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 26
    .line 27
    .line 28
    :cond_1
    return-void
.end method

.method public onPageScrollStateChanged(I)V
    .locals 0

    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0

    return-void
.end method

.method public onPageSelected(I)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a;->e:Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->l:Lcom/p1/mobile/putong/core/data/MessageAndMedia;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->d:Lv/VPager;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    instance-of v2, v0, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;

    .line 12
    .line 13
    if-eqz v2, :cond_0

    .line 14
    .line 15
    check-cast v0, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->reset()V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a;->e:Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;

    .line 21
    .line 22
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->h:Ll/vg60;

    .line 23
    .line 24
    iget-object v2, v2, Ll/vg60;->a:Ljava/util/List;

    .line 25
    .line 26
    invoke-interface {v2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    check-cast v2, Lcom/p1/mobile/putong/core/data/MessageAndMedia;

    .line 31
    .line 32
    iput-object v2, v0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->l:Lcom/p1/mobile/putong/core/data/MessageAndMedia;

    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a;->e:Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;

    .line 35
    .line 36
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->l:Lcom/p1/mobile/putong/core/data/MessageAndMedia;

    .line 37
    .line 38
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MessageAndMedia;->message:Lcom/p1/mobile/putong/core/data/Message;

    .line 39
    .line 40
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Message;->isOtherUser()Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    new-instance v0, Ll/pf60;

    .line 47
    .line 48
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a;->e:Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;

    .line 49
    .line 50
    iget-object v2, v2, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->l:Lcom/p1/mobile/putong/core/data/MessageAndMedia;

    .line 51
    .line 52
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/MessageAndMedia;->message:Lcom/p1/mobile/putong/core/data/Message;

    .line 53
    .line 54
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 55
    .line 56
    const-string v3, "message_id"

    .line 57
    .line 58
    invoke-direct {v0, v3, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 59
    .line 60
    .line 61
    new-instance v2, Ll/pf60;

    .line 62
    .line 63
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a;->e:Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;

    .line 64
    .line 65
    iget-object v3, v3, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->l:Lcom/p1/mobile/putong/core/data/MessageAndMedia;

    .line 66
    .line 67
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/MessageAndMedia;->message:Lcom/p1/mobile/putong/core/data/Message;

    .line 68
    .line 69
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 70
    .line 71
    const-string v4, "moments_user_id"

    .line 72
    .line 73
    invoke-direct {v2, v4, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 74
    .line 75
    .line 76
    filled-new-array {v0, v2}, [Ll/pf60;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    const-string v2, "e_photo_text_reply"

    .line 81
    .line 82
    const-string v3, "p_chat_view"

    .line 83
    .line 84
    invoke-static {v2, v3, v0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 85
    .line 86
    .line 87
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a;->e:Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;

    .line 88
    .line 89
    iget-object v2, v0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->l:Lcom/p1/mobile/putong/core/data/MessageAndMedia;

    .line 90
    .line 91
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->o2(Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;Lcom/p1/mobile/putong/core/data/MessageAndMedia;)V

    .line 92
    .line 93
    .line 94
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a;->e:Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;

    .line 95
    .line 96
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->l:Lcom/p1/mobile/putong/core/data/MessageAndMedia;

    .line 97
    .line 98
    if-eqz v0, :cond_2

    .line 99
    .line 100
    if-eqz v1, :cond_2

    .line 101
    .line 102
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/MessageAndMedia;->media:Lcom/p1/mobile/putong/data/Media;

    .line 103
    .line 104
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MessageAndMedia;->media:Lcom/p1/mobile/putong/data/Media;

    .line 105
    .line 106
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/data/Media;->equals(Ljava/lang/Object;)Z

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    if-nez v0, :cond_4

    .line 111
    .line 112
    :cond_2
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    sget-object v1, Lcom/p1/mobile/putong/core/ui/PlayerView;->A:Ljava/lang/String;

    .line 117
    .line 118
    invoke-virtual {v0, v1}, Ll/pb1;->e(Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a;->e:Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;

    .line 122
    .line 123
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->l2(Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;)Ll/ie80;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 128
    .line 129
    .line 130
    move-result v0

    .line 131
    if-eqz v0, :cond_3

    .line 132
    .line 133
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a;->e:Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;

    .line 134
    .line 135
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->l2(Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;)Ll/ie80;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    invoke-interface {v0}, Ll/ie80;->stop()V

    .line 140
    .line 141
    .line 142
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a;->e:Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;

    .line 143
    .line 144
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->m2(Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;)Ll/ie80;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 149
    .line 150
    .line 151
    move-result v0

    .line 152
    if-eqz v0, :cond_4

    .line 153
    .line 154
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a;->e:Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;

    .line 155
    .line 156
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->m2(Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;)Ll/ie80;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    invoke-interface {v0}, Ll/ie80;->stop()V

    .line 161
    .line 162
    .line 163
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a;->e:Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;

    .line 164
    .line 165
    const/4 v1, 0x1

    .line 166
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->dimStatusBar(Z)V

    .line 167
    .line 168
    .line 169
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a;->e:Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;

    .line 170
    .line 171
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->h:Ll/vg60;

    .line 172
    .line 173
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 174
    .line 175
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 176
    .line 177
    .line 178
    move-result v0

    .line 179
    sub-int/2addr v0, v1

    .line 180
    if-ne p1, v0, :cond_5

    .line 181
    .line 182
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a;->e:Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;

    .line 183
    .line 184
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->p2(Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;)V

    .line 185
    .line 186
    .line 187
    :cond_5
    return-void
.end method

.method public p(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a;->e:Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->h:Ll/vg60;

    .line 4
    .line 5
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    check-cast p2, Lcom/p1/mobile/putong/core/data/MessageAndMedia;

    .line 12
    .line 13
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/MessageAndMedia;->media:Lcom/p1/mobile/putong/data/Media;

    .line 14
    .line 15
    instance-of v1, v0, Lcom/p1/mobile/putong/data/Video;

    .line 16
    .line 17
    const-string v2, "real_shot"

    .line 18
    .line 19
    const/4 v3, 0x0

    .line 20
    if-eqz v1, :cond_3

    .line 21
    .line 22
    new-instance v0, Lcom/p1/mobile/putong/core/ui/PlayerView;

    .line 23
    .line 24
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a;->e:Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;

    .line 25
    .line 26
    iget-object v1, v1, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 27
    .line 28
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/ui/PlayerView;-><init>(Landroid/content/Context;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v3}, Lcom/p1/mobile/putong/core/ui/PlayerView;->setProgressBarsEnabled(Z)V

    .line 32
    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a;->e:Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;

    .line 35
    .line 36
    iget-object v4, p2, Lcom/p1/mobile/putong/core/data/MessageAndMedia;->media:Lcom/p1/mobile/putong/data/Media;

    .line 37
    .line 38
    iget-object v4, v4, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {v1, v4}, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->w2(Ljava/lang/String;)Ll/ie80;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    const-string v4, "chat"

    .line 45
    .line 46
    invoke-interface {v1, v4}, Ll/ie80;->a(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/PlayerView;->setPlayer(Ll/ie80;)V

    .line 50
    .line 51
    .line 52
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/PlayerView;->h:Lv/VFrame_ColorFilter;

    .line 53
    .line 54
    const/4 v4, 0x0

    .line 55
    invoke-virtual {v1, v4}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0, p2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 62
    .line 63
    .line 64
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/MessageAndMedia;->media:Lcom/p1/mobile/putong/data/Media;

    .line 65
    .line 66
    check-cast p1, Lcom/p1/mobile/putong/data/Video;

    .line 67
    .line 68
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/PlayerView;->setVideo(Lcom/p1/mobile/putong/data/Video;)V

    .line 69
    .line 70
    .line 71
    const/4 p1, 0x4

    .line 72
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/PlayerView;->setReplayVisibility(I)V

    .line 73
    .line 74
    .line 75
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/MessageAndMedia;->media:Lcom/p1/mobile/putong/data/Media;

    .line 76
    .line 77
    check-cast p1, Lcom/p1/mobile/putong/data/Video;

    .line 78
    .line 79
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Video;->formatAspectRatio()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    if-nez p1, :cond_0

    .line 88
    .line 89
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/MessageAndMedia;->media:Lcom/p1/mobile/putong/data/Media;

    .line 90
    .line 91
    check-cast p1, Lcom/p1/mobile/putong/data/Video;

    .line 92
    .line 93
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Video;->formatAspectRatio()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    invoke-static {p1}, Ll/uqb0;->S0(Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    :cond_0
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/MessageAndMedia;->message:Lcom/p1/mobile/putong/core/data/Message;

    .line 101
    .line 102
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 103
    .line 104
    invoke-static {p1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 105
    .line 106
    .line 107
    move-result p1

    .line 108
    if-eqz p1, :cond_2

    .line 109
    .line 110
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/MessageAndMedia;->message:Lcom/p1/mobile/putong/core/data/Message;

    .line 111
    .line 112
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 113
    .line 114
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/PlayerView;->setText(Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/MessageAndMedia;->message:Lcom/p1/mobile/putong/core/data/Message;

    .line 118
    .line 119
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Message;->isOtherUser()Z

    .line 120
    .line 121
    .line 122
    move-result p1

    .line 123
    if-eqz p1, :cond_1

    .line 124
    .line 125
    invoke-virtual {v0, v3}, Lcom/p1/mobile/putong/core/ui/PlayerView;->setReplayVisibility(I)V

    .line 126
    .line 127
    .line 128
    :cond_1
    new-instance p1, Ll/k2y;

    .line 129
    .line 130
    invoke-direct {p1, p0, p2}, Ll/k2y;-><init>(Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a;Lcom/p1/mobile/putong/core/data/MessageAndMedia;)V

    .line 131
    .line 132
    .line 133
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/PlayerView;->setReplayClick(Landroid/view/View$OnClickListener;)V

    .line 134
    .line 135
    .line 136
    :cond_2
    new-instance p1, Ll/l2y;

    .line 137
    .line 138
    invoke-direct {p1, p0, p2}, Ll/l2y;-><init>(Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a;Lcom/p1/mobile/putong/core/data/MessageAndMedia;)V

    .line 139
    .line 140
    .line 141
    invoke-virtual {v0, p1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 142
    .line 143
    .line 144
    new-instance p1, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a$a;

    .line 145
    .line 146
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a$a;-><init>(Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a;)V

    .line 147
    .line 148
    .line 149
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/PlayerView;->v(Ll/ie80$b;)V

    .line 150
    .line 151
    .line 152
    return-object p2

    .line 153
    :cond_3
    instance-of v0, v0, Lcom/p1/mobile/putong/data/Picture;

    .line 154
    .line 155
    if-eqz v0, :cond_7

    .line 156
    .line 157
    new-instance v0, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;

    .line 158
    .line 159
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a;->e:Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;

    .line 160
    .line 161
    iget-object v1, v1, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 162
    .line 163
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;-><init>(Landroid/content/Context;)V

    .line 164
    .line 165
    .line 166
    iget-object v1, p2, Lcom/p1/mobile/putong/core/data/MessageAndMedia;->media:Lcom/p1/mobile/putong/data/Media;

    .line 167
    .line 168
    check-cast v1, Lcom/p1/mobile/putong/data/Picture;

    .line 169
    .line 170
    iget-object v4, p2, Lcom/p1/mobile/putong/core/data/MessageAndMedia;->message:Lcom/p1/mobile/putong/core/data/Message;

    .line 171
    .line 172
    iget-object v4, v4, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 173
    .line 174
    if-nez v4, :cond_4

    .line 175
    .line 176
    const/4 v4, 0x1

    .line 177
    goto :goto_0

    .line 178
    :cond_4
    move v4, v3

    .line 179
    :goto_0
    invoke-virtual {v0, v1, v4}, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->N(Lcom/p1/mobile/putong/data/Picture;Z)V

    .line 180
    .line 181
    .line 182
    const/16 v1, 0x8

    .line 183
    .line 184
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->setReplayVisibility(I)V

    .line 185
    .line 186
    .line 187
    iget-object v1, p2, Lcom/p1/mobile/putong/core/data/MessageAndMedia;->message:Lcom/p1/mobile/putong/core/data/Message;

    .line 188
    .line 189
    iget-object v4, p2, Lcom/p1/mobile/putong/core/data/MessageAndMedia;->media:Lcom/p1/mobile/putong/data/Media;

    .line 190
    .line 191
    check-cast v4, Lcom/p1/mobile/putong/data/Picture;

    .line 192
    .line 193
    invoke-static {v1, v4}, Ll/k900;->h(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/Picture;)Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object v1

    .line 197
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->setPictureZoomAnimationKey(Ljava/lang/String;)V

    .line 198
    .line 199
    .line 200
    iget-object v1, p2, Lcom/p1/mobile/putong/core/data/MessageAndMedia;->message:Lcom/p1/mobile/putong/core/data/Message;

    .line 201
    .line 202
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 203
    .line 204
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 205
    .line 206
    .line 207
    move-result v1

    .line 208
    if-eqz v1, :cond_6

    .line 209
    .line 210
    iget-object v1, p2, Lcom/p1/mobile/putong/core/data/MessageAndMedia;->message:Lcom/p1/mobile/putong/core/data/Message;

    .line 211
    .line 212
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 213
    .line 214
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->setText(Ljava/lang/String;)V

    .line 215
    .line 216
    .line 217
    iget-object v1, p2, Lcom/p1/mobile/putong/core/data/MessageAndMedia;->message:Lcom/p1/mobile/putong/core/data/Message;

    .line 218
    .line 219
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Message;->isOtherUser()Z

    .line 220
    .line 221
    .line 222
    move-result v1

    .line 223
    if-eqz v1, :cond_5

    .line 224
    .line 225
    invoke-virtual {v0, v3}, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->setReplayVisibility(I)V

    .line 226
    .line 227
    .line 228
    :cond_5
    new-instance v1, Ll/m2y;

    .line 229
    .line 230
    invoke-direct {v1, p0, p2}, Ll/m2y;-><init>(Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a;Lcom/p1/mobile/putong/core/data/MessageAndMedia;)V

    .line 231
    .line 232
    .line 233
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->setReplayClick(Landroid/view/View$OnClickListener;)V

    .line 234
    .line 235
    .line 236
    :cond_6
    new-instance v1, Ll/n2y;

    .line 237
    .line 238
    invoke-direct {v1, p0, p2}, Ll/n2y;-><init>(Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a;Lcom/p1/mobile/putong/core/data/MessageAndMedia;)V

    .line 239
    .line 240
    .line 241
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->setOnLongPressListener(Lcom/p1/mobile/putong/core/ui/PhotoPreviewView$b;)V

    .line 242
    .line 243
    .line 244
    new-instance v1, Ll/o2y;

    .line 245
    .line 246
    invoke-direct {v1, p0, v0}, Ll/o2y;-><init>(Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a;Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;)V

    .line 247
    .line 248
    .line 249
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->setOnTapListener(Lcom/p1/mobile/putong/core/ui/PhotoPreviewView$c;)V

    .line 250
    .line 251
    .line 252
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;->a:Lcom/p1/mobile/putong/core/ui/mediapreview/gesture/CorePhotoDraweeView;

    .line 253
    .line 254
    new-instance v2, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a$b;

    .line 255
    .line 256
    invoke-direct {v2, p0, p2, v0}, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a$b;-><init>(Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a;Lcom/p1/mobile/putong/core/data/MessageAndMedia;Lcom/p1/mobile/putong/core/ui/PhotoPreviewView;)V

    .line 257
    .line 258
    .line 259
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/ui/mediapreview/gesture/CorePhotoDraweeView;->setOnDragDismissListenler(Ll/am50;)V

    .line 260
    .line 261
    .line 262
    invoke-virtual {v0, p2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 263
    .line 264
    .line 265
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 266
    .line 267
    .line 268
    :cond_7
    return-object p2
.end method

.method public final synthetic w(Lcom/p1/mobile/putong/core/data/MessageAndMedia;Landroid/view/View;)V
    .locals 2

    .line 1
    new-instance p2, Ll/pf60;

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MessageAndMedia;->message:Lcom/p1/mobile/putong/core/data/Message;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    const-string v1, "message_id"

    .line 8
    .line 9
    invoke-direct {p2, v1, v0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    new-instance v0, Ll/pf60;

    .line 13
    .line 14
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MessageAndMedia;->message:Lcom/p1/mobile/putong/core/data/Message;

    .line 15
    .line 16
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 17
    .line 18
    const-string v1, "moments_user_id"

    .line 19
    .line 20
    invoke-direct {v0, v1, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    filled-new-array {p2, v0}, [Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    const-string p2, "e_photo_text_reply"

    .line 28
    .line 29
    const-string v0, "p_chat_view"

    .line 30
    .line 31
    invoke-static {p2, v0, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a;->e:Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->finish()V

    .line 37
    .line 38
    .line 39
    sget-object p0, Ll/d3z;->x:Lrx/subjects/a;

    .line 40
    .line 41
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 42
    .line 43
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public final synthetic x(Lcom/p1/mobile/putong/core/data/MessageAndMedia;Landroid/view/View;)Z
    .locals 2

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a;->e:Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    if-ne p2, v0, :cond_1

    .line 11
    .line 12
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/MessageAndMedia;->message:Lcom/p1/mobile/putong/core/data/Message;

    .line 13
    .line 14
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 15
    .line 16
    const-string v0, "real_shot"

    .line 17
    .line 18
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 19
    .line 20
    .line 21
    move-result p2

    .line 22
    if-eqz p2, :cond_0

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a;->e:Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 28
    .line 29
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/MessageAndMedia;->media:Lcom/p1/mobile/putong/data/Media;

    .line 30
    .line 31
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MessageAndMedia;->message:Lcom/p1/mobile/putong/core/data/Message;

    .line 32
    .line 33
    invoke-static {p0, p2, p1}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->M1(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 34
    .line 35
    .line 36
    :cond_1
    :goto_0
    return v1
.end method

.method public final synthetic y(Lcom/p1/mobile/putong/core/data/MessageAndMedia;Landroid/view/View;)V
    .locals 2

    .line 1
    new-instance p2, Ll/pf60;

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MessageAndMedia;->message:Lcom/p1/mobile/putong/core/data/Message;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    const-string v1, "message_id"

    .line 8
    .line 9
    invoke-direct {p2, v1, v0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    new-instance v0, Ll/pf60;

    .line 13
    .line 14
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MessageAndMedia;->message:Lcom/p1/mobile/putong/core/data/Message;

    .line 15
    .line 16
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 17
    .line 18
    const-string v1, "moments_user_id"

    .line 19
    .line 20
    invoke-direct {v0, v1, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    filled-new-array {p2, v0}, [Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    const-string p2, "e_photo_text_reply"

    .line 28
    .line 29
    const-string v0, "p_chat_view"

    .line 30
    .line 31
    invoke-static {p2, v0, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 32
    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a;->e:Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->finish()V

    .line 37
    .line 38
    .line 39
    sget-object p0, Ll/d3z;->x:Lrx/subjects/a;

    .line 40
    .line 41
    sget-object p1, Ll/uxj0;->a:Ll/uxj0;

    .line 42
    .line 43
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public final synthetic z(Lcom/p1/mobile/putong/core/data/MessageAndMedia;)Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a;->e:Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    if-ne v0, v1, :cond_1

    .line 11
    .line 12
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MessageAndMedia;->message:Lcom/p1/mobile/putong/core/data/Message;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 15
    .line 16
    const-string v1, "real_shot"

    .line 17
    .line 18
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_1

    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct$a;->e:Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;

    .line 25
    .line 26
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/MediaPreviewAct;->r:Z

    .line 27
    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 32
    .line 33
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MessageAndMedia;->media:Lcom/p1/mobile/putong/data/Media;

    .line 34
    .line 35
    const/4 v0, 0x0

    .line 36
    invoke-static {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->M1(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/core/data/Message;)V

    .line 37
    .line 38
    .line 39
    :cond_1
    :goto_0
    return v2
.end method
