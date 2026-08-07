.class public Ll/grk0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/OnFlingFrameLayout$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/grk0;->X2()Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;

.field public final synthetic b:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

.field public final synthetic c:Ll/grk0;


# direct methods
.method public constructor <init>(Ll/grk0;Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/grk0$a;->c:Ll/grk0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/grk0$a;->a:Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;

    .line 4
    .line 5
    iput-object p3, p0, Ll/grk0$a;->b:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/grk0$a;->b:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/grk0$a;->a:Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;->getCurrentItem()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;->FILTER:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;->getIndex()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-ne v0, v1, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/grk0$a;->c:Ll/grk0;

    .line 16
    .line 17
    iget-object p0, p0, Ll/grk0;->h:Ll/ivk0;

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ll/ivk0;->p3(Z)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    iget-object v0, p0, Ll/grk0$a;->a:Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;->getCurrentItem()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;->MAKE_UP:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;

    .line 30
    .line 31
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;->getIndex()I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-ne v0, v1, :cond_1

    .line 36
    .line 37
    iget-object p0, p0, Ll/grk0$a;->c:Ll/grk0;

    .line 38
    .line 39
    iget-object p0, p0, Ll/grk0;->i:Ll/uvk0;

    .line 40
    .line 41
    invoke-virtual {p0, p1}, Ll/uvk0;->w3(Z)V

    .line 42
    .line 43
    .line 44
    :cond_1
    return-void
.end method
