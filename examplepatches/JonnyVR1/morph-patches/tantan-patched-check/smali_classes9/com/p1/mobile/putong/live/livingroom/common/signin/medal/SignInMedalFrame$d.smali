.class public Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame$d;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "d"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveSignInMedal;",
        ">;"
    }
.end annotation


# instance fields
.field public final c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSignInMedal;",
            ">;"
        }
    .end annotation
.end field

.field public final synthetic d:Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSignInMedal;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame$d;->d:Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame$d;->c:Ljava/util/List;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic E(Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame$d;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame$d;->H(ILandroid/view/View;)V

    return-void
.end method

.method private synthetic H(ILandroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame$d;->d:Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;->c:Lv/VPager;

    .line 4
    .line 5
    const/4 p2, 0x0

    .line 6
    invoke-virtual {p0, p1, p2}, Landroidx/viewpager/widget/ViewPager;->T(IZ)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/live/base/data/BLiveSignInMedal;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame$d;->F(Landroid/view/View;Lcom/p1/mobile/putong/live/base/data/BLiveSignInMedal;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame$d;->c:Ljava/util/List;

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

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget p1, Ll/yec0;->H5:I

    .line 6
    .line 7
    const/4 p2, 0x0

    .line 8
    invoke-static {p0, p1, p2}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    new-instance p1, Landroid/view/ViewGroup$LayoutParams;

    .line 13
    .line 14
    const/high16 p2, 0x42580000    # 54.0f

    .line 15
    .line 16
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    invoke-direct {p1, v0, p2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 28
    .line 29
    .line 30
    return-object p0
.end method

.method public F(Landroid/view/View;Lcom/p1/mobile/putong/live/base/data/BLiveSignInMedal;II)V
    .locals 1

    .line 1
    move-object p3, p1

    .line 2
    check-cast p3, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SmallMedal;

    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame$d;->d:Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;->d(Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame;)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-ne v0, p4, :cond_0

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 v0, 0x0

    .line 15
    :goto_0
    invoke-virtual {p3, p2, v0}, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SmallMedal;->b(Lcom/p1/mobile/putong/live/base/data/BLiveSignInMedal;Z)V

    .line 16
    .line 17
    .line 18
    new-instance p2, Ll/acf0;

    .line 19
    .line 20
    invoke-direct {p2, p0, p4}, Ll/acf0;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame$d;I)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public G(I)Lcom/p1/mobile/putong/live/base/data/BLiveSignInMedal;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame$d;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveSignInMedal;

    .line 8
    .line 9
    return-object p0
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/signin/medal/SignInMedalFrame$d;->G(I)Lcom/p1/mobile/putong/live/base/data/BLiveSignInMedal;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
