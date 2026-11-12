.class public final Ly4m;
.super Ln1;
.source "SourceFile"


# instance fields
.field public final c:Lcom/opera/android/BrowserActivity;

.field public final d:Lv3m;

.field public final e:Lghf;

.field public final f:Lr4m;

.field public g:Ljava/util/Set;

.field public h:Ljava/util/Set;

.field public i:Lszb;

.field public j:Z


# direct methods
.method public constructor <init>(Lo4m;Lcom/opera/android/BrowserActivity;Lv3m;Lghf;Lr4m;)V
    .registers 7

    const/16 v0, 0x18

    invoke-direct {p0, p1, v0}, Ln1;-><init>(Ljava/lang/Object;B)V

    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    iput-object p1, p0, Ly4m;->g:Ljava/util/Set;

    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    iput-object p1, p0, Ly4m;->h:Ljava/util/Set;

    iput-object p2, p0, Ly4m;->c:Lcom/opera/android/BrowserActivity;

    iput-object p3, p0, Ly4m;->d:Lv3m;

    iput-object p4, p0, Ly4m;->e:Lghf;

    iput-object p5, p0, Ly4m;->f:Lr4m;

    invoke-virtual {p3}, Lv3m;->g()Z

    move-result p1

    iput-boolean p1, p0, Ly4m;->j:Z

    iget-object p1, p3, Lv3m;->b:Lcom/opera/android/settings/SettingsManager;

    const-string p2, "translate_web_pages_to_language"

    invoke-virtual {p1, p2}, Lcom/opera/android/settings/SettingsManager;->z(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x0

    invoke-static {p2, p1}, Lszb;->d(ILjava/lang/String;)Lszb;

    move-result-object p1

    invoke-virtual {p3, p1}, Lv3m;->h(Lszb;)Z

    move-result p2

    if-nez p2, :cond_35

    const/4 p1, 0x0

    :cond_35
    iput-object p1, p0, Ly4m;->i:Lszb;

    return-void
.end method


# virtual methods
.method public final H0(Ljava/lang/String;)Z
    .registers 2

    if-eqz p1, :cond_1a

    iget-object p0, p0, Ly4m;->d:Lv3m;

    iget-object p0, p0, Lv3m;->d:Lplk;

    iget-object p0, p0, Lplk;->d:Ljava/lang/Object;

    check-cast p0, Lode;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Set;

    if-eqz p0, :cond_1a

    invoke-interface {p0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1a

    const/4 p0, 0x1

    return p0

    :cond_1a
    const/4 p0, 0x0

    return p0
.end method

.method public final I0(Lszb;Ljava/lang/String;)Z
    .registers 5

    const/4 v0, 0x1

    if-eqz p1, :cond_11

    iget-object v1, p0, Ly4m;->d:Lv3m;

    invoke-virtual {v1, p1, v0}, Lv3m;->e(Lszb;I)Z

    move-result p1

    if-nez p1, :cond_11

    invoke-virtual {p0, p2}, Ly4m;->H0(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_12

    :cond_11
    return v0

    :cond_12
    const/4 p0, 0x0

    return p0
.end method
