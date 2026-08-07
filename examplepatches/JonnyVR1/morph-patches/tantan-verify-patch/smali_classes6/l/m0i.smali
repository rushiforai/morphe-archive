.class public final synthetic Ll/m0i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:J


# direct methods
.method public synthetic constructor <init>(J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Ll/m0i;->a:J

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/m0i;->a:J

    check-cast p1, Lcom/p1/mobile/putong/feed/data/Moment;

    invoke-static {v0, v1, p1}, Lcom/p1/mobile/putong/feed/api/FeedServiceImpl;->S(JLcom/p1/mobile/putong/feed/data/Moment;)V

    return-void
.end method
