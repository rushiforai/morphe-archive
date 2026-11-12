.class public final synthetic Ljpn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lr8n;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/android/weather/ui/WeatherWidgetActivity;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/weather/ui/WeatherWidgetActivity;B)V
    .registers 3

    iput-byte p2, p0, Ljpn;->a:B

    iput-object p1, p0, Ljpn;->b:Lcom/opera/android/weather/ui/WeatherWidgetActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .registers 3

    iget-byte v0, p0, Ljpn;->a:B

    iget-object p0, p0, Ljpn;->b:Lcom/opera/android/weather/ui/WeatherWidgetActivity;

    packed-switch v0, :pswitch_data_30

    iget-object p0, p0, Lcom/opera/android/weather/ui/WeatherWidgetActivity;->S:Lmcj;

    if-nez p0, :cond_c

    const/4 p0, 0x0

    :cond_c
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lf03;->I(Landroid/content/Context;)Z

    move-result p1

    invoke-virtual {p0, p1}, Lmcj;->r(Z)V

    return-void

    :pswitch_18
    sget p1, Lcom/opera/android/weather/ui/WeatherWidgetActivity;->e0:I

    invoke-virtual {p0}, Lcom/opera/android/weather/ui/WeatherWidgetActivity;->H0()Lrpn;

    move-result-object p1

    iget-object p1, p1, Lrpn;->d:Lrlh;

    iget-object p1, p1, Lrlh;->a:Lnak;

    invoke-virtual {p1}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lqpn;

    iget-object p1, p1, Lqpn;->a:Lptl;

    iget-object p1, p1, Lptl;->b:Lxsl;

    invoke-virtual {p0, p1}, Lcom/opera/android/weather/ui/WeatherWidgetActivity;->F0(Lxsl;)V

    return-void

    :pswitch_data_30
    .packed-switch 0x0
        :pswitch_18
    .end packed-switch
.end method
