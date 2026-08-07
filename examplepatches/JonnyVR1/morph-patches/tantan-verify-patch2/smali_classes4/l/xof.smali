.class public final synthetic Ll/xof;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/zof;

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/explore/data/ExploreDialogData;


# direct methods
.method public synthetic constructor <init>(Ll/zof;Lcom/p1/mobile/putong/core/newui/explore/data/ExploreDialogData;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xof;->a:Ll/zof;

    iput-object p2, p0, Ll/xof;->b:Lcom/p1/mobile/putong/core/newui/explore/data/ExploreDialogData;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xof;->a:Ll/zof;

    iget-object p0, p0, Ll/xof;->b:Lcom/p1/mobile/putong/core/newui/explore/data/ExploreDialogData;

    invoke-static {v0, p0, p1}, Ll/zof;->E(Ll/zof;Lcom/p1/mobile/putong/core/newui/explore/data/ExploreDialogData;Landroid/view/View;)V

    return-void
.end method
