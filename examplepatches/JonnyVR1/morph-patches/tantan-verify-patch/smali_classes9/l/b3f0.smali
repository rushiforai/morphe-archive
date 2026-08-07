.class public Ll/b3f0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/p2f0;",
        ">;"
    }
.end annotation


# instance fields
.field public A:Lcom/p1/mobile/android/app/Act;

.field public B:Ll/p2f0;

.field public C:Lcom/p1/mobile/putong/data/Picture$ImageUri;

.field public D:Lcom/p1/mobile/putong/data/Media;

.field public a:Landroid/widget/ScrollView;

.field public b:Lv/VLinear;

.field public c:Lv/VDraweeView;

.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Landroid/widget/LinearLayout;

.field public h:Lv/VText;

.field public i:Lv/VText;

.field public j:Landroid/widget/LinearLayout;

.field public k:Lv/VText;

.field public l:Lv/VText;

.field public m:Landroid/widget/LinearLayout;

.field public n:Lv/VText;

.field public o:Lv/VText;

.field public p:Landroid/widget/LinearLayout;

.field public q:Lv/VText;

.field public r:Lv/VText;

.field public s:Landroid/widget/LinearLayout;

.field public t:Lv/VText;

.field public u:Lv/VText;

.field public v:Lv/VLinear;

.field public w:Lv/VLinear;

.field public x:Lv/VLinear;

.field public y:Landroid/view/View;

.field public z:Lv/VText;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/b3f0;->C:Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 6
    .line 7
    iput-object v0, p0, Ll/b3f0;->D:Lcom/p1/mobile/putong/data/Media;

    .line 8
    .line 9
    iput-object p1, p0, Ll/b3f0;->A:Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    return-void
.end method

