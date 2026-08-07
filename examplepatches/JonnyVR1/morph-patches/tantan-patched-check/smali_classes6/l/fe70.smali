.class public final synthetic Ll/fe70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fe70;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fe70;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;

    check-cast p1, Lcom/p1/mobile/putong/feed/data/FeedUserLiveLabel;

    invoke-static {p0, p1}, Ll/je70;->n0(Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;Lcom/p1/mobile/putong/feed/data/FeedUserLiveLabel;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
