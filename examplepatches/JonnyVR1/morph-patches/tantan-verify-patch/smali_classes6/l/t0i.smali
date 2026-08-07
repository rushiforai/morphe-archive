.class public final synthetic Ll/t0i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/data/Moment;

.field public final synthetic b:J


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/data/Moment;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/t0i;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    iput-wide p2, p0, Ll/t0i;->b:J

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/t0i;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    iget-wide v1, p0, Ll/t0i;->b:J

    check-cast p1, Ll/uxj0;

    invoke-static {v0, v1, v2, p1}, Lcom/p1/mobile/putong/feed/api/FeedServiceImpl;->Z(Lcom/p1/mobile/putong/feed/data/Moment;JLl/uxj0;)V

    return-void
.end method
