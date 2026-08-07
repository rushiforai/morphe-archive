.class public final synthetic Ll/jt70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView;

.field public final synthetic b:Ljava/util/List;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView;Ljava/util/List;Ljava/lang/String;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jt70;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView;

    iput-object p2, p0, Ll/jt70;->b:Ljava/util/List;

    iput-object p3, p0, Ll/jt70;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/jt70;->d:Ll/x20;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/jt70;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView;

    iget-object v1, p0, Ll/jt70;->b:Ljava/util/List;

    iget-object v2, p0, Ll/jt70;->c:Ljava/lang/String;

    iget-object p0, p0, Ll/jt70;->d:Ll/x20;

    invoke-static {v0, v1, v2, p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView;->a(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView;Ljava/util/List;Ljava/lang/String;Ll/x20;)V

    return-void
.end method
