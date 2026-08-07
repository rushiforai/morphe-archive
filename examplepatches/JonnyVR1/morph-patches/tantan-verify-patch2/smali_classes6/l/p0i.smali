.class public final synthetic Ll/p0i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/tantanapp/common/data/JsonAdapter;


# direct methods
.method public synthetic constructor <init>(Lcom/tantanapp/common/data/JsonAdapter;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/p0i;->a:Lcom/tantanapp/common/data/JsonAdapter;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p0i;->a:Lcom/tantanapp/common/data/JsonAdapter;

    check-cast p1, Lcom/p1/mobile/putong/feed/data/Moment;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/feed/api/FeedServiceImpl;->V(Lcom/tantanapp/common/data/JsonAdapter;Lcom/p1/mobile/putong/feed/data/Moment;)Lcom/tantanapp/common/data/ValueObject;

    move-result-object p0

    return-object p0
.end method
