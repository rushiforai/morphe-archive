.class public final synthetic Lcua;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:Lov0;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Lov0;Z)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcua;->a:Lov0;

    iput-boolean p2, p0, Lcua;->b:Z

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 7

    check-cast p1, Landroid/content/res/Configuration;

    iget p1, p1, Landroid/content/res/Configuration;->screenHeightDp:I

    const/16 v0, 0x258

    const/4 v1, 0x0

    if-lt p1, v0, :cond_b

    const/4 p1, 0x1

    goto :goto_c

    :cond_b
    move p1, v1

    :goto_c
    iget-object v0, p0, Lcua;->a:Lov0;

    iget-object v2, v0, Lov0;->d:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/widget/AspectRatioImageView;

    const/16 v3, 0x8

    if-eqz p1, :cond_18

    move v4, v1

    goto :goto_19

    :cond_18
    move v4, v3

    :goto_19
    invoke-virtual {v2, v4}, Landroid/view/View;->setVisibility(I)V

    iget-boolean p0, p0, Lcua;->b:Z

    if-eqz p0, :cond_2a

    iget-object p0, v0, Lov0;->c:Ljava/lang/Object;

    check-cast p0, Landroid/widget/FrameLayout;

    if-nez p1, :cond_27

    move v1, v3

    :cond_27
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    :cond_2a
    return-void
.end method
