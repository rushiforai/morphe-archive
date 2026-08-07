.class public Ll/nxm$e;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/nxm;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "e"
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/android/app/Act;

.field public b:Ljava/lang/String;

.field public c:Ll/a30;
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

.field public d:Lcom/p1/mobile/putong/data/User;

.field public e:Ll/x20;

.field public f:Ll/x20;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/nxm$e;->a:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()Ll/nxm;
    .locals 2

    .line 1
    new-instance v0, Ll/nxm;

    .line 2
    .line 3
    iget-object v1, p0, Ll/nxm$e;->a:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/nxm;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Ll/nxm$e;->b:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {v0, v1}, Ll/nxm;->m(Ll/nxm;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Ll/nxm$e;->e:Ll/x20;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ll/nxm;->E(Ll/x20;)V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Ll/nxm$e;->c:Ll/a30;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ll/nxm;->G(Ll/a30;)V

    .line 21
    .line 22
    .line 23
    iget-object v1, p0, Ll/nxm$e;->d:Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ll/nxm;->I(Lcom/p1/mobile/putong/data/User;)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Ll/nxm$e;->f:Ll/x20;

    .line 29
    .line 30
    invoke-virtual {v0, p0}, Ll/nxm;->F(Ll/x20;)V

    .line 31
    .line 32
    .line 33
    return-object v0
.end method

.method public b(Ljava/lang/String;)Ll/nxm$e;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/nxm$e;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Ll/a30;)Ll/nxm$e;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/a30<",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/lang/String;",
            ">;)",
            "Ll/nxm$e;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/nxm$e;->c:Ll/a30;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Ll/nxm;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/nxm$e;->a()Ll/nxm;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/nxm;->n(Ll/nxm;)V

    .line 6
    .line 7
    .line 8
    return-object p0
.end method
