.class public Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/StateScrollVIew;
.super Lcom/p1/mobile/putong/newui/view/NestedUseAgencyScrollView;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/StateScrollVIew$a;
    }
.end annotation


# instance fields
.field public G:Z

.field public H:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/StateScrollVIew$a;

.field public I:Ljava/lang/Runnable;

.field public J:J


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/newui/view/NestedUseAgencyScrollView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/StateScrollVIew;->G:Z

    .line 6
    .line 7
    new-instance p1, Ll/v3g0;

    .line 8
    .line 9
    invoke-direct {p1, p0}, Ll/v3g0;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/StateScrollVIew;)V

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/StateScrollVIew;->I:Ljava/lang/Runnable;

    .line 13
    .line 14
    const-wide/16 v0, 0x0

    .line 15
    .line 16
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/StateScrollVIew;->J:J

    .line 17
    .line 18
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 19
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/newui/view/NestedUseAgencyScrollView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 20
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/StateScrollVIew;->G:Z

    .line 21
    new-instance p1, Ll/v3g0;

    invoke-direct {p1, p0}, Ll/v3g0;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/StateScrollVIew;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/StateScrollVIew;->I:Ljava/lang/Runnable;

    const-wide/16 p1, 0x0

    .line 22
    iput-wide p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/StateScrollVIew;->J:J

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 23
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/newui/view/NestedUseAgencyScrollView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 24
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/StateScrollVIew;->G:Z

    .line 25
    new-instance p1, Ll/v3g0;

    invoke-direct {p1, p0}, Ll/v3g0;-><init>(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/StateScrollVIew;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/StateScrollVIew;->I:Ljava/lang/Runnable;

    const-wide/16 p1, 0x0

    .line 26
    iput-wide p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/StateScrollVIew;->J:J

    return-void
.end method

.method public static synthetic U(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/StateScrollVIew;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/StateScrollVIew;->V()V

    return-void
.end method

.method private synthetic V()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/StateScrollVIew;->G:Z

    .line 3
    .line 4
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/StateScrollVIew;->H:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/StateScrollVIew$a;

    .line 5
    .line 6
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/StateScrollVIew;->H:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/StateScrollVIew$a;

    .line 13
    .line 14
    invoke-interface {p0, v0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/StateScrollVIew$a;->a(Z)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method private getAct()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/bnl0;->E(Landroid/view/View;)Landroid/app/Activity;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    return-object p0
.end method


# virtual methods
.method public W()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/StateScrollVIew;->I:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/StateScrollVIew;->getAct()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/StateScrollVIew;->I:Ljava/lang/Runnable;

    .line 11
    .line 12
    const-wide/16 v1, 0x32

    .line 13
    .line 14
    invoke-static {v0, p0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public getOnScrollStateListener()Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/StateScrollVIew$a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/StateScrollVIew;->H:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/StateScrollVIew$a;

    .line 2
    .line 3
    return-object p0
.end method

.method public onScrollChanged(IIII)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroidx/core/widget/NestedScrollView;->onScrollChanged(IIII)V

    .line 2
    .line 3
    .line 4
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/StateScrollVIew;->G:Z

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    invoke-static {}, Ll/pzi0;->o()J

    .line 9
    .line 10
    .line 11
    move-result-wide p1

    .line 12
    iget-wide p3, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/StateScrollVIew;->J:J

    .line 13
    .line 14
    sub-long/2addr p1, p3

    .line 15
    const-wide/16 p3, 0x1e

    .line 16
    .line 17
    cmp-long p1, p1, p3

    .line 18
    .line 19
    if-lez p1, :cond_1

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/StateScrollVIew;->W()V

    .line 22
    .line 23
    .line 24
    invoke-static {}, Ll/pzi0;->o()J

    .line 25
    .line 26
    .line 27
    move-result-wide p1

    .line 28
    iput-wide p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/StateScrollVIew;->J:J

    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    const/4 p1, 0x1

    .line 32
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/StateScrollVIew;->G:Z

    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/StateScrollVIew;->W()V

    .line 35
    .line 36
    .line 37
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/StateScrollVIew;->H:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/StateScrollVIew$a;

    .line 38
    .line 39
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p2

    .line 43
    if-eqz p2, :cond_1

    .line 44
    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/StateScrollVIew;->H:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/StateScrollVIew$a;

    .line 46
    .line 47
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/StateScrollVIew$a;->a(Z)V

    .line 48
    .line 49
    .line 50
    :cond_1
    return-void
.end method

.method public setOnScrollStateListener(Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/StateScrollVIew$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/StateScrollVIew;->H:Lcom/p1/mobile/putong/core/newui/profile/newmine/newprofile/view/StateScrollVIew$a;

    .line 2
    .line 3
    return-void
.end method
