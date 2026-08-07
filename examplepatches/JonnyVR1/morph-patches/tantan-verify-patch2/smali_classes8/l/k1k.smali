.class public final synthetic Ll/k1k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/l1k;

.field public final synthetic b:Landroid/view/View;

.field public final synthetic c:I

.field public final synthetic d:Lcom/p1/mobile/putong/core/data/NewGiftWall;


# direct methods
.method public synthetic constructor <init>(Ll/l1k;Landroid/view/View;ILcom/p1/mobile/putong/core/data/NewGiftWall;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/k1k;->a:Ll/l1k;

    iput-object p2, p0, Ll/k1k;->b:Landroid/view/View;

    iput p3, p0, Ll/k1k;->c:I

    iput-object p4, p0, Ll/k1k;->d:Lcom/p1/mobile/putong/core/data/NewGiftWall;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/k1k;->a:Ll/l1k;

    iget-object v1, p0, Ll/k1k;->b:Landroid/view/View;

    iget v2, p0, Ll/k1k;->c:I

    iget-object p0, p0, Ll/k1k;->d:Lcom/p1/mobile/putong/core/data/NewGiftWall;

    invoke-static {v0, v1, v2, p0, p1}, Ll/l1k;->E(Ll/l1k;Landroid/view/View;ILcom/p1/mobile/putong/core/data/NewGiftWall;Landroid/view/View;)V

    return-void
.end method
