.class public final Lnck;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements La5n;


# instance fields
.field public final synthetic a:B

.field public final b:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public final c:Lcom/opera/android/custom_views/StylingTextView;

.field public final d:Lcom/opera/android/custom_views/StylingImageView;


# direct methods
.method public constructor <init>(Landroidx/constraintlayout/widget/ConstraintLayout;Lcom/opera/android/custom_views/StylingTextView;Lcom/opera/android/custom_views/StylingImageView;)V
    .registers 5

    const/4 v0, 0x1

    iput-byte v0, p0, Lnck;->a:B

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput-object p1, p0, Lnck;->b:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 15
    iput-object p2, p0, Lnck;->c:Lcom/opera/android/custom_views/StylingTextView;

    .line 16
    iput-object p3, p0, Lnck;->d:Lcom/opera/android/custom_views/StylingImageView;

    return-void
.end method

.method public constructor <init>(Landroidx/constraintlayout/widget/ConstraintLayout;Lcom/opera/android/custom_views/StylingTextView;Lcom/opera/android/custom_views/StylingImageView;Lcom/opera/android/custom_views/StylingTextView;)V
    .registers 5

    const/4 p2, 0x0

    iput-byte p2, p0, Lnck;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnck;->b:Landroidx/constraintlayout/widget/ConstraintLayout;

    iput-object p3, p0, Lnck;->d:Lcom/opera/android/custom_views/StylingImageView;

    iput-object p4, p0, Lnck;->c:Lcom/opera/android/custom_views/StylingTextView;

    return-void
.end method


# virtual methods
.method public final getRoot()Landroid/view/View;
    .registers 2

    iget-byte v0, p0, Lnck;->a:B

    packed-switch v0, :pswitch_data_c

    iget-object p0, p0, Lnck;->b:Landroidx/constraintlayout/widget/ConstraintLayout;

    return-object p0

    :pswitch_8
    iget-object p0, p0, Lnck;->b:Landroidx/constraintlayout/widget/ConstraintLayout;

    return-object p0

    nop

    :pswitch_data_c
    .packed-switch 0x0
        :pswitch_8
    .end packed-switch
.end method
