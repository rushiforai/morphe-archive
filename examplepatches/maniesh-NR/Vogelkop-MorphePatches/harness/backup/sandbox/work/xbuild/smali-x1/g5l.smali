.class public final synthetic Lg5l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lh5l;


# direct methods
.method public synthetic constructor <init>(Lh5l;B)V
    .registers 3

    iput-byte p2, p0, Lg5l;->a:B

    iput-object p1, p0, Lg5l;->b:Lh5l;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 7

    iget-byte v0, p0, Lg5l;->a:B

    iget-object p0, p0, Lg5l;->b:Lh5l;

    packed-switch v0, :pswitch_data_3a

    check-cast p1, Lqyi;

    iget-object p1, p0, Lh5l;->b:Ld5l;

    iget-object v0, p1, Ld5l;->e:Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v0, :cond_2f

    iget-object v0, p0, Lh5l;->i:Lu2l;

    if-eqz v0, :cond_2f

    iget-object v0, v0, Lu2l;->a:Lb2l;

    iget-object v1, p0, Lh5l;->e:Ls9i;

    invoke-virtual {v1, v0}, Ls9i;->Z(Lb2l;)Z

    move-result v0

    iget-object v1, p1, Ld5l;->d:Lcom/opera/android/custom_views/StylingImageButton;

    const/4 v2, 0x0

    const/4 v3, 0x4

    if-eqz v0, :cond_23

    move v4, v3

    goto :goto_24

    :cond_23
    move v4, v2

    :goto_24
    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    iget-object p1, p1, Ld5l;->e:Lcom/opera/android/custom_views/StylingImageButton;

    if-nez v0, :cond_2c

    move v2, v3

    :cond_2c
    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    :cond_2f
    invoke-virtual {p0}, Lh5l;->Z()V

    return-void

    :pswitch_33
    check-cast p1, Ljava/util/LinkedHashSet;

    invoke-virtual {p0}, Lh5l;->Z()V

    return-void

    nop

    :pswitch_data_3a
    .packed-switch 0x0
        :pswitch_33
    .end packed-switch
.end method
