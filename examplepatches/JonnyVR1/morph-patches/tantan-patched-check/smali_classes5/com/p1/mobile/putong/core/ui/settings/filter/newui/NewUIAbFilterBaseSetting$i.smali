.class public Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting$i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting;->O0(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Settings;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting$i;->a:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting$i;->a:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting;

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    iget-object v0, p1, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting;->q:Lv/VSlider;

    .line 6
    .line 7
    invoke-virtual {v0}, Lv/VSlider;->getValue()F

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting;->n0(F)V

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting;->q:Lv/VSlider;

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    invoke-virtual {p1, v0}, Lv/VSlider;->setValue(F)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting$i;->a:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting;

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting;->n0(F)V

    .line 24
    .line 25
    .line 26
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting$i;->a:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting;

    .line 27
    .line 28
    if-eqz p2, :cond_1

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting;->Q0()V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/NewUIAbFilterBaseSetting;->s0()V

    .line 35
    .line 36
    .line 37
    return-void
.end method
