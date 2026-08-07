.class public final Ll/fo50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/fo50$b;,
        Ll/fo50$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T1:",
        "Ljava/lang/Object;",
        "T2:",
        "Ljava/lang/Object;",
        "D1:",
        "Ljava/lang/Object;",
        "D2:",
        "Ljava/lang/Object;",
        "R:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lrx/c$a<",
        "TR;>;"
    }
.end annotation


# instance fields
.field public final a:Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/c<",
            "TT1;>;"
        }
    .end annotation
.end field

.field public final b:Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/c<",
            "TT2;>;"
        }
    .end annotation
.end field

.field public final c:Ll/qcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/qcj<",
            "-TT1;+",
            "Lrx/c<",
            "TD1;>;>;"
        }
    .end annotation
.end field

.field public final d:Ll/qcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/qcj<",
            "-TT2;+",
            "Lrx/c<",
            "TD2;>;>;"
        }
    .end annotation
.end field

.field public final e:Ll/rcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/rcj<",
            "-TT1;-",
            "Lrx/c<",
            "TT2;>;+TR;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lrx/c;Lrx/c;Ll/qcj;Ll/qcj;Ll/rcj;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/c<",
            "TT1;>;",
            "Lrx/c<",
            "TT2;>;",
            "Ll/qcj<",
            "-TT1;+",
            "Lrx/c<",
            "TD1;>;>;",
            "Ll/qcj<",
            "-TT2;+",
            "Lrx/c<",
            "TD2;>;>;",
            "Ll/rcj<",
            "-TT1;-",
            "Lrx/c<",
            "TT2;>;+TR;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/fo50;->a:Lrx/c;

    .line 5
    .line 6
    iput-object p2, p0, Ll/fo50;->b:Lrx/c;

    .line 7
    .line 8
    iput-object p3, p0, Ll/fo50;->c:Ll/qcj;

    .line 9
    .line 10
    iput-object p4, p0, Ll/fo50;->d:Ll/qcj;

    .line 11
    .line 12
    iput-object p5, p0, Ll/fo50;->e:Ll/rcj;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public a(Ll/gcg0;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-TR;>;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/fo50$a;

    .line 2
    .line 3
    new-instance v1, Ll/are0;

    .line 4
    .line 5
    invoke-direct {v1, p1}, Ll/are0;-><init>(Ll/gcg0;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, p0, v1}, Ll/fo50$a;-><init>(Ll/fo50;Ll/gcg0;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1, v0}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ll/fo50$a;->d()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/fo50;->a(Ll/gcg0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
