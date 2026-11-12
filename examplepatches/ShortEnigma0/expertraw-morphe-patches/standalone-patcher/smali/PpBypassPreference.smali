.class public Lcom/samsung/android/app/galaxyraw/mod/PpBypassPreference;
.super Lcom/samsung/android/app/galaxyraw/setting/CameraSwitchPreference;
.source "PpBypassPreference.java"


# instance fields
.field private mAttached:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3

    .line 24
    invoke-direct {p0, p1, p2}, Lcom/samsung/android/app/galaxyraw/setting/CameraSwitchPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 21
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/samsung/android/app/galaxyraw/mod/PpBypassPreference;->mAttached:Z

    .line 25
    return-void
.end method

.method static synthetic lambda$showRestartDialog$0(Landroid/content/Context;Landroid/content/DialogInterface;I)V
    .registers 3

    .line 64
    invoke-static {p0}, Lcom/samsung/android/app/galaxyraw/mod/PpBypassPreference;->restartApp(Landroid/content/Context;)V

    return-void
.end method

.method private static restartApp(Landroid/content/Context;)V
    .registers 3

    .line 74
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    .line 75
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    .line 76
    if-eqz v1, :cond_24

    .line 77
    invoke-virtual {v1}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v1

    invoke-static {v1}, Landroid/content/Intent;->makeRestartActivityTask(Landroid/content/ComponentName;)Landroid/content/Intent;

    move-result-object v1

    .line 78
    invoke-virtual {v1, v0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 79
    invoke-virtual {p0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 80
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object p0

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljava/lang/Runtime;->exit(I)V
    :try_end_24
    .catchall {:try_start_0 .. :try_end_24} :catchall_25

    .line 84
    :cond_24
    goto :goto_42

    .line 82
    :catchall_25
    move-exception p0

    .line 83
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "restartApp failed: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "GrawMod"

    invoke-static {v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 85
    :goto_42
    return-void
.end method

.method private showRestartDialog()V
    .registers 5

    .line 58
    invoke-virtual {p0}, Lcom/samsung/android/app/galaxyraw/mod/PpBypassPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 59
    if-nez v0, :cond_7

    return-void

    .line 61
    :cond_7
    :try_start_7
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v2, "Restart Expert RAW"

    .line 62
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "Restart the app to apply changes?"

    .line 63
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "Restart"

    new-instance v3, Lcom/samsung/android/app/galaxyraw/mod/PpBypassPreference$0;

    invoke-direct {v3, v0}, Lcom/samsung/android/app/galaxyraw/mod/PpBypassPreference$0;-><init>(Landroid/content/Context;)V

    .line 64
    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "Later"

    .line 65
    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 66
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;
    :try_end_2d
    .catchall {:try_start_7 .. :try_end_2d} :catchall_2e

    .line 69
    goto :goto_4b

    .line 67
    :catchall_2e
    move-exception v0

    .line 68
    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Could not show restart dialog: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "GrawMod"

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 70
    :goto_4b
    return-void
.end method


# virtual methods
.method public callChangeListener(Ljava/lang/Object;)Z
    .registers 4

    .line 46
    instance-of v0, p1, Ljava/lang/Boolean;

    if-eqz v0, :cond_22

    .line 47
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    .line 48
    invoke-virtual {p0}, Lcom/samsung/android/app/galaxyraw/mod/PpBypassPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/samsung/android/app/galaxyraw/mod/PpBypass;->isEnabled(Landroid/content/Context;)Z

    move-result v0

    .line 49
    iget-boolean v1, p0, Lcom/samsung/android/app/galaxyraw/mod/PpBypassPreference;->mAttached:Z

    if-eqz v1, :cond_22

    if-eq v0, p1, :cond_22

    .line 50
    invoke-virtual {p0}, Lcom/samsung/android/app/galaxyraw/mod/PpBypassPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/samsung/android/app/galaxyraw/mod/PpBypass;->set(Landroid/content/Context;Z)V

    .line 51
    invoke-direct {p0}, Lcom/samsung/android/app/galaxyraw/mod/PpBypassPreference;->showRestartDialog()V

    .line 54
    :cond_22
    const/4 p1, 0x1

    return p1
.end method

.method public onAttached()V
    .registers 2

    .line 29
    invoke-super {p0}, Lcom/samsung/android/app/galaxyraw/setting/CameraSwitchPreference;->onAttached()V

    .line 30
    invoke-virtual {p0}, Lcom/samsung/android/app/galaxyraw/mod/PpBypassPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/samsung/android/app/galaxyraw/mod/PpBypass;->isEnabled(Landroid/content/Context;)Z

    move-result v0

    invoke-super {p0, v0}, Lcom/samsung/android/app/galaxyraw/setting/CameraSwitchPreference;->setChecked(Z)V

    .line 31
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/samsung/android/app/galaxyraw/mod/PpBypassPreference;->mAttached:Z

    .line 32
    return-void
.end method

.method public setChecked(Z)V
    .registers 4

    .line 36
    invoke-virtual {p0}, Lcom/samsung/android/app/galaxyraw/mod/PpBypassPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/samsung/android/app/galaxyraw/mod/PpBypass;->isEnabled(Landroid/content/Context;)Z

    move-result v0

    .line 37
    invoke-super {p0, p1}, Lcom/samsung/android/app/galaxyraw/setting/CameraSwitchPreference;->setChecked(Z)V

    .line 38
    iget-boolean v1, p0, Lcom/samsung/android/app/galaxyraw/mod/PpBypassPreference;->mAttached:Z

    if-eqz v1, :cond_1b

    if-eq v0, p1, :cond_1b

    .line 39
    invoke-virtual {p0}, Lcom/samsung/android/app/galaxyraw/mod/PpBypassPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/samsung/android/app/galaxyraw/mod/PpBypass;->set(Landroid/content/Context;Z)V

    .line 40
    invoke-direct {p0}, Lcom/samsung/android/app/galaxyraw/mod/PpBypassPreference;->showRestartDialog()V

    .line 42
    :cond_1b
    return-void
.end method

.method public setOnPreferenceChangeListener(Landroidx/preference/Preference$OnPreferenceChangeListener;)V
    .registers 2

    .line 93
    return-void
.end method

.method public setOnPreferenceClickListener(Landroidx/preference/Preference$OnPreferenceClickListener;)V
    .registers 2

    .line 89
    return-void
.end method
