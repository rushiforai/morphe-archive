.class public final synthetic Ll/nra0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/tra0;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

.field public final synthetic c:Lcom/p1/mobile/putong/data/User;


# direct methods
.method public synthetic constructor <init>(Ll/tra0;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nra0;->a:Ll/tra0;

    iput-object p2, p0, Ll/nra0;->b:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    iput-object p3, p0, Ll/nra0;->c:Lcom/p1/mobile/putong/data/User;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/nra0;->a:Ll/tra0;

    iget-object v1, p0, Ll/nra0;->b:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    iget-object p0, p0, Ll/nra0;->c:Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, v1, p0, p1}, Ll/tra0;->e(Ll/tra0;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method
