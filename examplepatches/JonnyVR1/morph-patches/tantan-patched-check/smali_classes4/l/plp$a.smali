.class public Ll/plp$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/o1$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/plp;->i(Ll/rfh0$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/rfh0$a;

.field public final synthetic b:Ll/plp;


# direct methods
.method public constructor <init>(Ll/plp;Ll/rfh0$a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/plp$a;->b:Ll/plp;

    .line 2
    .line 3
    iput-object p2, p0, Ll/plp$a;->a:Ll/rfh0$a;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/plp$a;->a:Ll/rfh0$a;

    .line 2
    .line 3
    iget-object v0, v0, Ll/rfh0$a;->a:Ll/hjp;

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {v0, v1}, Ll/hjp;->B2(Z)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/plp$a;->a:Ll/rfh0$a;

    .line 10
    .line 11
    iget-object v0, v0, Ll/rfh0$a;->b:Ll/pkp;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/pkp;->e0()Lcom/p1/mobile/putong/core/newui/intltribe/IntlTribeSlideFrag;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->isAdded()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    iget-object p0, p0, Ll/plp$a;->a:Ll/rfh0$a;

    .line 24
    .line 25
    iget-object p0, p0, Ll/rfh0$a;->b:Ll/pkp;

    .line 26
    .line 27
    invoke-virtual {p0}, Ll/pkp;->m0()Ll/f1g0;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->UP:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 32
    .line 33
    invoke-interface {p0, v0}, Ll/f1g0;->A(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method public onCancel()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/plp$a;->a:Ll/rfh0$a;

    .line 2
    .line 3
    iget-object v0, v0, Ll/rfh0$a;->a:Ll/hjp;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Ll/hjp;->C2(Z)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/plp$a;->a:Ll/rfh0$a;

    .line 10
    .line 11
    iget-object p0, p0, Ll/rfh0$a;->b:Ll/pkp;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/pkp;->m0()Ll/f1g0;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/o1;->c(Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
