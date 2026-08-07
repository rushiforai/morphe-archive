.class Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->y1()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;


# direct methods
.method public constructor <init>(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$f;->a:Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$f;->a:Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->s1(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;)Landroid/view/MenuItem;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$f;->a:Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->s1(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;)Landroid/view/MenuItem;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$f;->a:Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    invoke-static {v0, v1}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->t1(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;Landroid/view/MenuItem;)Landroid/view/MenuItem;

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$f;->a:Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->Z1()V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$f;->a:Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;

    .line 31
    .line 32
    invoke-static {p0}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->u1(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;)Ll/c2j0;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0}, Ll/c2j0;->e()V

    .line 37
    .line 38
    .line 39
    return-void
.end method