.method private synthetic A(Ljava/lang/String;Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    const-string v0, "share_pannel"

    .line 10
    .line 11
    const-string v1, "wechat_moment"

    .line 12
    .line 13
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    filled-new-array {v0}, [Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "e_user_profile_share_popup_share"

    .line 22
    .line 23
    invoke-static {v1, p2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 24
    .line 25
    .line 26
    invoke-static {p1}, Ll/lik0;->c(Ljava/lang/String;)Z

    .line 27
    .line 28
    .line 29
    move-result p2

    .line 30
    if-eqz p2, :cond_0

    .line 31
    .line 32
    const-string p0, "\u6b64\u7528\u6237\u4e0d\u53ef\u88ab\u5206\u4eab"

    .line 33
    .line 34
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_0
    iget-object p2, p0, Ll/b3f0;->A:Lcom/p1/mobile/android/app/Act;

    .line 39
    .line 40
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 41
    .line 42
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 43
    .line 44
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/api/g;->rg(Ljava/lang/String;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {p2, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    new-instance p2, Ll/z2f0;

    .line 53
    .line 54
    invoke-direct {p2, p0}, Ll/z2f0;-><init>(Ll/b3f0;)V

    .line 55
    .line 56
    .line 57
    new-instance p0, Ll/a3f0;

    .line 58
    .line 59
    invoke-direct {p0}, Ll/a3f0;-><init>()V

    .line 60
    .line 61
    .line 62
    invoke-static {p2, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method private synthetic C(Ljava/lang/Boolean;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/b3f0;->q()Landroid/graphics/Bitmap;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iget-object v0, p0, Ll/b3f0;->A:Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    new-instance v1, Ll/r2f0;

    .line 14
    .line 15
    invoke-direct {v1, p0, p1}, Ll/r2f0;-><init>(Ll/b3f0;Landroid/graphics/Bitmap;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/i1k;->d(Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    const-string p0, "\u8be5\u7528\u6237\u672a\u5f00\u542f\u5206\u4eab\u529f\u80fd"

    .line 23
    .line 24
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public static synthetic a(Ll/b3f0;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/b3f0;->y(Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const-string p0, "\u8be5\u7528\u6237\u672a\u5f00\u542f\u5206\u4eab\u529f\u80fd"

    .line 2
    .line 3
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic c(Ll/b3f0;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/b3f0;->z(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic d(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const-string p0, "\u8be5\u7528\u6237\u672a\u5f00\u542f\u5206\u4eab\u529f\u80fd"

    .line 2
    .line 3
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic e(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const-string p0, "\u8be5\u7528\u6237\u672a\u5f00\u542f\u5206\u4eab\u529f\u80fd"

    .line 2
    .line 3
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic f(Ll/b3f0;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/b3f0;->A(Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i(Ll/b3f0;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/b3f0;->x(Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic j(Ll/b3f0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/b3f0;->v(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic k(Ll/b3f0;Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/b3f0;->B(Landroid/graphics/Bitmap;)V

    return-void
.end method

.method public static synthetic l(Ll/b3f0;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/b3f0;->w(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic m(Ll/b3f0;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/b3f0;->C(Ljava/lang/Boolean;)V

    return-void
.end method

.method private synthetic v(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const-string v0, "e_user_profile_share_popup_cancel"

    .line 10
    .line 11
    invoke-static {v0, p1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/b3f0;->A:Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method private synthetic w(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/b3f0;->q()Landroid/graphics/Bitmap;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const/4 p1, 0x0

    .line 12
    invoke-static {p0, p1}, Ll/i1k;->k(Landroid/graphics/Bitmap;Z)Z

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    const-string p0, "\u8be5\u7528\u6237\u672a\u5f00\u542f\u5206\u4eab\u529f\u80fd"

    .line 17
    .line 18
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method private synthetic y(Ljava/lang/String;Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    const-string v0, "share_pannel"

    .line 10
    .line 11
    const-string v1, "wechat_friend"

    .line 12
    .line 13
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    filled-new-array {v0}, [Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "e_user_profile_share_popup_share"

    .line 22
    .line 23
    invoke-static {v1, p2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 24
    .line 25
    .line 26
    invoke-static {p1}, Ll/lik0;->c(Ljava/lang/String;)Z

    .line 27
    .line 28
    .line 29
    move-result p2

    .line 30
    if-eqz p2, :cond_0

    .line 31
    .line 32
    const-string p0, "\u6b64\u7528\u6237\u4e0d\u53ef\u88ab\u5206\u4eab"

    .line 33
    .line 34
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_0
    iget-object p2, p0, Ll/b3f0;->A:Lcom/p1/mobile/android/app/Act;

    .line 39
    .line 40
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 41
    .line 42
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 43
    .line 44
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/api/g;->rg(Ljava/lang/String;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {p2, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    new-instance p2, Ll/x2f0;

    .line 53
    .line 54
    invoke-direct {p2, p0}, Ll/x2f0;-><init>(Ll/b3f0;)V

    .line 55
    .line 56
    .line 57
    new-instance p0, Ll/y2f0;

    .line 58
    .line 59
    invoke-direct {p0}, Ll/y2f0;-><init>()V

    .line 60
    .line 61
    .line 62
    invoke-static {p2, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 67
    .line 68
    .line 69
    return-void
.end method


# virtual methods
.method public A3(Ljava/lang/String;)V
    .locals 6

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/dkb;->oa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Ll/dkb;->oa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    iget-object v0, p0, Ll/b3f0;->A:Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 27
    .line 28
    .line 29
    const/4 v0, 0x0

    .line 30
    :goto_0
    iget-object v1, p0, Ll/b3f0;->f:Lv/VText;

    .line 31
    .line 32
    const/4 v2, 0x3

    .line 33
    invoke-static {v2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    const/4 v4, 0x1

    .line 38
    invoke-virtual {v1, v3, v4}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 39
    .line 40
    .line 41
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    iget-object v3, p0, Ll/b3f0;->d:Lv/VText;

    .line 48
    .line 49
    const/16 v5, 0x8

    .line 50
    .line 51
    if-nez v1, :cond_1

    .line 52
    .line 53
    invoke-static {v2}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {v3, v1, v4}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 58
    .line 59
    .line 60
    iget-object v1, p0, Ll/b3f0;->d:Lv/VText;

    .line 61
    .line 62
    iget-object v2, v0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 63
    .line 64
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 65
    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_1
    invoke-virtual {v3, v5}, Landroid/view/View;->setVisibility(I)V

    .line 69
    .line 70
    .line 71
    :goto_1
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 72
    .line 73
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    iget-object v2, p0, Ll/b3f0;->e:Lv/VText;

    .line 78
    .line 79
    if-eqz v1, :cond_2

    .line 80
    .line 81
    new-instance v1, Ljava/lang/StringBuilder;

    .line 82
    .line 83
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 84
    .line 85
    .line 86
    iget-object v3, v0, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 87
    .line 88
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    const-string v3, ""

    .line 92
    .line 93
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 101
    .line 102
    .line 103
    goto :goto_2

    .line 104
    :cond_2
    invoke-virtual {v2, v5}, Landroid/view/View;->setVisibility(I)V

    .line 105
    .line 106
    .line 107
    :goto_2
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 108
    .line 109
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 110
    .line 111
    invoke-static {v1}, Ll/q8g0;->j0(Lcom/p1/mobile/putong/data/ProfileZodiac;)Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 116
    .line 117
    .line 118
    move-result v2

    .line 119
    iget-object v3, p0, Ll/b3f0;->g:Landroid/widget/LinearLayout;

    .line 120
    .line 121
    const/4 v4, 0x0

    .line 122
    if-nez v2, :cond_3

    .line 123
    .line 124
    invoke-virtual {v3, v4}, Landroid/view/View;->setVisibility(I)V

    .line 125
    .line 126
    .line 127
    iget-object v2, p0, Ll/b3f0;->i:Lv/VText;

    .line 128
    .line 129
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 130
    .line 131
    .line 132
    goto :goto_3

    .line 133
    :cond_3
    invoke-virtual {v3, v5}, Landroid/view/View;->setVisibility(I)V

    .line 134
    .line 135
    .line 136
    :goto_3
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 137
    .line 138
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 139
    .line 140
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Work;->industry:Ljava/lang/String;

    .line 141
    .line 142
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 143
    .line 144
    .line 145
    move-result v1

    .line 146
    iget-object v2, p0, Ll/b3f0;->j:Landroid/widget/LinearLayout;

    .line 147
    .line 148
    if-nez v1, :cond_4

    .line 149
    .line 150
    invoke-virtual {v2, v4}, Landroid/view/View;->setVisibility(I)V

    .line 151
    .line 152
    .line 153
    iget-object v1, p0, Ll/b3f0;->l:Lv/VText;

    .line 154
    .line 155
    iget-object v2, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 156
    .line 157
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 158
    .line 159
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Work;->industry:Ljava/lang/String;

    .line 160
    .line 161
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 162
    .line 163
    .line 164
    goto :goto_4

    .line 165
    :cond_4
    invoke-virtual {v2, v5}, Landroid/view/View;->setVisibility(I)V

    .line 166
    .line 167
    .line 168
    :goto_4
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 169
    .line 170
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->hometown:Ljava/lang/String;

    .line 171
    .line 172
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 173
    .line 174
    .line 175
    move-result v1

    .line 176
    iget-object v2, p0, Ll/b3f0;->m:Landroid/widget/LinearLayout;

    .line 177
    .line 178
    if-nez v1, :cond_5

    .line 179
    .line 180
    invoke-virtual {v2, v4}, Landroid/view/View;->setVisibility(I)V

    .line 181
    .line 182
    .line 183
    iget-object v1, p0, Ll/b3f0;->o:Lv/VText;

    .line 184
    .line 185
    iget-object v2, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 186
    .line 187
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->hometown:Ljava/lang/String;

    .line 188
    .line 189
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 190
    .line 191
    .line 192
    goto :goto_5

    .line 193
    :cond_5
    invoke-virtual {v2, v5}, Landroid/view/View;->setVisibility(I)V

    .line 194
    .line 195
    .line 196
    :goto_5
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 197
    .line 198
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->hangouts:Ljava/lang/String;

    .line 199
    .line 200
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 201
    .line 202
    .line 203
    move-result v1

    .line 204
    iget-object v2, p0, Ll/b3f0;->p:Landroid/widget/LinearLayout;

    .line 205
    .line 206
    if-nez v1, :cond_6

    .line 207
    .line 208
    invoke-virtual {v2, v4}, Landroid/view/View;->setVisibility(I)V

    .line 209
    .line 210
    .line 211
    iget-object v1, p0, Ll/b3f0;->r:Lv/VText;

    .line 212
    .line 213
    iget-object v2, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 214
    .line 215
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->hangouts:Ljava/lang/String;

    .line 216
    .line 217
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 218
    .line 219
    .line 220
    goto :goto_6

    .line 221
    :cond_6
    invoke-virtual {v2, v5}, Landroid/view/View;->setVisibility(I)V

    .line 222
    .line 223
    .line 224
    :goto_6
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 225
    .line 226
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 227
    .line 228
    .line 229
    move-result v1

    .line 230
    iget-object v2, p0, Ll/b3f0;->s:Landroid/widget/LinearLayout;

    .line 231
    .line 232
    if-nez v1, :cond_7

    .line 233
    .line 234
    invoke-virtual {v2, v4}, Landroid/view/View;->setVisibility(I)V

    .line 235
    .line 236
    .line 237
    iget-object v1, p0, Ll/b3f0;->u:Lv/VText;

    .line 238
    .line 239
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 240
    .line 241
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 242
    .line 243
    .line 244
    goto :goto_7

    .line 245
    :cond_7
    invoke-virtual {v2, v5}, Landroid/view/View;->setVisibility(I)V

    .line 246
    .line 247
    .line 248
    :goto_7
    iget-object v0, p0, Ll/b3f0;->z:Lv/VText;

    .line 249
    .line 250
    new-instance v1, Ll/q2f0;

    .line 251
    .line 252
    invoke-direct {v1, p0}, Ll/q2f0;-><init>(Ll/b3f0;)V

    .line 253
    .line 254
    .line 255
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 256
    .line 257
    .line 258
    iget-object v0, p0, Ll/b3f0;->v:Lv/VLinear;

    .line 259
    .line 260
    new-instance v1, Ll/s2f0;

    .line 261
    .line 262
    invoke-direct {v1, p0, p1}, Ll/s2f0;-><init>(Ll/b3f0;Ljava/lang/String;)V

    .line 263
    .line 264
    .line 265
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 266
    .line 267
    .line 268
    iget-object v0, p0, Ll/b3f0;->w:Lv/VLinear;

    .line 269
    .line 270
    new-instance v1, Ll/t2f0;

    .line 271
    .line 272
    invoke-direct {v1, p0, p1}, Ll/t2f0;-><init>(Ll/b3f0;Ljava/lang/String;)V

    .line 273
    .line 274
    .line 275
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 276
    .line 277
    .line 278
    iget-object v0, p0, Ll/b3f0;->x:Lv/VLinear;

    .line 279
    .line 280
    new-instance v1, Ll/u2f0;

    .line 281
    .line 282
    invoke-direct {v1, p0, p1}, Ll/u2f0;-><init>(Ll/b3f0;Ljava/lang/String;)V

    .line 283
    .line 284
    .line 285
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 286
    .line 287
    .line 288
    iget-object v0, p0, Ll/b3f0;->c:Lv/VDraweeView;

    .line 289
    .line 290
    const v1, 0x3f6147ae    # 0.88f

    .line 291
    .line 292
    .line 293
    invoke-virtual {v0, v1}, Lcom/facebook/drawee/view/DraweeView;->setAspectRatio(F)V

    .line 294
    .line 295
    .line 296
    iget-object v0, p0, Ll/b3f0;->c:Lv/VDraweeView;

    .line 297
    .line 298
    invoke-virtual {p0, v0}, Ll/b3f0;->E(Lcom/facebook/drawee/view/SimpleDraweeView;)V

    .line 299
    .line 300
    .line 301
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 302
    .line 303
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 304
    .line 305
    invoke-virtual {v0, p1}, Ll/dkb;->oa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 306
    .line 307
    .line 308
    move-result-object p1

    .line 309
    invoke-virtual {p1, v4}, Lcom/p1/mobile/putong/data/User;->media(I)Lcom/p1/mobile/putong/data/Media;

    .line 310
    .line 311
    .line 312
    move-result-object p1

    .line 313
    iput-object p1, p0, Ll/b3f0;->D:Lcom/p1/mobile/putong/data/Media;

    .line 314
    .line 315
    instance-of v0, p1, Lcom/p1/mobile/putong/data/Video;

    .line 316
    .line 317
    if-eqz v0, :cond_8

    .line 318
    .line 319
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 320
    .line 321
    .line 322
    move-result-object p1

    .line 323
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->aspectRatioBiggest()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 324
    .line 325
    .line 326
    move-result-object p1

    .line 327
    iput-object p1, p0, Ll/b3f0;->C:Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 328
    .line 329
    goto :goto_8

    .line 330
    :cond_8
    invoke-static {p1}, Ll/nwb;->f(Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 331
    .line 332
    .line 333
    move-result-object p1

    .line 334
    iput-object p1, p0, Ll/b3f0;->C:Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 335
    .line 336
    :goto_8
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 337
    .line 338
    iget-object v0, p0, Ll/b3f0;->c:Lv/VDraweeView;

    .line 339
    .line 340
    iget-object v1, p0, Ll/b3f0;->C:Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 341
    .line 342
    new-instance v2, Ll/b3f0$a;

    .line 343
    .line 344
    invoke-direct {v2, p0}, Ll/b3f0$a;-><init>(Ll/b3f0;)V

    .line 345
    .line 346
    .line 347
    invoke-virtual {p1, v0, v1, v2}, Ll/fsb0;->C0(Lcom/facebook/drawee/view/DraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Ll/fn2;)V

    .line 348
    .line 349
    .line 350
    return-void
.end method

.method public final synthetic B(Landroid/graphics/Bitmap;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/b3f0;->A:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    const-string v0, ""

    .line 4
    .line 5
    invoke-static {p0, v0, p1}, Ll/i1k;->i(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Landroid/graphics/Bitmap;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const-string p0, "\u56fe\u7247\u5df2\u4fdd\u5b58\u5230\u76f8\u518c"

    .line 12
    .line 13
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/b3f0;->A:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public E(Lcom/facebook/drawee/view/SimpleDraweeView;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/wlj;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/wlj;->p()Lcom/facebook/drawee/generic/RoundingParams;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    new-instance p0, Lcom/facebook/drawee/generic/RoundingParams;

    .line 14
    .line 15
    invoke-direct {p0}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 16
    .line 17
    .line 18
    :cond_0
    sget v0, Ll/qa00;->o:I

    .line 19
    .line 20
    int-to-float v1, v0

    .line 21
    int-to-float v2, v0

    .line 22
    const/4 v3, 0x0

    .line 23
    invoke-virtual {p0, v1, v2, v3, v3}, Lcom/facebook/drawee/generic/RoundingParams;->r(FFFF)Lcom/facebook/drawee/generic/RoundingParams;

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Ll/wlj;

    .line 31
    .line 32
    invoke-virtual {v1, p0}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p1}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    check-cast p0, Ll/wlj;

    .line 40
    .line 41
    sget v1, Ll/dbc0;->o2:I

    .line 42
    .line 43
    invoke-virtual {p0, v1}, Ll/wlj;->z(I)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p1}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    check-cast p0, Ll/wlj;

    .line 51
    .line 52
    new-instance p1, Ll/rc80;

    .line 53
    .line 54
    int-to-float v0, v0

    .line 55
    const/4 v1, 0x3

    .line 56
    invoke-direct {p1, v0, v1}, Ll/rc80;-><init>(FI)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0, p1}, Ll/wlj;->E(Landroid/graphics/drawable/Drawable;)V

    .line 60
    .line 61
    .line 62
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
    check-cast p1, Ll/p2f0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/b3f0;->p(Ll/p2f0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/b3f0;->n(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public n(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/c3f0;->b(Ll/b3f0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public p(Ll/p2f0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/b3f0;->B:Ll/p2f0;

    .line 2
    .line 3
    return-void
.end method

.method public final q()Landroid/graphics/Bitmap;
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Ll/b3f0;->A:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    sget v2, Ll/dbc0;->Sp:I

    .line 10
    .line 11
    invoke-static {v1, v2}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    iget-object v1, v0, Ll/b3f0;->A:Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    sget v3, Ll/dbc0;->Tp:I

    .line 22
    .line 23
    invoke-static {v1, v3}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    .line 24
    .line 25
    .line 26
    move-result-object v9

    .line 27
    iget-object v1, v0, Ll/b3f0;->b:Lv/VLinear;

    .line 28
    .line 29
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    iget-object v3, v0, Ll/b3f0;->b:Lv/VLinear;

    .line 34
    .line 35
    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    sget-object v4, Landroid/graphics/Bitmap$Config;->ARGB_4444:Landroid/graphics/Bitmap$Config;

    .line 40
    .line 41
    invoke-static {v1, v3, v4}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 42
    .line 43
    .line 44
    move-result-object v10

    .line 45
    new-instance v1, Landroid/graphics/Canvas;

    .line 46
    .line 47
    invoke-direct {v1, v10}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 48
    .line 49
    .line 50
    iget-object v3, v0, Ll/b3f0;->b:Lv/VLinear;

    .line 51
    .line 52
    invoke-virtual {v3, v1}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    .line 53
    .line 54
    .line 55
    const/4 v1, 0x0

    .line 56
    move v3, v1

    .line 57
    :goto_0
    iget-object v4, v0, Ll/b3f0;->a:Landroid/widget/ScrollView;

    .line 58
    .line 59
    invoke-virtual {v4}, Landroid/view/ViewGroup;->getChildCount()I

    .line 60
    .line 61
    .line 62
    move-result v4

    .line 63
    if-ge v1, v4, :cond_0

    .line 64
    .line 65
    iget-object v4, v0, Ll/b3f0;->a:Landroid/widget/ScrollView;

    .line 66
    .line 67
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 68
    .line 69
    .line 70
    move-result-object v4

    .line 71
    invoke-virtual {v4}, Landroid/view/View;->getHeight()I

    .line 72
    .line 73
    .line 74
    move-result v4

    .line 75
    add-int/2addr v3, v4

    .line 76
    add-int/lit8 v1, v1, 0x1

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_0
    int-to-double v3, v3

    .line 80
    invoke-static {}, Ll/bnl0;->y0()I

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    const/high16 v11, 0x42200000    # 40.0f

    .line 85
    .line 86
    invoke-static {v11}, Ll/bnl0;->w(F)I

    .line 87
    .line 88
    .line 89
    move-result v5

    .line 90
    sub-int/2addr v1, v5

    .line 91
    int-to-double v5, v1

    .line 92
    const-wide v12, 0x4001c28f5c28f5c3L    # 2.22

    .line 93
    .line 94
    .line 95
    .line 96
    .line 97
    div-double/2addr v5, v12

    .line 98
    add-double/2addr v3, v5

    .line 99
    double-to-int v1, v3

    .line 100
    const/high16 v3, 0x42900000    # 72.0f

    .line 101
    .line 102
    invoke-static {v3}, Ll/bnl0;->w(F)I

    .line 103
    .line 104
    .line 105
    move-result v3

    .line 106
    add-int v6, v1, v3

    .line 107
    .line 108
    invoke-static {}, Ll/bnl0;->y0()I

    .line 109
    .line 110
    .line 111
    move-result v1

    .line 112
    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_4444:Landroid/graphics/Bitmap$Config;

    .line 113
    .line 114
    invoke-static {v1, v6, v3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 115
    .line 116
    .line 117
    move-result-object v14

    .line 118
    new-instance v1, Landroid/graphics/Canvas;

    .line 119
    .line 120
    invoke-direct {v1, v14}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 121
    .line 122
    .line 123
    invoke-static {}, Ll/bnl0;->y0()I

    .line 124
    .line 125
    .line 126
    move-result v5

    .line 127
    const/4 v7, 0x0

    .line 128
    const/4 v8, 0x0

    .line 129
    const/4 v3, 0x0

    .line 130
    const/4 v4, 0x0

    .line 131
    invoke-virtual/range {v0 .. v8}, Ll/b3f0;->u(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;IIIIII)V

    .line 132
    .line 133
    .line 134
    const/high16 v15, 0x41a00000    # 20.0f

    .line 135
    .line 136
    invoke-static {v15}, Ll/bnl0;->w(F)I

    .line 137
    .line 138
    .line 139
    move-result v3

    .line 140
    const/high16 v16, 0x42100000    # 36.0f

    .line 141
    .line 142
    invoke-static/range {v16 .. v16}, Ll/bnl0;->w(F)I

    .line 143
    .line 144
    .line 145
    move-result v4

    .line 146
    iget-object v2, v0, Ll/b3f0;->b:Lv/VLinear;

    .line 147
    .line 148
    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    .line 149
    .line 150
    .line 151
    move-result v5

    .line 152
    iget-object v2, v0, Ll/b3f0;->b:Lv/VLinear;

    .line 153
    .line 154
    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    .line 155
    .line 156
    .line 157
    move-result v6

    .line 158
    move-object v2, v10

    .line 159
    invoke-virtual/range {v0 .. v8}, Ll/b3f0;->s(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;IIIIII)V

    .line 160
    .line 161
    .line 162
    invoke-static {v15}, Ll/bnl0;->w(F)I

    .line 163
    .line 164
    .line 165
    move-result v3

    .line 166
    invoke-static/range {v16 .. v16}, Ll/bnl0;->w(F)I

    .line 167
    .line 168
    .line 169
    move-result v2

    .line 170
    iget-object v4, v0, Ll/b3f0;->b:Lv/VLinear;

    .line 171
    .line 172
    invoke-virtual {v4}, Landroid/view/View;->getHeight()I

    .line 173
    .line 174
    .line 175
    move-result v4

    .line 176
    add-int/2addr v4, v2

    .line 177
    invoke-static {}, Ll/bnl0;->y0()I

    .line 178
    .line 179
    .line 180
    move-result v2

    .line 181
    invoke-static {v11}, Ll/bnl0;->w(F)I

    .line 182
    .line 183
    .line 184
    move-result v5

    .line 185
    sub-int v5, v2, v5

    .line 186
    .line 187
    invoke-static {}, Ll/bnl0;->y0()I

    .line 188
    .line 189
    .line 190
    move-result v2

    .line 191
    invoke-static {v11}, Ll/bnl0;->w(F)I

    .line 192
    .line 193
    .line 194
    move-result v6

    .line 195
    sub-int/2addr v2, v6

    .line 196
    int-to-double v6, v2

    .line 197
    div-double/2addr v6, v12

    .line 198
    double-to-int v6, v6

    .line 199
    const/4 v7, 0x0

    .line 200
    move-object v2, v9

    .line 201
    invoke-virtual/range {v0 .. v8}, Ll/b3f0;->s(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;IIIIII)V

    .line 202
    .line 203
    .line 204
    return-object v14
.end method

.method public s(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;IIIIII)V
    .locals 1

    .line 1
    new-instance p0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/graphics/Rect;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Landroid/graphics/Rect;

    .line 7
    .line 8
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 9
    .line 10
    .line 11
    iput p7, p0, Landroid/graphics/Rect;->left:I

    .line 12
    .line 13
    iput p8, p0, Landroid/graphics/Rect;->top:I

    .line 14
    .line 15
    add-int/2addr p7, p5

    .line 16
    iput p7, p0, Landroid/graphics/Rect;->right:I

    .line 17
    .line 18
    add-int/2addr p8, p6

    .line 19
    iput p8, p0, Landroid/graphics/Rect;->bottom:I

    .line 20
    .line 21
    iput p3, v0, Landroid/graphics/Rect;->left:I

    .line 22
    .line 23
    iput p4, v0, Landroid/graphics/Rect;->top:I

    .line 24
    .line 25
    add-int/2addr p3, p5

    .line 26
    iput p3, v0, Landroid/graphics/Rect;->right:I

    .line 27
    .line 28
    add-int/2addr p4, p6

    .line 29
    iput p4, v0, Landroid/graphics/Rect;->bottom:I

    .line 30
    .line 31
    const/4 p0, 0x0

    .line 32
    invoke-virtual {p1, p2, p0, v0, p0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public u(Landroid/graphics/Canvas;Landroid/graphics/Bitmap;IIIIII)V
    .locals 1

    .line 1
    new-instance p0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/graphics/Rect;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Landroid/graphics/Rect;

    .line 7
    .line 8
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 9
    .line 10
    .line 11
    iput p7, p0, Landroid/graphics/Rect;->left:I

    .line 12
    .line 13
    iput p8, p0, Landroid/graphics/Rect;->top:I

    .line 14
    .line 15
    add-int/2addr p7, p5

    .line 16
    iput p7, p0, Landroid/graphics/Rect;->right:I

    .line 17
    .line 18
    add-int/2addr p8, p6

    .line 19
    iput p8, p0, Landroid/graphics/Rect;->bottom:I

    .line 20
    .line 21
    iput p3, v0, Landroid/graphics/Rect;->left:I

    .line 22
    .line 23
    iput p4, v0, Landroid/graphics/Rect;->top:I

    .line 24
    .line 25
    add-int/2addr p3, p5

    .line 26
    iput p3, v0, Landroid/graphics/Rect;->right:I

    .line 27
    .line 28
    add-int/2addr p4, p6

    .line 29
    iput p4, v0, Landroid/graphics/Rect;->bottom:I

    .line 30
    .line 31
    new-instance p0, Landroid/graphics/NinePatch;

    .line 32
    .line 33
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getNinePatchChunk()[B

    .line 34
    .line 35
    .line 36
    move-result-object p3

    .line 37
    const/4 p4, 0x0

    .line 38
    invoke-direct {p0, p2, p3, p4}, Landroid/graphics/NinePatch;-><init>(Landroid/graphics/Bitmap;[BLjava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0, p1, v0}, Landroid/graphics/NinePatch;->draw(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final synthetic x(Ljava/lang/String;Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    const-string v0, "share_pannel"

    .line 10
    .line 11
    const-string v1, "save_picture"

    .line 12
    .line 13
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    filled-new-array {v0}, [Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "e_user_profile_share_popup_share"

    .line 22
    .line 23
    invoke-static {v1, p2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 24
    .line 25
    .line 26
    iget-object p2, p0, Ll/b3f0;->A:Lcom/p1/mobile/android/app/Act;

    .line 27
    .line 28
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 29
    .line 30
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 31
    .line 32
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/api/g;->rg(Ljava/lang/String;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p2, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    new-instance p2, Ll/v2f0;

    .line 41
    .line 42
    invoke-direct {p2, p0}, Ll/v2f0;-><init>(Ll/b3f0;)V

    .line 43
    .line 44
    .line 45
    new-instance p0, Ll/w2f0;

    .line 46
    .line 47
    invoke-direct {p0}, Ll/w2f0;-><init>()V

    .line 48
    .line 49
    .line 50
    invoke-static {p2, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public final synthetic z(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/b3f0;->q()Landroid/graphics/Bitmap;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const/4 p1, 0x1

    .line 12
    invoke-static {p0, p1}, Ll/i1k;->k(Landroid/graphics/Bitmap;Z)Z

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    const-string p0, "\u8be5\u7528\u6237\u672a\u5f00\u542f\u5206\u4eab\u529f\u80fd"

    .line 17
    .line 18
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method
