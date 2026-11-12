.class public final Lixe;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lw73;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lkxe;


# direct methods
.method public synthetic constructor <init>(Lkxe;B)V
    .registers 3

    iput-byte p2, p0, Lixe;->a:B

    iput-object p1, p0, Lixe;->b:Lkxe;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final b(Ljava/lang/Object;FZ)V
    .registers 9

    iget-byte v0, p0, Lixe;->a:B

    iget-object p0, p0, Lixe;->b:Lkxe;

    packed-switch v0, :pswitch_data_70

    check-cast p1, Lcom/google/android/material/slider/h;

    iget-object p0, p0, Lkxe;->y:Lcom/opera/android/settings/SettingsManager;

    if-eqz p3, :cond_59

    instance-of p2, p1, Lcom/opera/android/widget/ScheduleRangeSlider;

    if-eqz p2, :cond_59

    check-cast p1, Lcom/opera/android/widget/ScheduleRangeSlider;

    invoke-virtual {p1}, Lcom/opera/android/widget/ScheduleRangeSlider;->F0()F

    move-result p2

    float-to-int p2, p2

    const/16 p3, 0x18

    if-le p2, p3, :cond_1f

    sub-int/2addr p2, p3

    :goto_1d
    int-to-long v0, p2

    goto :goto_21

    :cond_1f
    add-int/2addr p2, p3

    goto :goto_1d

    :goto_21
    const-wide/16 v2, 0x1e

    mul-long/2addr v0, v2

    sget-object p2, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p2, v0, v1}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    const-string v4, "night_mode_schedule_end"

    invoke-virtual {p0, v0, v1, v4}, Lcom/opera/android/settings/SettingsManager;->W(JLjava/lang/String;)V

    iget-boolean v0, p1, Lcom/opera/android/widget/ScheduleRangeSlider;->h1:Z

    invoke-virtual {p1}, Lcom/google/android/material/slider/h;->y()Ljava/util/ArrayList;

    move-result-object v1

    const/high16 v4, 0x3e800000    # 0.25f

    invoke-virtual {p1, v4}, Lcom/opera/android/widget/ScheduleRangeSlider;->E0(F)F

    move-result p1

    invoke-static {v0, v1}, Lkotlin/collections/CollectionsKt;->M(ILjava/util/List;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    if-eqz v0, :cond_47

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result p1

    :cond_47
    float-to-int p1, p1

    if-le p1, p3, :cond_4d

    sub-int/2addr p1, p3

    :goto_4b
    int-to-long v0, p1

    goto :goto_4f

    :cond_4d
    add-int/2addr p1, p3

    goto :goto_4b

    :goto_4f
    mul-long/2addr v0, v2

    invoke-virtual {p2, v0, v1}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide p1

    const-string p3, "night_mode_schedule_start"

    invoke-virtual {p0, p1, p2, p3}, Lcom/opera/android/settings/SettingsManager;->W(JLjava/lang/String;)V

    :cond_59
    return-void

    :pswitch_5a
    check-cast p1, Lcom/google/android/material/slider/Slider;

    iget-object p3, p0, Lkxe;->y:Lcom/opera/android/settings/SettingsManager;

    iget-object p0, p0, Lkxe;->G:Lcr2;

    iget-object p0, p0, Lcr2;->d:Landroid/view/View;

    check-cast p0, Lcom/opera/android/widget/GradientSlider;

    if-ne p1, p0, :cond_69

    const-string p0, "night_mode_dimming"

    goto :goto_6b

    :cond_69
    const-string p0, "night_mode_temperature"

    :goto_6b
    float-to-int p1, p2

    invoke-virtual {p3, p1, p0}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    return-void

    :pswitch_data_70
    .packed-switch 0x0
        :pswitch_5a
    .end packed-switch
.end method
