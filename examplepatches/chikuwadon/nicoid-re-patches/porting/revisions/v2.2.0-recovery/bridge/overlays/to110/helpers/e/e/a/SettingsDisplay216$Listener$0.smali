.class public final synthetic Le/e/a/SettingsDisplay216$Listener$0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation runtime Lcom/android/tools/r8/annotations/LambdaMethod;
    holder = "Le/e/a/SettingsDisplay216$Listener;"
    method = "lambda$onSharedPreferenceChanged$0"
    proto = "(Landroid/content/SharedPreferences;)V"
.end annotation


# instance fields
.field public final synthetic f$0:Le/e/a/SettingsDisplay216$Listener;

.field public final synthetic f$1:Landroid/content/SharedPreferences;


# direct methods
.method public synthetic constructor <init>(Le/e/a/SettingsDisplay216$Listener;Landroid/content/SharedPreferences;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/SettingsDisplay216$Listener$0;->f$0:Le/e/a/SettingsDisplay216$Listener;

    iput-object p2, p0, Le/e/a/SettingsDisplay216$Listener$0;->f$1:Landroid/content/SharedPreferences;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    .line 0
    iget-object v0, p0, Le/e/a/SettingsDisplay216$Listener$0;->f$0:Le/e/a/SettingsDisplay216$Listener;

    iget-object v1, p0, Le/e/a/SettingsDisplay216$Listener$0;->f$1:Landroid/content/SharedPreferences;

    invoke-virtual {v0, v1}, Le/e/a/SettingsDisplay216$Listener;->lambda$onSharedPreferenceChanged$0$e-e-a-SettingsDisplay216$Listener(Landroid/content/SharedPreferences;)V

    return-void
.end method
