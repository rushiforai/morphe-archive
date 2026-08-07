.class public final synthetic Ll/frk0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/grk0;

.field public final synthetic b:Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;


# direct methods
.method public synthetic constructor <init>(Ll/grk0;Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/frk0;->a:Ll/grk0;

    iput-object p2, p0, Ll/frk0;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/frk0;->a:Ll/grk0;

    iget-object p0, p0, Ll/frk0;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;

    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;

    invoke-static {v0, p0, p1}, Ll/grk0;->T2(Ll/grk0;Lcom/p1/mobile/putong/live/external/internal/vchat/view/VChatBeautyFilterView;Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;)V

    return-void
.end method
