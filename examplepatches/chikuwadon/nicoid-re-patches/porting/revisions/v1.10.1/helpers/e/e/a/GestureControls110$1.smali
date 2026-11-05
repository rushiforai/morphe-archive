.class Le/e/a/GestureControls110$1;
.super Ljava/lang/Object;
.source "GestureControls110.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/GestureControls110;->configure(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$a:Landroid/app/Activity;

.field private final synthetic val$showSensitivity:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Landroid/app/Activity;Ljava/lang/Runnable;)V
    .registers 3

    .line 14
    iput-object p1, p0, Le/e/a/GestureControls110$1;->val$a:Landroid/app/Activity;

    iput-object p2, p0, Le/e/a/GestureControls110$1;->val$showSensitivity:Ljava/lang/Runnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .registers 4

    .line 14
    if-eqz p3, :cond_17

    iget-object p1, p0, Le/e/a/GestureControls110$1;->val$a:Landroid/app/Activity;

    invoke-static {p1}, Le/e/a/GestureControls110;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    add-int/lit8 p2, p2, 0x1

    const-string p3, "gesture_sensitivity"

    invoke-interface {p1, p3, p2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_17
    iget-object p1, p0, Le/e/a/GestureControls110$1;->val$showSensitivity:Ljava/lang/Runnable;

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .registers 2

    .line 14
    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .registers 2

    .line 14
    return-void
.end method
