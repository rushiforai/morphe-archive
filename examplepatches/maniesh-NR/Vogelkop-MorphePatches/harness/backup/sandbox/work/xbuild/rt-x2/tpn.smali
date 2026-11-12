.class public final Ltpn;
.super Landroidx/fragment/app/Fragment;
.source "SourceFile"

# interfaces
.implements Lo37;


# instance fields
.field public final a:Lua7;

.field public final b:Lth;


# direct methods
.method public constructor <init>(Lgjm;)V
    .registers 4

    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    new-instance v0, Lua7;

    invoke-direct {v0, p0, p1}, Lua7;-><init>(Landroidx/fragment/app/Fragment;Lgjm;)V

    iput-object v0, p0, Ltpn;->a:Lua7;

    new-instance p1, Lsh;

    const/4 v0, 0x1

    invoke-direct {p1, v0}, Lsh;-><init>(B)V

    new-instance v0, Lr2n;

    const/16 v1, 0xf

    invoke-direct {v0, p0, v1}, Lr2n;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, p1, v0}, Landroidx/fragment/app/Fragment;->registerForActivityResult(Lrh;Lph;)Lth;

    move-result-object p1

    iput-object p1, p0, Ltpn;->b:Lth;

    return-void
.end method


# virtual methods
.method public final onCreate(Landroid/os/Bundle;)V
    .registers 8

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v0

    const/4 v3, 0x0

    const/4 v4, 0x1

    const-class v1, Lcom/opera/android/weather/ui/WeatherWidgetActivity;

    const/4 v2, 0x0

    sget-object v5, Llqm;->H:Llqm;

    invoke-static/range {v0 .. v5}, Lcom/opera/android/FullscreenWebActivity;->e0(Landroid/content/Context;Ljava/lang/Class;Ljava/lang/String;Lpxh;ZLlqm;)Landroid/content/Intent;

    move-result-object p1

    const/4 v0, 0x0

    iget-object p0, p0, Ltpn;->b:Lth;

    invoke-virtual {p0, p1, v0}, Lth;->a(Ljava/lang/Object;Lnh;)V

    return-void
.end method

.method public final r()Lua7;
    .registers 1

    iget-object p0, p0, Ltpn;->a:Lua7;

    return-object p0
.end method
