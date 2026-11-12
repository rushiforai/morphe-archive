.class public final synthetic Ld73;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lr8n;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lf73;


# direct methods
.method public synthetic constructor <init>(Lf73;B)V
    .registers 3

    iput-byte p2, p0, Ld73;->a:B

    iput-object p1, p0, Ld73;->b:Lf73;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .registers 3

    iget-byte v0, p0, Ld73;->a:B

    iget-object p0, p0, Ld73;->b:Lf73;

    packed-switch v0, :pswitch_data_2a

    iget-object p0, p0, Lf73;->d:Lowc;

    iget-object p0, p0, Lowc;->f:Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const v0, 0x7f040a7b

    invoke-static {v0, p1}, Lf03;->x(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/opera/android/custom_views/StylingImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void

    :pswitch_1a
    iget-object p0, p0, Lf73;->g:Le73;

    if-eqz p0, :cond_21

    invoke-virtual {p0, p1}, Le73;->a(Landroid/view/View;)V

    :cond_21
    return-void

    :pswitch_22
    iget-object p0, p0, Lf73;->f:Lr8n;

    if-eqz p0, :cond_29

    invoke-interface {p0, p1}, Lr8n;->a(Landroid/view/View;)V

    :cond_29
    return-void

    :pswitch_data_2a
    .packed-switch 0x0
        :pswitch_22
        :pswitch_1a
    .end packed-switch
.end method
