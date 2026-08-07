.class public Ll/z5m0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/rwn0;",
        ">",
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/b6m0<",
        "TD;>;>;"
    }
.end annotation


# instance fields
.field public final a:Ll/x3t;

.field public b:Ll/b6m0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/b6m0<",
            "TD;>;"
        }
    .end annotation
.end field

.field public final c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/x3t;

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-direct {v0, v1}, Ll/x3t;-><init>(Z)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/z5m0;->a:Ll/x3t;

    .line 11
    .line 12
    iput-object p1, p0, Ll/z5m0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;

    .line 13
    .line 14
    return-void
.end method

.method public static synthetic a(Ll/z5m0;Lcom/p1/mobile/putong/live/base/data/BLiveMedal;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/z5m0;->d(Lcom/p1/mobile/putong/live/base/data/BLiveMedal;)V

    return-void
.end method

.method public static synthetic b(Ll/z5m0;Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/z5m0;->e(Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;Landroid/view/View;)V

    return-void
.end method

.method private i(Lcom/p1/mobile/putong/data/User;)V
    .locals 5

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isHideLocationFromSVip()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x1

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/z5m0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;->i:Lv/VText;

    .line 12
    .line 13
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 22
    .line 23
    iget-object v3, p0, Ll/z5m0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;

    .line 24
    .line 25
    iget-object v3, v3, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;->i:Lv/VText;

    .line 26
    .line 27
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v4

    .line 31
    xor-int/2addr v4, v2

    .line 32
    invoke-static {v3, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 33
    .line 34
    .line 35
    iget-object v3, p0, Ll/z5m0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;

    .line 36
    .line 37
    iget-object v3, v3, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;->i:Lv/VText;

    .line 38
    .line 39
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 40
    .line 41
    .line 42
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 43
    .line 44
    iget v0, v0, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 45
    .line 46
    invoke-static {v0, v2}, Ll/q8g0;->p(IZ)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iget-object v3, p0, Ll/z5m0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;

    .line 51
    .line 52
    iget-object v3, v3, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;->j:Lv/VText;

    .line 53
    .line 54
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 55
    .line 56
    .line 57
    move-result v4

    .line 58
    if-nez v4, :cond_1

    .line 59
    .line 60
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isHideLocationFromSVip()Z

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    if-nez p1, :cond_1

    .line 65
    .line 66
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    if-nez p1, :cond_1

    .line 71
    .line 72
    move p1, v2

    .line 73
    goto :goto_1

    .line 74
    :cond_1
    move p1, v1

    .line 75
    :goto_1
    invoke-static {v3, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 76
    .line 77
    .line 78
    iget-object p1, p0, Ll/z5m0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;

    .line 79
    .line 80
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;->j:Lv/VText;

    .line 81
    .line 82
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 83
    .line 84
    .line 85
    iget-object p1, p0, Ll/z5m0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;

    .line 86
    .line 87
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;->g:Lv/VText;

    .line 88
    .line 89
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 90
    .line 91
    .line 92
    move-result p1

    .line 93
    if-eqz p1, :cond_2

    .line 94
    .line 95
    iget-object p1, p0, Ll/z5m0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;

    .line 96
    .line 97
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;->i:Lv/VText;

    .line 98
    .line 99
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 100
    .line 101
    .line 102
    move-result p1

    .line 103
    if-eqz p1, :cond_2

    .line 104
    .line 105
    iget-object p0, p0, Ll/z5m0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;

    .line 106
    .line 107
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;->h:Landroid/view/View;

    .line 108
    .line 109
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 110
    .line 111
    .line 112
    return-void

    .line 113
    :cond_2
    iget-object p0, p0, Ll/z5m0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;

    .line 114
    .line 115
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;->h:Landroid/view/View;

    .line 116
    .line 117
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 118
    .line 119
    .line 120
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/z5m0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;->a:Lv/VText;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public c(Ll/b6m0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/b6m0<",
            "TD;>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/z5m0;->b:Ll/b6m0;

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic d(Lcom/p1/mobile/putong/live/base/data/BLiveMedal;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z5m0;->b:Ll/b6m0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/b6m0;->n4(Lcom/p1/mobile/putong/live/base/data/BLiveMedal;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic e(Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z5m0;->b:Ll/b6m0;

    .line 2
    .line 3
    const/16 p2, 0xed8

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;->jumpScheme:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p0, p2, p1}, Ll/i6t;->p3(ILjava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public f(Ll/vak0;)V
    .locals 3
    .param p1    # Ll/vak0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    move-object v1, v0

    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object v1, p1, Ll/vak0;->c:Ll/nsv;

    .line 7
    .line 8
    :goto_0
    invoke-static {v1}, Ll/e3t;->a(Ll/nsv;)Ll/e3t;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {v2}, Ll/e3t;->d()Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-eqz v2, :cond_1

    .line 17
    .line 18
    iget-object p1, p0, Ll/z5m0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;

    .line 19
    .line 20
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;->k:Lv/VLinear;

    .line 21
    .line 22
    const/16 v0, 0x8

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Ll/z5m0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;

    .line 28
    .line 29
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;->a:Lv/VText;

    .line 30
    .line 31
    const/4 v0, 0x0

    .line 32
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Ll/z5m0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;->a:Lv/VText;

    .line 38
    .line 39
    invoke-virtual {v1}, Ll/nsv;->g()Ll/pyl;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    check-cast p1, Ll/e3t;

    .line 44
    .line 45
    iget-object p1, p1, Ll/e3t;->a:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 46
    .line 47
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->name:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :cond_1
    if-eqz v1, :cond_2

    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_2
    move-object p1, v0

    .line 57
    :goto_1
    invoke-virtual {p0, p1}, Ll/z5m0;->l(Ll/vak0;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/b6m0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/z5m0;->c(Ll/b6m0;)V

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

.method public final j(Lcom/p1/mobile/putong/data/User;)V
    .locals 6

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 8
    .line 9
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    iget-object v2, p0, Ll/z5m0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;

    .line 14
    .line 15
    iget-object v2, v2, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;->b:Lv/VLinear;

    .line 16
    .line 17
    const/4 v3, 0x1

    .line 18
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    const-string v2, "male"

    .line 22
    .line 23
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v4

    .line 27
    if-eqz v4, :cond_0

    .line 28
    .line 29
    sget v4, Ll/obc0;->ea:I

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    sget v4, Ll/obc0;->da:I

    .line 33
    .line 34
    :goto_0
    iget-object v5, p0, Ll/z5m0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;

    .line 35
    .line 36
    iget-object v5, v5, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;->c:Lv/VImage;

    .line 37
    .line 38
    invoke-virtual {v5, v4}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundResource(I)V

    .line 39
    .line 40
    .line 41
    iget-object v4, p0, Ll/z5m0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;

    .line 42
    .line 43
    iget-object v4, v4, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;->b:Lv/VLinear;

    .line 44
    .line 45
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    iget-object v2, p0, Ll/z5m0;->b:Ll/b6m0;

    .line 50
    .line 51
    if-eqz v0, :cond_1

    .line 52
    .line 53
    invoke-virtual {v2}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    sget v2, Ll/n9c0;->c1:I

    .line 62
    .line 63
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    goto :goto_1

    .line 68
    :cond_1
    invoke-virtual {v2}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    sget v2, Ll/n9c0;->b1:I

    .line 77
    .line 78
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    :goto_1
    const/high16 v2, 0x40800000    # 4.0f

    .line 83
    .line 84
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 85
    .line 86
    .line 87
    move-result v2

    .line 88
    int-to-float v2, v2

    .line 89
    invoke-static {v0, v2}, Ll/jde;->b(IF)Landroid/graphics/drawable/Drawable;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-virtual {v4, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isHideAgeFromSVipWithOutMe()Z

    .line 97
    .line 98
    .line 99
    move-result p1

    .line 100
    iget-object v0, p0, Ll/z5m0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;

    .line 101
    .line 102
    const/4 v2, 0x0

    .line 103
    if-eqz p1, :cond_2

    .line 104
    .line 105
    iget-object p1, v0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;->d:Lv/VText;

    .line 106
    .line 107
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 108
    .line 109
    .line 110
    iget-object p0, p0, Ll/z5m0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;

    .line 111
    .line 112
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;->b:Lv/VLinear;

    .line 113
    .line 114
    sget p1, Ll/qa00;->a:I

    .line 115
    .line 116
    invoke-virtual {p0, p1, v2, p1, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 117
    .line 118
    .line 119
    return-void

    .line 120
    :cond_2
    iget-object p1, v0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;->d:Lv/VText;

    .line 121
    .line 122
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 123
    .line 124
    .line 125
    iget-object p1, p0, Ll/z5m0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;

    .line 126
    .line 127
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;->b:Lv/VLinear;

    .line 128
    .line 129
    sget v0, Ll/qa00;->a:I

    .line 130
    .line 131
    sget v3, Ll/qa00;->e:I

    .line 132
    .line 133
    invoke-virtual {p1, v0, v2, v3, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 134
    .line 135
    .line 136
    iget-object p0, p0, Ll/z5m0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;

    .line 137
    .line 138
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;->d:Lv/VText;

    .line 139
    .line 140
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 145
    .line 146
    .line 147
    return-void
.end method

.method public final k(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/z5m0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;->g:Lv/VText;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    if-eqz p1, :cond_3

    .line 10
    .line 11
    if-nez p2, :cond_0

    .line 12
    .line 13
    goto :goto_1

    .line 14
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->relationState:Ljava/lang/String;

    .line 15
    .line 16
    const-string v1, "beLiked"

    .line 17
    .line 18
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    const/4 v1, 0x1

    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    iget-object p2, p0, Ll/z5m0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;

    .line 30
    .line 31
    if-eqz p1, :cond_1

    .line 32
    .line 33
    iget-object p1, p2, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;->g:Lv/VText;

    .line 34
    .line 35
    const-string p2, "\u5979\u559c\u6b22\u4e86\u4f60"

    .line 36
    .line 37
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    iget-object p1, p2, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;->g:Lv/VText;

    .line 42
    .line 43
    const-string p2, "\u4ed6\u559c\u6b22\u4e86\u4f60"

    .line 44
    .line 45
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 46
    .line 47
    .line 48
    :goto_0
    iget-object p0, p0, Ll/z5m0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;

    .line 49
    .line 50
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;->g:Lv/VText;

    .line 51
    .line 52
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_2
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->relationState:Ljava/lang/String;

    .line 57
    .line 58
    const-string p2, "likeMatched"

    .line 59
    .line 60
    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    if-eqz p1, :cond_3

    .line 65
    .line 66
    iget-object p1, p0, Ll/z5m0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;

    .line 67
    .line 68
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;->g:Lv/VText;

    .line 69
    .line 70
    const-string p2, "\u76f8\u4e92\u559c\u6b22"

    .line 71
    .line 72
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 73
    .line 74
    .line 75
    iget-object p0, p0, Ll/z5m0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;

    .line 76
    .line 77
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;->g:Lv/VText;

    .line 78
    .line 79
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 80
    .line 81
    .line 82
    :cond_3
    :goto_1
    return-void
.end method

.method public l(Ll/vak0;)V
    .locals 9
    .param p1    # Ll/vak0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    move-object v1, v0

    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {p1}, Ll/vak0;->r()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    :goto_0
    if-eqz p1, :cond_2

    .line 11
    .line 12
    iget-object v2, p1, Ll/vak0;->c:Ll/nsv;

    .line 13
    .line 14
    if-nez v2, :cond_1

    .line 15
    .line 16
    goto :goto_1

    .line 17
    :cond_1
    iget-object v0, v2, Ll/nsv;->a:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    :cond_2
    :goto_1
    const/16 v2, 0x8

    .line 22
    .line 23
    if-nez v0, :cond_3

    .line 24
    .line 25
    iget-object p1, p0, Ll/z5m0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;

    .line 26
    .line 27
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;->a:Lv/VText;

    .line 28
    .line 29
    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Ll/z5m0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;

    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;->k:Lv/VLinear;

    .line 35
    .line 36
    invoke-virtual {p0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_3
    invoke-virtual {p0, v1, v0}, Ll/z5m0;->k(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;Lcom/p1/mobile/putong/data/User;)V

    .line 41
    .line 42
    .line 43
    invoke-direct {p0, v0}, Ll/z5m0;->i(Lcom/p1/mobile/putong/data/User;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p1}, Ll/vak0;->r()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->identity:Ljava/lang/String;

    .line 51
    .line 52
    invoke-static {v1}, Ll/i9o0;->n(Ljava/lang/String;)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    iget-object v3, p0, Ll/z5m0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;

    .line 57
    .line 58
    iget-object v3, v3, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;->n:Landroid/widget/TextView;

    .line 59
    .line 60
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 61
    .line 62
    .line 63
    move-result v4

    .line 64
    const/4 v5, 0x1

    .line 65
    xor-int/2addr v4, v5

    .line 66
    invoke-static {v3, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 67
    .line 68
    .line 69
    iget-object v3, p0, Ll/z5m0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;

    .line 70
    .line 71
    iget-object v3, v3, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;->n:Landroid/widget/TextView;

    .line 72
    .line 73
    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 74
    .line 75
    .line 76
    iget-object v1, p0, Ll/z5m0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;

    .line 77
    .line 78
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;->n:Landroid/widget/TextView;

    .line 79
    .line 80
    invoke-virtual {p1}, Ll/vak0;->r()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;

    .line 81
    .line 82
    .line 83
    move-result-object v3

    .line 84
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceUserProfileConfig;->identity:Ljava/lang/String;

    .line 85
    .line 86
    invoke-static {v3}, Ll/i9o0;->m(Ljava/lang/String;)I

    .line 87
    .line 88
    .line 89
    move-result v3

    .line 90
    invoke-virtual {v1, v3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 91
    .line 92
    .line 93
    iget-object v1, p0, Ll/z5m0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;

    .line 94
    .line 95
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;->e:Lv/VLinear;

    .line 96
    .line 97
    const/high16 v3, 0x40a00000    # 5.0f

    .line 98
    .line 99
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 100
    .line 101
    .line 102
    move-result v3

    .line 103
    invoke-static {v1, v3}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {p0, v0}, Ll/z5m0;->j(Lcom/p1/mobile/putong/data/User;)V

    .line 107
    .line 108
    .line 109
    iget-object v1, p0, Ll/z5m0;->a:Ll/x3t;

    .line 110
    .line 111
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 112
    .line 113
    .line 114
    move-result-object v3

    .line 115
    iget-object v4, p0, Ll/z5m0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;

    .line 116
    .line 117
    iget-object v6, v4, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;->q:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 118
    .line 119
    iget-object v7, v4, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;->r:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 120
    .line 121
    iget-object v8, v4, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;->s:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 122
    .line 123
    iget-object v4, v4, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;->t:Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 124
    .line 125
    filled-new-array {v6, v7, v8, v4}, [Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;

    .line 126
    .line 127
    .line 128
    move-result-object v4

    .line 129
    invoke-virtual {v1, v3, v4}, Ll/x3t;->k(Landroid/content/Context;[Lcom/p1/mobile/putong/live/livingroom/common/usercard/CommonMedalView;)V

    .line 130
    .line 131
    .line 132
    iget-object v1, p0, Ll/z5m0;->a:Ll/x3t;

    .line 133
    .line 134
    invoke-virtual {v1, v0, v5}, Ll/x3t;->z(Lcom/p1/mobile/putong/data/User;Z)V

    .line 135
    .line 136
    .line 137
    iget-object v1, p0, Ll/z5m0;->a:Ll/x3t;

    .line 138
    .line 139
    new-instance v3, Ll/x5m0;

    .line 140
    .line 141
    invoke-direct {v3, p0}, Ll/x5m0;-><init>(Ll/z5m0;)V

    .line 142
    .line 143
    .line 144
    invoke-virtual {v1, v3}, Ll/x3t;->B(Ll/y20;)V

    .line 145
    .line 146
    .line 147
    iget-object v1, p0, Ll/z5m0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;

    .line 148
    .line 149
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;->a:Lv/VText;

    .line 150
    .line 151
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 152
    .line 153
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 154
    .line 155
    .line 156
    iget-object v0, p0, Ll/z5m0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;

    .line 157
    .line 158
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;->a:Lv/VText;

    .line 159
    .line 160
    const/4 v1, 0x0

    .line 161
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 162
    .line 163
    .line 164
    iget-object v0, p0, Ll/z5m0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;

    .line 165
    .line 166
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;->a:Lv/VText;

    .line 167
    .line 168
    const-string v1, "#ccffffff"

    .line 169
    .line 170
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 171
    .line 172
    .line 173
    move-result v1

    .line 174
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 175
    .line 176
    .line 177
    iget-object v0, p0, Ll/z5m0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;

    .line 178
    .line 179
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;->k:Lv/VLinear;

    .line 180
    .line 181
    invoke-static {v0, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 182
    .line 183
    .line 184
    iget-object v0, p0, Ll/z5m0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;

    .line 185
    .line 186
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;->f:Lv/VLinear;

    .line 187
    .line 188
    invoke-static {v0, v5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 189
    .line 190
    .line 191
    iget-object v0, p0, Ll/z5m0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;

    .line 192
    .line 193
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;->o:Lv/VText;

    .line 194
    .line 195
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 196
    .line 197
    .line 198
    invoke-virtual {p0, p1}, Ll/z5m0;->m(Ll/vak0;)V

    .line 199
    .line 200
    .line 201
    iget-object p1, p0, Ll/z5m0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;

    .line 202
    .line 203
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;->g:Lv/VText;

    .line 204
    .line 205
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 206
    .line 207
    .line 208
    move-result p1

    .line 209
    if-nez p1, :cond_5

    .line 210
    .line 211
    iget-object p1, p0, Ll/z5m0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;

    .line 212
    .line 213
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;->i:Lv/VText;

    .line 214
    .line 215
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 216
    .line 217
    .line 218
    move-result p1

    .line 219
    if-nez p1, :cond_5

    .line 220
    .line 221
    iget-object p1, p0, Ll/z5m0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;

    .line 222
    .line 223
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;->j:Lv/VText;

    .line 224
    .line 225
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 226
    .line 227
    .line 228
    move-result p1

    .line 229
    if-eqz p1, :cond_4

    .line 230
    .line 231
    goto :goto_2

    .line 232
    :cond_4
    iget-object p0, p0, Ll/z5m0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;

    .line 233
    .line 234
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;->f:Lv/VLinear;

    .line 235
    .line 236
    const/4 p1, 0x0

    .line 237
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 238
    .line 239
    .line 240
    move-result p1

    .line 241
    invoke-static {p0, p1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 242
    .line 243
    .line 244
    return-void

    .line 245
    :cond_5
    :goto_2
    iget-object p0, p0, Ll/z5m0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;

    .line 246
    .line 247
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;->f:Lv/VLinear;

    .line 248
    .line 249
    const/high16 p1, 0x41400000    # 12.0f

    .line 250
    .line 251
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 252
    .line 253
    .line 254
    move-result p1

    .line 255
    invoke-static {p0, p1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 256
    .line 257
    .line 258
    return-void
.end method

.method public final m(Ll/vak0;)V
    .locals 5

    .line 1
    invoke-virtual {p1}, Ll/vak0;->p()Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Ll/z5m0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;->l:Lv/VDraweeView;

    .line 11
    .line 12
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-virtual {p1}, Ll/vak0;->j()Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const/4 v2, 0x1

    .line 21
    if-eqz v0, :cond_2

    .line 22
    .line 23
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;->backendUrl:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    if-nez v3, :cond_2

    .line 30
    .line 31
    iget-object v3, p0, Ll/z5m0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;

    .line 32
    .line 33
    iget-object v3, v3, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;->l:Lv/VDraweeView;

    .line 34
    .line 35
    invoke-static {v3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p1}, Ll/vak0;->p()Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    iget-wide v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;->grade:J

    .line 43
    .line 44
    invoke-static {v3, v4}, Ll/kny;->a(J)Z

    .line 45
    .line 46
    .line 47
    move-result v3

    .line 48
    if-eqz v3, :cond_1

    .line 49
    .line 50
    sget v3, Ll/i0k;->b:I

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_1
    sget v3, Ll/i0k;->a:I

    .line 54
    .line 55
    :goto_0
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;->backendUrl:Ljava/lang/String;

    .line 56
    .line 57
    iget-object v4, p0, Ll/z5m0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;

    .line 58
    .line 59
    iget-object v4, v4, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;->l:Lv/VDraweeView;

    .line 60
    .line 61
    invoke-static {v0, v4, v3}, Ll/i0k;->c(Ljava/lang/String;Lv/VDraweeView;I)V

    .line 62
    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_2
    iget-object v0, p0, Ll/z5m0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;

    .line 66
    .line 67
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;->l:Lv/VDraweeView;

    .line 68
    .line 69
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 70
    .line 71
    .line 72
    :goto_1
    invoke-virtual {p1}, Ll/vak0;->n()Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    if-eqz p1, :cond_4

    .line 77
    .line 78
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;->iconUrl:Ljava/lang/String;

    .line 79
    .line 80
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    if-eqz v0, :cond_3

    .line 85
    .line 86
    goto :goto_2

    .line 87
    :cond_3
    iget-object v0, p0, Ll/z5m0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;

    .line 88
    .line 89
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;->m:Lv/VDraweeView;

    .line 90
    .line 91
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 92
    .line 93
    .line 94
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;->iconUrl:Ljava/lang/String;

    .line 95
    .line 96
    iget-object v1, p0, Ll/z5m0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;

    .line 97
    .line 98
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;->m:Lv/VDraweeView;

    .line 99
    .line 100
    sget v2, Ll/i0k;->a:I

    .line 101
    .line 102
    invoke-static {v0, v1, v2}, Ll/i0k;->c(Ljava/lang/String;Lv/VDraweeView;I)V

    .line 103
    .line 104
    .line 105
    iget-object v0, p0, Ll/z5m0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;

    .line 106
    .line 107
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;->m:Lv/VDraweeView;

    .line 108
    .line 109
    new-instance v1, Ll/y5m0;

    .line 110
    .line 111
    invoke-direct {v1, p0, p1}, Ll/y5m0;-><init>(Ll/z5m0;Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;)V

    .line 112
    .line 113
    .line 114
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 115
    .line 116
    .line 117
    return-void

    .line 118
    :cond_4
    :goto_2
    iget-object p0, p0, Ll/z5m0;->c:Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;

    .line 119
    .line 120
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/usercard/view/VirtualVoiceUserCardMedalAndNameView;->m:Lv/VDraweeView;

    .line 121
    .line 122
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 123
    .line 124
    .line 125
    return-void
.end method
