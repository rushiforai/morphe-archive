.class public Ll/uyw;
.super Ll/hzw;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/hzw<",
        "Ll/syw;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Lv/VRelative;

.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Lv/VImage;

.field public g:Lv/VDraweeView;

.field public h:Lv/VImage;

.field public i:Landroid/widget/TextView;

.field public j:Lv/VImage;

.field public k:Lv/VImage;

.field public l:Lv/VText;

.field public m:Ll/syw;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/marry/profile/loop/base/MarryEditProfileBaseMvpFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/hzw;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/ui/marry/profile/loop/base/MarryEditProfileBaseMvpFrag;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic j(Ll/uyw;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/uyw;->m(Landroid/view/View;)V

    return-void
.end method

.method private synthetic m(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/uyw;->m:Ll/syw;

    .line 2
    .line 3
    iget-object p1, p1, Ll/syw;->a:Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 4
    .line 5
    if-eqz p1, :cond_4

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 13
    .line 14
    const-string v0, "verified"

    .line 15
    .line 16
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/hzw;->a()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;->b2()Ll/b2x;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    iget-object p0, p0, Ll/b2x;->k:Lv/VButton;

    .line 31
    .line 32
    invoke-virtual {p0}, Landroid/view/View;->performClick()Z

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_1
    const-string v0, "rejected"

    .line 37
    .line 38
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-eqz v0, :cond_2

    .line 43
    .line 44
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-virtual {p0}, Ll/hzw;->a()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-interface {p1, p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->U8(Lcom/p1/mobile/android/app/Act;)V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_2
    const-string v0, "pending"

    .line 61
    .line 62
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    if-eqz p1, :cond_3

    .line 67
    .line 68
    invoke-virtual {p0}, Ll/hzw;->a()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;->b2()Ll/b2x;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    iget-object p0, p0, Ll/b2x;->k:Lv/VButton;

    .line 77
    .line 78
    invoke-virtual {p0}, Landroid/view/View;->performClick()Z

    .line 79
    .line 80
    .line 81
    return-void

    .line 82
    :cond_3
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    invoke-virtual {p1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    invoke-virtual {p0}, Ll/hzw;->a()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-interface {p1, p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Eg(Lcom/p1/mobile/android/app/Act;)V

    .line 95
    .line 96
    .line 97
    :cond_4
    :goto_0
    return-void
.end method


# virtual methods
.method public c(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public e(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    return-void
.end method

.method public i(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    iget-object p2, p0, Ll/uyw;->d:Lv/VText;

    .line 2
    .line 3
    const/4 v0, 0x3

    .line 4
    invoke-static {v0}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    const/4 v2, 0x1

    .line 9
    invoke-virtual {p2, v1, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 10
    .line 11
    .line 12
    iget-object p2, p0, Ll/uyw;->d:Lv/VText;

    .line 13
    .line 14
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->getTitleName()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Ll/uyw;->l:Lv/VText;

    .line 22
    .line 23
    invoke-static {v0}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    invoke-virtual {p1, p2, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Ll/uyw;->l:Lv/VText;

    .line 31
    .line 32
    new-instance p2, Ll/tyw;

    .line 33
    .line 34
    invoke-direct {p2, p0}, Ll/tyw;-><init>(Ll/uyw;)V

    .line 35
    .line 36
    .line 37
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 38
    .line 39
    .line 40
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 41
    .line 42
    iget-object p0, p0, Ll/uyw;->g:Lv/VDraweeView;

    .line 43
    .line 44
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 45
    .line 46
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 47
    .line 48
    invoke-virtual {p2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 49
    .line 50
    .line 51
    move-result-object p2

    .line 52
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 53
    .line 54
    .line 55
    move-result-object p2

    .line 56
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p2

    .line 64
    invoke-virtual {p1, p0, p2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/syw;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/uyw;->l(Ll/syw;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/uyw;->k(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public k(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/vyw;->b(Ll/uyw;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public l(Ll/syw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/uyw;->m:Ll/syw;

    .line 2
    .line 3
    return-void
.end method
