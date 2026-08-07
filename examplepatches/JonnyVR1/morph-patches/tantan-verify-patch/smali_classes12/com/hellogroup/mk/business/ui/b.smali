.class public final synthetic Lcom/hellogroup/mk/business/ui/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$a;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$a;Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/hellogroup/mk/business/ui/b;->a:Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$a;

    iput-object p2, p0, Lcom/hellogroup/mk/business/ui/b;->b:Ljava/lang/String;

    iput p3, p0, Lcom/hellogroup/mk/business/ui/b;->c:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/ui/b;->a:Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$a;

    iget-object v1, p0, Lcom/hellogroup/mk/business/ui/b;->b:Ljava/lang/String;

    iget p0, p0, Lcom/hellogroup/mk/business/ui/b;->c:I

    invoke-static {v0, v1, p0}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$a;->e(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$a;Ljava/lang/String;I)V

    return-void
.end method
