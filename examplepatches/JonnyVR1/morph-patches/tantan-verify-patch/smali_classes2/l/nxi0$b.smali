.class public final Ll/nxi0$b;
.super Ll/er2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/nxi0;->b(Ll/z06;Ll/yk90;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0011\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0003*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u000f\u0010\u0003\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u0003\u0010\u0004\u00a8\u0006\u0005"
    }
    d2 = {
        "l/nxi0$b",
        "Ll/er2;",
        "",
        "b",
        "()V",
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
.field public final synthetic a:Ll/z3g0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/z3g0<",
            "TT;>;"
        }
    .end annotation
.end field

.field public final synthetic b:Ll/nxi0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/nxi0<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/z3g0;Ll/nxi0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z3g0<",
            "TT;>;",
            "Ll/nxi0<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/nxi0$b;->a:Ll/z3g0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/nxi0$b;->b:Ll/nxi0;

    .line 4
    .line 5
    invoke-direct {p0}, Ll/er2;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public b()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nxi0$b;->a:Ll/z3g0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/a4g0;->a()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/nxi0$b;->b:Ll/nxi0;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/nxi0;->d()Ll/oxi0;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object p0, p0, Ll/nxi0$b;->a:Ll/z3g0;

    .line 13
    .line 14
    invoke-interface {v0, p0}, Ll/oxi0;->a(Ljava/lang/Runnable;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
