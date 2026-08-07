.class public Ll/m520;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/d520;",
        ">;"
    }
.end annotation


# static fields
.field public static g:Ll/jxd0;


# instance fields
.field public a:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public b:Lv/VText;

.field public c:Lv/VText;

.field public d:Landroid/view/ViewStub;

.field public e:Landroid/view/ViewStub;

.field public f:Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Ll/jxd0;

    .line 2
    .line 3
    const-string v1, "liveShowTwoRoomInProfile"

    .line 4
    .line 5
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Ll/m520;->g:Ll/jxd0;

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Ll/y20;Ll/i420;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Ll/m520;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/m520;->i(Landroid/view/View;)V

    return-void
.end method

.method private synthetic i(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/m520;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/app/Activity;

    .line 8
    .line 9
    const-string p1, "live_setting_page"

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-static {p0, p1, v0}, Lcom/p1/mobile/putong/live/external/page/setting/LiveIndependentSettingAct;->Z1(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p0, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/m520;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/m520;->d:Landroid/view/ViewStub;

    .line 2
    .line 3
    invoke-static {p0}, Ll/bnl0;->E(Landroid/view/View;)Landroid/app/Activity;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    return-object p0
.end method

.method public c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/n520;->b(Ll/m520;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public d(Ll/d520;)V
    .locals 0

    .line 1
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e(Ll/i420;Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object p0, p0, Ll/m520;->f:Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView;

    .line 4
    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    invoke-virtual {p1}, Ll/i420;->c()Lcom/p1/mobile/putong/data/User;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView;->n0(Ljava/lang/Boolean;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    :cond_1
    :goto_0
    return-void
.end method

.method public f(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m520;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    xor-int/lit8 p1, p1, 0x1

    .line 6
    .line 7
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/d520;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/m520;->d(Ll/d520;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/m520;->c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public j(Ll/i420;Ll/i420;Ljava/lang/Boolean;Ll/y20;Z)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/i420;",
            "Ll/i420;",
            "Ljava/lang/Boolean;",
            "Ll/y20<",
            "Ll/i420;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/m520;->b:Lv/VText;

    .line 2
    .line 3
    const v1, -0xdededf

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/m520;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 10
    .line 11
    const/4 v1, -0x1

    .line 12
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/m520;->b:Lv/VText;

    .line 16
    .line 17
    sget-object v1, Landroid/graphics/Typeface;->SANS_SERIF:Landroid/graphics/Typeface;

    .line 18
    .line 19
    const/4 v2, 0x1

    .line 20
    invoke-virtual {v0, v1, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/m520;->b:Lv/VText;

    .line 24
    .line 25
    sget-object v1, Ll/tbs;->b:Ll/vwt;

    .line 26
    .line 27
    invoke-virtual {v1}, Ll/vwt;->R4()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 32
    .line 33
    .line 34
    if-eqz p5, :cond_0

    .line 35
    .line 36
    iget-object v0, p0, Ll/m520;->c:Lv/VText;

    .line 37
    .line 38
    sget-object v1, Ll/tbs;->b:Ll/vwt;

    .line 39
    .line 40
    invoke-virtual {v1}, Ll/vwt;->Q4()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 45
    .line 46
    .line 47
    new-instance v0, Ll/k520;

    .line 48
    .line 49
    invoke-direct {v0, p0}, Ll/k520;-><init>(Ll/m520;)V

    .line 50
    .line 51
    .line 52
    iget-object v1, p0, Ll/m520;->c:Lv/VText;

    .line 53
    .line 54
    invoke-virtual {v1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 55
    .line 56
    .line 57
    :cond_0
    iget-object v0, p0, Ll/m520;->c:Lv/VText;

    .line 58
    .line 59
    invoke-static {v0, p5}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 60
    .line 61
    .line 62
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result p5

    .line 66
    if-eqz p5, :cond_1

    .line 67
    .line 68
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 69
    .line 70
    .line 71
    move-result p3

    .line 72
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/m520;->k(Ll/i420;Ll/i420;ZLl/y20;)V

    .line 73
    .line 74
    .line 75
    return-void

    .line 76
    :cond_1
    invoke-virtual {p0, p1, p3, p4}, Ll/m520;->l(Ll/i420;Ljava/lang/Boolean;Ll/y20;)V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public final k(Ll/i420;Ll/i420;ZLl/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/i420;",
            "Ll/i420;",
            "Z",
            "Ll/y20<",
            "Ll/i420;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/m520;->e:Landroid/view/ViewStub;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileDoubleView;

    .line 8
    .line 9
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileDoubleView;->d(Ll/i420;Ll/i420;ZLl/y20;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final l(Ll/i420;Ljava/lang/Boolean;Ll/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/i420;",
            "Ljava/lang/Boolean;",
            "Ll/y20<",
            "Ll/i420;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/m520;->d:Landroid/view/ViewStub;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView;

    .line 8
    .line 9
    iput-object v0, p0, Ll/m520;->f:Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView;

    .line 10
    .line 11
    invoke-virtual {v0, p1, p2}, Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView;->m0(Ll/i420;Ljava/lang/Boolean;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/m520;->f:Lcom/p1/mobile/putong/live/external/page/profile/myroom/view/MyRoomInProfileSingleView;

    .line 15
    .line 16
    new-instance p2, Ll/l520;

    .line 17
    .line 18
    invoke-direct {p2, p3, p1}, Ll/l520;-><init>(Ll/y20;Ll/i420;)V

    .line 19
    .line 20
    .line 21
    invoke-static {p0, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method
