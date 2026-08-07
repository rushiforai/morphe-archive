.class public final synthetic Ll/xk40;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/fl40;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/purchase/d;

.field public final synthetic c:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ll/fl40;Lcom/p1/mobile/putong/core/ui/purchase/d;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xk40;->a:Ll/fl40;

    iput-object p2, p0, Ll/xk40;->b:Lcom/p1/mobile/putong/core/ui/purchase/d;

    iput-object p3, p0, Ll/xk40;->c:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xk40;->a:Ll/fl40;

    iget-object v1, p0, Ll/xk40;->b:Lcom/p1/mobile/putong/core/ui/purchase/d;

    iget-object p0, p0, Ll/xk40;->c:Ljava/util/List;

    invoke-static {v0, v1, p0, p1}, Ll/fl40;->o(Ll/fl40;Lcom/p1/mobile/putong/core/ui/purchase/d;Ljava/util/List;Landroid/view/View;)V

    return-void
.end method
