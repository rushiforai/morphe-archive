.class public Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/RelativeLayout;",
        "Ll/iam<",
        "Ll/ebg;",
        ">;"
    }
.end annotation


# static fields
.field public static final F:I

.field public static final G:I


# instance fields
.field public A:Lv/VText;

.field public B:Lv/VText;

.field public C:Ll/ebg;

.field public D:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

.field public E:Ljava/lang/String;

.field public a:Landroid/widget/LinearLayout;

.field public b:Landroid/view/View;

.field public c:Landroid/widget/LinearLayout;

.field public d:Lv/VEditText;

.field public e:Lv/VText;

.field public f:Landroid/view/View;

.field public g:Landroid/widget/RelativeLayout;

.field public h:Landroid/widget/FrameLayout;

.field public i:Lv/VImage;

.field public j:Lv/VImage;

.field public k:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public l:Lv/VText;

.field public m:Landroid/view/View;

.field public n:Landroid/view/View;

.field public o:Landroid/view/View;

.field public p:Landroid/view/View;

.field public q:Landroid/view/View;

.field public r:Landroid/view/View;

.field public s:Landroid/view/View;

.field public t:Landroid/widget/ScrollView;

.field public u:Landroid/widget/LinearLayout;

.field public v:Landroid/widget/LinearLayout;

.field public w:Lv/VText;

.field public x:Lv/VText;

.field public y:Landroid/widget/LinearLayout;

.field public z:Lv/VText;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/high16 v0, 0x42fe0000    # 127.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sput v0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->F:I

    .line 8
    .line 9
    const v0, 0x440c8000    # 562.0f

    .line 10
    .line 11
    .line 12
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    sput v0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->G:I

    .line 17
    .line 18
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private H()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->D:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->d:Lv/VEditText;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->hideInput(Landroid/view/View;)Z

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->D:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 25
    .line 26
    .line 27
    :cond_1
    return-void
.end method

