.class public final synthetic Ll/dzg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Comparator;


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/feed/data/Moment;

    check-cast p2, Lcom/p1/mobile/putong/feed/data/Moment;

    invoke-static {p1, p2}, Lcom/p1/mobile/putong/feed/data/FeedData;->q(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/Moment;)I

    move-result p0

    return p0
.end method
