.class public final Lau8;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Ljava/util/EnumMap;

.field public final c:Ljava/util/HashMap;

.field public final d:Lb59;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/EnumMap;

    const-class v1, Lcue;

    invoke-direct {v0, v1}, Ljava/util/EnumMap;-><init>(Ljava/lang/Class;)V

    iput-object v0, p0, Lau8;->b:Ljava/util/EnumMap;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lau8;->c:Ljava/util/HashMap;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lau8;->a:Landroid/content/Context;

    sget-object v0, Lvml;->d:Lumi;

    const/4 v1, 0x0

    new-array v1, v1, [Lbg1;

    const-string v2, "feed"

    invoke-static {p1, v0, v2, v1}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object p1

    iput-object p1, p0, Lau8;->d:Lb59;

    return-void
.end method


# virtual methods
.method public final a(Lbwf;Lzt8;)Ljava/lang/Object;
    .registers 5

    const-string v0, "topnews"

    invoke-virtual {p1}, Lbwf;->a()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sget-object v1, Lcue;->b:Lcue;

    if-eqz v0, :cond_33

    sget-object p1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object p0, p0, Lau8;->a:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object p1

    const-string v0, "enable_newsfeed"

    invoke-virtual {p1, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_2d

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->z()Lfue;

    move-result-object p0

    invoke-virtual {p0}, Lfue;->d()V

    iget-object v1, p0, Lfue;->a:Lcue;

    :cond_2d
    const/4 p0, 0x1

    invoke-interface {p2, v1, p0}, Lzt8;->i(Lcue;Z)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :cond_33
    instance-of p0, p1, Lzqe;

    const/4 p1, 0x0

    if-eqz p0, :cond_3f

    sget-object p0, Lcue;->c:Lcue;

    invoke-interface {p2, p0, p1}, Lzt8;->i(Lcue;Z)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :cond_3f
    invoke-interface {p2, v1, p1}, Lzt8;->i(Lcue;Z)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
