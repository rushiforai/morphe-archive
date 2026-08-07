.class public Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$b;,
        Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;
    }
.end annotation


# instance fields
.field public c:Lv/VPager;

.field public d:Landroid/widget/LinearLayout;

.field public e:Lv/VText;

.field public f:Landroid/widget/LinearLayout;

.field public g:Landroid/widget/FrameLayout;

.field public h:Landroid/widget/FrameLayout;

.field public i:Landroid/widget/ImageView;

.field public j:Lv/VFrame;

.field public k:Lv/VText;

.field public l:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;

.field public m:Ljava/lang/String;

.field public n:Ljava/lang/String;

.field public o:I

.field public p:Ljava/lang/String;

.field public q:Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;

.field public r:Ljava/lang/Boolean;

.field public s:Lcom/p1/mobile/putong/data/User;

.field public t:Ll/vg60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$b;",
            ">;"
        }
    .end annotation
.end field

.field public u:I

.field public v:Ll/ie80;

.field public w:Ll/ie80;

.field public x:Z

.field public y:Ll/kcg0;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongAct;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->o:I

    .line 6
    .line 7
    invoke-static {}, Ll/vg60;->a()Ll/vg60;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->t:Ll/vg60;

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->u:I

    .line 15
    .line 16
    const/4 v0, 0x1

    .line 17
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->x:Z

    .line 18
    .line 19
    return-void
.end method

