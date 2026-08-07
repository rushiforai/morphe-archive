.class Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->onActivityCreated(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;


# direct methods
.method public constructor <init>(Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment$a;->a:Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;

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
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment$a;->a:Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->V3()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment$a;->a:Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->X3()V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment$a;->a:Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/base/fragment/BaseMkFragment;->p4()V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method
