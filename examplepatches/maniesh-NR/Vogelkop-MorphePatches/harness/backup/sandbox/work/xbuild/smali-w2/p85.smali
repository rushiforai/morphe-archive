.class public final Lp85;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements La5n;


# instance fields
.field public final synthetic a:B

.field public final b:Landroid/widget/LinearLayout;

.field public final c:Lcom/opera/android/custom_views/StylingTextView;

.field public final d:Landroid/widget/FrameLayout;

.field public final e:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public final f:Landroid/view/ViewGroup;

.field public final g:Landroid/view/ViewGroup;

.field public final h:Landroid/view/View;

.field public final i:Landroid/view/View;

.field public final j:Landroid/view/View;

.field public final k:Landroid/view/View;

.field public final l:Landroid/view/View;

.field public final m:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/widget/LinearLayout;Lcom/opera/android/ui/catalog/widget/OperaListItem;Landroid/widget/LinearLayout;Landroid/widget/LinearLayout;Lcom/opera/android/custom_views/StylingTextView;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/custom_views/FadingRecyclerView;Lcom/opera/android/custom_views/SeparatorView;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/custom_views/PullSpinner;Landroid/widget/FrameLayout;)V
    .registers 14

    const/4 p9, 0x1

    iput-byte p9, p0, Lp85;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lp85;->b:Landroid/widget/LinearLayout;

    iput-object p2, p0, Lp85;->e:Landroidx/constraintlayout/widget/ConstraintLayout;

    iput-object p3, p0, Lp85;->f:Landroid/view/ViewGroup;

    iput-object p4, p0, Lp85;->g:Landroid/view/ViewGroup;

    iput-object p5, p0, Lp85;->c:Lcom/opera/android/custom_views/StylingTextView;

    iput-object p6, p0, Lp85;->h:Landroid/view/View;

    iput-object p7, p0, Lp85;->i:Landroid/view/View;

    iput-object p8, p0, Lp85;->j:Landroid/view/View;

    iput-object p10, p0, Lp85;->k:Landroid/view/View;

    iput-object p11, p0, Lp85;->l:Landroid/view/View;

    iput-object p12, p0, Lp85;->m:Landroid/view/View;

    iput-object p13, p0, Lp85;->d:Landroid/widget/FrameLayout;

    return-void
.end method

.method public constructor <init>(Landroidx/constraintlayout/widget/ConstraintLayout;Landroid/widget/FrameLayout;Landroid/widget/FrameLayout;Lcom/opera/android/custom_views/StylingTextView;Lcom/opera/android/custom_views/StylingTextView;Landroid/widget/LinearLayout;Landroid/widget/ImageView;Landroid/widget/TextView;Landroidx/constraintlayout/widget/ConstraintLayout;Landroid/widget/ImageView;Landroid/widget/ImageView;Lcom/opera/android/custom_views/DropShadowFrameLayout;)V
    .registers 14

    const/4 v0, 0x0

    iput-byte v0, p0, Lp85;->a:B

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput-object p1, p0, Lp85;->e:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 33
    iput-object p2, p0, Lp85;->d:Landroid/widget/FrameLayout;

    .line 34
    iput-object p3, p0, Lp85;->g:Landroid/view/ViewGroup;

    .line 35
    iput-object p4, p0, Lp85;->c:Lcom/opera/android/custom_views/StylingTextView;

    .line 36
    iput-object p5, p0, Lp85;->h:Landroid/view/View;

    .line 37
    iput-object p6, p0, Lp85;->b:Landroid/widget/LinearLayout;

    .line 38
    iput-object p7, p0, Lp85;->i:Landroid/view/View;

    .line 39
    iput-object p8, p0, Lp85;->l:Landroid/view/View;

    .line 40
    iput-object p9, p0, Lp85;->f:Landroid/view/ViewGroup;

    .line 41
    iput-object p10, p0, Lp85;->j:Landroid/view/View;

    .line 42
    iput-object p11, p0, Lp85;->k:Landroid/view/View;

    .line 43
    iput-object p12, p0, Lp85;->m:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final getRoot()Landroid/view/View;
    .registers 2

    iget-byte v0, p0, Lp85;->a:B

    packed-switch v0, :pswitch_data_c

    iget-object p0, p0, Lp85;->b:Landroid/widget/LinearLayout;

    return-object p0

    :pswitch_8
    iget-object p0, p0, Lp85;->e:Landroidx/constraintlayout/widget/ConstraintLayout;

    return-object p0

    nop

    :pswitch_data_c
    .packed-switch 0x0
        :pswitch_8
    .end packed-switch
.end method
