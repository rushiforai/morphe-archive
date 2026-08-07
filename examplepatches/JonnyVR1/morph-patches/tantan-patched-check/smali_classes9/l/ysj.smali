.class public final synthetic Ll/ysj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRankings;

.field public final synthetic b:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRankings;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ysj;->a:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRankings;

    iput-object p2, p0, Ll/ysj;->b:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ysj;->a:Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRankings;

    iget-object p0, p0, Ll/ysj;->b:Ljava/util/List;

    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRanking;

    invoke-static {v0, p0, p1}, Ll/zsj;->B(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRankings;Ljava/util/List;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveRanking;)V

    return-void
.end method
