.class public final Lqa2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public b:Z

.field public c:Z

.field public final synthetic d:Landroid/widget/FrameLayout;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/FrameLayout;B)V
    .registers 3

    iput-byte p2, p0, Lqa2;->a:B

    iput-object p1, p0, Lqa2;->d:Landroid/widget/FrameLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    iget-byte v0, p0, Lqa2;->a:B

    iget-object v1, p0, Lqa2;->d:Landroid/widget/FrameLayout;

    const/4 v2, 0x0

    packed-switch v0, :pswitch_data_24

    iput-boolean v2, p0, Lqa2;->b:Z

    check-cast v1, Lcom/opera/android/widget/ThumbScroller;

    iget-boolean p0, p0, Lqa2;->c:Z

    sget v0, Lcom/opera/android/widget/ThumbScroller;->q:I

    const/4 v0, 0x1

    invoke-virtual {v1, v0, p0}, Lcom/opera/android/widget/ThumbScroller;->d(ZZ)V

    return-void

    :pswitch_15
    iput-boolean v2, p0, Lqa2;->c:Z

    check-cast v1, Landroidx/media3/ui/AspectRatioFrameLayout;

    iget-object v0, v1, Landroidx/media3/ui/AspectRatioFrameLayout;->b:Lpa2;

    if-eqz v0, :cond_22

    iget-boolean p0, p0, Lqa2;->b:Z

    invoke-interface {v0, p0}, Lpa2;->d(Z)V

    :cond_22
    return-void

    nop

    :pswitch_data_24
    .packed-switch 0x0
        :pswitch_15
    .end packed-switch
.end method
