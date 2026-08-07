.class public Lcom/p1/mobile/putong/live/livingroom/other/obs/ObsPreviewView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/FrameLayout;",
        "Ll/iam<",
        "Ll/ta50;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroid/widget/FrameLayout;

.field public b:Landroid/widget/LinearLayout;

.field public c:Landroid/widget/LinearLayout;

.field public d:Lv/VImage;

.field public e:Lv/VImage;

.field public f:Landroid/widget/FrameLayout;

.field public g:Landroid/widget/LinearLayout;

.field public h:Lv/VText;

.field public i:Lv/VText;

.field public j:Lv/VText;

.field public k:Ll/ta50;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/other/obs/ObsPreviewView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/other/obs/ObsPreviewView;->m(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/other/obs/ObsPreviewView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/other/obs/ObsPreviewView;->j(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/livingroom/other/obs/ObsPreviewView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/other/obs/ObsPreviewView;->k(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/live/livingroom/other/obs/ObsPreviewView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/other/obs/ObsPreviewView;->l(Landroid/view/View;)V

    return-void
.end method

.method private synthetic j(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/obs/ObsPreviewView;->k:Ll/ta50;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ta50;->k4()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method private synthetic k(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/obs/ObsPreviewView;->k:Ll/ta50;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ta50;->l4()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic l(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/obs/ObsPreviewView;->k:Ll/ta50;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ta50;->m4()V

    .line 6
    .line 7
    .line 8
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

.method public final e(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ya50;->a(Lcom/p1/mobile/putong/live/livingroom/other/obs/ObsPreviewView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public f(Ll/ta50;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/obs/ObsPreviewView;->k:Ll/ta50;

    .line 2
    .line 3
    return-void
.end method

.method public i()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/obs/ObsPreviewView;->b:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/ta50;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/other/obs/ObsPreviewView;->f(Ll/ta50;)V

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

.method public final synthetic m(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/obs/ObsPreviewView;->k:Ll/ta50;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ta50;->n4()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public n(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/obs/ObsPreviewView;->i:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/view/View;->setEnabled(Z)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/obs/ObsPreviewView;->i:Lv/VText;

    .line 7
    .line 8
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->tc:I

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/other/obs/ObsPreviewView;->e(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/obs/ObsPreviewView;->i:Lv/VText;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/obs/ObsPreviewView;->d:Lv/VImage;

    .line 14
    .line 15
    new-instance v1, Ll/ua50;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/ua50;-><init>(Lcom/p1/mobile/putong/live/livingroom/other/obs/ObsPreviewView;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/obs/ObsPreviewView;->i:Lv/VText;

    .line 24
    .line 25
    new-instance v1, Ll/va50;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Ll/va50;-><init>(Lcom/p1/mobile/putong/live/livingroom/other/obs/ObsPreviewView;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/obs/ObsPreviewView;->g:Landroid/widget/LinearLayout;

    .line 34
    .line 35
    new-instance v1, Ll/wa50;

    .line 36
    .line 37
    invoke-direct {v1, p0}, Ll/wa50;-><init>(Lcom/p1/mobile/putong/live/livingroom/other/obs/ObsPreviewView;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/obs/ObsPreviewView;->e:Lv/VImage;

    .line 44
    .line 45
    new-instance v1, Ll/xa50;

    .line 46
    .line 47
    invoke-direct {v1, p0}, Ll/xa50;-><init>(Lcom/p1/mobile/putong/live/livingroom/other/obs/ObsPreviewView;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public p(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/obs/ObsPreviewView;->f:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    xor-int/lit8 v1, p1, 0x1

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/obs/ObsPreviewView;->g:Landroid/widget/LinearLayout;

    .line 9
    .line 10
    xor-int/lit8 p1, p1, 0x1

    .line 11
    .line 12
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public q(Z)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public s(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/obs/ObsPreviewView;->h:Lv/VText;

    .line 2
    .line 3
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->vc:I

    .line 4
    .line 5
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-virtual {p1, v0, p2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
