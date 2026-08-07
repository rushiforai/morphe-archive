.class public Lcom/momo/xengine/media/SharePreferenceUtils;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private context:Landroid/content/Context;

.field private sp:Landroid/content/SharedPreferences;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/momo/xengine/media/SharePreferenceUtils;->context:Landroid/content/Context;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/momo/xengine/media/SharePreferenceUtils;->sp:Landroid/content/SharedPreferences;

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public getInt(Ljava/lang/String;)I
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/momo/xengine/media/SharePreferenceUtils;->sp:Landroid/content/SharedPreferences;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-interface {p0, p1, v0}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    return p0
.end method

.method public init(Landroid/content/Context;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Lcom/momo/xengine/media/SharePreferenceUtils;->context:Landroid/content/Context;

    .line 4
    .line 5
    const-string v0, "xom.momo.xengine.media"

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iput-object p1, p0, Lcom/momo/xengine/media/SharePreferenceUtils;->sp:Landroid/content/SharedPreferences;

    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public putInt(Ljava/lang/String;I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xengine/media/SharePreferenceUtils;->sp:Landroid/content/SharedPreferences;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method
