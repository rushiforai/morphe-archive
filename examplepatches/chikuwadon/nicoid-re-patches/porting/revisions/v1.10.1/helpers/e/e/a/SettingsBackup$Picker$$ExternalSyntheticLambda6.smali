.class public final synthetic Le/e/a/SettingsBackup$Picker$$ExternalSyntheticLambda6;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Landroid/content/SharedPreferences;

.field public final synthetic f$1:Ljava/util/Map;

.field public final synthetic f$2:Landroid/app/Activity;


# direct methods
.method public synthetic constructor <init>(Landroid/content/SharedPreferences;Ljava/util/Map;Landroid/app/Activity;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/SettingsBackup$Picker$$ExternalSyntheticLambda6;->f$0:Landroid/content/SharedPreferences;

    iput-object p2, p0, Le/e/a/SettingsBackup$Picker$$ExternalSyntheticLambda6;->f$1:Ljava/util/Map;

    iput-object p3, p0, Le/e/a/SettingsBackup$Picker$$ExternalSyntheticLambda6;->f$2:Landroid/app/Activity;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    .line 0
    iget-object v0, p0, Le/e/a/SettingsBackup$Picker$$ExternalSyntheticLambda6;->f$0:Landroid/content/SharedPreferences;

    iget-object v1, p0, Le/e/a/SettingsBackup$Picker$$ExternalSyntheticLambda6;->f$1:Ljava/util/Map;

    iget-object v2, p0, Le/e/a/SettingsBackup$Picker$$ExternalSyntheticLambda6;->f$2:Landroid/app/Activity;

    invoke-static {v0, v1, v2}, Le/e/a/SettingsBackup$Picker;->lambda$4(Landroid/content/SharedPreferences;Ljava/util/Map;Landroid/app/Activity;)V

    return-void
.end method
