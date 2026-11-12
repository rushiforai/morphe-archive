.class public final Lfue;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lcue;

.field public b:Ll1c;

.field private final c:Leue;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/opera/android/annotations/WeakOwner;
    .end annotation
.end field

.field public final d:Lb59;

.field public final e:Lh7f;

.field public final f:Lcom/opera/android/settings/SettingsManager;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lfqe;Lcom/opera/android/settings/SettingsManager;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Lcue;->b:Lcue;

    iput-object v0, p0, Lfue;->a:Lcue;

    new-instance v0, Lh7f;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lfue;->e:Lh7f;

    sget-object v0, Lvml;->d:Lumi;

    const/4 v1, 0x0

    new-array v1, v1, [Lbg1;

    const-string v2, "news_source_tracker"

    invoke-static {p1, v0, v2, v1}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object p1

    iput-object p1, p0, Lfue;->d:Lb59;

    iput-object p3, p0, Lfue;->f:Lcom/opera/android/settings/SettingsManager;

    new-instance p1, Ls9;

    const/16 v0, 0x19

    invoke-direct {p1, p0, v0}, Ls9;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p3, p1}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    new-instance p1, Leue;

    invoke-direct {p1, p2, p0}, Leue;-><init>(Lfqe;Lfue;)V

    iput-object p1, p0, Lfue;->c:Leue;

    invoke-virtual {p2, p1}, Lfqe;->a(Lq8j;)V

    return-void
.end method

.method public static bridge synthetic a(Lfue;)Leue;
    .registers 1

    iget-object p0, p0, Lfue;->c:Leue;

    return-object p0
.end method

.method public static c(Landroid/content/Context;)Lcue;
    .registers 3

    const-string v0, "news_source_tracker"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "last_active_news_source"

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0

    invoke-static {p0}, Lcue;->d(I)Lcue;

    move-result-object p0

    if-nez p0, :cond_15

    sget-object p0, Lcue;->b:Lcue;

    :cond_15
    return-object p0
.end method


# virtual methods
.method public final b(Ldue;)V
    .registers 2

    iget-object p0, p0, Lfue;->e:Lh7f;

    invoke-virtual {p0, p1}, Lh7f;->b(Ljava/lang/Object;)Z

    return-void
.end method

.method public final d()V
    .registers 5

    iget-object v0, p0, Lfue;->f:Lcom/opera/android/settings/SettingsManager;

    const-string v1, "news_is_blocked_by_personalization_change"

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    iget-object v1, p0, Lfue;->b:Ll1c;

    sget-object v2, Lcue;->b:Lcue;

    if-eqz v1, :cond_1c

    if-nez v0, :cond_1c

    iget-object v0, v1, Ll1c;->b:Ljava/util/Set;

    iget-object v1, v1, Ll1c;->c:Ll0c;

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1c

    sget-object v2, Lcue;->c:Lcue;

    :cond_1c
    iget-object v0, p0, Lfue;->a:Lcue;

    if-ne v0, v2, :cond_21

    return-void

    :cond_21
    iput-object v2, p0, Lfue;->a:Lcue;

    iget-object v0, p0, Lfue;->d:Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "last_active_news_source"

    iget-byte v3, v2, Lcue;->a:B

    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    iget-object p0, p0, Lfue;->e:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_40
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_50

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ldue;

    invoke-interface {v0, v2}, Ldue;->b(Lcue;)V

    goto :goto_40

    :cond_50
    new-instance p0, Lr16;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p0}, Lac8;->a(Ljava/lang/Object;)V

    return-void
.end method

.method public final e(Ldue;)V
    .registers 2

    iget-object p0, p0, Lfue;->e:Lh7f;

    invoke-virtual {p0, p1}, Lh7f;->c(Ljava/lang/Object;)Z

    return-void
.end method
