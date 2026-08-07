.class public final synthetic Ll/pie;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/greet/tag/ImTagContainerLayout;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;Lcom/p1/mobile/putong/core/newui/greet/tag/ImTagContainerLayout;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pie;->a:Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;

    iput-object p2, p0, Ll/pie;->b:Lcom/p1/mobile/putong/core/newui/greet/tag/ImTagContainerLayout;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pie;->a:Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;

    iget-object p0, p0, Ll/pie;->b:Lcom/p1/mobile/putong/core/newui/greet/tag/ImTagContainerLayout;

    check-cast p1, Lcom/p1/mobile/putong/core/newui/greet/NewTagStatusItem;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;->p(Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetStatusView;Lcom/p1/mobile/putong/core/newui/greet/tag/ImTagContainerLayout;Lcom/p1/mobile/putong/core/newui/greet/NewTagStatusItem;)V

    return-void
.end method
