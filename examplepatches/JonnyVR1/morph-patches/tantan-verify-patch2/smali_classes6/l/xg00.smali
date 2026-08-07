.class public final synthetic Ll/xg00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/data/Moment;

.field public final synthetic c:Lcom/p1/mobile/putong/feed/data/MomentActivity;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/MomentActivity;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xg00;->a:Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;

    iput-object p2, p0, Ll/xg00;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    iput-object p3, p0, Ll/xg00;->c:Lcom/p1/mobile/putong/feed/data/MomentActivity;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xg00;->a:Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;

    iget-object v1, p0, Ll/xg00;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    iget-object p0, p0, Ll/xg00;->c:Lcom/p1/mobile/putong/feed/data/MomentActivity;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;->c(Lcom/p1/mobile/putong/feed/ui/moments/MomentActivitiesView;Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/MomentActivity;Landroid/view/View;)V

    return-void
.end method
