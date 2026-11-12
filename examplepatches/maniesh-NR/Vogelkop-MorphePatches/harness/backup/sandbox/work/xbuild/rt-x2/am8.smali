.class public final synthetic Lam8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ldm8;


# direct methods
.method public synthetic constructor <init>(Ldm8;B)V
    .registers 3

    iput-byte p2, p0, Lam8;->a:B

    iput-object p1, p0, Lam8;->b:Ldm8;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 5

    iget-byte v0, p0, Lam8;->a:B

    const/4 v1, 0x0

    const/16 v2, 0x8

    iget-object p0, p0, Lam8;->b:Ldm8;

    packed-switch v0, :pswitch_data_36

    iget-object v0, p0, Ldm8;->x:Ly83;

    iget-object v0, v0, Ly83;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    iget-object v3, p0, Ldm8;->A:Lqmj;

    invoke-virtual {v3}, Lqmj;->I()Z

    move-result v3

    if-eqz v3, :cond_19

    move v1, v2

    :cond_19
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p0}, Ldm8;->J0()V

    return-void

    :pswitch_20
    iget-object v0, p0, Ldm8;->x:Ly83;

    iget-object v0, v0, Ly83;->g:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    iget-object v3, p0, Ldm8;->z:Lqmj;

    invoke-virtual {v3}, Lqmj;->I()Z

    move-result v3

    if-eqz v3, :cond_2f

    move v1, v2

    :cond_2f
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p0}, Ldm8;->J0()V

    return-void

    :pswitch_data_36
    .packed-switch 0x0
        :pswitch_20
    .end packed-switch
.end method
