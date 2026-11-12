.class public final synthetic Loon;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lr8n;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Loon;->a:B

    iput-object p1, p0, Loon;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .registers 5

    iget-byte v0, p0, Loon;->a:B

    const v1, 0x7f06063b

    const/4 v2, 0x0

    iget-object p0, p0, Loon;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_b6

    check-cast p0, Lf7o;

    iget-object p0, p0, Lf7o;->b:Lq5g;

    iget-object p1, p0, Lq5g;->c:Ljava/lang/Object;

    check-cast p1, Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    instance-of v0, p1, Lc7o;

    if-eqz v0, :cond_1e

    move-object v2, p1

    check-cast v2, Lc7o;

    :cond_1e
    if-eqz v2, :cond_32

    iget-object p0, p0, Lq5g;->c:Ljava/lang/Object;

    check-cast p0, Landroid/widget/ImageView;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    const p1, 0x7f0402d4

    invoke-static {p1, p0, v1}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p0

    invoke-virtual {v2, p0}, Lc7o;->a(I)V

    :cond_32
    return-void

    :pswitch_33
    check-cast p0, Ld7o;

    iget-object p0, p0, Ld7o;->h:Ly6o;

    iget-object p1, p0, Ly6o;->c:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    instance-of v0, p1, Lc7o;

    if-eqz v0, :cond_44

    move-object v2, p1

    check-cast v2, Lc7o;

    :cond_44
    if-eqz v2, :cond_56

    iget-object p0, p0, Ly6o;->c:Landroid/widget/ImageView;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    const p1, 0x7f0402ef

    invoke-static {p1, p0, v1}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p0

    invoke-virtual {v2, p0}, Lc7o;->a(I)V

    :cond_56
    return-void

    :pswitch_57
    check-cast p0, Lcom/opera/android/startup/WelcomeActivity;

    sget p1, Lcom/opera/android/startup/WelcomeActivity;->w:I

    invoke-virtual {p0}, Lcom/opera/android/startup/WelcomeActivity;->P()V

    return-void

    :pswitch_5f
    check-cast p0, Lmrn;

    invoke-virtual {p0}, Lmrn;->j()V

    return-void

    :pswitch_65
    check-cast p0, Lwqn;

    iget-object p1, p0, Lwqn;->e:Lioh;

    if-eqz p1, :cond_6e

    invoke-virtual {p0, p1}, Lwqn;->X(Lioh;)V

    :cond_6e
    return-void

    :pswitch_6f
    check-cast p0, Lpon;

    iget-object p0, p0, Lpon;->b:Lb7k;

    iget-object v0, p0, Lb7k;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/weather/view/WeatherWidgetView;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lf03;->D(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v1

    iget-object v0, v0, Lcom/opera/android/weather/view/WeatherWidgetView;->a:Lvs;

    iget-object v0, v0, Lvs;->e:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object p0, p0, Lb7k;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/weather/view/WeatherWidgetView;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const v0, 0x7f0406a7

    const v1, 0x7f060f8d

    invoke-static {v0, p1, v1}, Lf03;->u(ILandroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    iget-object p0, p0, Lcom/opera/android/weather/view/WeatherWidgetView;->a:Lvs;

    iget-object p0, p0, Lvs;->c:Ljava/lang/Object;

    check-cast p0, Landroid/widget/LinearLayout;

    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p0

    instance-of v0, p0, Landroid/graphics/drawable/RippleDrawable;

    if-eqz v0, :cond_b4

    check-cast p0, Landroid/graphics/drawable/RippleDrawable;

    invoke-virtual {p0, p1}, Landroid/graphics/drawable/RippleDrawable;->setColor(Landroid/content/res/ColorStateList;)V

    :cond_b4
    return-void

    nop

    :pswitch_data_b6
    .packed-switch 0x0
        :pswitch_6f
        :pswitch_65
        :pswitch_5f
        :pswitch_57
        :pswitch_33
    .end packed-switch
.end method
