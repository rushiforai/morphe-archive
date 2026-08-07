.class public Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatPreviewView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/constraintlayout/widget/ConstraintLayout;",
        "Ll/iam<",
        "Ll/zvk0;",
        ">;"
    }
.end annotation


# instance fields
.field public d:Lv/VFrame;

.field public e:Lv/VImage;

.field public f:Lv/VButton;

.field public g:Lv/VImage;

.field public h:Ll/zvk0;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic h0(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatPreviewView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatPreviewView;->m0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i0(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatPreviewView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatPreviewView;->o0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic j0(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatPreviewView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatPreviewView;->n0(Landroid/view/View;)V

    return-void
.end method

.method private synthetic m0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatPreviewView;->h:Ll/zvk0;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatPreviewView;->h:Ll/zvk0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/zvk0;->U2()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method private synthetic n0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatPreviewView;->h:Ll/zvk0;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatPreviewView;->h:Ll/zvk0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/zvk0;->X2()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/zvk0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatPreviewView;->l0(Ll/zvk0;)V

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

.method public final k0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/vqu;->a(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatPreviewView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public l0(Ll/zvk0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatPreviewView;->h:Ll/zvk0;

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic o0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatPreviewView;->h:Ll/zvk0;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatPreviewView;->h:Ll/zvk0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/zvk0;->T2()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatPreviewView;->k0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatPreviewView;->g:Lv/VImage;

    .line 8
    .line 9
    new-instance v1, Ll/squ;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/squ;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatPreviewView;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatPreviewView;->f:Lv/VButton;

    .line 18
    .line 19
    new-instance v1, Ll/tqu;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/tqu;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatPreviewView;)V

    .line 22
    .line 23
    .line 24
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatPreviewView;->e:Lv/VImage;

    .line 28
    .line 29
    new-instance v1, Ll/uqu;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/uqu;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatPreviewView;)V

    .line 32
    .line 33
    .line 34
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public p0(Z)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
