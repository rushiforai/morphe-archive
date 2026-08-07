.class public final synthetic Ll/vaj0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/data/TopicMoment;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/data/TopicMoment;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vaj0;->a:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vaj0;->a:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    check-cast p1, Ljava/lang/String;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView$a;->s(Lcom/p1/mobile/putong/feed/data/TopicMoment;Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
