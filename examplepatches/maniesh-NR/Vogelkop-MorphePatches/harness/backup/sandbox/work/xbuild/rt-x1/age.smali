.class public final Lage;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lhxl;
.implements Lp5j;


# instance fields
.field public final synthetic a:Lfge;


# direct methods
.method public constructor <init>(Lfge;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lage;->a:Lfge;

    return-void
.end method


# virtual methods
.method public final M(Ljava/lang/String;)V
    .registers 4

    const-string v0, "my_flow_visible"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_25

    iget-object p0, p0, Lage;->a:Lfge;

    iget-boolean p1, p0, Lfge;->Q:Z

    if-nez p1, :cond_25

    iget-object p1, p0, Lfge;->r:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p1}, Landroidx/fragment/app/r;->getSupportFragmentManager()Landroidx/fragment/app/w;

    move-result-object p1

    iget-object v0, p0, Lfge;->u:Lcom/opera/android/settings/SettingsManager;

    iget-object p0, p0, Lfge;->t:Lbf9;

    invoke-virtual {v0, p0}, Lcom/opera/android/settings/SettingsManager;->r(Lbf9;)Z

    move-result p0

    if-nez p0, :cond_25

    const/4 p0, 0x1

    const/4 v0, -0x1

    const-string v1, "flow"

    invoke-virtual {p1, v0, p0, v1}, Landroidx/fragment/app/w;->Y(IILjava/lang/String;)Z

    :cond_25
    return-void
.end method

.method public final i()V
    .registers 1

    return-void
.end method

.method public final x(I)V
    .registers 4

    iget-object p0, p0, Lage;->a:Lfge;

    iget-boolean p1, p0, Lfge;->Q:Z

    if-nez p1, :cond_1d

    iget-object p1, p0, Lfge;->r:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p1}, Landroidx/fragment/app/r;->getSupportFragmentManager()Landroidx/fragment/app/w;

    move-result-object p1

    iget-object v0, p0, Lfge;->u:Lcom/opera/android/settings/SettingsManager;

    iget-object p0, p0, Lfge;->t:Lbf9;

    invoke-virtual {v0, p0}, Lcom/opera/android/settings/SettingsManager;->r(Lbf9;)Z

    move-result p0

    if-nez p0, :cond_1d

    const/4 p0, 0x1

    const/4 v0, -0x1

    const-string v1, "flow"

    invoke-virtual {p1, v0, p0, v1}, Landroidx/fragment/app/w;->Y(IILjava/lang/String;)Z

    :cond_1d
    return-void
.end method

.method public final z()V
    .registers 1

    return-void
.end method
