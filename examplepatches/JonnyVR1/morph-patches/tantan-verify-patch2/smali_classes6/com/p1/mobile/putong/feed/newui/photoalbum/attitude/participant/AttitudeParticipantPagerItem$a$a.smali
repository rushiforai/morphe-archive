.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantPagerItem$a$a;
.super Ll/h80;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantPagerItem$a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/h80<",
        "Lcom/p1/mobile/putong/data/User;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic i:Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantPagerItem$a;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantPagerItem$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantPagerItem$a$a;->i:Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantPagerItem$a;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/h80;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public f(Landroid/view/ViewGroup;Landroid/view/ViewGroup;)V
    .locals 0

    .line 1
    sget p2, Ll/hdc0;->k2:I

    .line 2
    .line 3
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Landroidx/viewpager/widget/ViewPager;

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    new-instance p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantPagerItem$a$a$a;

    .line 13
    .line 14
    invoke-direct {p2, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantPagerItem$a$a$a;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantPagerItem$a$a;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1, p2}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public bridge synthetic k(Ljava/lang/Object;ILandroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantPagerItem$a$a;->s(Lcom/p1/mobile/putong/data/User;ILandroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic m(Ljava/lang/Object;IJLandroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantPagerItem$a$a;->t(Lcom/p1/mobile/putong/data/User;IJLandroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public s(Lcom/p1/mobile/putong/data/User;ILandroid/view/View;)V
    .locals 0

    .line 1
    const-class p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantListtem;

    .line 2
    .line 3
    invoke-virtual {p2, p3}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    check-cast p3, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantListtem;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantPagerItem$a$a;->i:Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantPagerItem$a;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantPagerItem$a;->e:Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    invoke-virtual {p3, p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantListtem;->w(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public t(Lcom/p1/mobile/putong/data/User;IJLandroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method
