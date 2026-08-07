.class public final synthetic Ll/qde;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView$b;

.field public final synthetic b:I

.field public final synthetic c:Lcom/p1/mobile/putong/data/BannersItem;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView$b;ILcom/p1/mobile/putong/data/BannersItem;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qde;->a:Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView$b;

    iput p2, p0, Ll/qde;->b:I

    iput-object p3, p0, Ll/qde;->c:Lcom/p1/mobile/putong/data/BannersItem;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/qde;->a:Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView$b;

    iget v1, p0, Ll/qde;->b:I

    iget-object p0, p0, Ll/qde;->c:Lcom/p1/mobile/putong/data/BannersItem;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView$b;->j(Lcom/p1/mobile/putong/core/ui/banner/DrawerBannersView$b;ILcom/p1/mobile/putong/data/BannersItem;Landroid/view/View;)V

    return-void
.end method
