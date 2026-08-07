.class public final synthetic Ll/n670;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/data/TopicOperations;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/data/TopicOperations;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/n670;->a:Lcom/p1/mobile/putong/feed/data/TopicOperations;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n670;->a:Lcom/p1/mobile/putong/feed/data/TopicOperations;

    check-cast p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    invoke-static {p0, p1}, Ll/v670;->r0(Lcom/p1/mobile/putong/feed/data/TopicOperations;Lcom/p1/mobile/putong/feed/data/TopicMoment;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
