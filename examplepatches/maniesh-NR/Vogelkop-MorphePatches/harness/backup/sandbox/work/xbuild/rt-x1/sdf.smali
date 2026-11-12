.class public final Lsdf;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lcom/opera/android/settings/SettingsManager;

.field public final b:Ludf;

.field public final c:Lvx;

.field public final d:Lr65;


# direct methods
.method public constructor <init>(Lnx5;Lcom/opera/android/settings/SettingsManager;Ludf;Lcq5;Lr65;)V
    .registers 8

    new-instance v0, Lvx;

    const/16 v1, 0x1c

    invoke-direct {v0, p4, v1}, Lvx;-><init>(Ljava/lang/Object;B)V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lsdf;->a:Lcom/opera/android/settings/SettingsManager;

    iput-object p3, p0, Lsdf;->b:Ludf;

    iput-object v0, p0, Lsdf;->c:Lvx;

    iput-object p5, p0, Lsdf;->d:Lr65;

    new-instance p2, Lbz1;

    const/4 p3, 0x0

    const/16 p5, 0x15

    invoke-direct {p2, p5, p3, p0}, Lbz1;-><init>(BLmt5;Ljava/lang/Object;)V

    new-instance p0, Lz99;

    const/4 p3, 0x2

    invoke-direct {p0, p4, p2, p3}, Lz99;-><init>(Lf99;Lkotlin/jvm/functions/Function2;B)V

    invoke-static {p0, p1}, Lj14;->Y(Lf99;Lnx5;)Ld3k;

    return-void
.end method


# virtual methods
.method public final a()I
    .registers 3

    iget-object p0, p0, Lsdf;->b:Ludf;

    iget-object p0, p0, Ludf;->a:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const-string v0, "pending.consents"

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0

    invoke-static {p0}, Lwyh;->K(I)I

    move-result p0

    return p0
.end method

.method public final b()I
    .registers 3

    iget-object p0, p0, Lsdf;->b:Ludf;

    iget-object p0, p0, Ludf;->a:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const-string v0, "processed.consents"

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0

    invoke-static {p0}, Lwyh;->K(I)I

    move-result p0

    return p0
.end method

.method public final c(I)V
    .registers 4

    invoke-static {p1}, Lwyh;->K(I)I

    move-result p1

    invoke-virtual {p0}, Lsdf;->b()I

    move-result v0

    or-int/2addr v0, p1

    invoke-virtual {p0}, Lsdf;->a()I

    move-result v1

    not-int p1, p1

    and-int/2addr v1, p1

    iget-object p0, p0, Lsdf;->b:Ludf;

    iget-object p0, p0, Ludf;->a:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string p1, "processed.consents"

    invoke-interface {p0, p1, v0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    const-string p1, "pending.consents"

    invoke-interface {p0, p1, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method
