.class public final synthetic Lb6o;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lr8n;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Le6o;


# direct methods
.method public synthetic constructor <init>(Le6o;B)V
    .registers 3

    iput-byte p2, p0, Lb6o;->a:B

    iput-object p1, p0, Lb6o;->b:Le6o;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .registers 6

    iget-byte p1, p0, Lb6o;->a:B

    const v0, 0x7f06063b

    const v1, 0x7f0402d4

    const/4 v2, 0x0

    iget-object p0, p0, Lb6o;->b:Le6o;

    packed-switch p1, :pswitch_data_56

    iget-object p0, p0, Ld7o;->g:La5n;

    move-object p1, p0

    check-cast p1, Lx6o;

    iget-object p1, p1, Lx6o;->g:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    instance-of v3, p1, Lc7o;

    if-eqz v3, :cond_20

    move-object v2, p1

    check-cast v2, Lc7o;

    :cond_20
    if-eqz v2, :cond_31

    check-cast p0, Lx6o;

    iget-object p0, p0, Lx6o;->g:Landroid/widget/ImageView;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {v1, p0, v0}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p0

    invoke-virtual {v2, p0}, Lc7o;->a(I)V

    :cond_31
    return-void

    :pswitch_32
    iget-object p0, p0, Ld7o;->g:La5n;

    move-object p1, p0

    check-cast p1, Lx6o;

    iget-object p1, p1, Lx6o;->c:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    instance-of v3, p1, Lc7o;

    if-eqz v3, :cond_44

    move-object v2, p1

    check-cast v2, Lc7o;

    :cond_44
    if-eqz v2, :cond_55

    check-cast p0, Lx6o;

    iget-object p0, p0, Lx6o;->c:Landroid/widget/ImageView;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {v1, p0, v0}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p0

    invoke-virtual {v2, p0}, Lc7o;->a(I)V

    :cond_55
    return-void

    :pswitch_data_56
    .packed-switch 0x0
        :pswitch_32
    .end packed-switch
.end method
