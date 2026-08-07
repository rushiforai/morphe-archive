.class public final Ll/q7$a;
.super Ll/ji2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/q7;->A()Ll/z06;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ji2<",
        "TT;>;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000)\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0003\n\u0002\u0008\u0005\n\u0002\u0010\u0007\n\u0002\u0008\u0004*\u0001\u0000\u0008\n\u0018\u00002\u0008\u0012\u0004\u0012\u00028\u00000\u0001J!\u0010\u0006\u001a\u00020\u00052\u0008\u0010\u0002\u001a\u0004\u0018\u00018\u00002\u0006\u0010\u0004\u001a\u00020\u0003H\u0014\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u0017\u0010\n\u001a\u00020\u00052\u0006\u0010\t\u001a\u00020\u0008H\u0014\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\u000f\u0010\u000c\u001a\u00020\u0005H\u0014\u00a2\u0006\u0004\u0008\u000c\u0010\rJ\u0017\u0010\u0010\u001a\u00020\u00052\u0006\u0010\u000f\u001a\u00020\u000eH\u0014\u00a2\u0006\u0004\u0008\u0010\u0010\u0011\u00a8\u0006\u0012"
    }
    d2 = {
        "l/q7$a",
        "Ll/ji2;",
        "newResult",
        "",
        "status",
        "",
        "h",
        "(Ljava/lang/Object;I)V",
        "",
        "throwable",
        "g",
        "(Ljava/lang/Throwable;)V",
        "f",
        "()V",
        "",
        "progress",
        "i",
        "(F)V",
        "imagepipeline_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final synthetic b:Ll/q7;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/q7<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/q7;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/q7<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/q7$a;->b:Ll/q7;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/ji2;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public f()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q7$a;->b:Ll/q7;

    .line 2
    .line 3
    invoke-static {p0}, Ll/q7;->x(Ll/q7;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public g(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/q7$a;->b:Ll/q7;

    .line 5
    .line 6
    invoke-static {p0, p1}, Ll/q7;->y(Ll/q7;Ljava/lang/Throwable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public h(Ljava/lang/Object;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;I)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/q7$a;->b:Ll/q7;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/q7;->C()Ll/eve0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, p1, p2, v0}, Ll/q7;->F(Ljava/lang/Object;ILl/yk90;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public i(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q7$a;->b:Ll/q7;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/q7;->z(Ll/q7;F)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method
