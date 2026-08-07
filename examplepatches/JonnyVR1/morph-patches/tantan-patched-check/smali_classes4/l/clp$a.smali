.class public Ll/clp$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/o1$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/clp;->t(Ll/rfh0$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/rfh0$a;

.field public final synthetic b:Ll/clp;


# direct methods
.method public constructor <init>(Ll/clp;Ll/rfh0$a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/clp$a;->b:Ll/clp;

    .line 2
    .line 3
    iput-object p2, p0, Ll/clp$a;->a:Ll/rfh0$a;

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
    iget-object v0, p0, Ll/clp$a;->a:Ll/rfh0$a;

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
    iget-object v0, p0, Ll/clp$a;->b:Ll/clp;

    .line 10
    .line 11
    iget-object p0, p0, Ll/clp$a;->a:Ll/rfh0$a;

    .line 12
    .line 13
    invoke-static {v0, p0}, Ll/clp;->k(Ll/clp;Ll/rfh0$a;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public onCancel()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/clp$a;->a:Ll/rfh0$a;

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
    iget-object p0, p0, Ll/clp$a;->a:Ll/rfh0$a;

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
