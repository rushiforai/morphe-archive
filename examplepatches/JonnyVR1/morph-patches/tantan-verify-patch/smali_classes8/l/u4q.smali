.class public final synthetic Ll/u4q;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/greet/ItemDynamicGreetAgreeMatch;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/greet/ItemDynamicGreetAgreeMatch;Lcom/p1/mobile/putong/core/ui/greet/GreetAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/u4q;->a:Lcom/p1/mobile/putong/core/ui/greet/ItemDynamicGreetAgreeMatch;

    iput-object p2, p0, Ll/u4q;->b:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/u4q;->a:Lcom/p1/mobile/putong/core/ui/greet/ItemDynamicGreetAgreeMatch;

    iget-object p0, p0, Ll/u4q;->b:Lcom/p1/mobile/putong/core/ui/greet/GreetAct;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/greet/ItemDynamicGreetAgreeMatch;->p(Lcom/p1/mobile/putong/core/ui/greet/ItemDynamicGreetAgreeMatch;Lcom/p1/mobile/putong/core/ui/greet/GreetAct;Landroid/view/View;)V

    return-void
.end method
