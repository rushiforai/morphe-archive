.class public final Lcyf;
.super Lzxf;
.source "SourceFile"


# instance fields
.field public final synthetic e:Ldyf;


# direct methods
.method public constructor <init>(Ldyf;)V
    .registers 2

    iput-object p1, p0, Lcyf;->e:Ldyf;

    invoke-direct {p0, p1}, Lzxf;-><init>(Ldyf;)V

    return-void
.end method


# virtual methods
.method public final b(Lnre;)Ljava/util/ArrayList;
    .registers 2

    iget-object p0, p1, Lnre;->e:Ljava/util/List;

    iget-object p1, p1, Lnre;->g:Lbre;

    if-eqz p1, :cond_8

    const/4 p1, 0x1

    goto :goto_9

    :cond_8
    const/4 p1, 0x0

    :goto_9
    invoke-static {p0, p1}, Li41;->y(Ljava/util/Collection;Z)Ljava/util/ArrayList;

    move-result-object p0

    return-object p0
.end method

.method public final f()Z
    .registers 2

    iget-object p0, p0, Lcyf;->e:Ldyf;

    iget-object p0, p0, Ldyf;->a:Landroid/content/Context;

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object p0

    const-string v0, "enable_newsfeed"

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method
