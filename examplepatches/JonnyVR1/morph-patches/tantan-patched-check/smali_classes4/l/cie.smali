.class public final synthetic Ll/cie;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/fzq;

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;


# direct methods
.method public synthetic constructor <init>(Ll/fzq;Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cie;->a:Ll/fzq;

    iput-object p2, p0, Ll/cie;->b:Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cie;->a:Ll/fzq;

    iget-object p0, p0, Ll/cie;->b:Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListItemView;->a(Ll/fzq;Lcom/p1/mobile/putong/core/newui/greet/DynamicGreetListAct;Landroid/view/View;)V

    return-void
.end method
