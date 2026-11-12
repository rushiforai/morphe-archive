.class public final synthetic Lgxe;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/app/TimePickerDialog$OnTimeSetListener;


# instance fields
.field public final synthetic a:Lkxe;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Lkxe;Z)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lgxe;->a:Lkxe;

    iput-boolean p2, p0, Lgxe;->b:Z

    return-void
.end method


# virtual methods
.method public final onTimeSet(Landroid/widget/TimePicker;II)V
    .registers 7

    sget-object p1, Ljava/util/concurrent/TimeUnit;->HOURS:Ljava/util/concurrent/TimeUnit;

    int-to-long v0, p2

    invoke-virtual {p1, v0, v1}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide p1

    sget-object v0, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    int-to-long v1, p3

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    add-long/2addr v0, p1

    iget-object p1, p0, Lgxe;->a:Lkxe;

    iget-object p2, p1, Lkxe;->y:Lcom/opera/android/settings/SettingsManager;

    iget-boolean p0, p0, Lgxe;->b:Z

    if-eqz p0, :cond_1d

    const-string p0, "night_mode_schedule_start"

    invoke-virtual {p2, v0, v1, p0}, Lcom/opera/android/settings/SettingsManager;->W(JLjava/lang/String;)V

    goto :goto_22

    :cond_1d
    const-string p0, "night_mode_schedule_end"

    invoke-virtual {p2, v0, v1, p0}, Lcom/opera/android/settings/SettingsManager;->W(JLjava/lang/String;)V

    :goto_22
    invoke-virtual {p1}, Lkxe;->M0()V

    const/4 p0, 0x0

    iput-object p0, p1, Lkxe;->R:Landroid/app/TimePickerDialog;

    return-void
.end method
