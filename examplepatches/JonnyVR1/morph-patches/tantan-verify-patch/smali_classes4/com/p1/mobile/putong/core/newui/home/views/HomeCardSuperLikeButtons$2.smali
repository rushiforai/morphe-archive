.class Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons$2;
.super Ljava/util/HashMap;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons$2;->this$0:Lcom/p1/mobile/putong/core/newui/home/views/HomeCardSuperLikeButtons;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string p1, "core_card_expanded_click_superlike_width_60.svga"

    .line 7
    .line 8
    invoke-static {p1, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v1, "default"

    .line 13
    .line 14
    invoke-virtual {p0, v1, v0}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    const-string v0, "core_card_expanded_click_superlike_odiamond_width_60.svga"

    .line 18
    .line 19
    invoke-static {v0, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "oDiamond"

    .line 24
    .line 25
    invoke-virtual {p0, v1, v0}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    const-string v0, "supremePartner"

    .line 29
    .line 30
    invoke-static {p1, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p0, v0, p1}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    return-void
.end method
