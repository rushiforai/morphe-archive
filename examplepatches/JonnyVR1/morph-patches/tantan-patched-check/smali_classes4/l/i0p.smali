.class public Ll/i0p;
.super Ll/re90;
.source "SourceFile"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/re90;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public c()I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/u4;->b:Ljava/lang/Object;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/u4;->b:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast v0, Ll/bkj0;

    .line 12
    .line 13
    iget-object v0, v0, Ll/bkj0;->b:Ljava/lang/Object;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Ll/u4;->b:Ljava/lang/Object;

    .line 22
    .line 23
    check-cast p0, Ll/bkj0;

    .line 24
    .line 25
    iget-object p0, p0, Ll/bkj0;->b:Ljava/lang/Object;

    .line 26
    .line 27
    check-cast p0, Lcom/p1/mobile/putong/core/api/CoreLikers$a;

    .line 28
    .line 29
    iget p0, p0, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->c:I

    .line 30
    .line 31
    return p0

    .line 32
    :cond_0
    const/4 p0, 0x0

    .line 33
    return p0
.end method
