.class public Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$c;
.super Landroidx/recyclerview/widget/RecyclerView$t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$c;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 2
    .line 3
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$t;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V
    .locals 0
    .param p1    # Landroidx/recyclerview/widget/RecyclerView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroidx/recyclerview/widget/RecyclerView$t;->onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$c;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 5
    .line 6
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->m8(Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;)I

    .line 7
    .line 8
    .line 9
    move-result p2

    .line 10
    add-int/2addr p2, p3

    .line 11
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->r8(Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;I)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$c;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 15
    .line 16
    iget-boolean p2, p1, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->o3:Z

    .line 17
    .line 18
    if-nez p2, :cond_0

    .line 19
    .line 20
    iget-object p2, p1, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->B2:Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder;

    .line 21
    .line 22
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->m8(Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;)I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder;->S1(I)V

    .line 27
    .line 28
    .line 29
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$c;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 30
    .line 31
    iget-boolean p2, p1, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->o3:Z

    .line 32
    .line 33
    if-nez p2, :cond_2

    .line 34
    .line 35
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->B2:Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder;

    .line 36
    .line 37
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/profile/profilelist/itemholders/ProfileImagesItemHolder;->u:Lcom/p1/mobile/putong/core/ui/profile/ParallaxView;

    .line 38
    .line 39
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-eqz p1, :cond_2

    .line 44
    .line 45
    if-nez p3, :cond_1

    .line 46
    .line 47
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$c;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 48
    .line 49
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->m8(Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;)I

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    if-nez p1, :cond_1

    .line 54
    .line 55
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$c;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 56
    .line 57
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->t8(Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;)V

    .line 58
    .line 59
    .line 60
    :cond_1
    if-eqz p3, :cond_2

    .line 61
    .line 62
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$c;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 63
    .line 64
    iget-object p2, p1, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->W:Lcom/p1/mobile/putong/core/ui/FloatShadowButton;

    .line 65
    .line 66
    invoke-static {p1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->m8(Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;)I

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    neg-int p1, p1

    .line 71
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag$c;->a:Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;

    .line 72
    .line 73
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;->h8(Lcom/p1/mobile/putong/core/ui/profile/profilelist/ProfileListFrag;)I

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    add-int/2addr p1, p0

    .line 78
    int-to-float p0, p1

    .line 79
    invoke-virtual {p2, p0}, Landroid/view/View;->setTranslationY(F)V

    .line 80
    .line 81
    .line 82
    :cond_2
    return-void
.end method
