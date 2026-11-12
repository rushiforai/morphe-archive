.class public final Lppn;
.super Lozb;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic i:B

.field public final synthetic j:Lcom/opera/android/weather/ui/WeatherWidgetActivity;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/weather/ui/WeatherWidgetActivity;B)V
    .registers 3

    iput-byte p2, p0, Lppn;->i:B

    iput-object p1, p0, Lppn;->j:Lcom/opera/android/weather/ui/WeatherWidgetActivity;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lozb;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 2

    iget-byte v0, p0, Lppn;->i:B

    iget-object p0, p0, Lppn;->j:Lcom/opera/android/weather/ui/WeatherWidgetActivity;

    packed-switch v0, :pswitch_data_16

    invoke-virtual {p0}, Lxd5;->getDefaultViewModelCreationExtras()Lg06;

    move-result-object p0

    return-object p0

    :pswitch_c
    invoke-virtual {p0}, Lxd5;->getViewModelStore()Lv7n;

    move-result-object p0

    return-object p0

    :pswitch_11
    invoke-virtual {p0}, Lxd5;->getDefaultViewModelProviderFactory()Lr7n;

    move-result-object p0

    return-object p0

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_11
        :pswitch_c
    .end packed-switch
.end method
