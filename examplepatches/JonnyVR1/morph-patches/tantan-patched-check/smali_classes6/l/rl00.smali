.class public final synthetic Ll/rl00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/data/Moment;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rl00;->a:Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;

    iput-object p2, p0, Ll/rl00;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rl00;->a:Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;

    iget-object p0, p0, Ll/rl00;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;->k(Lcom/p1/mobile/putong/feed/ui/moments/MomentDetailHeaderView;Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V

    return-void
.end method
