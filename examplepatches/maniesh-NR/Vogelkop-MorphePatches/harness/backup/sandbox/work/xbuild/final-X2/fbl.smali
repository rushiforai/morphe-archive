.class public final Lfbl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements La5n;


# instance fields
.field public final synthetic a:B

.field public final b:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public final c:Landroid/view/View;

.field public final d:Landroid/view/View;

.field public final e:Landroid/view/View;

.field public final f:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroidx/constraintlayout/widget/ConstraintLayout;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageView;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/ui/catalog/widget/OperaTextView;)V
    .registers 7

    const/4 v0, 0x0

    iput-byte v0, p0, Lfbl;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfbl;->b:Landroidx/constraintlayout/widget/ConstraintLayout;

    iput-object p2, p0, Lfbl;->c:Landroid/view/View;

    iput-object p3, p0, Lfbl;->e:Landroid/view/View;

    iput-object p4, p0, Lfbl;->d:Landroid/view/View;

    iput-object p5, p0, Lfbl;->f:Landroid/view/View;

    return-void
.end method

.method public constructor <init>(Landroidx/constraintlayout/widget/ConstraintLayout;Lcom/opera/android/mainmenu/tiles/MainMenuTileLayout;Lcom/opera/android/mainmenu/tiles/MainMenuTileLayout;Lcom/opera/android/ui/catalog/widget/OperaListItem;Landroid/widget/LinearLayout;)V
    .registers 7

    const/4 v0, 0x1

    iput-byte v0, p0, Lfbl;->a:B

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput-object p1, p0, Lfbl;->b:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 19
    iput-object p2, p0, Lfbl;->c:Landroid/view/View;

    .line 20
    iput-object p3, p0, Lfbl;->d:Landroid/view/View;

    .line 21
    iput-object p4, p0, Lfbl;->e:Landroid/view/View;

    .line 22
    iput-object p5, p0, Lfbl;->f:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final getRoot()Landroid/view/View;
    .registers 2

    iget-byte v0, p0, Lfbl;->a:B

    iget-object p0, p0, Lfbl;->b:Landroidx/constraintlayout/widget/ConstraintLayout;

    return-object p0
.end method
