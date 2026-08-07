.class public Ll/fe5$e;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/fe5;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "e"
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/android/app/Act;

.field public b:Lcom/p1/mobile/putong/core/data/PurchaseType;

.field public c:Ljava/lang/String;

.field public d:Ll/a30;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/a30<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public e:Lcom/p1/mobile/putong/data/User;

.field public f:J

.field public g:J

.field public h:I

.field public i:I

.field public j:I

.field public k:Lcom/p1/mobile/putong/core/data/Privilege;

.field public l:Ll/x20;

.field public m:Ll/x20;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/fe5$e;->j:I

    .line 6
    .line 7
    iput-object p1, p0, Ll/fe5$e;->a:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public a()Ll/fe5;
    .locals 3

    .line 1
    new-instance v0, Ll/fe5;

    .line 2
    .line 3
    iget-object v1, p0, Ll/fe5$e;->a:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    iget-object v2, p0, Ll/fe5$e;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Ll/fe5;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 8
    .line 9
    .line 10
    iget v1, p0, Ll/fe5$e;->j:I

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ll/fe5;->T(I)V

    .line 13
    .line 14
    .line 15
    iget-object v1, p0, Ll/fe5$e;->c:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v0, v1}, Ll/fe5;->t(Ll/fe5;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Ll/fe5$e;->l:Ll/x20;

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ll/fe5;->W(Ll/x20;)V

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Ll/fe5$e;->d:Ll/a30;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ll/fe5;->Y(Ll/a30;)V

    .line 28
    .line 29
    .line 30
    iget-object v1, p0, Ll/fe5$e;->e:Lcom/p1/mobile/putong/data/User;

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ll/fe5;->d0(Lcom/p1/mobile/putong/data/User;)V

    .line 33
    .line 34
    .line 35
    iget-wide v1, p0, Ll/fe5$e;->f:J

    .line 36
    .line 37
    invoke-virtual {v0, v1, v2}, Ll/fe5;->V(J)V

    .line 38
    .line 39
    .line 40
    iget-object v1, p0, Ll/fe5$e;->m:Ll/x20;

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Ll/fe5;->X(Ll/x20;)V

    .line 43
    .line 44
    .line 45
    iget v1, p0, Ll/fe5$e;->h:I

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Ll/fe5;->Z(I)V

    .line 48
    .line 49
    .line 50
    iget-wide v1, p0, Ll/fe5$e;->g:J

    .line 51
    .line 52
    invoke-virtual {v0, v1, v2}, Ll/fe5;->c0(J)V

    .line 53
    .line 54
    .line 55
    iget-object v1, p0, Ll/fe5$e;->k:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 56
    .line 57
    invoke-virtual {v0, v1}, Ll/fe5;->a0(Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 58
    .line 59
    .line 60
    iget p0, p0, Ll/fe5$e;->i:I

    .line 61
    .line 62
    invoke-static {v0, p0}, Ll/fe5;->s(Ll/fe5;I)V

    .line 63
    .line 64
    .line 65
    return-object v0
.end method

.method public b(I)Ll/fe5$e;
    .locals 0

    .line 1
    iput p1, p0, Ll/fe5$e;->i:I

    .line 2
    .line 3
    return-object p0
.end method

.method public c(I)Ll/fe5$e;
    .locals 0

    .line 1
    iput p1, p0, Ll/fe5$e;->j:I

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Ljava/lang/String;)Ll/fe5$e;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fe5$e;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public e(J)Ll/fe5$e;
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/fe5$e;->f:J

    .line 2
    .line 3
    return-object p0
.end method

.method public f(Ll/x20;)Ll/fe5$e;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fe5$e;->m:Ll/x20;

    .line 2
    .line 3
    return-object p0
.end method

.method public g(Ll/a30;)Ll/fe5$e;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/a30<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            ">;)",
            "Ll/fe5$e;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/fe5$e;->d:Ll/a30;

    .line 2
    .line 3
    return-object p0
.end method

.method public h(I)Ll/fe5$e;
    .locals 0

    .line 1
    iput p1, p0, Ll/fe5$e;->h:I

    .line 2
    .line 3
    return-object p0
.end method

.method public i(Lcom/p1/mobile/putong/core/data/Privilege;)Ll/fe5$e;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fe5$e;->k:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 2
    .line 3
    return-object p0
.end method

.method public j(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ll/fe5$e;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fe5$e;->b:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    return-object p0
.end method

.method public k(J)Ll/fe5$e;
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/fe5$e;->g:J

    .line 2
    .line 3
    return-object p0
.end method

.method public l()Ll/fe5;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/fe5$e;->a()Ll/fe5;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/fe5;->u(Ll/fe5;)V

    .line 6
    .line 7
    .line 8
    return-object p0
.end method
