.class public final synthetic Lcom/hellogroup/mk/business/ui/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$a;

.field public final synthetic b:Z

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$a;ZLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/hellogroup/mk/business/ui/a;->a:Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$a;

    iput-boolean p2, p0, Lcom/hellogroup/mk/business/ui/a;->b:Z

    iput-object p3, p0, Lcom/hellogroup/mk/business/ui/a;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/a;->a:Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$a;

    iget-boolean v1, p0, Lcom/hellogroup/mk/business/ui/a;->b:Z

    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/a;->c:Ljava/lang/String;

    invoke-static {v0, v1, p0}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$a;->f(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$a;ZLjava/lang/String;)V

    return-void
.end method
