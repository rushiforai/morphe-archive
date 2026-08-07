.class Lcom/idv/identity/platform/IdentityAlertOverlay$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/idv/identity/platform/IdentityAlertOverlay;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/idv/identity/platform/IdentityAlertOverlay;


# direct methods
.method public constructor <init>(Lcom/idv/identity/platform/IdentityAlertOverlay;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/IdentityAlertOverlay$b;->a:Lcom/idv/identity/platform/IdentityAlertOverlay;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/idv/identity/platform/IdentityAlertOverlay$b;->a:Lcom/idv/identity/platform/IdentityAlertOverlay;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/idv/identity/platform/IdentityAlertOverlay;->a(Lcom/idv/identity/platform/IdentityAlertOverlay;)Lcom/idv/identity/platform/IdentityAlertOverlay$d;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lcom/idv/identity/platform/IdentityAlertOverlay$b;->a:Lcom/idv/identity/platform/IdentityAlertOverlay;

    .line 10
    .line 11
    invoke-static {p1}, Lcom/idv/identity/platform/IdentityAlertOverlay;->a(Lcom/idv/identity/platform/IdentityAlertOverlay;)Lcom/idv/identity/platform/IdentityAlertOverlay$d;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-interface {p1}, Lcom/idv/identity/platform/IdentityAlertOverlay$d;->a()V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/idv/identity/platform/IdentityAlertOverlay$b;->a:Lcom/idv/identity/platform/IdentityAlertOverlay;

    .line 19
    .line 20
    const/4 p1, 0x4

    .line 21
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method
