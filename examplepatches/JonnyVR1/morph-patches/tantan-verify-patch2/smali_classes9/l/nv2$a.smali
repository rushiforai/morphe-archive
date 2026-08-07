.class public Ll/nv2$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/OnFlingFrameLayout$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/nv2;->Y3(Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;Ll/x20;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

.field public final synthetic b:Ll/x20;

.field public final synthetic c:Ll/nv2;


# direct methods
.method public constructor <init>(Ll/nv2;Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;Ll/x20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/nv2$a;->c:Ll/nv2;

    .line 2
    .line 3
    iput-object p2, p0, Ll/nv2$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

    .line 4
    .line 5
    iput-object p3, p0, Ll/nv2$a;->b:Ll/x20;

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
    iget-object p0, p0, Ll/nv2$a;->b:Ll/x20;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/x20;->call()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public c(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/nv2$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->getCurrentItem()I

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
    iget-object p0, p0, Ll/nv2$a;->c:Ll/nv2;

    .line 16
    .line 17
    invoke-static {p0}, Ll/nv2;->V3(Ll/nv2;)Ll/tmi;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0, p1}, Ll/tmi;->k4(Z)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    iget-object v0, p0, Ll/nv2$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyFilterView;->getCurrentItem()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;->MAKE_UP:Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;

    .line 32
    .line 33
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/livingroom/common/bottom/filter/view/BeautyTabItem;->getIndex()I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-ne v0, v1, :cond_1

    .line 38
    .line 39
    iget-object p0, p0, Ll/nv2$a;->c:Ll/nv2;

    .line 40
    .line 41
    invoke-static {p0}, Ll/nv2;->W3(Ll/nv2;)Ll/stw;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p0, p1}, Ll/stw;->r4(Z)V

    .line 46
    .line 47
    .line 48
    :cond_1
    return-void
.end method
