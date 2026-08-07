.class public Ll/rgd0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/rgd0;->n(Lcom/p1/mobile/android/app/Act;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/rgd0;


# direct methods
.method public constructor <init>(Ll/rgd0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/rgd0$a;->a:Ll/rgd0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rgd0$a;->a:Ll/rgd0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/rgd0;->b:Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->getIndicatorView()Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomIndicatorView;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomIndicatorView;->d(Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public b()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rgd0$a;->a:Ll/rgd0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/rgd0;->b:Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->getIndicatorView()Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomIndicatorView;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomIndicatorView;->c()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public c(Z)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rgd0$a;->a:Ll/rgd0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/rgd0;->c(Ll/rgd0;)Ll/ogd0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p1}, Ll/ogd0;->m1(Z)Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object p0, p0, Ll/rgd0$a;->a:Ll/rgd0;

    .line 12
    .line 13
    iget-object p0, p0, Ll/rgd0;->b:Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;->getIndicatorView()Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomIndicatorView;

    .line 20
    .line 21
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomIndicatorView;->b(ZLl/pf60;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, v0, Ll/pf60;->a:Ljava/lang/Object;

    .line 25
    .line 26
    check-cast p0, Ljava/lang/Boolean;

    .line 27
    .line 28
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    return p0
.end method
