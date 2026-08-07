.class public final synthetic Ll/nzg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/data/FeedData;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/data/Moment;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/data/FeedData;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nzg;->a:Lcom/p1/mobile/putong/feed/data/FeedData;

    iput-object p2, p0, Ll/nzg;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nzg;->a:Lcom/p1/mobile/putong/feed/data/FeedData;

    iget-object p0, p0, Ll/nzg;->b:Lcom/p1/mobile/putong/feed/data/Moment;

    check-cast p1, Ljava/lang/Integer;

    invoke-static {v0, p0, p1}, Ll/qzg;->k(Lcom/p1/mobile/putong/feed/data/FeedData;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/Integer;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
