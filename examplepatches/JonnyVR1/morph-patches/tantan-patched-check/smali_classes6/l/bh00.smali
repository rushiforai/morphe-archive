.class public final synthetic Ll/bh00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/data/MomentActivity;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;Lcom/p1/mobile/putong/feed/data/MomentActivity;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bh00;->a:Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;

    iput-object p2, p0, Ll/bh00;->b:Lcom/p1/mobile/putong/feed/data/MomentActivity;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bh00;->a:Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;

    iget-object p0, p0, Ll/bh00;->b:Lcom/p1/mobile/putong/feed/data/MomentActivity;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;->a(Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;Lcom/p1/mobile/putong/feed/data/MomentActivity;Landroid/view/View;)V

    return-void
.end method
