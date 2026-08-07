.class public Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpPortraitFrag;
.super Lcom/p1/mobile/android/app/Frag;
.source "SourceFile"


# instance fields
.field public A:Ll/x20;

.field public B:Landroid/view/View;

.field public C:Landroid/view/View;

.field public D:Lv/VText;

.field public E:Lv/VText;

.field public F:Lcom/tantan/library/svga/SVGAnimationView;

.field public G:Lcom/p1/mobile/putong/data/Gender;

.field public z:Landroid/view/View;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/android/app/Frag;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic A4(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpPortraitFrag;->A:Ll/x20;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpPortraitFrag;->A:Ll/x20;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/x20;->call()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public static B4()Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpPortraitFrag;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpPortraitFrag;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpPortraitFrag;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Landroid/os/Bundle;

    .line 7
    .line 8
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method private r()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpPortraitFrag;->z:Landroid/view/View;

    .line 2
    .line 3
    sget v1, Ll/wcc0;->b0:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lv/VText;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpPortraitFrag;->E:Lv/VText;

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpPortraitFrag;->z:Landroid/view/View;

    .line 14
    .line 15
    sget v1, Ll/wcc0;->X:I

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpPortraitFrag;->B:Landroid/view/View;

    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpPortraitFrag;->z:Landroid/view/View;

    .line 24
    .line 25
    sget v1, Ll/wcc0;->Y:I

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpPortraitFrag;->C:Landroid/view/View;

    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpPortraitFrag;->z:Landroid/view/View;

    .line 34
    .line 35
    sget v1, Ll/wcc0;->Z:I

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, Lv/VText;

    .line 42
    .line 43
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpPortraitFrag;->D:Lv/VText;

    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpPortraitFrag;->z:Landroid/view/View;

    .line 46
    .line 47
    sget v1, Ll/wcc0;->W:I

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    check-cast v0, Lcom/tantan/library/svga/SVGAnimationView;

    .line 54
    .line 55
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpPortraitFrag;->F:Lcom/tantan/library/svga/SVGAnimationView;

    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpPortraitFrag;->G:Lcom/p1/mobile/putong/data/Gender;

    .line 58
    .line 59
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-eqz v0, :cond_0

    .line 64
    .line 65
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpPortraitFrag;->F4()V

    .line 66
    .line 67
    .line 68
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpPortraitFrag;->B:Landroid/view/View;

    .line 69
    .line 70
    new-instance v1, Ll/wlf0;

    .line 71
    .line 72
    invoke-direct {v1, p0}, Ll/wlf0;-><init>(Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpPortraitFrag;)V

    .line 73
    .line 74
    .line 75
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 76
    .line 77
    .line 78
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    const-string v1, "signup_photo_config"

    .line 83
    .line 84
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->F(Ljava/lang/String;)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    if-nez v1, :cond_1

    .line 93
    .line 94
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    .line 95
    .line 96
    invoke-direct {v1, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    const-string v0, "title"

    .line 100
    .line 101
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 106
    .line 107
    .line 108
    move-result v1

    .line 109
    if-nez v1, :cond_1

    .line 110
    .line 111
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpPortraitFrag;->E:Lv/VText;

    .line 112
    .line 113
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 114
    .line 115
    .line 116
    :catch_0
    :cond_1
    return-void
.end method

.method public static synthetic z4(Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpPortraitFrag;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpPortraitFrag;->A4(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public C4(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpPortraitFrag;->A:Ll/x20;

    .line 2
    .line 3
    return-void
.end method

.method public D4(Lcom/p1/mobile/putong/data/Gender;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpPortraitFrag;->G:Lcom/p1/mobile/putong/data/Gender;

    .line 2
    .line 3
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpPortraitFrag;->F:Lcom/tantan/library/svga/SVGAnimationView;

    .line 4
    .line 5
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpPortraitFrag;->F4()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final varargs E4([Landroid/view/View;)V
    .locals 6

    .line 1
    invoke-static {p1}, Ll/jyb;->K([Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_2

    .line 6
    .line 7
    new-instance p0, Landroid/animation/AnimatorSet;

    .line 8
    .line 9
    invoke-direct {p0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 10
    .line 11
    .line 12
    array-length v0, p1

    .line 13
    const/4 v1, 0x0

    .line 14
    move v2, v1

    .line 15
    :goto_0
    if-ge v2, v0, :cond_1

    .line 16
    .line 17
    aget-object v3, p1, v2

    .line 18
    .line 19
    if-eqz v3, :cond_0

    .line 20
    .line 21
    sget-object v4, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 22
    .line 23
    const/4 v5, 0x6

    .line 24
    new-array v5, v5, [F

    .line 25
    .line 26
    fill-array-data v5, :array_0

    .line 27
    .line 28
    .line 29
    invoke-static {v3, v4, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    const/4 v4, 0x1

    .line 34
    new-array v4, v4, [Landroid/animation/Animator;

    .line 35
    .line 36
    aput-object v3, v4, v1

    .line 37
    .line 38
    invoke-virtual {p0, v4}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 39
    .line 40
    .line 41
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    const-wide/16 v0, 0x32

    .line 45
    .line 46
    invoke-virtual {p0, v0, v1}, Landroid/animation/AnimatorSet;->setStartDelay(J)V

    .line 47
    .line 48
    .line 49
    const-wide/16 v0, 0x1388

    .line 50
    .line 51
    invoke-virtual {p0, v0, v1}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 56
    .line 57
    .line 58
    :cond_2
    return-void

    .line 59
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
        0x0
        0x3f800000    # 1.0f
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final F4()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpPortraitFrag;->F:Lcom/tantan/library/svga/SVGAnimationView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpPortraitFrag;->G:Lcom/p1/mobile/putong/data/Gender;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_2

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpPortraitFrag;->F:Lcom/tantan/library/svga/SVGAnimationView;

    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpPortraitFrag;->G:Lcom/p1/mobile/putong/data/Gender;

    .line 20
    .line 21
    const-string v2, "female"

    .line 22
    .line 23
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    sget v1, Ll/bbc0;->F1:I

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    sget v1, Ll/bbc0;->G1:I

    .line 33
    .line 34
    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpPortraitFrag;->G:Lcom/p1/mobile/putong/data/Gender;

    .line 46
    .line 47
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-eqz v1, :cond_1

    .line 52
    .line 53
    const-string v1, "https://auto.tancdn.com/v1/raw/f4973703-3fdb-40f1-b31c-2dfc7c47fc5614.svga"

    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_1
    const-string v1, "https://auto.tancdn.com/v1/raw/cd16e9f0-10d8-420e-8ac9-5ca497c7714c14.svga"

    .line 57
    .line 58
    :goto_1
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    const/4 v1, 0x1

    .line 63
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    iget-object v2, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpPortraitFrag;->F:Lcom/tantan/library/svga/SVGAnimationView;

    .line 72
    .line 73
    invoke-virtual {v0, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpPortraitFrag;->C:Landroid/view/View;

    .line 77
    .line 78
    iget-object v2, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpPortraitFrag;->D:Lv/VText;

    .line 79
    .line 80
    const/4 v3, 0x2

    .line 81
    new-array v3, v3, [Landroid/view/View;

    .line 82
    .line 83
    const/4 v4, 0x0

    .line 84
    aput-object v0, v3, v4

    .line 85
    .line 86
    aput-object v2, v3, v1

    .line 87
    .line 88
    invoke-virtual {p0, v3}, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpPortraitFrag;->E4([Landroid/view/View;)V

    .line 89
    .line 90
    .line 91
    :cond_2
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpPortraitFrag;->z:Landroid/view/View;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget v0, Ll/hec0;->Y:I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpPortraitFrag;->z:Landroid/view/View;

    .line 13
    .line 14
    :cond_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpPortraitFrag;->r()V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/accountai/frag/SignUpPortraitFrag;->z:Landroid/view/View;

    .line 18
    .line 19
    return-object p0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/android/app/Frag;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
