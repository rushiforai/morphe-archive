.class public final synthetic Le/e/a/SettingsBackup$Picker$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:I

.field public final synthetic f$1:Landroid/content/SharedPreferences;

.field public final synthetic f$2:Landroid/app/Activity;

.field public final synthetic f$3:Landroid/net/Uri;


# direct methods
.method public synthetic constructor <init>(ILandroid/content/SharedPreferences;Landroid/app/Activity;Landroid/net/Uri;)V
    .registers 5

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Le/e/a/SettingsBackup$Picker$$ExternalSyntheticLambda2;->f$0:I

    iput-object p2, p0, Le/e/a/SettingsBackup$Picker$$ExternalSyntheticLambda2;->f$1:Landroid/content/SharedPreferences;

    iput-object p3, p0, Le/e/a/SettingsBackup$Picker$$ExternalSyntheticLambda2;->f$2:Landroid/app/Activity;

    iput-object p4, p0, Le/e/a/SettingsBackup$Picker$$ExternalSyntheticLambda2;->f$3:Landroid/net/Uri;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 5

    .line 0
    iget v0, p0, Le/e/a/SettingsBackup$Picker$$ExternalSyntheticLambda2;->f$0:I

    iget-object v1, p0, Le/e/a/SettingsBackup$Picker$$ExternalSyntheticLambda2;->f$1:Landroid/content/SharedPreferences;

    iget-object v2, p0, Le/e/a/SettingsBackup$Picker$$ExternalSyntheticLambda2;->f$2:Landroid/app/Activity;

    iget-object v3, p0, Le/e/a/SettingsBackup$Picker$$ExternalSyntheticLambda2;->f$3:Landroid/net/Uri;

    invoke-static {v0, v1, v2, v3}, Le/e/a/SettingsBackup$Picker;->lambda$0(ILandroid/content/SharedPreferences;Landroid/app/Activity;Landroid/net/Uri;)V

    return-void
.end method
