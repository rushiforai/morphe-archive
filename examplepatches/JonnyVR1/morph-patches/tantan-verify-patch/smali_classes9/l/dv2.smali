.class public final synthetic Ll/dv2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/nv2;

.field public final synthetic b:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;


# direct methods
.method public synthetic constructor <init>(Ll/nv2;Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dv2;->a:Ll/nv2;

    iput-object p2, p0, Ll/dv2;->b:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/dv2;->a:Ll/nv2;

    iget-object p0, p0, Ll/dv2;->b:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;

    invoke-static {v0, p0, p1}, Ll/nv2;->O3(Ll/nv2;Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;)V

    return-void
.end method
