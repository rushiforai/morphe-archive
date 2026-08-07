.class Lcom/idv/identity/platform/IntlFaceBaseActivity$a;
.super Landroid/view/ContextThemeWrapper;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/idv/identity/platform/IntlFaceBaseActivity;->attachBaseContext(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Landroid/content/res/Configuration;

.field final synthetic b:Lcom/idv/identity/platform/IntlFaceBaseActivity;


# direct methods
.method public constructor <init>(Lcom/idv/identity/platform/IntlFaceBaseActivity;Landroid/content/Context;ILandroid/content/res/Configuration;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/IntlFaceBaseActivity$a;->b:Lcom/idv/identity/platform/IntlFaceBaseActivity;

    .line 2
    .line 3
    iput-object p4, p0, Lcom/idv/identity/platform/IntlFaceBaseActivity$a;->a:Landroid/content/res/Configuration;

    .line 4
    .line 5
    invoke-direct {p0, p2, p3}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public applyOverrideConfiguration(Landroid/content/res/Configuration;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Lcom/idv/identity/platform/IntlFaceBaseActivity$a;->a:Landroid/content/res/Configuration;

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Landroid/content/res/Configuration;->setTo(Landroid/content/res/Configuration;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-super {p0, p1}, Landroid/view/ContextThemeWrapper;->applyOverrideConfiguration(Landroid/content/res/Configuration;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
