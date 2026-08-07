.class public final synthetic Ll/cp2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;

.field public final synthetic b:Landroid/content/res/Configuration;


# direct methods
.method public synthetic constructor <init>(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;Landroid/content/res/Configuration;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cp2;->a:Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;

    iput-object p2, p0, Ll/cp2;->b:Landroid/content/res/Configuration;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cp2;->a:Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;

    iget-object p0, p0, Ll/cp2;->b:Landroid/content/res/Configuration;

    invoke-static {v0, p0}, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->X0(Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;Landroid/content/res/Configuration;)V

    return-void
.end method
