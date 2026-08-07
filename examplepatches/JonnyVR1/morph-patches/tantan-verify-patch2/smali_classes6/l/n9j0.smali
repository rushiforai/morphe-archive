.class public final synthetic Ll/n9j0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/feed/data/CategoryTopic;

    invoke-static {p1}, Lcom/p1/mobile/putong/feed/data/TopicOperations;->c(Lcom/p1/mobile/putong/feed/data/CategoryTopic;)Lcom/p1/mobile/putong/feed/data/CategoryTopic;

    move-result-object p0

    return-object p0
.end method
