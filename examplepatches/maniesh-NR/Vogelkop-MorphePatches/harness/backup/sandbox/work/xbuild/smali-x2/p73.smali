.class public final synthetic Lp73;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lr8n;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/android/custom_views/StylingImageView;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/custom_views/StylingImageView;B)V
    .registers 3

    iput-byte p2, p0, Lp73;->a:B

    iput-object p1, p0, Lp73;->b:Lcom/opera/android/custom_views/StylingImageView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .registers 4

    iget-byte p1, p0, Lp73;->a:B

    iget-object p0, p0, Lp73;->b:Lcom/opera/android/custom_views/StylingImageView;

    packed-switch p1, :pswitch_data_2c

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lf03;->v(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/opera/android/custom_views/StylingImageView;->c(Landroid/content/res/ColorStateList;)V

    return-void

    :pswitch_13
    sget p1, Lcom/opera/android/custom_views/EmptyListView;->e:I

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const v0, 0x7f040526

    const v1, 0x7f0600ac

    invoke-static {v0, p1, v1}, Lf03;->u(ILandroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/opera/android/custom_views/StylingImageView;->c(Landroid/content/res/ColorStateList;)V

    return-void

    :pswitch_27
    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/opera/android/custom_views/StylingImageView;->c(Landroid/content/res/ColorStateList;)V

    return-void

    :pswitch_data_2c
    .packed-switch 0x0
        :pswitch_27
        :pswitch_13
    .end packed-switch
.end method
