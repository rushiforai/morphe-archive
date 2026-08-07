.class public Ll/hjp$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/hjp;->t1()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/qcj<",
        "Ll/uxj0;",
        "Lrx/c<",
        "Ll/pf60;",
        ">;>;"
    }
.end annotation


# instance fields
.field public final synthetic a:Ll/hjp;


# direct methods
.method public constructor <init>(Ll/hjp;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/hjp$a;->a:Ll/hjp;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/PartialListOpt;)Ll/pf60;
    .locals 1

    .line 1
    new-instance v0, Ll/pf60;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public b(Ll/uxj0;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/uxj0;",
            ")",
            "Lrx/c<",
            "Ll/pf60;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/dkb;->o9()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->o0:Lcom/p1/mobile/putong/core/api/n;

    .line 12
    .line 13
    iget-object v1, p0, Ll/hjp$a;->a:Ll/hjp;

    .line 14
    .line 15
    invoke-static {v1}, Ll/hjp;->c1(Ll/hjp;)Ll/iam;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Ll/pkp;

    .line 20
    .line 21
    iget-object v1, v1, Ll/pkp;->T:Ljava/lang/String;

    .line 22
    .line 23
    iget-object p0, p0, Ll/hjp$a;->a:Ll/hjp;

    .line 24
    .line 25
    invoke-static {p0}, Ll/hjp;->d1(Ll/hjp;)Ll/iam;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    check-cast p0, Ll/pkp;

    .line 30
    .line 31
    iget-object p0, p0, Ll/pkp;->U:Ljava/lang/String;

    .line 32
    .line 33
    invoke-virtual {v0, v1, p0}, Lcom/p1/mobile/putong/core/api/n;->c4(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    new-instance v0, Ll/gjp;

    .line 38
    .line 39
    invoke-direct {v0}, Ll/gjp;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-static {p1, p0, v0}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    return-object p0
.end method

.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/uxj0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/hjp$a;->b(Ll/uxj0;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
