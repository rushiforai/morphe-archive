.class public final synthetic Ll/go70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/sm70;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksStateExpandView;


# direct methods
.method public synthetic constructor <init>(Ll/sm70;Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksStateExpandView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/go70;->a:Ll/sm70;

    iput-object p2, p0, Ll/go70;->b:Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksStateExpandView;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/go70;->a:Ll/sm70;

    iget-object p0, p0, Ll/go70;->b:Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksStateExpandView;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksStateExpandView;->p(Ll/sm70;Lcom/p1/mobile/putong/core/ui/vip/picks/view/header/PicksStateExpandView;Landroid/view/View;)V

    return-void
.end method
