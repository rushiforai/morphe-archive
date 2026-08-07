.class public final synthetic Ll/op1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lv/VDraweeView;

.field public final synthetic b:Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;


# direct methods
.method public synthetic constructor <init>(Lv/VDraweeView;Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/op1;->a:Lv/VDraweeView;

    iput-object p2, p0, Ll/op1;->b:Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/op1;->a:Lv/VDraweeView;

    iget-object p0, p0, Ll/op1;->b:Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;->b(Lv/VDraweeView;Lcom/p1/mobile/putong/core/newui/mytab/AvatarsCarouselView;)V

    return-void
.end method
