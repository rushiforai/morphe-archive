.class public final synthetic Ll/s0i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/data/Moment;

.field public final synthetic b:Lcom/p1/mobile/putong/data/MessageLocation;

.field public final synthetic c:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/data/MessageLocation;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/s0i;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    iput-object p2, p0, Ll/s0i;->b:Lcom/p1/mobile/putong/data/MessageLocation;

    iput-object p3, p0, Ll/s0i;->c:Ll/y20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/s0i;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    iget-object v1, p0, Ll/s0i;->b:Lcom/p1/mobile/putong/data/MessageLocation;

    iget-object p0, p0, Ll/s0i;->c:Ll/y20;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/feed/api/FeedServiceImpl;->Q(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/data/MessageLocation;Ll/y20;Ljava/lang/Throwable;)V

    return-void
.end method
