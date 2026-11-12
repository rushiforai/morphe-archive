.class public final Ljm9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements La5n;


# instance fields
.field public final synthetic a:B

.field public final b:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public final c:Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;


# direct methods
.method public constructor <init>(Landroidx/constraintlayout/widget/ConstraintLayout;Lcom/opera/android/custom_views/CheckBox;Lcom/opera/android/custom_views/StylingTextView;Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;)V
    .registers 6

    const/4 p2, 0x1

    iput-byte p2, p0, Ljm9;->a:B

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput-object p1, p0, Ljm9;->b:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 13
    iput-object p5, p0, Ljm9;->c:Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    return-void
.end method

.method public constructor <init>(Landroidx/constraintlayout/widget/ConstraintLayout;Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;)V
    .registers 4

    const/4 v0, 0x0

    iput-byte v0, p0, Ljm9;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ljm9;->b:Landroidx/constraintlayout/widget/ConstraintLayout;

    iput-object p2, p0, Ljm9;->c:Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    return-void
.end method


# virtual methods
.method public final getRoot()Landroid/view/View;
    .registers 2

    iget-byte v0, p0, Ljm9;->a:B

    packed-switch v0, :pswitch_data_c

    iget-object p0, p0, Ljm9;->b:Landroidx/constraintlayout/widget/ConstraintLayout;

    return-object p0

    :pswitch_8
    iget-object p0, p0, Ljm9;->b:Landroidx/constraintlayout/widget/ConstraintLayout;

    return-object p0

    nop

    :pswitch_data_c
    .packed-switch 0x0
        :pswitch_8
    .end packed-switch
.end method
