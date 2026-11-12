.class public final Lc5b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements La5n;


# instance fields
.field public final synthetic a:B

.field public final b:Landroid/widget/LinearLayout;

.field public final c:Lcom/opera/android/custom_views/StylingImageView;


# direct methods
.method public constructor <init>(Landroid/widget/LinearLayout;Lcom/opera/android/custom_views/StylingImageView;Lcom/opera/android/custom_views/StylingTextView;)V
    .registers 4

    const/4 p3, 0x1

    iput-byte p3, p0, Lc5b;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lc5b;->b:Landroid/widget/LinearLayout;

    iput-object p2, p0, Lc5b;->c:Lcom/opera/android/custom_views/StylingImageView;

    return-void
.end method

.method public constructor <init>(Landroid/widget/LinearLayout;Lpq3;Lcom/opera/android/custom_views/StylingImageView;Lcom/opera/android/custom_views/StylingTextView;Lcom/opera/android/custom_views/DialogTitle;)V
    .registers 6

    const/4 p2, 0x0

    iput-byte p2, p0, Lc5b;->a:B

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput-object p1, p0, Lc5b;->b:Landroid/widget/LinearLayout;

    .line 13
    iput-object p3, p0, Lc5b;->c:Lcom/opera/android/custom_views/StylingImageView;

    return-void
.end method


# virtual methods
.method public final getRoot()Landroid/view/View;
    .registers 2

    iget-byte v0, p0, Lc5b;->a:B

    packed-switch v0, :pswitch_data_c

    iget-object p0, p0, Lc5b;->b:Landroid/widget/LinearLayout;

    return-object p0

    :pswitch_8
    iget-object p0, p0, Lc5b;->b:Landroid/widget/LinearLayout;

    return-object p0

    nop

    :pswitch_data_c
    .packed-switch 0x0
        :pswitch_8
    .end packed-switch
.end method
