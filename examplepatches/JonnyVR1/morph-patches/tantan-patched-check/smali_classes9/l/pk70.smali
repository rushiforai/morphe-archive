.class public final synthetic Ll/pk70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;

.field public final synthetic b:Ll/jl70;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;Ll/jl70;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pk70;->a:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;

    iput-object p2, p0, Ll/pk70;->b:Ll/jl70;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pk70;->a:Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;

    iget-object p0, p0, Ll/pk70;->b:Ll/jl70;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;->h(Lcom/p1/mobile/putong/core/ui/messages/newpic/PicExchangeLayout;Ll/jl70;Landroid/view/View;)V

    return-void
.end method
