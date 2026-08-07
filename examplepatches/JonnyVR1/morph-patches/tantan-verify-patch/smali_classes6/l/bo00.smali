.class public final synthetic Ll/bo00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Ll/co00;

.field public final synthetic b:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterImageView;


# direct methods
.method public synthetic constructor <init>(Ll/co00;Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterImageView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bo00;->a:Ll/co00;

    iput-object p2, p0, Ll/bo00;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterImageView;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bo00;->a:Ll/co00;

    iget-object p0, p0, Ll/bo00;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterImageView;

    check-cast p1, Lcom/p1/mobile/putong/feed/data/Moment;

    check-cast p2, Ljava/lang/Integer;

    invoke-static {v0, p0, p1, p2}, Ll/co00;->h(Ll/co00;Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterImageView;Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/Integer;)V

    return-void
.end method
