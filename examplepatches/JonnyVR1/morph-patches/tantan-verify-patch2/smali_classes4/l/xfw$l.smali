.class public Ll/xfw$l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/xfw;->x0(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/y20<",
        "Lcom/p1/mobile/putong/core/data/FateRadar;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Ll/xfw;


# direct methods
.method public constructor <init>(Ll/xfw;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/xfw$l;->b:Ll/xfw;

    .line 2
    .line 3
    iput-boolean p2, p0, Ll/xfw$l;->a:Z

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/core/data/FateRadar;)V
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Ll/xfw$l;->b:Ll/xfw;

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-static {v1, p1}, Ll/xfw;->g0(Ll/xfw;Lcom/p1/mobile/putong/core/data/FateRadar;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/xfw$l;->b:Ll/xfw;

    .line 13
    .line 14
    invoke-static {v0}, Ll/xfw;->i0(Ll/xfw;)Ll/iam;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Ll/yfw;

    .line 19
    .line 20
    invoke-virtual {v0, p1}, Ll/yfw;->j(Lcom/p1/mobile/putong/core/data/FateRadar;)V

    .line 21
    .line 22
    .line 23
    iget-boolean p1, p0, Ll/xfw$l;->a:Z

    .line 24
    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    iget-object p0, p0, Ll/xfw$l;->b:Ll/xfw;

    .line 28
    .line 29
    invoke-static {p0}, Ll/xfw;->j0(Ll/xfw;)Ll/iam;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    check-cast p0, Ll/yfw;

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/yfw;->e()V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void

    .line 39
    :cond_1
    invoke-static {v1}, Ll/xfw;->k0(Ll/xfw;)Ll/iam;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    check-cast p0, Ll/yfw;

    .line 44
    .line 45
    invoke-virtual {p0}, Ll/yfw;->f()V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/data/FateRadar;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/xfw$l;->a(Lcom/p1/mobile/putong/core/data/FateRadar;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
