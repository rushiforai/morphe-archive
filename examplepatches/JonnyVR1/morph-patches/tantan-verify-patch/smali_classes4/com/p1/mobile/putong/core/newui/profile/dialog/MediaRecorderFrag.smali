.class public Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;
.super Landroidx/fragment/app/DialogFragment;
.source "SourceFile"

# interfaces
.implements Ll/xyl;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag$a;
    }
.end annotation


# instance fields
.field public A:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

.field public B:Lcom/p1/mobile/putong/data/User;

.field public C:Landroid/view/View;

.field public D:I

.field public E:Ll/l4g0;

.field public F:Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag$a;

.field public G:Z

.field public H:Z

.field public I:I

.field public z:Landroid/util/Pair;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Pair<",
            "Landroid/view/View;",
            "Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Landroidx/fragment/app/DialogFragment;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->D:I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->G:Z

    .line 9
    .line 10
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->H:Z

    .line 11
    .line 12
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->I:I

    .line 13
    .line 14
    return-void
.end method

.method public static synthetic V3(Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->d4(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic W3(Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;Lcom/p1/mobile/putong/data/Media;Ljava/lang/Boolean;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->g4(Lcom/p1/mobile/putong/data/Media;Ljava/lang/Boolean;Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic X3(Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->c4(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic Y3(Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->f4(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic Z3(Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->e4(Ll/uxj0;)V

    return-void
.end method

.method private synthetic g4(Lcom/p1/mobile/putong/data/Media;Ljava/lang/Boolean;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->n4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private k4(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->D:I

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    :goto_0
    const/4 v1, 0x6

    .line 9
    if-ge v0, v1, :cond_2

    .line 10
    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->A:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 18
    .line 19
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-ge v0, v2, :cond_0

    .line 24
    .line 25
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    check-cast v2, Lcom/p1/mobile/putong/data/Media;

    .line 30
    .line 31
    goto :goto_1

    .line 32
    :cond_0
    const/4 v2, 0x0

    .line 33
    :goto_1
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->C1(Lcom/p1/mobile/putong/data/Media;)V

    .line 34
    .line 35
    .line 36
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->A:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 37
    .line 38
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    check-cast v1, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 43
    .line 44
    invoke-virtual {v1, p0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->setMediaOperation(Ll/xyl;)V

    .line 45
    .line 46
    .line 47
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->A:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 48
    .line 49
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    check-cast v1, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 54
    .line 55
    new-instance v2, Ll/h3y;

    .line 56
    .line 57
    invoke-direct {v2, p0}, Ll/h3y;-><init>(Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->setChangeAction(Ll/a30;)V

    .line 61
    .line 62
    .line 63
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->A:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 64
    .line 65
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    check-cast v1, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 70
    .line 71
    const-string v2, "p_specialguest_photo_upload"

    .line 72
    .line 73
    invoke-virtual {v1, v0, v2}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->E1(ILjava/lang/String;)V

    .line 74
    .line 75
    .line 76
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    if-ne v0, v1, :cond_1

    .line 81
    .line 82
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->A:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 83
    .line 84
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    check-cast v1, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 89
    .line 90
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->P1()V

    .line 91
    .line 92
    .line 93
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_2
    return-void
.end method


# virtual methods
.method public a4()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

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

.method public final b4()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/DialogFragment;->getDialog()Landroid/app/Dialog;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {v0, v1}, Landroid/app/Dialog;->requestWindowFeature(I)Z

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Landroidx/fragment/app/DialogFragment;->getDialog()Landroid/app/Dialog;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const/4 v1, 0x0

    .line 22
    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const/4 v1, -0x1

    .line 30
    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 31
    .line 32
    const/4 v1, -0x2

    .line 33
    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 34
    .line 35
    const/16 v1, 0x50

    .line 36
    .line 37
    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 38
    .line 39
    sget v1, Ll/agc0;->i:I

    .line 40
    .line 41
    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->windowAnimations:I

    .line 42
    .line 43
    invoke-virtual {p0, v0}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 44
    .line 45
    .line 46
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    .line 47
    .line 48
    invoke-direct {v0}, Landroid/graphics/drawable/ColorDrawable;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0, v0}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public final synthetic c4(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "e_specialguest_photo_close"

    .line 2
    .line 3
    const-string v0, "p_specialguest_photo_upload"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->F:Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag$a;

    .line 9
    .line 10
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->F:Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag$a;

    .line 17
    .line 18
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag$a;->onCancel()V

    .line 19
    .line 20
    .line 21
    :cond_0
    const/4 p1, 0x1

    .line 22
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->G:Z

    .line 23
    .line 24
    invoke-virtual {p0}, Landroidx/fragment/app/DialogFragment;->dismiss()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final synthetic d4(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->l4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic e4(Ll/uxj0;)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->G:Z

    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->F:Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag$a;

    .line 5
    .line 6
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->F:Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag$a;

    .line 13
    .line 14
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag$a;->a()V

    .line 15
    .line 16
    .line 17
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 20
    .line 21
    invoke-virtual {p1}, Ll/dkb;->H7()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->a4()Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Landroidx/fragment/app/DialogFragment;->dismiss()V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public f2(ILjava/lang/String;)V
    .locals 1

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->I:I

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->a4()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const/4 v0, 0x1

    .line 8
    invoke-static {p1, p2, v0}, Lcom/p1/mobile/putong/core/newui/cropiwa/NewCropperAct;->G1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    const/16 p2, 0x6000

    .line 13
    .line 14
    invoke-virtual {p0, p1, p2}, Landroidx/fragment/app/Fragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic f4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->a4()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->a4()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public h4(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->I:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-eq v0, v1, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->A:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-lez v0, :cond_0

    .line 19
    .line 20
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->I:I

    .line 21
    .line 22
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->i4(Ljava/util/List;I)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public i4(Ljava/util/List;I)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;I)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 7
    .line 8
    instance-of v1, p1, Lcom/p1/mobile/putong/data/Video;

    .line 9
    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->A:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 13
    .line 14
    invoke-virtual {v1, p2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    check-cast p2, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 19
    .line 20
    check-cast p1, Lcom/p1/mobile/putong/data/Video;

    .line 21
    .line 22
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->z1(Lcom/p1/mobile/putong/data/Video;)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    instance-of v1, p1, Lcom/p1/mobile/putong/data/Picture;

    .line 27
    .line 28
    if-eqz v1, :cond_1

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->A:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 31
    .line 32
    invoke-virtual {v1, p2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    check-cast p2, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 37
    .line 38
    check-cast p1, Lcom/p1/mobile/putong/data/Picture;

    .line 39
    .line 40
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->w1(Lcom/p1/mobile/putong/data/Picture;)V

    .line 41
    .line 42
    .line 43
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->n4()V

    .line 44
    .line 45
    .line 46
    :goto_1
    const/4 p1, 0x6

    .line 47
    if-ge v0, p1, :cond_2

    .line 48
    .line 49
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->A:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 50
    .line 51
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    check-cast p1, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 56
    .line 57
    const-string p2, "p_specialguest_photo_upload"

    .line 58
    .line 59
    invoke-virtual {p1, v0, p2}, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->E1(ILjava/lang/String;)V

    .line 60
    .line 61
    .line 62
    add-int/lit8 v0, v0, 0x1

    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_2
    return-void
.end method

.method public j4(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/data/User;->subtract(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->a4()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    sget v0, Lcom/p1/mobile/putong/core/R$string;->L5:I

    .line 16
    .line 17
    invoke-virtual {p2, v0}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->a4()Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 25
    .line 26
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 27
    .line 28
    invoke-virtual {v0, p1}, Ll/dkb;->u9(Lcom/p1/mobile/putong/data/User;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p2, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    new-instance p2, Ll/f3y;

    .line 37
    .line 38
    invoke-direct {p2, p0}, Ll/f3y;-><init>(Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;)V

    .line 39
    .line 40
    .line 41
    new-instance v0, Ll/g3y;

    .line 42
    .line 43
    invoke-direct {v0, p0}, Ll/g3y;-><init>(Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;)V

    .line 44
    .line 45
    .line 46
    invoke-static {p2, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 51
    .line 52
    .line 53
    :cond_0
    return-void
.end method

.method public final l4()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->A:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    new-instance v0, Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 12
    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    :goto_0
    const/4 v2, 0x6

    .line 16
    if-ge v1, v2, :cond_0

    .line 17
    .line 18
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->A:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 19
    .line 20
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    check-cast v2, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 25
    .line 26
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->n()Z

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    if-nez v2, :cond_0

    .line 31
    .line 32
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->A:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 33
    .line 34
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    check-cast v2, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 39
    .line 40
    iget-object v2, v2, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 41
    .line 42
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    add-int/lit8 v1, v1, 0x1

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    const-string v2, "specialguest_photo_upload_type"

    .line 53
    .line 54
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    invoke-static {v2, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    filled-new-array {v2}, [Ll/pf60;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    const-string v3, "e_specialguest_photo_complete"

    .line 67
    .line 68
    const-string v4, "p_specialguest_photo_upload"

    .line 69
    .line 70
    invoke-static {v3, v4, v2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 71
    .line 72
    .line 73
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->D:I

    .line 74
    .line 75
    if-le v1, v2, :cond_1

    .line 76
    .line 77
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 78
    .line 79
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 80
    .line 81
    invoke-virtual {v1}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    iput-object v0, v1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 90
    .line 91
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 92
    .line 93
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 94
    .line 95
    invoke-virtual {v0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-virtual {p0, v1, v0}, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->j4(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;)V

    .line 100
    .line 101
    .line 102
    :cond_1
    return-void
.end method

.method public m4(Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->F:Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag$a;

    .line 2
    .line 3
    return-void
.end method

.method public n0(IZZZ)V
    .locals 14

    .line 1
    move/from16 v0, p2

    .line 2
    .line 3
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->H:Z

    .line 4
    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->I:I

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    const/16 v1, 0x312

    .line 9
    .line 10
    const/4 v2, 0x1

    .line 11
    if-eqz p3, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->a4()Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 18
    .line 19
    .line 20
    move-result-object v4

    .line 21
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 22
    .line 23
    .line 24
    move-result-object v5

    .line 25
    invoke-virtual {v5, v2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withMaxPickCount(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 26
    .line 27
    .line 28
    move-result-object v5

    .line 29
    invoke-virtual {v5}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;

    .line 30
    .line 31
    .line 32
    move-result-object v5

    .line 33
    invoke-virtual {v4, v5}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withVideoPickConfig(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 34
    .line 35
    .line 36
    move-result-object v4

    .line 37
    invoke-virtual {v4, v2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withFromType(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-virtual {v2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-static {v3, v2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerAct;->Y1(Landroid/content/Context;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)Landroid/content/Intent;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-virtual {p0, v2, v1}, Landroidx/fragment/app/Fragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->a4()Lcom/p1/mobile/android/app/Act;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    sget v1, Ll/x7c0;->y:I

    .line 57
    .line 58
    invoke-virtual {p0, v1, v0}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_0
    if-eqz p4, :cond_1

    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->a4()Lcom/p1/mobile/android/app/Act;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 69
    .line 70
    .line 71
    move-result-object v4

    .line 72
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 73
    .line 74
    .line 75
    move-result-object v5

    .line 76
    invoke-virtual {v5, v2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withMaxPickCount(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 77
    .line 78
    .line 79
    move-result-object v5

    .line 80
    const v6, 0x3f4ccccd    # 0.8f

    .line 81
    .line 82
    .line 83
    invoke-virtual {v5, v6}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withImageCropProportion(F)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 84
    .line 85
    .line 86
    move-result-object v5

    .line 87
    invoke-static {}, Ll/bnl0;->y0()I

    .line 88
    .line 89
    .line 90
    move-result v6

    .line 91
    const/high16 v7, 0x42200000    # 40.0f

    .line 92
    .line 93
    invoke-static {v7}, Ll/qa00;->d(F)I

    .line 94
    .line 95
    .line 96
    move-result v7

    .line 97
    sub-int/2addr v6, v7

    .line 98
    invoke-virtual {v5, v6}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withImageCropWidth(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 99
    .line 100
    .line 101
    move-result-object v5

    .line 102
    invoke-virtual {v5}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;

    .line 103
    .line 104
    .line 105
    move-result-object v5

    .line 106
    invoke-virtual {v4, v5}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withImagePickConfig(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 107
    .line 108
    .line 109
    move-result-object v4

    .line 110
    invoke-virtual {v4, v2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withFromType(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 111
    .line 112
    .line 113
    move-result-object v2

    .line 114
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->a4()Lcom/p1/mobile/android/app/Act;

    .line 115
    .line 116
    .line 117
    move-result-object v4

    .line 118
    instance-of v4, v4, Lcom/p1/mobile/putong/core/ui/profile/EditProfileAct;

    .line 119
    .line 120
    invoke-virtual {v2, v4}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->setCroppingNewStyle(Z)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 121
    .line 122
    .line 123
    move-result-object v2

    .line 124
    invoke-virtual {v2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 125
    .line 126
    .line 127
    move-result-object v2

    .line 128
    invoke-static {v3, v2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerAct;->Y1(Landroid/content/Context;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)Landroid/content/Intent;

    .line 129
    .line 130
    .line 131
    move-result-object v2

    .line 132
    invoke-virtual {p0, v2, v1}, Landroidx/fragment/app/Fragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->a4()Lcom/p1/mobile/android/app/Act;

    .line 136
    .line 137
    .line 138
    move-result-object p0

    .line 139
    sget v1, Ll/x7c0;->y:I

    .line 140
    .line 141
    invoke-virtual {p0, v1, v0}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 142
    .line 143
    .line 144
    return-void

    .line 145
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->a4()Lcom/p1/mobile/android/app/Act;

    .line 146
    .line 147
    .line 148
    move-result-object v2

    .line 149
    sget v8, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->D:I

    .line 150
    .line 151
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 152
    .line 153
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 154
    .line 155
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    iget-object v11, v0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 160
    .line 161
    const-string v12, ""

    .line 162
    .line 163
    const/4 v13, 0x1

    .line 164
    const/4 v3, 0x1

    .line 165
    const/4 v4, 0x0

    .line 166
    const/4 v5, 0x1

    .line 167
    const/4 v6, 0x1

    .line 168
    const/4 v7, 0x0

    .line 169
    const/4 v9, 0x0

    .line 170
    const/4 v10, 0x1

    .line 171
    invoke-static/range {v2 .. v13}, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->k2(Landroid/content/Context;IZZZLjava/lang/String;IZZLcom/p1/mobile/putong/data/Gender;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    invoke-virtual {p0, v0, v1}, Landroidx/fragment/app/Fragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 176
    .line 177
    .line 178
    return-void
.end method

.method public n4()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->A:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_3

    .line 8
    .line 9
    new-instance v0, Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 12
    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    move v2, v1

    .line 16
    :goto_0
    const/4 v3, 0x6

    .line 17
    if-ge v2, v3, :cond_1

    .line 18
    .line 19
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->A:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 20
    .line 21
    invoke-virtual {v3, v2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    check-cast v3, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 26
    .line 27
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;->n()Z

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    if-nez v3, :cond_1

    .line 32
    .line 33
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->A:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 34
    .line 35
    invoke-virtual {v3, v2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    check-cast v3, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 40
    .line 41
    iget-object v3, v3, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 42
    .line 43
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 44
    .line 45
    const-string v4, "normal"

    .line 46
    .line 47
    invoke-static {v3, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    if-eqz v3, :cond_0

    .line 52
    .line 53
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->A:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 54
    .line 55
    invoke-virtual {v3, v2}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->h(I)Lcom/p1/mobile/putong/core/ui/profile/VReorderCard;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    check-cast v3, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;

    .line 60
    .line 61
    iget-object v3, v3, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCard;->N:Lcom/p1/mobile/putong/data/Media;

    .line 62
    .line 63
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_1
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->C:Landroid/view/View;

    .line 74
    .line 75
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->D:I

    .line 76
    .line 77
    if-le v0, p0, :cond_2

    .line 78
    .line 79
    const/4 v1, 0x1

    .line 80
    :cond_2
    invoke-virtual {v2, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 81
    .line 82
    .line 83
    :cond_3
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1
    .param p3    # Landroid/content/Intent;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroidx/fragment/app/Fragment;->onActivityResult(IILandroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x312

    .line 5
    .line 6
    if-ne p1, v0, :cond_0

    .line 7
    .line 8
    const/4 p1, -0x1

    .line 9
    if-ne p2, p1, :cond_0

    .line 10
    .line 11
    sget-object p1, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->h:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p3, p1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    check-cast p1, Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->h4(Ljava/util/List;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroidx/fragment/app/DialogFragment;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->b4()V

    .line 2
    .line 3
    .line 4
    sget p2, Ll/kec0;->Pc:I

    .line 5
    .line 6
    const/4 p3, 0x0

    .line 7
    invoke-virtual {p1, p2, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    sget p2, Ll/adc0;->ue:I

    .line 12
    .line 13
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    check-cast p2, Lv/VText;

    .line 18
    .line 19
    invoke-virtual {p2}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    const/4 v0, 0x1

    .line 24
    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 25
    .line 26
    .line 27
    sget p2, Ll/adc0;->S1:I

    .line 28
    .line 29
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    check-cast p2, Landroid/widget/FrameLayout;

    .line 34
    .line 35
    new-instance v1, Ll/tr90;

    .line 36
    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->a4()Lcom/p1/mobile/android/app/Act;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-direct {v1, v2, p3}, Ll/tr90;-><init>(Lcom/p1/mobile/android/app/Act;Lv/VText;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v1, p2, v0}, Ll/tr90;->u(Landroid/view/ViewGroup;Z)Landroid/util/Pair;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->z:Landroid/util/Pair;

    .line 49
    .line 50
    iget-object p2, p2, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 51
    .line 52
    check-cast p2, Landroid/view/View;

    .line 53
    .line 54
    sget p3, Ll/adc0;->i2:I

    .line 55
    .line 56
    invoke-virtual {p2, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    const/16 p3, 0x8

    .line 61
    .line 62
    invoke-virtual {p2, p3}, Landroid/view/View;->setVisibility(I)V

    .line 63
    .line 64
    .line 65
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->z:Landroid/util/Pair;

    .line 66
    .line 67
    iget-object p2, p2, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 68
    .line 69
    check-cast p2, Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 70
    .line 71
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->A:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 72
    .line 73
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->setCardsCrop(Z)V

    .line 74
    .line 75
    .line 76
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->A:Lcom/p1/mobile/putong/core/ui/profile/MediaReorderCards;

    .line 77
    .line 78
    const-string p3, "p_specialguest_photo_upload"

    .line 79
    .line 80
    invoke-virtual {p2, p3}, Lcom/p1/mobile/putong/core/ui/profile/VReorderCards;->setCurPageId(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    sget p2, Ll/adc0;->f3:I

    .line 84
    .line 85
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 86
    .line 87
    .line 88
    move-result-object p2

    .line 89
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->C:Landroid/view/View;

    .line 90
    .line 91
    sget p2, Ll/adc0;->E1:I

    .line 92
    .line 93
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 94
    .line 95
    .line 96
    move-result-object p2

    .line 97
    new-instance v0, Ll/d3y;

    .line 98
    .line 99
    invoke-direct {v0, p0}, Ll/d3y;-><init>(Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;)V

    .line 100
    .line 101
    .line 102
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 103
    .line 104
    .line 105
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->C:Landroid/view/View;

    .line 106
    .line 107
    new-instance v0, Ll/e3y;

    .line 108
    .line 109
    invoke-direct {v0, p0}, Ll/e3y;-><init>(Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;)V

    .line 110
    .line 111
    .line 112
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 113
    .line 114
    .line 115
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->C:Landroid/view/View;

    .line 116
    .line 117
    const/4 v0, 0x0

    .line 118
    invoke-virtual {p2, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 119
    .line 120
    .line 121
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 122
    .line 123
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 124
    .line 125
    invoke-virtual {p2}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 126
    .line 127
    .line 128
    move-result-object p2

    .line 129
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->B:Lcom/p1/mobile/putong/data/User;

    .line 134
    .line 135
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 136
    .line 137
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->k4(Ljava/util/List;)V

    .line 138
    .line 139
    .line 140
    const-class v0, Lcom/p1/mobile/android/app/Dialog;

    .line 141
    .line 142
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    invoke-static {p3, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 147
    .line 148
    .line 149
    move-result-object p3

    .line 150
    iput-object p3, p0, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->E:Ll/l4g0;

    .line 151
    .line 152
    iget-object p2, p2, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 153
    .line 154
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 155
    .line 156
    .line 157
    move-result p2

    .line 158
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 159
    .line 160
    .line 161
    move-result-object p2

    .line 162
    const-string v0, "specialguest_photo_upload_type"

    .line 163
    .line 164
    invoke-static {v0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 165
    .line 166
    .line 167
    move-result-object p2

    .line 168
    filled-new-array {p2}, [Ll/pf60;

    .line 169
    .line 170
    .line 171
    move-result-object p2

    .line 172
    invoke-virtual {p3, p2}, Ll/l4g0;->p([Ll/pf60;)V

    .line 173
    .line 174
    .line 175
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->E:Ll/l4g0;

    .line 176
    .line 177
    invoke-static {p0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 178
    .line 179
    .line 180
    return-object p1
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 0
    .param p1    # Landroid/content/DialogInterface;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroidx/fragment/app/DialogFragment;->onDismiss(Landroid/content/DialogInterface;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->E:Ll/l4g0;

    .line 5
    .line 6
    invoke-static {p1}, Ll/w1e;->e(Ll/l4g0;)V

    .line 7
    .line 8
    .line 9
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->G:Z

    .line 10
    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->F:Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag$a;

    .line 14
    .line 15
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->F:Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag$a;

    .line 22
    .line 23
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag$a;->onCancel()V

    .line 24
    .line 25
    .line 26
    :cond_0
    const/4 p1, 0x1

    .line 27
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/profile/dialog/MediaRecorderFrag;->G:Z

    .line 28
    .line 29
    return-void
.end method

.method public show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V
    .locals 0
    .param p1    # Landroidx/fragment/app/FragmentManager;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Landroidx/fragment/app/FragmentManager;->m()Landroidx/fragment/app/k;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1, p0, p2}, Landroidx/fragment/app/k;->e(Landroidx/fragment/app/Fragment;Ljava/lang/String;)Landroidx/fragment/app/k;

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Landroidx/fragment/app/k;->j()I

    .line 9
    .line 10
    .line 11
    return-void
.end method
