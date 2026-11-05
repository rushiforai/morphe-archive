.class public final synthetic Le/e/a/SettingsBackup$Picker$$ExternalSyntheticLambda4;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Landroid/app/Activity;

.field public final synthetic f$1:Ljava/util/Map;

.field public final synthetic f$2:Landroid/content/SharedPreferences;


# direct methods
.method public synthetic constructor <init>(Landroid/app/Activity;Ljava/util/Map;Landroid/content/SharedPreferences;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/SettingsBackup$Picker$$ExternalSyntheticLambda4;->f$0:Landroid/app/Activity;

    iput-object p2, p0, Le/e/a/SettingsBackup$Picker$$ExternalSyntheticLambda4;->f$1:Ljava/util/Map;

    iput-object p3, p0, Le/e/a/SettingsBackup$Picker$$ExternalSyntheticLambda4;->f$2:Landroid/content/SharedPreferences;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    .line 0
    iget-object v0, p0, Le/e/a/SettingsBackup$Picker$$ExternalSyntheticLambda4;->f$0:Landroid/app/Activity;

    iget-object v1, p0, Le/e/a/SettingsBackup$Picker$$ExternalSyntheticLambda4;->f$1:Ljava/util/Map;

    iget-object v2, p0, Le/e/a/SettingsBackup$Picker$$ExternalSyntheticLambda4;->f$2:Landroid/content/SharedPreferences;

    invoke-static {v0, v1, v2}, Le/e/a/SettingsBackup$Picker;->lambda$2(Landroid/app/Activity;Ljava/util/Map;Landroid/content/SharedPreferences;)V

    return-void
.end method
