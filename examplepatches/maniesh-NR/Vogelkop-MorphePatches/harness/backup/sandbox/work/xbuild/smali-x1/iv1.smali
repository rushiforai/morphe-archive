.class public final synthetic Liv1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lxv1;


# direct methods
.method public synthetic constructor <init>(Lxv1;B)V
    .registers 3

    iput-byte p2, p0, Liv1;->a:B

    iput-object p1, p0, Liv1;->b:Lxv1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 3

    iget-byte v0, p0, Liv1;->a:B

    iget-object p0, p0, Liv1;->b:Lxv1;

    packed-switch v0, :pswitch_data_32

    iget-object p0, p0, Lxv1;->P0:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/opera/android/settings/SettingsManager;

    new-instance v0, Lve5;

    const/16 v1, 0x1c

    invoke-direct {v0, v1}, Lve5;-><init>(B)V

    const-string v1, "ga_usage_statistics"

    invoke-static {p0, v1, v0}, Luyg;->d(Lcom/opera/android/settings/SettingsManager;Ljava/lang/String;Lkotlin/jvm/functions/Function2;)Lf99;

    move-result-object p0

    return-object p0

    :pswitch_1d
    iget-object p0, p0, Lxv1;->P0:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/opera/android/settings/SettingsManager;

    return-object p0

    :pswitch_26
    iget-object p0, p0, Lxv1;->i0:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Llpe;

    iget-object p0, p0, Llpe;->c:Lcq5;

    return-object p0

    nop

    :pswitch_data_32
    .packed-switch 0x0
        :pswitch_26
        :pswitch_1d
    .end packed-switch
.end method
