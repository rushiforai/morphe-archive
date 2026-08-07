.class public final Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView$a;
.super Landroid/os/Handler;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field public final a:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;",
            ">;"
        }
    .end annotation
.end field

.field public b:I


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;Landroid/os/Looper;)V
    .locals 0

    .line 1
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 2
    .line 3
    .line 4
    const/16 p2, 0x9c4

    .line 5
    .line 6
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView$a;->b:I

    .line 7
    .line 8
    new-instance p2, Ljava/lang/ref/WeakReference;

    .line 9
    .line 10
    invoke-direct {p2, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView$a;->a:Ljava/lang/ref/WeakReference;

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public a(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView$a;->b:I

    .line 2
    .line 3
    return-void
.end method

.method public handleMessage(Landroid/os/Message;)V
    .locals 4
    .param p1    # Landroid/os/Message;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView$a;->a:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget p1, p1, Landroid/os/Message;->what:I

    .line 13
    .line 14
    if-nez p1, :cond_2

    .line 15
    .line 16
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->c(Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;)Ljava/util/List;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    const/4 v1, 0x1

    .line 25
    if-lez p1, :cond_1

    .line 26
    .line 27
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->b(Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;)I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    add-int/2addr v2, v1

    .line 32
    rem-int/2addr v2, p1

    .line 33
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->d(Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;I)V

    .line 34
    .line 35
    .line 36
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->c(Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;)Ljava/util/List;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->b(Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;)I

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    check-cast v2, Ljava/lang/CharSequence;

    .line 49
    .line 50
    invoke-virtual {v0, v2}, Landroid/widget/TextSwitcher;->setText(Ljava/lang/CharSequence;)V

    .line 51
    .line 52
    .line 53
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->b(Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;)I

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    add-int/lit8 v3, p1, -0x1

    .line 58
    .line 59
    if-ne v2, v3, :cond_1

    .line 60
    .line 61
    iget v2, v0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->o:I

    .line 62
    .line 63
    add-int/2addr v2, v1

    .line 64
    iput v2, v0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->o:I

    .line 65
    .line 66
    :cond_1
    if-le p1, v1, :cond_2

    .line 67
    .line 68
    iget p1, v0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->o:I

    .line 69
    .line 70
    iget v0, v0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->n:I

    .line 71
    .line 72
    sub-int/2addr v0, v1

    .line 73
    if-ge p1, v0, :cond_2

    .line 74
    .line 75
    iget p1, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView$a;->b:I

    .line 76
    .line 77
    int-to-long v0, p1

    .line 78
    const/4 p1, 0x0

    .line 79
    invoke-virtual {p0, p1, v0, v1}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 80
    .line 81
    .line 82
    :cond_2
    :goto_0
    return-void
.end method
