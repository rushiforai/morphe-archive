.class public final synthetic Lcld;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lgld;


# direct methods
.method public synthetic constructor <init>(Lgld;B)V
    .registers 3

    iput-byte p2, p0, Lcld;->a:B

    iput-object p1, p0, Lcld;->b:Lgld;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    iget-byte v0, p0, Lcld;->a:B

    iget-object p0, p0, Lcld;->b:Lgld;

    packed-switch v0, :pswitch_data_52

    iget-object p0, p0, Lgld;->s:Lu02;

    if-eqz p0, :cond_17

    iget-object p0, p0, Lu02;->f:Ljava/lang/Object;

    check-cast p0, Lor2;

    iget-object p0, p0, Lor2;->f:Ljava/lang/Object;

    check-cast p0, Landroid/widget/RelativeLayout;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    :cond_17
    return-void

    :pswitch_18
    iget-object v0, p0, Lgld;->s:Lu02;

    if-eqz v0, :cond_50

    invoke-virtual {p0}, Lgld;->I0()V

    iget-object v0, p0, Lgld;->s:Lu02;

    iget-object v1, v0, Lu02;->d:Ljava/lang/Object;

    check-cast v1, Lwkd;

    iget-object v1, v1, Lwkd;->j:Lcom/opera/android/custom_views/StylingImageButton;

    iget-object v0, v0, Lu02;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/media/MediaPlayerBottomSlideLayout;

    iget-boolean v0, v0, Lcom/opera/android/media/MediaPlayerBottomSlideLayout;->a:Z

    invoke-virtual {v1, v0}, Landroid/view/View;->setActivated(Z)V

    iget-object v0, p0, Lgld;->s:Lu02;

    iget-object v0, v0, Lu02;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/media/MediaPlayerBottomSlideLayout;

    invoke-virtual {v0}, Lcom/opera/android/media/MediaPlayerBottomSlideLayout;->a()F

    move-result v0

    const/high16 v1, 0x3f800000    # 1.0f

    cmpl-float v0, v0, v1

    if-nez v0, :cond_44

    const v0, 0x7f080522

    goto :goto_47

    :cond_44
    const v0, 0x7f08051a

    :goto_47
    iget v1, p0, Lgld;->w:I

    if-eq v0, v1, :cond_50

    iput v0, p0, Lgld;->w:I

    invoke-virtual {p0}, Lltl;->E0()V

    :cond_50
    return-void

    nop

    :pswitch_data_52
    .packed-switch 0x0
        :pswitch_18
    .end packed-switch
.end method
