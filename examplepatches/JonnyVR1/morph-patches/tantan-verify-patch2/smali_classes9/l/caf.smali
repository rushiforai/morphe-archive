.class public final synthetic Ll/caf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;

.field public final synthetic b:Landroid/view/View;

.field public final synthetic c:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;Landroid/view/View;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/caf;->a:Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;

    iput-object p2, p0, Ll/caf;->b:Landroid/view/View;

    iput-object p3, p0, Ll/caf;->c:Ll/x20;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/caf;->a:Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;

    iget-object v1, p0, Ll/caf;->b:Landroid/view/View;

    iget-object p0, p0, Ll/caf;->c:Ll/x20;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;->a(Lcom/p1/mobile/putong/core/ui/profile/exp/item/a;Landroid/view/View;Ll/x20;Landroid/view/View;)V

    return-void
.end method
