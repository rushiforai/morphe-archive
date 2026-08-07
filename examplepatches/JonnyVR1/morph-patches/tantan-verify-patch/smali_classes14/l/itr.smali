.class public final Ll/itr;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesInfiltrationView;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000,\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0008\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\u000f\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u000f\u0010\u0008\u001a\u00020\u0007H\u0016\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u0017\u0010\u000c\u001a\u00020\u000b2\u0006\u0010\n\u001a\u00020\u0002H\u0014\u00a2\u0006\u0004\u0008\u000c\u0010\rR\u0017\u0010\u0004\u001a\u00020\u00038\u0006\u00a2\u0006\u000c\n\u0004\u0008\u000e\u0010\u000f\u001a\u0004\u0008\u0010\u0010\u0011R$\u0010\u0019\u001a\u0004\u0018\u00010\u00128\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u0013\u0010\u0014\u001a\u0004\u0008\u0015\u0010\u0016\"\u0004\u0008\u0017\u0010\u0018\u00a8\u0006\u001a"
    }
    d2 = {
        "Ll/itr;",
        "Ll/d3q;",
        "Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesInfiltrationView;",
        "Ll/eur;",
        "presenter",
        "<init>",
        "(Ll/eur;)V",
        "",
        "o",
        "()I",
        "itemView",
        "",
        "H",
        "(Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesInfiltrationView;)V",
        "a",
        "Ll/eur;",
        "getPresenter",
        "()Ll/eur;",
        "Ll/rtr;",
        "b",
        "Ll/rtr;",
        "getLiveActivitiesInfo",
        "()Ll/rtr;",
        "I",
        "(Ll/rtr;)V",
        "liveActivitiesInfo",
        "external_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final a:Ll/eur;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public b:Ll/rtr;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/eur;)V
    .locals 0
    .param p1    # Ll/eur;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Ll/itr;->a:Ll/eur;

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public H(Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesInfiltrationView;)V
    .locals 1
    .param p1    # Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesInfiltrationView;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/itr;->a:Ll/eur;

    .line 8
    .line 9
    iget-object p0, p0, Ll/itr;->b:Ll/rtr;

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1, v0, p0}, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesInfiltrationView;->d(Ll/eur;Ll/rtr;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final I(Ll/rtr;)V
    .locals 0
    .param p1    # Ll/rtr;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Ll/itr;->b:Ll/rtr;

    .line 2
    .line 3
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/xec0;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesInfiltrationView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/itr;->H(Lcom/p1/mobile/putong/live/external/view/widgets/LiveActivitiesInfiltrationView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
