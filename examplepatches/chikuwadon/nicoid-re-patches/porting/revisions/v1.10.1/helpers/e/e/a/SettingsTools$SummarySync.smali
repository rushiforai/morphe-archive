.class final Le/e/a/SettingsTools$SummarySync;
.super Ljava/lang/Object;
.source "SettingsTools.java"

# interfaces
.implements Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;
.implements Landroid/view/View$OnAttachStateChangeListener;
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/SettingsTools;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "SummarySync"
.end annotation


# instance fields
.field active:Z

.field final activity:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/preference/PreferenceActivity;",
            ">;"
        }
    .end annotation
.end field

.field pending:Z

.field final prefs:Landroid/content/SharedPreferences;

.field final view:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroid/preference/PreferenceActivity;Landroid/view/View;)V
    .registers 4

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Le/e/a/SettingsTools$SummarySync;->activity:Ljava/lang/ref/WeakReference;

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Le/e/a/SettingsTools$SummarySync;->view:Ljava/lang/ref/WeakReference;

    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    iput-object p1, p0, Le/e/a/SettingsTools$SummarySync;->prefs:Landroid/content/SharedPreferences;

    return-void
.end method


# virtual methods
.method public onSharedPreferenceChanged(Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .registers 3

    .line 11
    iget-object p1, p0, Le/e/a/SettingsTools$SummarySync;->view:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    iget-boolean p2, p0, Le/e/a/SettingsTools$SummarySync;->active:Z

    if-eqz p2, :cond_18

    iget-boolean p2, p0, Le/e/a/SettingsTools$SummarySync;->pending:Z

    if-nez p2, :cond_18

    if-eqz p1, :cond_18

    const/4 p2, 0x1

    iput-boolean p2, p0, Le/e/a/SettingsTools$SummarySync;->pending:Z

    invoke-virtual {p1, p0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    :cond_18
    return-void
.end method

.method public onViewAttachedToWindow(Landroid/view/View;)V
    .registers 2

    .line 11
    iget-boolean p1, p0, Le/e/a/SettingsTools$SummarySync;->active:Z

    if-nez p1, :cond_c

    const/4 p1, 0x1

    iput-boolean p1, p0, Le/e/a/SettingsTools$SummarySync;->active:Z

    iget-object p1, p0, Le/e/a/SettingsTools$SummarySync;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {p1, p0}, Landroid/content/SharedPreferences;->registerOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    :cond_c
    return-void
.end method

.method public onViewDetachedFromWindow(Landroid/view/View;)V
    .registers 4

    .line 11
    const/4 v0, 0x0

    iput-boolean v0, p0, Le/e/a/SettingsTools$SummarySync;->active:Z

    iget-object v1, p0, Le/e/a/SettingsTools$SummarySync;->prefs:Landroid/content/SharedPreferences;

    invoke-interface {v1, p0}, Landroid/content/SharedPreferences;->unregisterOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    invoke-virtual {p1, p0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    iput-boolean v0, p0, Le/e/a/SettingsTools$SummarySync;->pending:Z

    return-void
.end method

.method public run()V
    .registers 3

    .line 11
    const/4 v0, 0x0

    iput-boolean v0, p0, Le/e/a/SettingsTools$SummarySync;->pending:Z

    iget-object v0, p0, Le/e/a/SettingsTools$SummarySync;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/preference/PreferenceActivity;

    iget-boolean v1, p0, Le/e/a/SettingsTools$SummarySync;->active:Z

    if-eqz v1, :cond_24

    if-eqz v0, :cond_24

    invoke-virtual {v0}, Landroid/preference/PreferenceActivity;->isFinishing()Z

    move-result v1

    if-nez v1, :cond_24

    invoke-virtual {v0}, Landroid/preference/PreferenceActivity;->isDestroyed()Z

    move-result v1

    if-nez v1, :cond_24

    invoke-virtual {v0}, Landroid/preference/PreferenceActivity;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v0

    invoke-static {v0}, Le/e/a/SettingsTools;->cleanSummaries(Landroid/preference/PreferenceGroup;)V

    :cond_24
    return-void
.end method
