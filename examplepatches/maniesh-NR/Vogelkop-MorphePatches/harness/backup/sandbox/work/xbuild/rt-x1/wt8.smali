.class public final Lwt8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lp5j;
.implements Ltdn;


# instance fields
.field public final synthetic a:Lxt8;


# direct methods
.method public constructor <init>(Lxt8;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lwt8;->a:Lxt8;

    return-void
.end method


# virtual methods
.method public final M(Ljava/lang/String;)V
    .registers 3

    const-string v0, "night_mode"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_10

    const-string v0, "night_mode_schedule"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1f

    :cond_10
    iget-object p0, p0, Lwt8;->a:Lxt8;

    iget-object p1, p0, Lxt8;->c:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p1}, Lcom/opera/android/settings/SettingsManager;->s()I

    move-result p1

    const/4 v0, 0x2

    if-eq p1, v0, :cond_1f

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lxt8;->R(I)V

    :cond_1f
    return-void
.end method

.method public final s()V
    .registers 3

    iget-object p0, p0, Lwt8;->a:Lxt8;

    iget-object v0, p0, Lxt8;->b:Lydn;

    iget-object v1, v0, Lydn;->d:Lvdn;

    iget-boolean v1, v1, Lvdn;->a:Z

    if-eqz v1, :cond_e

    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lxt8;->R(I)V

    :cond_e
    iget-object v0, v0, Lydn;->c:Lgfn;

    invoke-interface {v0}, Lgfn;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_1a

    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lxt8;->R(I)V

    :cond_1a
    return-void
.end method

.method public final t()V
    .registers 1

    return-void
.end method
