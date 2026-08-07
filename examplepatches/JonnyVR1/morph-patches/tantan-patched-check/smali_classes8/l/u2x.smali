.class public Ll/u2x;
.super Ll/hzw;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/u2x$b;,
        Ll/u2x$c;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/hzw<",
        "Ll/s2x;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Lv/VText;

.field public d:Lv/VList;

.field public e:Ll/u2x$b;

.field public f:Ll/s2x;


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

.method public static synthetic j(Ll/u2x;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/u2x;->n()V

    return-void
.end method

.method public static bridge synthetic k(Ll/u2x;)Ll/s2x;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u2x;->f:Ll/s2x;

    return-object p0
.end method


# virtual methods
.method public c(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u2x;->f:Ll/s2x;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/s2x;->k0()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x1

    .line 12
    return p0
.end method

.method public e(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/u2x;->f:Ll/s2x;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/s2x;->m0()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->ADDRESS_HOMETOWN:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 8
    .line 9
    if-ne p1, v0, :cond_0

    .line 10
    .line 11
    iget-object p1, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 12
    .line 13
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;->country:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {v0}, Ll/jyb;->M(Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->country:Ljava/util/List;

    .line 24
    .line 25
    iget-object p1, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 26
    .line 27
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 28
    .line 29
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;->province:Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {v0}, Ll/jyb;->M(Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iput-object v0, p1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->province:Ljava/util/List;

    .line 38
    .line 39
    iget-object p1, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 40
    .line 41
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 42
    .line 43
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 44
    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;->city:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {p0}, Ll/jyb;->M(Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    iput-object p0, p1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->city:Ljava/util/List;

    .line 52
    .line 53
    return-void

    .line 54
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->ADDRESS_LIVE_NOW:Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;

    .line 55
    .line 56
    if-ne p1, v0, :cond_1

    .line 57
    .line 58
    iget-object p1, p2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 59
    .line 60
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 61
    .line 62
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 63
    .line 64
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;->country:Ljava/lang/String;

    .line 65
    .line 66
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;->province:Ljava/lang/String;

    .line 67
    .line 68
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;->city:Ljava/lang/String;

    .line 69
    .line 70
    filled-new-array {p2, v0, p0}, [Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    iput-object p0, p1, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->address:Ljava/util/List;

    .line 79
    .line 80
    :cond_1
    return-void
.end method

.method public i(Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    iget-object p2, p0, Ll/u2x;->c:Lv/VText;

    .line 2
    .line 3
    const/4 v0, 0x3

    .line 4
    invoke-static {v0}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-virtual {p2, v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ll/hzw;->a()Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/MarryEditProfileSeriesAct;->d2()Z

    .line 17
    .line 18
    .line 19
    move-result p2

    .line 20
    iget-object v0, p0, Ll/u2x;->c:Lv/VText;

    .line 21
    .line 22
    if-eqz p2, :cond_0

    .line 23
    .line 24
    const-string p1, "\u6765\u81ea"

    .line 25
    .line 26
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarrySeriesType;->getTitleName()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 35
    .line 36
    .line 37
    :goto_0
    new-instance p1, Ll/u2x$b;

    .line 38
    .line 39
    iget-object p2, p0, Ll/u2x;->f:Ll/s2x;

    .line 40
    .line 41
    invoke-direct {p1, p0, p2}, Ll/u2x$b;-><init>(Ll/u2x;Ll/s2x;)V

    .line 42
    .line 43
    .line 44
    iput-object p1, p0, Ll/u2x;->e:Ll/u2x$b;

    .line 45
    .line 46
    iget-object p2, p0, Ll/u2x;->d:Lv/VList;

    .line 47
    .line 48
    invoke-virtual {p2, p1}, Lv/VList;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 49
    .line 50
    .line 51
    iget-object p1, p0, Ll/u2x;->d:Lv/VList;

    .line 52
    .line 53
    new-instance p2, Ll/u2x$a;

    .line 54
    .line 55
    invoke-direct {p2, p0}, Ll/u2x$a;-><init>(Ll/u2x;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p1, p2}, Landroid/widget/AdapterView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/s2x;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/u2x;->m(Ll/s2x;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/u2x;->l(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public l(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/v2x;->b(Ll/u2x;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public m(Ll/s2x;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/u2x;->f:Ll/s2x;

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic n()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/u2x;->d:Lv/VList;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Landroid/widget/AdapterView;->setSelection(I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public p()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u2x;->e:Ll/u2x$b;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public q(Ljava/util/List;Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/marry/profile/loop/bean/MarryAddressSelectData;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/u2x;->e:Ll/u2x$b;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/u2x$b;->b(Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/u2x;->e:Ll/u2x$b;

    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    .line 9
    .line 10
    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    iget-object p1, p0, Ll/u2x;->d:Lv/VList;

    .line 14
    .line 15
    new-instance p2, Ll/t2x;

    .line 16
    .line 17
    invoke-direct {p2, p0}, Ll/t2x;-><init>(Ll/u2x;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1, p2}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method
