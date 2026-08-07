.class public Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->setAdapter(Lcom/p1/mobile/putong/core/newui/home/c;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt$b;->a:Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;

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
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt$b;->a:Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->k:Ll/y20;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    instance-of v0, p1, Ll/xql;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt$b;->a:Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/opt/view/ProfileCardStackOpt;->k:Ll/y20;

    .line 18
    .line 19
    check-cast p1, Ll/xql;

    .line 20
    .line 21
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method
