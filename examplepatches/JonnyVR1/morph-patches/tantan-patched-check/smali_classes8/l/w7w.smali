.class public final synthetic Ll/w7w;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzWarnView;

.field public final synthetic b:Ll/jl80;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzWarnView;Ll/jl80;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/w7w;->a:Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzWarnView;

    iput-object p2, p0, Ll/w7w;->b:Ll/jl80;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/w7w;->a:Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzWarnView;

    iget-object p0, p0, Ll/w7w;->b:Ll/jl80;

    invoke-static {v0, p0, p1}, Ll/d8w;->l(Lcom/p1/mobile/putong/core/ui/lovebuzz/widget/LoveBuzzWarnView;Ll/jl80;Landroid/view/View;)V

    return-void
.end method
