.class public final synthetic Ll/svd0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/result/VipContentItemView$a;

.field public final synthetic b:Lcom/p1/mobile/putong/core/data/Privilege;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/result/VipContentItemView$a;Lcom/p1/mobile/putong/core/data/Privilege;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/svd0;->a:Lcom/p1/mobile/putong/core/ui/result/VipContentItemView$a;

    iput-object p2, p0, Ll/svd0;->b:Lcom/p1/mobile/putong/core/data/Privilege;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/svd0;->a:Lcom/p1/mobile/putong/core/ui/result/VipContentItemView$a;

    iget-object p0, p0, Ll/svd0;->b:Lcom/p1/mobile/putong/core/data/Privilege;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/result/SVipContentItemView;->a(Lcom/p1/mobile/putong/core/ui/result/VipContentItemView$a;Lcom/p1/mobile/putong/core/data/Privilege;Landroid/view/View;)V

    return-void
.end method
