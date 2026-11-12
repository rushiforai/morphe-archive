.class public final Le23;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public b:Z

.field public c:Ljava/lang/String;

.field public final d:Ljava/lang/Object;

.field public final e:Ljava/lang/Object;

.field public final f:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lb2l;)V
    .registers 4

    const/4 v0, 0x0

    iput-byte v0, p0, Le23;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Lcom/opera/android/BrowserActivity;->O()Leej;

    move-result-object v0

    iput-object v0, p0, Le23;->d:Ljava/lang/Object;

    iput-object p1, p0, Le23;->e:Ljava/lang/Object;

    iput-object p2, p0, Le23;->f:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lk43;ZLjava/lang/String;Lv50;Ljava/lang/Long;)V
    .registers 7

    const/4 v0, 0x1

    iput-byte v0, p0, Le23;->a:B

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p2, p0, Le23;->b:Z

    iput-object p3, p0, Le23;->c:Ljava/lang/String;

    iput-object p4, p0, Le23;->d:Ljava/lang/Object;

    iput-object p5, p0, Le23;->e:Ljava/lang/Object;

    iput-object p1, p0, Le23;->f:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 11

    iget-byte v0, p0, Le23;->a:B

    iget-object v1, p0, Le23;->e:Ljava/lang/Object;

    iget-object v2, p0, Le23;->d:Ljava/lang/Object;

    iget-object v3, p0, Le23;->f:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_9e

    move-object v4, v3

    check-cast v4, Lk43;

    iget-boolean v5, p0, Le23;->b:Z

    iget-object v6, p0, Le23;->c:Ljava/lang/String;

    move-object v8, v2

    check-cast v8, Lv50;

    move-object v9, v1

    check-cast v9, Ljava/lang/Long;

    const/4 v7, 0x1

    invoke-virtual/range {v4 .. v9}, Lk43;->c(ZLjava/lang/String;ZLv50;Ljava/lang/Long;)V

    return-void

    :pswitch_1d
    check-cast v1, Lcom/opera/android/BrowserActivity;

    check-cast v3, Lb2l;

    check-cast v3, Ld7l;

    iget-object v0, v3, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->isActive()Z

    move-result v0

    if-eqz v0, :cond_9d

    iget-object v0, p0, Le23;->c:Ljava/lang/String;

    if-eqz v0, :cond_9d

    iget-object v0, v3, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object v0

    iget-object p0, p0, Le23;->c:Ljava/lang/String;

    sget-object v3, Lwqm;->a:[Ljava/lang/String;

    invoke-static {v0}, Laik;->g(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0}, Laik;->g(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_9d

    invoke-virtual {v1}, Lcom/opera/android/BrowserActivity;->X0()Z

    move-result p0

    if-eqz p0, :cond_9d

    invoke-static {v1}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p0

    iget-object p0, p0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v0, "cookie.blocker.sheet.show.count"

    const/4 v3, 0x0

    invoke-interface {p0, v0, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0

    if-nez p0, :cond_9d

    sget-object p0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object p0

    const-string v0, "ad_blocking"

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_9d

    sget p0, Lcom/opera/android/browser/BannerBlockerHelper;->c:I

    const/4 v0, 0x2

    if-eq p0, v0, :cond_9d

    invoke-virtual {v1}, Lcom/opera/android/BrowserActivity;->k0()Z

    move-result p0

    if-eqz p0, :cond_9d

    check-cast v2, Leej;

    invoke-virtual {v1}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->c:Lx5f;

    iget-object v0, v2, Leej;->c:Lgjm;

    if-eqz v0, :cond_9d

    iget-object v1, v2, Leej;->a:Lnej;

    new-instance v2, Lxq3;

    const/4 v3, 0x1

    invoke-direct {v2, p0, v0, v3}, Lxq3;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p0, Lijm;->b:Lijm;

    invoke-virtual {v1, v2, p0}, Lr22;->b(Ljjm;Lijm;)V

    :cond_9d
    return-void

    :pswitch_data_9e
    .packed-switch 0x0
        :pswitch_1d
    .end packed-switch
.end method
