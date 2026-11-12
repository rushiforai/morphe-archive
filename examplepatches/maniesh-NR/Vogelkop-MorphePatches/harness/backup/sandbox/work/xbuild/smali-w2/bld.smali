.class public final synthetic Lbld;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lgld;


# direct methods
.method public synthetic constructor <init>(Lgld;B)V
    .registers 3

    iput-byte p2, p0, Lbld;->a:B

    iput-object p1, p0, Lbld;->b:Lgld;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 8

    iget-byte p1, p0, Lbld;->a:B

    const/4 v0, 0x0

    iget-object p0, p0, Lbld;->b:Lgld;

    packed-switch p1, :pswitch_data_76

    iput-boolean v0, p0, Lgld;->x:Z

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object v1, p0, Lgld;->s:Lu02;

    iget-object v1, v1, Lu02;->e:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/media/PlayerContainerView;

    sget v2, Lcom/opera/android/media/MediaPlayerActivity;->t:I

    new-instance v2, Landroid/content/Intent;

    const/4 v3, 0x0

    const-class v4, Lcom/opera/android/media/MediaPlayerActivity;

    const-string v5, "android.intent.action.VIEW"

    invoke-direct {v2, v5, v3, p1, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;Landroid/content/Context;Ljava/lang/Class;)V

    const/high16 v3, 0x10000000

    invoke-virtual {v2, v3}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    const-string v3, "sourceBounds"

    invoke-virtual {v1}, Lcom/opera/android/media/PlayerContainerView;->d()Landroid/graphics/Rect;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v3

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v4

    invoke-static {v1, v0, v0, v3, v4}, Landroid/app/ActivityOptions;->makeScaleUpAnimation(Landroid/view/View;IIII)Landroid/app/ActivityOptions;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/ActivityOptions;->toBundle()Landroid/os/Bundle;

    move-result-object v0

    invoke-virtual {p1, v2, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;Landroid/os/Bundle;)V

    iget-object p1, p0, Lgld;->v:Lxbf;

    iget-object p1, p1, Lxbf;->b:Ljava/lang/Object;

    check-cast p1, Ltjg;

    new-instance v0, Leld;

    invoke-direct {v0, p0, p1}, Leld;-><init>(Lgld;Ltjg;)V

    invoke-virtual {p1, v0}, Ltjg;->a(Lrjg;)V

    return-void

    :pswitch_50
    iget-object p0, p0, Lgld;->v:Lxbf;

    iget-object p0, p0, Lxbf;->g:Ljava/lang/Object;

    check-cast p0, Luuj;

    invoke-virtual {p0}, Luuj;->i()I

    move-result p1

    if-lez p1, :cond_62

    iput p1, p0, Luuj;->a:I

    invoke-virtual {p0, v0}, Luuj;->m(I)V

    goto :goto_67

    :cond_62
    iget p1, p0, Luuj;->a:I

    invoke-virtual {p0, p1}, Luuj;->m(I)V

    :goto_67
    return-void

    :pswitch_68
    iget-object p0, p0, Lgld;->s:Lu02;

    iget-object p0, p0, Lu02;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/media/MediaPlayerBottomSlideLayout;

    iget-boolean p1, p0, Lcom/opera/android/media/MediaPlayerBottomSlideLayout;->a:Z

    xor-int/lit8 p1, p1, 0x1

    invoke-virtual {p0, p1}, Lcom/opera/android/media/MediaPlayerBottomSlideLayout;->b(Z)V

    return-void

    :pswitch_data_76
    .packed-switch 0x0
        :pswitch_68
        :pswitch_50
    .end packed-switch
.end method
