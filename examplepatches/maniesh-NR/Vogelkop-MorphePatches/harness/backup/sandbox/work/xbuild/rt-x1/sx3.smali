.class public final Lsx3;
.super Llim;
.source "SourceFile"

# interfaces
.implements Lp5j;


# instance fields
.field public final a:Lcom/opera/android/settings/SettingsManager;

.field public final b:Lb7f;


# direct methods
.method public constructor <init>(Lcom/opera/android/settings/SettingsManager;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-static {v0}, Luup;->m(Ljava/lang/Object;)Lb7f;

    move-result-object v0

    iput-object v0, p0, Lsx3;->b:Lb7f;

    iput-object p1, p0, Lsx3;->a:Lcom/opera/android/settings/SettingsManager;

    const-string v1, "thumb_scroller_enabled"

    invoke-virtual {p1, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Lb7f;->d(Ljava/lang/Object;)V

    invoke-virtual {p1, p0}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    return-void
.end method


# virtual methods
.method public final M(Ljava/lang/String;)V
    .registers 3

    const-string v0, "thumb_scroller_enabled"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_17

    iget-object p1, p0, Lsx3;->a:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p1, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    iget-object p0, p0, Lsx3;->b:Lb7f;

    invoke-virtual {p0, p1}, Lb7f;->d(Ljava/lang/Object;)V

    :cond_17
    return-void
.end method

.method public final onDestroy(Lndc;)V
    .registers 2

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    iget-object p1, p0, Lsx3;->a:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p1, p0}, Lcom/opera/android/settings/SettingsManager;->T(Lp5j;)V

    return-void
.end method
