.class public final synthetic Ll/bp2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bp2;->a:Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;

    iput-boolean p2, p0, Ll/bp2;->b:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bp2;->a:Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;

    iget-boolean p0, p0, Ll/bp2;->b:Z

    invoke-static {v0, p0}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->V0(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;Z)V

    return-void
.end method
