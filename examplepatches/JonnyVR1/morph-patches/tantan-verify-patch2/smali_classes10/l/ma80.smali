.class public final synthetic Ll/ma80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/z20;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchor;


# direct methods
.method public synthetic constructor <init>(Ll/z20;Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchor;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ma80;->a:Ll/z20;

    iput-object p2, p0, Ll/ma80;->b:Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchor;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ma80;->a:Ll/z20;

    iget-object p0, p0, Ll/ma80;->b:Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchor;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkSuggestAnchorItemView;->b(Ll/z20;Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchor;Landroid/view/View;)V

    return-void
.end method