.method private synthetic L(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->C:Ll/ebg;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ebg;->c4()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic M()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->C:Ll/ebg;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->getColor()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->getIcon()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->getText()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    invoke-virtual {v0, v1, v2, v3}, Ll/ebg;->d4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const-string v0, "unclickable"

    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->E:Ljava/lang/String;

    .line 21
    .line 22
    return-void
.end method

.method private synthetic N(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->E:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "editable"

    .line 4
    .line 5
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Z3:I

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Dialog$e;->F(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->a4:I

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    new-instance v1, Ll/ids;

    .line 44
    .line 45
    invoke-direct {v1, p0}, Ll/ids;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->v0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Y3:I

    .line 57
    .line 58
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Dialog$e;->m0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    const/4 p1, 0x1

    .line 67
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->q(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 72
    .line 73
    .line 74
    :cond_0
    return-void
.end method

.method private synthetic O(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->C:Ll/ebg;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ebg;->S3()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic Q(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->f0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;Lcom/p1/mobile/putong/live/base/data/BLiveMedalColor;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->W(Lcom/p1/mobile/putong/live/base/data/BLiveMedalColor;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->Q(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->O(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Landroid/view/View;Ll/ruf0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->S(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->P(Landroid/view/View;)V

    return-void
.end method

.method private getColor()Ljava/lang/String;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->u:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    :goto_0
    if-ge v1, v0, :cond_1

    .line 9
    .line 10
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->u:Landroid/widget/LinearLayout;

    .line 11
    .line 12
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/MedalEditItemView;

    .line 17
    .line 18
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/MedalEditItemView;->b()Z

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    if-eqz v3, :cond_0

    .line 23
    .line 24
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/MedalEditItemView;->getName()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0

    .line 29
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    const-string p0, ""

    .line 33
    .line 34
    return-object p0
.end method

.method private getIcon()Ljava/lang/String;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->v:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    :goto_0
    if-ge v1, v0, :cond_1

    .line 9
    .line 10
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->v:Landroid/widget/LinearLayout;

    .line 11
    .line 12
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/MedalEditItemView;

    .line 17
    .line 18
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/MedalEditItemView;->b()Z

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    if-eqz v3, :cond_0

    .line 23
    .line 24
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/MedalEditItemView;->getName()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0

    .line 29
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    const-string p0, ""

    .line 33
    .line 34
    return-object p0
.end method

.method private getInputFilter()[Landroid/text/InputFilter;
    .locals 2

    .line 1
    new-instance p0, Ll/ucs;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/ucs;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    new-array v0, v0, [Landroid/text/InputFilter;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    aput-object p0, v0, v1

    .line 11
    .line 12
    return-object v0
.end method

.method private getIntlInputFilter()[Landroid/text/InputFilter;
    .locals 3

    .line 1
    new-instance p0, Ll/gds;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/gds;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ll/hds;

    .line 7
    .line 8
    invoke-direct {v0}, Ll/hds;-><init>()V

    .line 9
    .line 10
    .line 11
    const/4 v1, 0x2

    .line 12
    new-array v1, v1, [Landroid/text/InputFilter;

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    aput-object p0, v1, v2

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    aput-object v0, v1, p0

    .line 19
    .line 20
    return-object v1
.end method

.method private getText()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->w:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const-string p0, ""

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public static synthetic i(Ljava/lang/CharSequence;IILandroid/text/Spanned;II)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    array-length p1, p0

    .line 10
    const/4 p2, 0x0

    .line 11
    :goto_0
    if-ge p2, p1, :cond_1

    .line 12
    .line 13
    aget-char p3, p0, p2

    .line 14
    .line 15
    invoke-static {p3}, Ll/a9g0;->i(C)Z

    .line 16
    .line 17
    .line 18
    move-result p3

    .line 19
    if-eqz p3, :cond_0

    .line 20
    .line 21
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->c4:I

    .line 22
    .line 23
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 24
    .line 25
    .line 26
    const-string p0, ""

    .line 27
    .line 28
    return-object p0

    .line 29
    :cond_0
    add-int/lit8 p2, p2, 0x1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    const/4 p0, 0x0

    .line 33
    return-object p0
.end method

.method private init()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->w:Lv/VText;

    .line 2
    .line 3
    sget v1, Ll/qa00;->m:I

    .line 4
    .line 5
    int-to-float v1, v1

    .line 6
    const/4 v2, 0x0

    .line 7
    const v3, -0x60607

    .line 8
    .line 9
    .line 10
    invoke-static {v3, v1, v2}, Ll/fc2;->a(IFZ)Landroid/graphics/drawable/Drawable;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->j:Lv/VImage;

    .line 18
    .line 19
    new-instance v1, Ll/bds;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/bds;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;)V

    .line 22
    .line 23
    .line 24
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->y:Landroid/widget/LinearLayout;

    .line 28
    .line 29
    new-instance v1, Ll/cds;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/cds;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;)V

    .line 32
    .line 33
    .line 34
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->f:Landroid/view/View;

    .line 38
    .line 39
    new-instance v1, Ll/dds;

    .line 40
    .line 41
    invoke-direct {v1, p0}, Ll/dds;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;)V

    .line 42
    .line 43
    .line 44
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->i:Lv/VImage;

    .line 48
    .line 49
    new-instance v1, Ll/eds;

    .line 50
    .line 51
    invoke-direct {v1, p0}, Ll/eds;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;)V

    .line 52
    .line 53
    .line 54
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->w:Lv/VText;

    .line 58
    .line 59
    new-instance v1, Ll/fds;

    .line 60
    .line 61
    invoke-direct {v1, p0}, Ll/fds;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;)V

    .line 62
    .line 63
    .line 64
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->M()V

    return-void
.end method

.method public static synthetic k(Ljava/lang/CharSequence;IILandroid/text/Spanned;II)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    array-length p1, p0

    .line 10
    if-lez p1, :cond_1

    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    aget-char p0, p0, p1

    .line 14
    .line 15
    invoke-static {p0}, Ll/xau;->h(C)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-nez p1, :cond_1

    .line 20
    .line 21
    invoke-static {p0}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-static {p1}, Ll/a9g0;->j(Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-nez p1, :cond_1

    .line 30
    .line 31
    invoke-static {p0}, Ljava/lang/Character;->isDigit(C)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-eqz p0, :cond_0

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->b4:I

    .line 39
    .line 40
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 41
    .line 42
    .line 43
    const-string p0, ""

    .line 44
    .line 45
    return-object p0

    .line 46
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 47
    return-object p0
.end method

.method public static synthetic l(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;Lcom/p1/mobile/putong/live/base/data/BLiveMedalIcon;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->T(Lcom/p1/mobile/putong/live/base/data/BLiveMedalIcon;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic m(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;Lcom/p1/mobile/putong/live/base/data/BLiveMedalColor;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->V(Lcom/p1/mobile/putong/live/base/data/BLiveMedalColor;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic n(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->N(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic p(Ljava/lang/CharSequence;IILandroid/text/Spanned;II)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-static {}, Ll/seg;->a()Ljava/util/regex/Pattern;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p1}, Ljava/util/regex/Matcher;->matches()Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_2

    .line 21
    .line 22
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const-string p1, "\u3164"

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-eqz p0, :cond_1

    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 36
    return-object p0

    .line 37
    :cond_2
    :goto_1
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->c4:I

    .line 38
    .line 39
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 40
    .line 41
    .line 42
    const-string p0, ""

    .line 43
    .line 44
    return-object p0
.end method

.method public static synthetic q(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->R(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->L(Landroid/view/View;)V

    return-void
.end method

.method private setPreviewPanelBackground(Ljava/lang/String;)V
    .locals 5

    .line 1
    const-string v0, "#"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->k:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Landroid/graphics/drawable/LayerDrawable;

    .line 21
    .line 22
    const/4 v2, 0x0

    .line 23
    invoke-virtual {v0, v2}, Landroid/graphics/drawable/LayerDrawable;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    check-cast v2, Landroid/graphics/drawable/GradientDrawable;

    .line 28
    .line 29
    const-string v3, "#0c"

    .line 30
    .line 31
    invoke-virtual {v3, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v4

    .line 35
    invoke-static {v4}, Ll/n3d0;->g(Ljava/lang/String;)I

    .line 36
    .line 37
    .line 38
    move-result v4

    .line 39
    invoke-virtual {v2, v4}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/LayerDrawable;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    check-cast v2, Landroid/graphics/drawable/GradientDrawable;

    .line 47
    .line 48
    sget-object v4, Landroid/graphics/drawable/GradientDrawable$Orientation;->TOP_BOTTOM:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 49
    .line 50
    invoke-virtual {v2, v4}, Landroid/graphics/drawable/GradientDrawable;->setOrientation(Landroid/graphics/drawable/GradientDrawable$Orientation;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/LayerDrawable;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    check-cast v1, Landroid/graphics/drawable/GradientDrawable;

    .line 58
    .line 59
    const-string v2, "#0a"

    .line 60
    .line 61
    invoke-virtual {v2, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    invoke-static {v2}, Ll/n3d0;->g(Ljava/lang/String;)I

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    const-string v4, "#07"

    .line 70
    .line 71
    invoke-virtual {v4, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v4

    .line 75
    invoke-static {v4}, Ll/n3d0;->g(Ljava/lang/String;)I

    .line 76
    .line 77
    .line 78
    move-result v4

    .line 79
    filled-new-array {v2, v4}, [I

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    invoke-virtual {v1, v2}, Landroid/graphics/drawable/GradientDrawable;->setColors([I)V

    .line 84
    .line 85
    .line 86
    const/4 v1, 0x3

    .line 87
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/LayerDrawable;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    check-cast v1, Landroid/graphics/drawable/GradientDrawable;

    .line 92
    .line 93
    invoke-virtual {v3, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    invoke-static {p1}, Ll/n3d0;->g(Ljava/lang/String;)I

    .line 98
    .line 99
    .line 100
    move-result p1

    .line 101
    invoke-virtual {v1, p1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 102
    .line 103
    .line 104
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->k:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 105
    .line 106
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 107
    .line 108
    .line 109
    return-void
.end method

.method public static synthetic u(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;Lcom/p1/mobile/putong/live/base/data/BLiveMedalIcon;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->U(Lcom/p1/mobile/putong/live/base/data/BLiveMedalIcon;)V

    return-void
.end method

.method public static bridge synthetic v(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;[C)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->F([C)Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic w(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;Ljava/lang/CharSequence;)I
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->I(Ljava/lang/CharSequence;)I

    move-result p0

    return p0
.end method

.method public static bridge synthetic x(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->K()Z

    move-result p0

    return p0
.end method


# virtual methods
.method public A(Ll/ebg;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->C:Ll/ebg;

    .line 2
    .line 3
    return-void
.end method

.method public B(Ljava/lang/String;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->E:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, -0x1

    .line 11
    sparse-switch v0, :sswitch_data_0

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :sswitch_0
    const-string v0, "editable"

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-nez p1, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 v1, 0x2

    .line 25
    goto :goto_0

    .line 26
    :sswitch_1
    const-string v0, "reviewing"

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    if-nez p1, :cond_1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    const/4 v1, 0x1

    .line 36
    goto :goto_0

    .line 37
    :sswitch_2
    const-string v0, "uneditable"

    .line 38
    .line 39
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-nez p1, :cond_2

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_2
    const/4 v1, 0x0

    .line 47
    :goto_0
    packed-switch v1, :pswitch_data_0

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :pswitch_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->X()V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :pswitch_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->c0()V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :pswitch_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->e0()V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :sswitch_data_0
    .sparse-switch
        -0x4584ac03 -> :sswitch_2
        0x1d63418a -> :sswitch_1
        0x5f82ee64 -> :sswitch_0
    .end sparse-switch

    .line 64
    .line 65
    .line 66
    .line 67
    .line 68
    .line 69
    .line 70
    .line 71
    .line 72
    .line 73
    .line 74
    .line 75
    .line 76
    .line 77
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final C(Ljava/lang/String;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->u:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const-string v1, ""

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    move v3, v2

    .line 11
    :goto_0
    if-ge v3, v0, :cond_1

    .line 12
    .line 13
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->u:Landroid/widget/LinearLayout;

    .line 14
    .line 15
    invoke-virtual {v4, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v4

    .line 19
    check-cast v4, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/MedalEditItemView;

    .line 20
    .line 21
    invoke-virtual {v4}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/MedalEditItemView;->getName()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v5

    .line 25
    invoke-static {p1, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v5

    .line 29
    if-eqz v5, :cond_0

    .line 30
    .line 31
    const/4 v1, 0x1

    .line 32
    invoke-virtual {v4, v1}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/MedalEditItemView;->setChecked(Z)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v4}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/MedalEditItemView;->getBackgroundColor()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    goto :goto_1

    .line 40
    :cond_0
    invoke-virtual {v4, v2}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/MedalEditItemView;->setChecked(Z)V

    .line 41
    .line 42
    .line 43
    :goto_1
    add-int/lit8 v3, v3, 0x1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->d0(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-direct {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->setPreviewPanelBackground(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->v:Landroid/widget/LinearLayout;

    .line 53
    .line 54
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    :goto_2
    if-ge v2, p1, :cond_2

    .line 59
    .line 60
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->v:Landroid/widget/LinearLayout;

    .line 61
    .line 62
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/MedalEditItemView;

    .line 67
    .line 68
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/MedalEditItemView;->setBackgroundColor(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    add-int/lit8 v2, v2, 0x1

    .line 72
    .line 73
    goto :goto_2

    .line 74
    :cond_2
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final E(Ljava/lang/String;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->v:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    :goto_0
    if-ge v1, v0, :cond_0

    .line 9
    .line 10
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->v:Landroid/widget/LinearLayout;

    .line 11
    .line 12
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/MedalEditItemView;

    .line 17
    .line 18
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/MedalEditItemView;->getName()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    invoke-static {p1, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/MedalEditItemView;->setChecked(Z)V

    .line 27
    .line 28
    .line 29
    add-int/lit8 v1, v1, 0x1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    return-void
.end method

.method public final F([C)Z
    .locals 7

    .line 1
    invoke-static {}, Ll/seg;->b()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    array-length v0, p1

    .line 6
    const/4 v1, 0x0

    .line 7
    move v2, v1

    .line 8
    move v3, v2

    .line 9
    move v4, v3

    .line 10
    :goto_0
    if-ge v2, v0, :cond_3

    .line 11
    .line 12
    aget-char v5, p1, v2

    .line 13
    .line 14
    invoke-static {v5}, Ll/a9g0;->h(C)Z

    .line 15
    .line 16
    .line 17
    move-result v6

    .line 18
    if-eqz v6, :cond_0

    .line 19
    .line 20
    add-int/lit8 v4, v4, 0x1

    .line 21
    .line 22
    :cond_0
    invoke-static {v5}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v6

    .line 26
    invoke-static {v6}, Ll/a9g0;->j(Ljava/lang/String;)Z

    .line 27
    .line 28
    .line 29
    move-result v6

    .line 30
    if-nez v6, :cond_1

    .line 31
    .line 32
    invoke-static {v5}, Ljava/lang/Character;->isDigit(C)Z

    .line 33
    .line 34
    .line 35
    move-result v5

    .line 36
    if-eqz v5, :cond_2

    .line 37
    .line 38
    :cond_1
    add-int/lit8 v3, v3, 0x1

    .line 39
    .line 40
    :cond_2
    add-int/lit8 v2, v2, 0x1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_3
    array-length v0, p1

    .line 44
    const/4 v2, 0x4

    .line 45
    const/4 v5, 0x1

    .line 46
    if-ne v3, v0, :cond_6

    .line 47
    .line 48
    if-eqz p0, :cond_4

    .line 49
    .line 50
    const/4 v2, 0x6

    .line 51
    :cond_4
    if-gt v3, v2, :cond_5

    .line 52
    .line 53
    return v5

    .line 54
    :cond_5
    return v1

    .line 55
    :cond_6
    array-length v0, p1

    .line 56
    const/4 v6, 0x3

    .line 57
    if-ne v4, v0, :cond_9

    .line 58
    .line 59
    if-eqz p0, :cond_7

    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_7
    move v2, v6

    .line 63
    :goto_1
    if-gt v4, v2, :cond_8

    .line 64
    .line 65
    return v5

    .line 66
    :cond_8
    return v1

    .line 67
    :cond_9
    const/4 v0, 0x2

    .line 68
    if-eqz p0, :cond_d

    .line 69
    .line 70
    array-length p0, p1

    .line 71
    if-le p0, v2, :cond_c

    .line 72
    .line 73
    if-ne v4, v0, :cond_a

    .line 74
    .line 75
    if-eq v3, v0, :cond_c

    .line 76
    .line 77
    :cond_a
    if-ne v4, v5, :cond_b

    .line 78
    .line 79
    if-ne v3, v2, :cond_b

    .line 80
    .line 81
    goto :goto_2

    .line 82
    :cond_b
    return v1

    .line 83
    :cond_c
    :goto_2
    return v5

    .line 84
    :cond_d
    array-length p0, p1

    .line 85
    if-le p0, v6, :cond_10

    .line 86
    .line 87
    if-ne v4, v0, :cond_e

    .line 88
    .line 89
    if-eq v3, v5, :cond_10

    .line 90
    .line 91
    :cond_e
    if-ne v4, v5, :cond_f

    .line 92
    .line 93
    if-ne v3, v6, :cond_f

    .line 94
    .line 95
    goto :goto_3

    .line 96
    :cond_f
    return v1

    .line 97
    :cond_10
    :goto_3
    return v5
.end method

.method public final G(Ljava/lang/CharSequence;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Ll/q8g0;->J(Ljava/lang/CharSequence;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 p1, 0x6

    .line 6
    if-gt p0, p1, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public final I(Ljava/lang/CharSequence;)I
    .locals 3

    .line 1
    const/4 p0, 0x6

    .line 2
    const/4 v0, 0x0

    .line 3
    move v1, v0

    .line 4
    :goto_0
    if-eqz p1, :cond_2

    .line 5
    .line 6
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 7
    .line 8
    .line 9
    move-result v2

    .line 10
    if-ge v1, v2, :cond_2

    .line 11
    .line 12
    invoke-interface {p1, v1}, Ljava/lang/CharSequence;->charAt(I)C

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    invoke-static {v2}, Ll/xau;->h(C)Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-eqz v2, :cond_0

    .line 21
    .line 22
    add-int/lit8 p0, p0, -0x2

    .line 23
    .line 24
    goto :goto_1

    .line 25
    :cond_0
    add-int/lit8 p0, p0, -0x1

    .line 26
    .line 27
    :goto_1
    if-gtz p0, :cond_1

    .line 28
    .line 29
    return v1

    .line 30
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_2
    return v0
.end method

.method public final J()V
    .locals 5

    .line 1
    new-instance v0, Ll/c0s;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->C:Ll/ebg;

    .line 4
    .line 5
    sget v2, Ll/jgc0;->g:I

    .line 6
    .line 7
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v3

    .line 11
    invoke-virtual {v3}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    const/4 v4, 0x0

    .line 16
    invoke-virtual {p0, v3, v4}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->z(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    invoke-direct {v0, v1, v2, v3}, Ll/c0s;-><init>(Ll/xzs;ILandroid/view/View;)V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->D:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->b:Landroid/view/View;

    .line 26
    .line 27
    new-instance v1, Ll/jds;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Ll/jds;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;)V

    .line 30
    .line 31
    .line 32
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->d:Lv/VEditText;

    .line 36
    .line 37
    new-instance v1, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel$a;

    .line 38
    .line 39
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->d:Lv/VEditText;

    .line 46
    .line 47
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->K()Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-eqz v1, :cond_0

    .line 52
    .line 53
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->getIntlInputFilter()[Landroid/text/InputFilter;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    goto :goto_0

    .line 58
    :cond_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->getInputFilter()[Landroid/text/InputFilter;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setFilters([Landroid/text/InputFilter;)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->e:Lv/VText;

    .line 66
    .line 67
    new-instance v1, Ll/vcs;

    .line 68
    .line 69
    invoke-direct {v1, p0}, Ll/vcs;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public final K()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/seg;->b()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/seg;->c()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    invoke-static {}, Ll/seg;->d()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public final synthetic P(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->C:Ll/ebg;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ebg;->S3()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic R(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->H()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic S(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->w:Lv/VText;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->d:Lv/VEditText;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->H()V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->C:Ll/ebg;

    .line 20
    .line 21
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->getColor()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->getIcon()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p1, v0, p0}, Ll/ebg;->a4(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final synthetic T(Lcom/p1/mobile/putong/live/base/data/BLiveMedalIcon;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMedalIcon;->name:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->E(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->C:Ll/ebg;

    .line 7
    .line 8
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->getColor()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->getIcon()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p1, p2, p0}, Ll/ebg;->a4(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic U(Lcom/p1/mobile/putong/live/base/data/BLiveMedalIcon;)V
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/MedalEditItemView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/MedalEditItemView;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 11
    .line 12
    const/high16 v2, 0x42480000    # 50.0f

    .line 13
    .line 14
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    invoke-direct {v1, v3, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 23
    .line 24
    .line 25
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->v:Landroid/widget/LinearLayout;

    .line 26
    .line 27
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-lez v2, :cond_0

    .line 32
    .line 33
    const/high16 v2, 0x41a00000    # 20.0f

    .line 34
    .line 35
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 40
    .line 41
    :cond_0
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMedalIcon;->url:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/MedalEditItemView;->setIcon(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMedalIcon;->name:Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/MedalEditItemView;->setName(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    new-instance v2, Ll/ycs;

    .line 52
    .line 53
    invoke-direct {v2, p0, p1}, Ll/ycs;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;Lcom/p1/mobile/putong/live/base/data/BLiveMedalIcon;)V

    .line 54
    .line 55
    .line 56
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 57
    .line 58
    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->v:Landroid/widget/LinearLayout;

    .line 60
    .line 61
    invoke-virtual {p0, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public final synthetic V(Lcom/p1/mobile/putong/live/base/data/BLiveMedalColor;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMedalColor;->name:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->C(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->C:Ll/ebg;

    .line 7
    .line 8
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->getColor()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->getIcon()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p1, p2, p0}, Ll/ebg;->a4(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic W(Lcom/p1/mobile/putong/live/base/data/BLiveMedalColor;)V
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/MedalEditItemView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/MedalEditItemView;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 11
    .line 12
    const/high16 v2, 0x42480000    # 50.0f

    .line 13
    .line 14
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    invoke-direct {v1, v3, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 23
    .line 24
    .line 25
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->u:Landroid/widget/LinearLayout;

    .line 26
    .line 27
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-lez v2, :cond_0

    .line 32
    .line 33
    const/high16 v2, 0x41a00000    # 20.0f

    .line 34
    .line 35
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 40
    .line 41
    :cond_0
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMedalColor;->color:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/MedalEditItemView;->setBackgroundColor(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMedalColor;->name:Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/MedalEditItemView;->setName(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    new-instance v2, Ll/zcs;

    .line 52
    .line 53
    invoke-direct {v2, p0, p1}, Ll/zcs;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;Lcom/p1/mobile/putong/live/base/data/BLiveMedalColor;)V

    .line 54
    .line 55
    .line 56
    invoke-static {v0, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 57
    .line 58
    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->u:Landroid/widget/LinearLayout;

    .line 60
    .line 61
    invoke-virtual {p0, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public final X()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->z:Lv/VText;

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->A:Lv/VText;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->z:Lv/VText;

    .line 13
    .line 14
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->G3:I

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->y:Landroid/widget/LinearLayout;

    .line 20
    .line 21
    sget v0, Ll/qa00;->k:I

    .line 22
    .line 23
    int-to-float v0, v0

    .line 24
    const/4 v1, 0x0

    .line 25
    const v2, -0x181e3

    .line 26
    .line 27
    .line 28
    invoke-static {v2, v0, v1}, Ll/fc2;->a(IFZ)Landroid/graphics/drawable/Drawable;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public Y()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->x:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->k:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->t:Landroid/widget/ScrollView;

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->y:Landroid/widget/LinearLayout;

    .line 18
    .line 19
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public Z(Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseMedalPanel;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->x:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->k:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->t:Landroid/widget/ScrollView;

    .line 14
    .line 15
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->y:Landroid/widget/LinearLayout;

    .line 19
    .line 20
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->t:Landroid/widget/ScrollView;

    .line 24
    .line 25
    new-instance v3, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel$b;

    .line 26
    .line 27
    invoke-direct {v3, p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel$b;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v3}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 31
    .line 32
    .line 33
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseMedalPanel;->template:Lcom/p1/mobile/putong/live/base/data/BLiveMedalEditTemplate;

    .line 34
    .line 35
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->u:Landroid/widget/LinearLayout;

    .line 36
    .line 37
    invoke-virtual {v3}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 38
    .line 39
    .line 40
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMedalEditTemplate;->colors:Ljava/util/List;

    .line 41
    .line 42
    invoke-static {v3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    if-nez v3, :cond_0

    .line 47
    .line 48
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMedalEditTemplate;->colors:Ljava/util/List;

    .line 49
    .line 50
    new-instance v4, Ll/wcs;

    .line 51
    .line 52
    invoke-direct {v4, p0}, Ll/wcs;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;)V

    .line 53
    .line 54
    .line 55
    invoke-static {v3, v4}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 56
    .line 57
    .line 58
    :cond_0
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->v:Landroid/widget/LinearLayout;

    .line 59
    .line 60
    invoke-virtual {v3}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 61
    .line 62
    .line 63
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMedalEditTemplate;->icons:Ljava/util/List;

    .line 64
    .line 65
    invoke-static {v3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 66
    .line 67
    .line 68
    move-result v3

    .line 69
    if-nez v3, :cond_1

    .line 70
    .line 71
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveMedalEditTemplate;->icons:Ljava/util/List;

    .line 72
    .line 73
    new-instance v3, Ll/xcs;

    .line 74
    .line 75
    invoke-direct {v3, p0}, Ll/xcs;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;)V

    .line 76
    .line 77
    .line 78
    invoke-static {v0, v3}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 79
    .line 80
    .line 81
    :cond_1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseMedalPanel;->editInfo:Lcom/p1/mobile/putong/live/base/data/BLiveMedalEditInfo;

    .line 82
    .line 83
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMedalEditInfo;->text:Ljava/lang/String;

    .line 84
    .line 85
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->setMedalText(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    invoke-static {}, Ll/seg;->b()Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    if-eqz v0, :cond_2

    .line 93
    .line 94
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->B:Lv/VText;

    .line 95
    .line 96
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMedalEditInfo;->reason:Ljava/lang/String;

    .line 97
    .line 98
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 99
    .line 100
    .line 101
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->B:Lv/VText;

    .line 102
    .line 103
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 104
    .line 105
    .line 106
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->A:Lv/VText;

    .line 107
    .line 108
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 109
    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->A:Lv/VText;

    .line 113
    .line 114
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMedalEditInfo;->reason:Ljava/lang/String;

    .line 115
    .line 116
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 117
    .line 118
    .line 119
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->A:Lv/VText;

    .line 120
    .line 121
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 122
    .line 123
    .line 124
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->B:Lv/VText;

    .line 125
    .line 126
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 127
    .line 128
    .line 129
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMedalEditInfo;->status:Ljava/lang/String;

    .line 130
    .line 131
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->B(Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMedalEditInfo;->color:Ljava/lang/String;

    .line 135
    .line 136
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->C(Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMedalEditInfo;->icon:Ljava/lang/String;

    .line 140
    .line 141
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->E(Ljava/lang/String;)V

    .line 142
    .line 143
    .line 144
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->C:Ll/ebg;

    .line 145
    .line 146
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMedalEditInfo;->color:Ljava/lang/String;

    .line 147
    .line 148
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMedalEditInfo;->icon:Ljava/lang/String;

    .line 149
    .line 150
    invoke-virtual {p0, v0, p1}, Ll/ebg;->a4(Ljava/lang/String;Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    return-void
.end method

.method public a0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->x:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->k:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->t:Landroid/widget/ScrollView;

    .line 14
    .line 15
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->y:Landroid/widget/LinearLayout;

    .line 19
    .line 20
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public b0(ILjava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    packed-switch p1, :pswitch_data_0

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    goto :goto_0

    .line 6
    :pswitch_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->s:Landroid/view/View;

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :pswitch_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->r:Landroid/view/View;

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :pswitch_2
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->q:Landroid/view/View;

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :pswitch_3
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->p:Landroid/view/View;

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :pswitch_4
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->o:Landroid/view/View;

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :pswitch_5
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->n:Landroid/view/View;

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :pswitch_6
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->m:Landroid/view/View;

    .line 25
    .line 26
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->C:Ll/ebg;

    .line 27
    .line 28
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->getText()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-static {p2, p3, p0}, Ll/vag;->l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {v0, p0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    new-instance p2, Ll/ads;

    .line 41
    .line 42
    invoke-direct {p2, p1}, Ll/ads;-><init>(Landroid/view/View;)V

    .line 43
    .line 44
    .line 45
    invoke-static {p2}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final c0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->z:Lv/VText;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->H3:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->z:Lv/VText;

    .line 9
    .line 10
    const/4 v1, -0x1

    .line 11
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->A:Lv/VText;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->y:Landroid/widget/LinearLayout;

    .line 20
    .line 21
    sget v0, Ll/qa00;->k:I

    .line 22
    .line 23
    int-to-float v0, v0

    .line 24
    const/4 v1, 0x0

    .line 25
    const/high16 v2, 0xc000000

    .line 26
    .line 27
    invoke-static {v2, v0, v1}, Ll/fc2;->a(IFZ)Landroid/graphics/drawable/Drawable;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public d0(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->l:Lv/VText;

    .line 2
    .line 3
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public final e0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->z:Lv/VText;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->G3:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->z:Lv/VText;

    .line 9
    .line 10
    const/4 v1, -0x1

    .line 11
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->A:Lv/VText;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->y:Landroid/widget/LinearLayout;

    .line 20
    .line 21
    sget v0, Ll/qa00;->k:I

    .line 22
    .line 23
    int-to-float v0, v0

    .line 24
    const/4 v1, 0x0

    .line 25
    const/high16 v2, 0xc000000

    .line 26
    .line 27
    invoke-static {v2, v0, v1}, Ll/fc2;->a(IFZ)Landroid/graphics/drawable/Drawable;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final f0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->D:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->J()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->D:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_3

    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->D:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->show()V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->d:Lv/VEditText;

    .line 22
    .line 23
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->getText()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->K()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->getText()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->G(Ljava/lang/CharSequence;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    goto :goto_0

    .line 45
    :cond_1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->getText()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->F([C)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    :goto_0
    if-eqz v0, :cond_2

    .line 58
    .line 59
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->d:Lv/VEditText;

    .line 60
    .line 61
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->getText()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setSelection(I)V

    .line 70
    .line 71
    .line 72
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->d:Lv/VEditText;

    .line 73
    .line 74
    invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z

    .line 75
    .line 76
    .line 77
    :cond_3
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/ebg;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->A(Ll/ebg;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->y(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->init()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public onMeasure(II)V
    .locals 5

    .line 1
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    sget v1, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->F:I

    .line 6
    .line 7
    sget v2, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->G:I

    .line 8
    .line 9
    add-int v3, v1, v2

    .line 10
    .line 11
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->f:Landroid/view/View;

    .line 12
    .line 13
    if-lt v0, v3, :cond_0

    .line 14
    .line 15
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    sub-int/2addr v0, v2

    .line 20
    iput v0, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->g:Landroid/widget/RelativeLayout;

    .line 23
    .line 24
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iput v2, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    iput v1, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 36
    .line 37
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->g:Landroid/widget/RelativeLayout;

    .line 38
    .line 39
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    sub-int/2addr v0, v1

    .line 44
    iput v0, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 45
    .line 46
    :goto_0
    invoke-super {p0, p1, p2}, Landroid/widget/RelativeLayout;->onMeasure(II)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public setMedalText(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;->w:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final y(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/kds;->a(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public z(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/lds;->b(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubMedalEditPanel;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
