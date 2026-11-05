.class public final synthetic Le/e/a/SettingsBackup$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceClickListener;


# instance fields
.field public final synthetic f$0:Landroid/preference/PreferenceGroup;

.field public final synthetic f$1:Landroid/preference/PreferenceActivity;

.field public final synthetic f$2:Z


# direct methods
.method public synthetic constructor <init>(Landroid/preference/PreferenceGroup;Landroid/preference/PreferenceActivity;Z)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/SettingsBackup$$ExternalSyntheticLambda0;->f$0:Landroid/preference/PreferenceGroup;

    iput-object p2, p0, Le/e/a/SettingsBackup$$ExternalSyntheticLambda0;->f$1:Landroid/preference/PreferenceActivity;

    iput-boolean p3, p0, Le/e/a/SettingsBackup$$ExternalSyntheticLambda0;->f$2:Z

    return-void
.end method


# virtual methods
.method public final onPreferenceClick(Landroid/preference/Preference;)Z
    .registers 5

    .line 0
    iget-object v0, p0, Le/e/a/SettingsBackup$$ExternalSyntheticLambda0;->f$0:Landroid/preference/PreferenceGroup;

    iget-object v1, p0, Le/e/a/SettingsBackup$$ExternalSyntheticLambda0;->f$1:Landroid/preference/PreferenceActivity;

    iget-boolean v2, p0, Le/e/a/SettingsBackup$$ExternalSyntheticLambda0;->f$2:Z

    invoke-static {v0, v1, v2, p1}, Le/e/a/SettingsBackup;->lambda$0(Landroid/preference/PreferenceGroup;Landroid/preference/PreferenceActivity;ZLandroid/preference/Preference;)Z

    move-result p1

    return p1
.end method
