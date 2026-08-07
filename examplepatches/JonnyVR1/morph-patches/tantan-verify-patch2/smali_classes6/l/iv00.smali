.class public final synthetic Ll/iv00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedAct;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedFrag;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedAct;Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/iv00;->a:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedAct;

    iput-object p2, p0, Ll/iv00;->b:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedFrag;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/iv00;->a:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedAct;

    iget-object p0, p0, Ll/iv00;->b:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedFrag;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedAct;->X1(Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedAct;Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedFrag;)V

    return-void
.end method
