.class final Le/e/a/SettingsDisplay216$Listener;
.super Ljava/lang/Object;
.source "SettingsDisplay216.java"

# interfaces
.implements Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/SettingsDisplay216;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Listener"
.end annotation


# instance fields
.field private final activity:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/preference/PreferenceActivity;",
            ">;"
        }
    .end annotation
.end field

.field private final list:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/widget/ListView;",
            ">;"
        }
    .end annotation
.end field

.field private final observer:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/ViewTreeObserver;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroid/preference/PreferenceActivity;)V
    .registers 3

    .line 214
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 215
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Le/e/a/SettingsDisplay216$Listener;->activity:Ljava/lang/ref/WeakReference;

    .line 216
    invoke-virtual {p1}, Landroid/preference/PreferenceActivity;->getListView()Landroid/widget/ListView;

    move-result-object p1

    .line 217
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Le/e/a/SettingsDisplay216$Listener;->list:Ljava/lang/ref/WeakReference;

    .line 218
    new-instance v0, Ljava/lang/ref/WeakReference;

    if-nez p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Landroid/widget/ListView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object p1

    :goto_0
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Le/e/a/SettingsDisplay216$Listener;->observer:Ljava/lang/ref/WeakReference;

    .line 219
    return-void
.end method


# virtual methods
.method attach()V
    .registers 3

    .line 222
    iget-object v0, p0, Le/e/a/SettingsDisplay216$Listener;->observer:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/ViewTreeObserver;

    .line 223
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 224
    :cond_0
    return-void
.end method

.method close(Landroid/content/SharedPreferences;)V
    .registers 3

    .line 227
    invoke-interface {p1, p0}, Landroid/content/SharedPreferences;->unregisterOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    .line 228
    iget-object p1, p0, Le/e/a/SettingsDisplay216$Listener;->observer:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/ViewTreeObserver;

    .line 229
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1, p0}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 230
    :cond_0
    return-void
.end method

.method synthetic lambda$onSharedPreferenceChanged$0$e-e-a-SettingsDisplay216$Listener(Landroid/content/SharedPreferences;)V
    .registers 4

    .line 240
    iget-object v0, p0, Le/e/a/SettingsDisplay216$Listener;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/preference/PreferenceActivity;

    .line 241
    # invokes: Le/e/a/SettingsDisplay216;->valid(Landroid/preference/PreferenceActivity;)Z
    invoke-static {v0}, Le/e/a/SettingsDisplay216;->access$000(Landroid/preference/PreferenceActivity;)Z

    move-result v1

    if-eqz v1, :cond_0

    # invokes: Le/e/a/SettingsDisplay216;->refresh(Landroid/preference/PreferenceActivity;)V
    invoke-static {v0}, Le/e/a/SettingsDisplay216;->access$100(Landroid/preference/PreferenceActivity;)V

    goto :goto_0

    .line 242
    :cond_0
    invoke-virtual {p0, p1}, Le/e/a/SettingsDisplay216$Listener;->close(Landroid/content/SharedPreferences;)V

    .line 243
    :goto_0
    return-void
.end method

.method public onPreDraw()Z
    .registers 3

    .line 233
    iget-object v0, p0, Le/e/a/SettingsDisplay216$Listener;->activity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/preference/PreferenceActivity;

    .line 234
    # invokes: Le/e/a/SettingsDisplay216;->valid(Landroid/preference/PreferenceActivity;)Z
    invoke-static {v0}, Le/e/a/SettingsDisplay216;->access$000(Landroid/preference/PreferenceActivity;)Z

    move-result v1

    if-eqz v1, :cond_0

    # invokes: Le/e/a/SettingsDisplay216;->refresh(Landroid/preference/PreferenceActivity;)V
    invoke-static {v0}, Le/e/a/SettingsDisplay216;->access$100(Landroid/preference/PreferenceActivity;)V

    .line 235
    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method public onSharedPreferenceChanged(Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .registers 4

    .line 239
    # getter for: Le/e/a/SettingsDisplay216;->MAIN:Landroid/os/Handler;
    invoke-static {}, Le/e/a/SettingsDisplay216;->access$200()Landroid/os/Handler;

    move-result-object p2

    new-instance v0, Le/e/a/SettingsDisplay216$Listener$0;

    invoke-direct {v0, p0, p1}, Le/e/a/SettingsDisplay216$Listener$0;-><init>(Le/e/a/SettingsDisplay216$Listener;Landroid/content/SharedPreferences;)V

    invoke-virtual {p2, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 244
    return-void
.end method
