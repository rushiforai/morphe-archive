.class Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;->R1()V
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
    iput-object p1, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$c;->a:Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;

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
    iget-object p1, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$c;->a:Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;

    .line 2
    .line 3
    invoke-static {p1}, Ll/jkw;->a(Landroid/app/Activity;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity$c;->a:Lcom/hellogroup/mk/business/ui/BaseMKProxyActivity;

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    .line 9
    .line 10
    .line 11
    return-void
.end method
