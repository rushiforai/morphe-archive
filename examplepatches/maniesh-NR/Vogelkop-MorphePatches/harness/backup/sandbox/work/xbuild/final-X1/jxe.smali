.class public final Ljxe;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lp5j;


# instance fields
.field public final a:Ljava/util/HashMap;

.field public final synthetic b:Lkxe;


# direct methods
.method public constructor <init>(Lkxe;Lcom/opera/android/settings/SettingsManager;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ljxe;->b:Lkxe;

    new-instance p1, Lkw3;

    const/16 v0, 0x10

    invoke-direct {p1, v0}, Lkw3;-><init>(B)V

    new-instance v0, Lkw3;

    const/16 v1, 0x11

    invoke-direct {v0, v1}, Lkw3;-><init>(B)V

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Ljxe;->a:Ljava/util/HashMap;

    const-string p0, "night_mode_dimming"

    invoke-virtual {v1, p0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p0, "night_mode_temperature"

    invoke-virtual {v1, p0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p0, "darken_websites_dark_theme"

    invoke-virtual {v1, p0, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p0, "night_mode"

    invoke-virtual {v1, p0, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p0, "night_mode_schedule"

    invoke-virtual {v1, p0, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p0, "night_mode_schedule_start"

    invoke-virtual {v1, p0, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p0, "night_mode_schedule_end"

    invoke-virtual {v1, p0, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance p0, Lnx3;

    const/4 p1, 0x1

    invoke-direct {p0, p2, p1}, Lnx3;-><init>(Lcom/opera/android/settings/SettingsManager;B)V

    const-string p1, "darken_websites"

    invoke-virtual {v1, p1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance p0, Lnx3;

    const/4 p1, 0x2

    invoke-direct {p0, p2, p1}, Lnx3;-><init>(Lcom/opera/android/settings/SettingsManager;B)V

    const-string p1, "night_mode_switch_theme"

    invoke-virtual {v1, p1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance p0, Lnx3;

    const/4 p1, 0x3

    invoke-direct {p0, p2, p1}, Lnx3;-><init>(Lcom/opera/android/settings/SettingsManager;B)V

    const-string p1, "night_mode_overlay_keyboard"

    invoke-virtual {v1, p1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final M(Ljava/lang/String;)V
    .registers 4

    iget-object v0, p0, Ljxe;->a:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_9

    return-void

    :cond_9
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lesk;

    const/4 v0, 0x0

    if-eqz p1, :cond_1d

    invoke-interface {p1}, Lesk;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    goto :goto_1e

    :cond_1d
    move p1, v0

    :goto_1e
    iget-object p0, p0, Ljxe;->b:Lkxe;

    if-eqz p1, :cond_32

    sget-object p1, Lowe;->c:Lowe;

    iget-object p1, p1, Lowe;->a:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result p1

    if-nez p1, :cond_32

    iget-object p1, p0, Lkxe;->J:Ldxe;

    const/4 v1, 0x1

    invoke-virtual {p1, v1, v0}, Ldxe;->T(ZZ)V

    :cond_32
    invoke-virtual {p0}, Lkxe;->J0()V

    return-void
.end method
