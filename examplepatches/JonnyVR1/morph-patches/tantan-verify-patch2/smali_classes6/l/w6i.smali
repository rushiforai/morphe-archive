.class public final synthetic Ll/w6i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/f7i;

.field public final synthetic b:Lcom/p1/mobile/putong/data/FollowshipStatus;

.field public final synthetic c:Ll/dj70;


# direct methods
.method public synthetic constructor <init>(Ll/f7i;Lcom/p1/mobile/putong/data/FollowshipStatus;Ll/dj70;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/w6i;->a:Ll/f7i;

    iput-object p2, p0, Ll/w6i;->b:Lcom/p1/mobile/putong/data/FollowshipStatus;

    iput-object p3, p0, Ll/w6i;->c:Ll/dj70;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/w6i;->a:Ll/f7i;

    iget-object v1, p0, Ll/w6i;->b:Lcom/p1/mobile/putong/data/FollowshipStatus;

    iget-object p0, p0, Ll/w6i;->c:Ll/dj70;

    invoke-static {v0, v1, p0, p1}, Ll/f7i;->g(Ll/f7i;Lcom/p1/mobile/putong/data/FollowshipStatus;Ll/dj70;Landroid/view/View;)V

    return-void
.end method
