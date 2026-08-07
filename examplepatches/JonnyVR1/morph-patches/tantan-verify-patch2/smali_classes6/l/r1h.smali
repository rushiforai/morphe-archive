.class public final synthetic Ll/r1h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/MenuItem$OnMenuItemClickListener;


# instance fields
.field public final synthetic a:Ll/y20;

.field public final synthetic b:Lcom/p1/mobile/putong/data/FollowshipStatus;


# direct methods
.method public synthetic constructor <init>(Ll/y20;Lcom/p1/mobile/putong/data/FollowshipStatus;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/r1h;->a:Ll/y20;

    iput-object p2, p0, Ll/r1h;->b:Lcom/p1/mobile/putong/data/FollowshipStatus;

    return-void
.end method


# virtual methods
.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/r1h;->a:Ll/y20;

    iget-object p0, p0, Ll/r1h;->b:Lcom/p1/mobile/putong/data/FollowshipStatus;

    invoke-static {v0, p0, p1}, Ll/k3h;->z(Ll/y20;Lcom/p1/mobile/putong/data/FollowshipStatus;Landroid/view/MenuItem;)Z

    move-result p0

    return p0
.end method