.method public static synthetic A2(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;Ll/vg60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->c3(Ll/vg60;)V

    return-void
.end method

.method public static bridge synthetic B2(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->p:Ljava/lang/String;

    return-object p0
.end method

.method public static bridge synthetic C2(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->o:I

    return p0
.end method

.method public static bridge synthetic D2(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->x:Z

    return-void
.end method

.method public static bridge synthetic E2(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->p:Ljava/lang/String;

    return-void
.end method

.method public static bridge synthetic F2(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->o:I

    return-void
.end method

.method public static bridge synthetic H2(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->s3()Z

    move-result p0

    return p0
.end method

.method public static K2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "moment id"

    .line 9
    .line 10
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    const-string p0, "user id"

    .line 14
    .line 15
    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    return-object v0
.end method

.method private N2()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->r:Ljava/lang/Boolean;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->n:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Ll/mrb0;->z(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->r:Ljava/lang/Boolean;

    .line 16
    .line 17
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->r:Ljava/lang/Boolean;

    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0
.end method

.method private Q2()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->n:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method private synthetic R2(Landroid/view/View;)V
    .locals 1

    .line 1
    sget-object p1, Ll/uqb0;->b0:Ll/sre0;

    .line 2
    .line 3
    iget-object p1, p1, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->n:Ljava/lang/String;

    .line 6
    .line 7
    invoke-interface {p1, v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->shouldLockComment(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    sget-object p1, Ll/uqb0;->b0:Ll/sre0;

    .line 14
    .line 15
    iget-object p1, p1, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-string v0, "moment_detail"

    .line 22
    .line 23
    invoke-interface {p1, p0, v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->showProofAgeDlg(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->q:Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;->t()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method private synthetic S2()V
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->d:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->d:Landroid/widget/LinearLayout;

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->e:Lv/VText;

    .line 13
    .line 14
    invoke-virtual {v1}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    const-wide/16 v1, 0x0

    .line 25
    .line 26
    :goto_0
    move-wide v3, v1

    .line 27
    goto :goto_1

    .line 28
    :cond_1
    const/high16 v1, 0x41f00000    # 30.0f

    .line 29
    .line 30
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    int-to-double v1, v1

    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->d:Landroid/widget/LinearLayout;

    .line 36
    .line 37
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    int-to-double v3, p0

    .line 42
    div-double/2addr v1, v3

    .line 43
    goto :goto_0

    .line 44
    :goto_1
    const-wide/16 v7, 0x0

    .line 45
    .line 46
    sget-object v9, Landroid/graphics/drawable/GradientDrawable$Orientation;->BOTTOM_TOP:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 47
    .line 48
    const-wide/high16 v5, 0x3ff0000000000000L    # 1.0

    .line 49
    .line 50
    invoke-static/range {v3 .. v9}, Ll/jde;->a(DDDLandroid/graphics/drawable/GradientDrawable$Orientation;)Landroid/graphics/drawable/Drawable;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {v0, p0}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method private synthetic W2()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->w:Ll/ie80;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->w:Ll/ie80;

    .line 10
    .line 11
    invoke-interface {v0}, Ll/ie80;->release()V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->v:Ll/ie80;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->v:Ll/ie80;

    .line 23
    .line 24
    invoke-interface {p0}, Ll/ie80;->release()V

    .line 25
    .line 26
    .line 27
    :cond_1
    return-void
.end method

.method public static synthetic X1(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->k3(Lcom/p1/mobile/putong/feed/data/Moment;)V

    return-void
.end method

.method public static synthetic Y1(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;Lcom/p1/mobile/putong/data/User;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->h3(Lcom/p1/mobile/putong/data/User;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic Z1(Lcom/p1/mobile/putong/feed/data/Moment;)Lcom/p1/mobile/putong/feed/data/Moment;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/Moment;->clone()Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->likes:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->haveLiked:Z

    .line 12
    .line 13
    return-object p0
.end method

.method public static synthetic a2(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->n3(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b2(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p0, v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic c2(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->t3()V

    return-void
.end method

.method public static synthetic d2(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->d3()Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic e2(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;)Lrx/c;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->g3()Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic g2(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;)Lcom/p1/mobile/putong/data/Media;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->j3()Lcom/p1/mobile/putong/data/Media;

    move-result-object p0

    return-object p0
.end method

.method private synthetic g3()Lrx/c;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->n:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Ll/mrb0;->W(Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic h2(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->Z2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i2(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->a3(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic k2(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->e3(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic l2(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->V2(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic m2(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->f3(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic n2(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->W2()V

    return-void
.end method

.method public static synthetic o2(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;Landroid/view/View;)V
    .locals 0

    .line 1
    sget-object p3, Ll/uqb0;->b0:Ll/sre0;

    .line 2
    .line 3
    iget-object p3, p3, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 6
    .line 7
    invoke-interface {p3, p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->shouldLockComment(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    sget-object p0, Ll/uqb0;->b0:Ll/sre0;

    .line 14
    .line 15
    iget-object p0, p0, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 16
    .line 17
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    const-string p2, "moment_detail"

    .line 24
    .line 25
    invoke-interface {p0, p1, p2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->showProofAgeDlg(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    invoke-virtual {p2}, Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;->t()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public static synthetic p2(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->S2()V

    return-void
.end method

.method public static synthetic q2(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$b;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->X2(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$b;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static q3(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;ILandroid/widget/TextView;Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;)V
    .locals 6

    .line 1
    const/4 v5, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move-object v1, p1

    .line 4
    move v2, p2

    .line 5
    move-object v3, p3

    .line 6
    move-object v4, p4

    .line 7
    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->r3(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;ILandroid/widget/TextView;Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;Ll/x20;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic r2(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;)Lcom/p1/mobile/putong/feed/data/Moment;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->i3()Lcom/p1/mobile/putong/feed/data/Moment;

    move-result-object p0

    return-object p0
.end method

.method public static r3(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;ILandroid/widget/TextView;Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;Ll/x20;)V
    .locals 0

    .line 1
    invoke-static {p2}, Ll/q8g0;->h0(I)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p3, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    new-instance p2, Ll/zy00;

    .line 9
    .line 10
    invoke-direct {p2, p0, p1, p4}, Ll/zy00;-><init>(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 14
    .line 15
    .line 16
    sget-object p2, Ll/uqb0;->b0:Ll/sre0;

    .line 17
    .line 18
    iget-object p2, p2, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 19
    .line 20
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 21
    .line 22
    invoke-interface {p2, p3}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->isCurrentMessageBlock(Ljava/lang/String;)Z

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    if-nez p2, :cond_0

    .line 27
    .line 28
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 29
    .line 30
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 31
    .line 32
    .line 33
    move-result-object p3

    .line 34
    invoke-interface {p3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p3

    .line 38
    invoke-virtual {p2, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result p2

    .line 42
    xor-int/lit8 p2, p2, 0x1

    .line 43
    .line 44
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 45
    .line 46
    .line 47
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 48
    .line 49
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {p4, p1, p0, p5}, Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;->s(Ljava/lang/String;Ljava/lang/String;Ll/x20;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public static synthetic s2(Ll/vg60;)Ljava/util/ArrayList;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/vg60;->a:Ljava/util/List;

    .line 2
    .line 3
    new-instance v0, Ll/yy00;

    .line 4
    .line 5
    invoke-direct {v0}, Ll/yy00;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public static synthetic u2(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->b3()V

    return-void
.end method

.method public static synthetic v2(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->U2(Ll/uxj0;)V

    return-void
.end method

.method public static synthetic w2(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->T2()Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic y2(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->R2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic z2(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;Lcom/p1/mobile/putong/feed/data/Moment;Ll/vg60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->m3(Lcom/p1/mobile/putong/feed/data/Moment;Ll/vg60;)V

    return-void
.end method


# virtual methods
.method public I2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/tz00;->b(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public L2(Ljava/lang/String;)Ll/ie80;
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    const-string v0, "http"

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-nez p1, :cond_1

    .line 14
    .line 15
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->v:Ll/ie80;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    new-instance p1, Ll/re80;

    .line 20
    .line 21
    invoke-direct {p1}, Ll/re80;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->v:Ll/ie80;

    .line 25
    .line 26
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->v:Ll/ie80;

    .line 27
    .line 28
    return-object p0

    .line 29
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->w:Ll/ie80;

    .line 30
    .line 31
    if-nez p1, :cond_2

    .line 32
    .line 33
    new-instance p1, Ll/ye80;

    .line 34
    .line 35
    invoke-direct {p1}, Ll/ye80;-><init>()V

    .line 36
    .line 37
    .line 38
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->w:Ll/ie80;

    .line 39
    .line 40
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->w:Ll/ie80;

    .line 41
    .line 42
    return-object p0
.end method

.method public final M2()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->s:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PicVerification;->anchor:Lcom/p1/mobile/putong/data/VerificationResult;

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/VerificationResult;->verified:Z

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public final synthetic T2()Lrx/c;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->n:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Ll/mrb0;->a(Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic U2(Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic V2(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    new-instance p1, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-direct {p1, p0, v0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;Ll/sz00;)V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->l:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->c:Lv/VPager;

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->c:Lv/VPager;

    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->l:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->c:Lv/VPager;

    .line 22
    .line 23
    const/high16 v0, 0x41000000    # 8.0f

    .line 24
    .line 25
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    invoke-virtual {p1, v0}, Landroidx/viewpager/widget/ViewPager;->setPageMargin(I)V

    .line 30
    .line 31
    .line 32
    sget-object p1, Ll/uqb0;->b0:Ll/sre0;

    .line 33
    .line 34
    iget-object p1, p1, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->n:Ljava/lang/String;

    .line 37
    .line 38
    invoke-interface {p1, v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->isCurrentMessageBlock(Ljava/lang/String;)Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    const/4 v0, 0x0

    .line 43
    if-eqz p1, :cond_0

    .line 44
    .line 45
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->g:Landroid/widget/FrameLayout;

    .line 46
    .line 47
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 48
    .line 49
    .line 50
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->g:Landroid/widget/FrameLayout;

    .line 51
    .line 52
    new-instance v1, Ll/py00;

    .line 53
    .line 54
    invoke-direct {v1, p0}, Ll/py00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 58
    .line 59
    .line 60
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->d:Landroid/widget/LinearLayout;

    .line 61
    .line 62
    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    new-instance v1, Ll/qy00;

    .line 67
    .line 68
    invoke-direct {v1, p0}, Ll/qy00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p1, v1}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 72
    .line 73
    .line 74
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->N2()Z

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    if-eqz p1, :cond_1

    .line 79
    .line 80
    new-instance p1, Ll/ry00;

    .line 81
    .line 82
    invoke-direct {p1, p0}, Ll/ry00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Ll/pcj;Z)Lrx/c;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    new-instance v0, Ll/sy00;

    .line 90
    .line 91
    invoke-direct {v0, p0}, Ll/sy00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;)V

    .line 92
    .line 93
    .line 94
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 99
    .line 100
    .line 101
    :cond_1
    return-void
.end method

.method public final synthetic X2(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$b;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$b;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->m:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final synthetic Z2(Landroid/view/View;)V
    .locals 3

    .line 1
    iget p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->o:I

    .line 2
    .line 3
    if-ltz p1, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->t:Ll/vg60;

    .line 6
    .line 7
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    check-cast p1, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$b;

    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$b;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 20
    .line 21
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    invoke-static {v0, v1, p1, v2, v2}, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailAct;->X1(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public final synthetic a3(Landroid/view/View;)V
    .locals 1

    .line 1
    iget p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->o:I

    .line 2
    .line 3
    if-ltz p1, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->t:Ll/vg60;

    .line 6
    .line 7
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    check-cast p1, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$b;

    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$b;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->i:Landroid/widget/ImageView;

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    invoke-static {p1, p0, v0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->h0(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/widget/ImageView;Z)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public final synthetic b3()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->x:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sget-object v1, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 11
    .line 12
    if-ne v0, v1, :cond_2

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->c:Lv/VPager;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-ltz v0, :cond_2

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->t:Ll/vg60;

    .line 23
    .line 24
    iget-object v1, v1, Ll/vg60;->a:Ljava/util/List;

    .line 25
    .line 26
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-lt v0, v1, :cond_1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->t:Ll/vg60;

    .line 34
    .line 35
    iget-object v1, v1, Ll/vg60;->a:Ljava/util/List;

    .line 36
    .line 37
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$b;

    .line 42
    .line 43
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$b;->a:Lcom/p1/mobile/putong/data/Media;

    .line 44
    .line 45
    instance-of v1, v1, Lcom/p1/mobile/putong/data/Video;

    .line 46
    .line 47
    if-eqz v1, :cond_2

    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->c:Lv/VPager;

    .line 50
    .line 51
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    instance-of v0, p0, Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 56
    .line 57
    if-eqz v0, :cond_2

    .line 58
    .line 59
    check-cast p0, Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 60
    .line 61
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/PlayerView;->D()Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-nez v0, :cond_2

    .line 66
    .line 67
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/PlayerView;->N()V

    .line 68
    .line 69
    .line 70
    :cond_2
    :goto_0
    return-void
.end method

.method public final synthetic c3(Ll/vg60;)V
    .locals 8

    .line 1
    iget-object v0, p1, Ll/vg60;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    new-instance v0, Ll/vg60;

    .line 14
    .line 15
    new-instance v1, Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 18
    .line 19
    .line 20
    iget-object v2, p1, Ll/vg60;->b:Lcom/p1/mobile/putong/data/DbLinks;

    .line 21
    .line 22
    invoke-direct {v0, v1, v2}, Ll/vg60;-><init>(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)V

    .line 23
    .line 24
    .line 25
    const/4 v1, 0x0

    .line 26
    move v2, v1

    .line 27
    :goto_0
    iget-object v3, p1, Ll/vg60;->a:Ljava/util/List;

    .line 28
    .line 29
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    if-ge v2, v3, :cond_2

    .line 34
    .line 35
    iget-object v3, p1, Ll/vg60;->a:Ljava/util/List;

    .line 36
    .line 37
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    check-cast v3, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 42
    .line 43
    move v4, v1

    .line 44
    :goto_1
    iget-object v5, v3, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 45
    .line 46
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 47
    .line 48
    .line 49
    move-result v5

    .line 50
    if-ge v4, v5, :cond_1

    .line 51
    .line 52
    iget-object v5, v0, Ll/vg60;->a:Ljava/util/List;

    .line 53
    .line 54
    new-instance v6, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$b;

    .line 55
    .line 56
    iget-object v7, v3, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 57
    .line 58
    invoke-interface {v7, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v7

    .line 62
    check-cast v7, Lcom/p1/mobile/putong/data/Media;

    .line 63
    .line 64
    invoke-direct {v6, v7, v3}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$b;-><init>(Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 65
    .line 66
    .line 67
    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    add-int/lit8 v4, v4, 0x1

    .line 71
    .line 72
    goto :goto_1

    .line 73
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_2
    invoke-virtual {p1}, Ll/vg60;->c()Z

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    if-eqz p1, :cond_3

    .line 81
    .line 82
    iget-object p1, v0, Ll/vg60;->a:Ljava/util/List;

    .line 83
    .line 84
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 85
    .line 86
    .line 87
    move-result p1

    .line 88
    iget v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->o:I

    .line 89
    .line 90
    if-gt p1, v1, :cond_3

    .line 91
    .line 92
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->p3()V

    .line 93
    .line 94
    .line 95
    return-void

    .line 96
    :cond_3
    iget p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->o:I

    .line 97
    .line 98
    const/4 v1, 0x0

    .line 99
    if-ltz p1, :cond_4

    .line 100
    .line 101
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->t:Ll/vg60;

    .line 102
    .line 103
    iget-object v2, v2, Ll/vg60;->a:Ljava/util/List;

    .line 104
    .line 105
    invoke-interface {v2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    check-cast p1, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$b;

    .line 110
    .line 111
    goto :goto_2

    .line 112
    :cond_4
    move-object p1, v1

    .line 113
    :goto_2
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    move-result v2

    .line 117
    if-eqz v2, :cond_5

    .line 118
    .line 119
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->c:Lv/VPager;

    .line 120
    .line 121
    invoke-virtual {v2, p1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    .line 122
    .line 123
    .line 124
    move-result-object v2

    .line 125
    instance-of v2, v2, Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 126
    .line 127
    if-eqz v2, :cond_5

    .line 128
    .line 129
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->c:Lv/VPager;

    .line 130
    .line 131
    invoke-virtual {v2, p1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    .line 132
    .line 133
    .line 134
    move-result-object v2

    .line 135
    check-cast v2, Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 136
    .line 137
    invoke-virtual {v2}, Lcom/p1/mobile/putong/feed/ui/PlayerView;->D()Z

    .line 138
    .line 139
    .line 140
    move-result v2

    .line 141
    if-eqz v2, :cond_5

    .line 142
    .line 143
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->c:Lv/VPager;

    .line 144
    .line 145
    invoke-virtual {v2, p1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    .line 146
    .line 147
    .line 148
    move-result-object v2

    .line 149
    check-cast v2, Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 150
    .line 151
    invoke-virtual {v2}, Lcom/p1/mobile/putong/feed/ui/PlayerView;->M()V

    .line 152
    .line 153
    .line 154
    :cond_5
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->t:Ll/vg60;

    .line 155
    .line 156
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->l:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;

    .line 157
    .line 158
    invoke-virtual {v0}, Ll/cf60;->notifyDataSetChanged()V

    .line 159
    .line 160
    .line 161
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->m:Ljava/lang/String;

    .line 162
    .line 163
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 164
    .line 165
    .line 166
    move-result v0

    .line 167
    if-eqz v0, :cond_8

    .line 168
    .line 169
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->t:Ll/vg60;

    .line 170
    .line 171
    iget-object p1, p1, Ll/vg60;->a:Ljava/util/List;

    .line 172
    .line 173
    new-instance v0, Ll/ty00;

    .line 174
    .line 175
    invoke-direct {v0, p0}, Ll/ty00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;)V

    .line 176
    .line 177
    .line 178
    invoke-static {p1, v0}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 179
    .line 180
    .line 181
    move-result p1

    .line 182
    if-ltz p1, :cond_6

    .line 183
    .line 184
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->c:Lv/VPager;

    .line 185
    .line 186
    invoke-virtual {v0, p1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 187
    .line 188
    .line 189
    :cond_6
    if-nez p1, :cond_7

    .line 190
    .line 191
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->l:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;

    .line 192
    .line 193
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;->onPageSelected(I)V

    .line 194
    .line 195
    .line 196
    :cond_7
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->m:Ljava/lang/String;

    .line 197
    .line 198
    goto :goto_4

    .line 199
    :cond_8
    iget v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->o:I

    .line 200
    .line 201
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->t:Ll/vg60;

    .line 202
    .line 203
    iget-object v2, v2, Ll/vg60;->a:Ljava/util/List;

    .line 204
    .line 205
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 206
    .line 207
    .line 208
    move-result v2

    .line 209
    add-int/lit8 v2, v2, -0x1

    .line 210
    .line 211
    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    .line 212
    .line 213
    .line 214
    move-result v0

    .line 215
    iput v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->o:I

    .line 216
    .line 217
    if-ltz v0, :cond_9

    .line 218
    .line 219
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->t:Ll/vg60;

    .line 220
    .line 221
    iget-object v2, v2, Ll/vg60;->a:Ljava/util/List;

    .line 222
    .line 223
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 224
    .line 225
    .line 226
    move-result-object v0

    .line 227
    check-cast v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$b;

    .line 228
    .line 229
    goto :goto_3

    .line 230
    :cond_9
    move-object v0, v1

    .line 231
    :goto_3
    if-eqz p1, :cond_a

    .line 232
    .line 233
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$b;->equals(Ljava/lang/Object;)Z

    .line 234
    .line 235
    .line 236
    move-result v0

    .line 237
    if-nez v0, :cond_b

    .line 238
    .line 239
    :cond_a
    new-instance v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;

    .line 240
    .line 241
    invoke-direct {v0, p0, v1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;Ll/sz00;)V

    .line 242
    .line 243
    .line 244
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->l:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;

    .line 245
    .line 246
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->c:Lv/VPager;

    .line 247
    .line 248
    invoke-virtual {v1, v0}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 249
    .line 250
    .line 251
    :cond_b
    iget v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->o:I

    .line 252
    .line 253
    if-ltz v0, :cond_c

    .line 254
    .line 255
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->c:Lv/VPager;

    .line 256
    .line 257
    invoke-virtual {v1, v0}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 258
    .line 259
    .line 260
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->l:Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;

    .line 261
    .line 262
    iget v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->o:I

    .line 263
    .line 264
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$a;->onPageSelected(I)V

    .line 265
    .line 266
    .line 267
    :cond_c
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 268
    .line 269
    .line 270
    move-result p1

    .line 271
    if-eqz p1, :cond_d

    .line 272
    .line 273
    iget p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->o:I

    .line 274
    .line 275
    if-gez p1, :cond_d

    .line 276
    .line 277
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 278
    .line 279
    .line 280
    :cond_d
    :goto_4
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->j:Lv/VFrame;

    .line 281
    .line 282
    new-instance v0, Ll/uy00;

    .line 283
    .line 284
    invoke-direct {v0, p0}, Ll/uy00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;)V

    .line 285
    .line 286
    .line 287
    invoke-virtual {p1, v0}, Lv/VFrame;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 288
    .line 289
    .line 290
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->h:Landroid/widget/FrameLayout;

    .line 291
    .line 292
    new-instance v0, Ll/vy00;

    .line 293
    .line 294
    invoke-direct {v0, p0}, Ll/vy00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;)V

    .line 295
    .line 296
    .line 297
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 298
    .line 299
    .line 300
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->c:Lv/VPager;

    .line 301
    .line 302
    new-instance v0, Ll/xy00;

    .line 303
    .line 304
    invoke-direct {v0, p0}, Ll/xy00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;)V

    .line 305
    .line 306
    .line 307
    invoke-virtual {p1, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 308
    .line 309
    .line 310
    iget p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->u:I

    .line 311
    .line 312
    const/4 v0, 0x5

    .line 313
    if-ge p1, v0, :cond_e

    .line 314
    .line 315
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->p3()V

    .line 316
    .line 317
    .line 318
    :cond_e
    return-void
.end method

.method public final synthetic d3()Lrx/c;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->n:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Ll/mrb0;->y(Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic e3(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->r:Ljava/lang/Boolean;

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic f3(Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->v:Ll/ie80;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->v:Ll/ie80;

    .line 10
    .line 11
    invoke-interface {p1}, Ll/ie80;->stop()V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->w:Ll/ie80;

    .line 15
    .line 16
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_1

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->w:Ll/ie80;

    .line 23
    .line 24
    invoke-interface {p0}, Ll/ie80;->stop()V

    .line 25
    .line 26
    .line 27
    :cond_1
    return-void
.end method

.method public final synthetic h3(Lcom/p1/mobile/putong/data/User;)Lrx/c;
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->s:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->f:Landroid/widget/LinearLayout;

    .line 4
    .line 5
    const/4 v0, 0x4

    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->s3()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    const/4 v0, 0x0

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->f:Landroid/widget/LinearLayout;

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 19
    .line 20
    .line 21
    :cond_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->N2()Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-nez p1, :cond_2

    .line 26
    .line 27
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->Q2()Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-nez p1, :cond_2

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->M2()Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-eqz p1, :cond_1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->n:Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {p1, p0, v0}, Lcom/p1/mobile/putong/feed/api/b;->W2(Ljava/lang/String;I)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0

    .line 49
    :cond_2
    :goto_0
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->n:Ljava/lang/String;

    .line 52
    .line 53
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/feed/api/b;->Z3(Ljava/lang/String;)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    return-object p0
.end method

.method public final synthetic i3()Lcom/p1/mobile/putong/feed/data/Moment;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->t:Ll/vg60;

    .line 2
    .line 3
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 4
    .line 5
    iget p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->o:I

    .line 6
    .line 7
    invoke-interface {v0, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$b;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$b;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 14
    .line 15
    return-object p0
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->I2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Ll/tec0;->p4:I

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-virtual {p1, v1, p2, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;

    .line 13
    .line 14
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->q:Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;

    .line 15
    .line 16
    iget-object p2, p1, Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;->f:Ll/z20;

    .line 17
    .line 18
    invoke-virtual {p0, v0, p1, p2}, Lcom/p1/mobile/android/app/Act;->setUpKeyboardDetectorLayout(Landroid/view/View;Landroid/view/View;Ll/z20;)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public initDataOnCreate()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initDataOnCreate()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/ly00;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/ly00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;)V

    .line 7
    .line 8
    .line 9
    new-instance v1, Ll/wy00;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/wy00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/android/app/Act;->creates(Ll/y20;Ll/x20;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public initSubscription()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/dz00;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/dz00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Ll/pcj;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/ez00;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/ez00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/fz00;

    .line 23
    .line 24
    invoke-direct {v1}, Ll/fz00;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lrx/c;->distinctUntilChanged(Ll/qcj;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v1, Ll/gz00;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Ll/gz00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 41
    .line 42
    .line 43
    new-instance v0, Ll/hz00;

    .line 44
    .line 45
    invoke-direct {v0, p0}, Ll/hz00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Ll/pcj;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    new-instance v1, Ll/iz00;

    .line 53
    .line 54
    invoke-direct {v1, p0}, Ll/iz00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;)V

    .line 55
    .line 56
    .line 57
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    new-instance v1, Ll/jz00;

    .line 69
    .line 70
    invoke-direct {v1}, Ll/jz00;-><init>()V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    new-instance v1, Ll/kz00;

    .line 78
    .line 79
    invoke-direct {v1, p0}, Ll/kz00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;)V

    .line 80
    .line 81
    .line 82
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public final synthetic j3()Lcom/p1/mobile/putong/data/Media;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->t:Ll/vg60;

    .line 2
    .line 3
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 4
    .line 5
    iget p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->o:I

    .line 6
    .line 7
    invoke-interface {v0, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$b;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$b;->a:Lcom/p1/mobile/putong/data/Media;

    .line 14
    .line 15
    return-object p0
.end method

.method public final synthetic k3(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->o3(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic m3(Lcom/p1/mobile/putong/feed/data/Moment;Ll/vg60;)V
    .locals 6

    .line 1
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->g:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    invoke-virtual {p2}, Ll/vg60;->d()I

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->likes:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 8
    .line 9
    iget v0, v0, Lcom/p1/mobile/putong/data/PartialIdList;->count:I

    .line 10
    .line 11
    add-int v2, p2, v0

    .line 12
    .line 13
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->k:Lv/VText;

    .line 14
    .line 15
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->q:Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;

    .line 16
    .line 17
    new-instance v5, Ll/cz00;

    .line 18
    .line 19
    invoke-direct {v5, p0, p1}, Ll/cz00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 20
    .line 21
    .line 22
    move-object v0, p1

    .line 23
    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->r3(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;ILandroid/widget/TextView;Lcom/p1/mobile/putong/feed/ui/moments/CommentCheckMarkView;Ll/x20;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final synthetic n3(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    iget-object p2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-static {p0, p2, p1, v0, v0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailAct;->X1(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public o3(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/pzi0;->q()Ljava/text/SimpleDateFormat;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-wide v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->createdTime:D

    .line 6
    .line 7
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Ljava/text/Format;->format(Ljava/lang/Object;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->setTitle(Ljava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->e:Lv/VText;

    .line 19
    .line 20
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    xor-int/lit8 v1, v1, 0x1

    .line 27
    .line 28
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->e:Lv/VText;

    .line 32
    .line 33
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 36
    .line 37
    .line 38
    sget v0, Ll/lbc0;->d2:I

    .line 39
    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->i:Landroid/widget/ImageView;

    .line 41
    .line 42
    iget-boolean v2, p1, Lcom/p1/mobile/putong/feed/data/Moment;->haveLiked:Z

    .line 43
    .line 44
    if-eqz v2, :cond_0

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    sget v0, Ll/lbc0;->q6:I

    .line 48
    .line 49
    :goto_0
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->y:Ll/kcg0;

    .line 53
    .line 54
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-eqz v0, :cond_1

    .line 59
    .line 60
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->y:Ll/kcg0;

    .line 61
    .line 62
    invoke-interface {v0}, Ll/kcg0;->isUnsubscribed()Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-nez v0, :cond_1

    .line 67
    .line 68
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->y:Ll/kcg0;

    .line 69
    .line 70
    invoke-interface {v0}, Ll/kcg0;->unsubscribe()V

    .line 71
    .line 72
    .line 73
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 74
    .line 75
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 76
    .line 77
    iget-object v2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 78
    .line 79
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/feed/api/b;->c3(Ljava/lang/String;)Lrx/c;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    new-instance v1, Ll/az00;

    .line 88
    .line 89
    invoke-direct {v1, p0, p1}, Ll/az00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 90
    .line 91
    .line 92
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->y:Ll/kcg0;

    .line 101
    .line 102
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->j:Lv/VFrame;

    .line 103
    .line 104
    new-instance v1, Ll/bz00;

    .line 105
    .line 106
    invoke-direct {v1, p0, p1}, Ll/bz00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {v0, v1}, Lv/VFrame;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/data/Moment;->status()Lcom/p1/mobile/putong/data/LocalStatus;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    const-string v0, "normal"

    .line 117
    .line 118
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 119
    .line 120
    .line 121
    move-result p1

    .line 122
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->g:Landroid/widget/FrameLayout;

    .line 123
    .line 124
    invoke-static {v0, p1}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 125
    .line 126
    .line 127
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->h:Landroid/widget/FrameLayout;

    .line 128
    .line 129
    invoke-static {v0, p1}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 130
    .line 131
    .line 132
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->j:Lv/VFrame;

    .line 133
    .line 134
    invoke-static {v0, p1}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 135
    .line 136
    .line 137
    sget-object p1, Ll/uqb0;->b0:Ll/sre0;

    .line 138
    .line 139
    iget-object p1, p1, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 140
    .line 141
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->n:Ljava/lang/String;

    .line 142
    .line 143
    invoke-interface {p1, v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->isCurrentMessageBlock(Ljava/lang/String;)Z

    .line 144
    .line 145
    .line 146
    move-result p1

    .line 147
    if-eqz p1, :cond_2

    .line 148
    .line 149
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->g:Landroid/widget/FrameLayout;

    .line 150
    .line 151
    const/4 p1, 0x0

    .line 152
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 153
    .line 154
    .line 155
    :cond_2
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 15

    .line 1
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->t:Ll/vg60;

    .line 2
    .line 3
    const/4 v14, 0x1

    .line 4
    if-eqz v1, :cond_3

    .line 5
    .line 6
    iget-object v1, v1, Ll/vg60;->a:Ljava/util/List;

    .line 7
    .line 8
    if-eqz v1, :cond_3

    .line 9
    .line 10
    iget v2, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->o:I

    .line 11
    .line 12
    if-ltz v2, :cond_3

    .line 13
    .line 14
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-lt v2, v1, :cond_0

    .line 19
    .line 20
    goto :goto_1

    .line 21
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->t:Ll/vg60;

    .line 22
    .line 23
    iget-object v1, v1, Ll/vg60;->a:Ljava/util/List;

    .line 24
    .line 25
    iget v2, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->o:I

    .line 26
    .line 27
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    check-cast v1, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$b;

    .line 32
    .line 33
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$b;->a:Lcom/p1/mobile/putong/data/Media;

    .line 34
    .line 35
    instance-of v1, v1, Lcom/p1/mobile/putong/data/Video;

    .line 36
    .line 37
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->n:Ljava/lang/String;

    .line 38
    .line 39
    new-instance v3, Ll/my00;

    .line 40
    .line 41
    invoke-direct {v3, p0}, Ll/my00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;)V

    .line 42
    .line 43
    .line 44
    new-instance v4, Ll/ny00;

    .line 45
    .line 46
    invoke-direct {v4, p0}, Ll/ny00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;)V

    .line 47
    .line 48
    .line 49
    new-instance v6, Ll/oy00;

    .line 50
    .line 51
    invoke-direct {v6, p0}, Ll/oy00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;)V

    .line 52
    .line 53
    .line 54
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->N2()Z

    .line 55
    .line 56
    .line 57
    move-result v12

    .line 58
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->N2()Z

    .line 59
    .line 60
    .line 61
    move-result v5

    .line 62
    if-nez v5, :cond_1

    .line 63
    .line 64
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->Q2()Z

    .line 65
    .line 66
    .line 67
    move-result v5

    .line 68
    if-eqz v5, :cond_2

    .line 69
    .line 70
    :cond_1
    if-nez v1, :cond_2

    .line 71
    .line 72
    move v13, v14

    .line 73
    goto :goto_0

    .line 74
    :cond_2
    const/4 v1, 0x0

    .line 75
    move v13, v1

    .line 76
    :goto_0
    const/4 v5, 0x0

    .line 77
    const/4 v7, 0x0

    .line 78
    const/4 v8, 0x0

    .line 79
    const/4 v9, 0x0

    .line 80
    const/4 v10, 0x0

    .line 81
    const/4 v11, 0x0

    .line 82
    move-object v0, p0

    .line 83
    move-object/from16 v1, p1

    .line 84
    .line 85
    invoke-static/range {v0 .. v13}, Ll/k3h;->F0(Lcom/p1/mobile/android/app/Act;Landroid/view/Menu;Ljava/lang/String;Ll/pcj;Ll/pcj;Ll/x20;Ll/x20;Ll/y20;Ll/y20;Ll/y20;ZZZZ)Landroid/view/Menu;

    .line 86
    .line 87
    .line 88
    :try_start_0
    sget-object v0, Lcom/p1/mobile/android/app/Act;->TOOLBAR_MENU_VIEW_FILED:Ljava/lang/reflect/Field;

    .line 89
    .line 90
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->toolbar()Landroidx/appcompat/widget/Toolbar;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    check-cast v0, Landroidx/appcompat/widget/ActionMenuView;

    .line 99
    .line 100
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    sget v2, Ll/lbc0;->b2:I

    .line 105
    .line 106
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/ActionMenuView;->setOverflowIcon(Landroid/graphics/drawable/Drawable;)V
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 111
    .line 112
    .line 113
    goto :goto_1

    .line 114
    :catch_0
    move-exception v0

    .line 115
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 116
    .line 117
    .line 118
    :cond_3
    :goto_1
    return v14
.end method

.method public p3()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->Q2()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->N2()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    return-void

    .line 15
    :cond_1
    :goto_0
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->n:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/feed/api/b;->b4(Ljava/lang/String;)Lrx/c;

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_user_moment_fullscreen_browse_view"

    .line 2
    .line 3
    return-object p0
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Ll/k9c0;->o0:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->setStatusBarColor(I)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->decorOrSwipingDecorView()Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const/high16 v1, -0x1000000

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "moment id"

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->m:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    const-string v1, "user id"

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->n:Ljava/lang/String;

    .line 46
    .line 47
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->preCreateView(Landroid/os/Bundle;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public final s3()Z
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->N2()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->Q2()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->M2()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0

    .line 22
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 23
    return p0
.end method

.method public shouldShowGradientActionBar()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public shouldShowGradientStatusBar()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public shouldSwitchToGradientColoredStatusBar()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public final t3()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 6
    .line 7
    if-eq v0, v1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->c:Lv/VPager;

    .line 11
    .line 12
    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-ltz v0, :cond_2

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->t:Ll/vg60;

    .line 19
    .line 20
    iget-object v1, v1, Ll/vg60;->a:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-lt v0, v1, :cond_1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->t:Ll/vg60;

    .line 30
    .line 31
    iget-object v1, v1, Ll/vg60;->a:Ljava/util/List;

    .line 32
    .line 33
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$b;

    .line 38
    .line 39
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct$b;->a:Lcom/p1/mobile/putong/data/Media;

    .line 40
    .line 41
    instance-of v1, v1, Lcom/p1/mobile/putong/data/Video;

    .line 42
    .line 43
    if-eqz v1, :cond_2

    .line 44
    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->c:Lv/VPager;

    .line 46
    .line 47
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    instance-of v0, p0, Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 52
    .line 53
    if-eqz v0, :cond_2

    .line 54
    .line 55
    check-cast p0, Lcom/p1/mobile/putong/feed/ui/PlayerView;

    .line 56
    .line 57
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/PlayerView;->D()Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-eqz v0, :cond_2

    .line 62
    .line 63
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/PlayerView;->R()V

    .line 64
    .line 65
    .line 66
    :cond_2
    :goto_0
    return-void
.end method

.method public trackedArgs()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->n:Ljava/lang/String;

    .line 2
    .line 3
    sget-object v2, Ll/og3;->c:Ll/og3;

    .line 4
    .line 5
    const-string v3, "moment id"

    .line 6
    .line 7
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsInProfilePreviewAct;->m:Ljava/lang/String;

    .line 8
    .line 9
    const-string v0, "other user id"

    .line 10
    .line 11
    move-object v5, v2

    .line 12
    filled-new-array/range {v0 .. v5}, [Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method
