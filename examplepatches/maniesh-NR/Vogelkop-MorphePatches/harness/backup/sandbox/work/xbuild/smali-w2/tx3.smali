.class public final Ltx3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lp5j;


# instance fields
.field public a:I

.field public final synthetic b:Lcom/opera/android/browser/BrowserFragment;


# direct methods
.method public constructor <init>(Lcom/opera/android/browser/BrowserFragment;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ltx3;->b:Lcom/opera/android/browser/BrowserFragment;

    return-void
.end method


# virtual methods
.method public final M(Ljava/lang/String;)V
    .registers 5

    const-string v0, "toolbar_disposition_classic"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_18

    const-string v0, "toolbar_disposition_tablet"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_18

    const-string v0, "addressbar_position"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_51

    :cond_18
    invoke-virtual {p0}, Ltx3;->a()I

    move-result p1

    iget v0, p0, Ltx3;->a:I

    if-eq p1, v0, :cond_51

    iput p1, p0, Ltx3;->a:I

    iget-object p0, p0, Ltx3;->b:Lcom/opera/android/browser/BrowserFragment;

    iget-object v0, p0, Lcom/opera/android/browser/BrowserFragment;->j:Laz3;

    const/4 v1, 0x0

    if-eqz p1, :cond_2b

    const/4 p1, 0x1

    goto :goto_2c

    :cond_2b
    move p1, v1

    :goto_2c
    iget-boolean v2, v0, Laz3;->i:Z

    if-eq v2, p1, :cond_36

    iput-boolean p1, v0, Laz3;->i:Z

    const/4 p1, 0x3

    invoke-virtual {v0, p1, v1}, Laz3;->N(IZ)Z

    :cond_36
    iget-object p1, p0, Lcom/opera/android/browser/BrowserFragment;->p:Lcom/opera/android/browser/chromium/ChromiumContainerView;

    if-eqz p1, :cond_51

    iget v0, p0, Lcom/opera/android/browser/BrowserFragment;->m:I

    iget v1, p0, Lcom/opera/android/browser/BrowserFragment;->n:I

    iget v2, p0, Lcom/opera/android/browser/BrowserFragment;->o:I

    iget-object p0, p0, Lcom/opera/android/browser/BrowserFragment;->c:Ltx3;

    iget p0, p0, Ltx3;->a:I

    iget-object p1, p1, Lcom/opera/android/browser/chromium/ChromiumContainerView;->b:Lzy4;

    iput v0, p1, Lzy4;->g:I

    iput v1, p1, Lzy4;->h:I

    iput v2, p1, Lzy4;->i:I

    iput p0, p1, Lzy4;->j:I

    invoke-virtual {p1}, Lzy4;->T()V

    :cond_51
    return-void
.end method

.method public final a()I
    .registers 4

    iget-object p0, p0, Ltx3;->b:Lcom/opera/android/browser/BrowserFragment;

    iget-object v0, p0, Lcom/opera/android/browser/BrowserFragment;->a:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v0}, Lcom/opera/android/settings/SettingsManager;->f()Le7j;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->D(Le7j;)Lr7j;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_23

    const/4 v2, 0x2

    if-eq v0, v2, :cond_18

    const/4 p0, 0x0

    return p0

    :cond_18
    iget-object p0, p0, Lcom/opera/android/browser/BrowserFragment;->a:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p0}, Lcom/opera/android/settings/SettingsManager;->c()Lb7j;

    move-result-object p0

    sget-object v0, Lb7j;->c:Lb7j;

    if-ne p0, v0, :cond_23

    return v1

    :cond_23
    const/4 p0, 0x3

    return p0
.end method
