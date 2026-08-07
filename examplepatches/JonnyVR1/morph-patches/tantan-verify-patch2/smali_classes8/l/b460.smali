.class public final Ll/b460;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$c;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/b460$d;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<R:",
        "Ljava/lang/Object;",
        "T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lrx/c$c<",
        "TR;TT;>;"
    }
.end annotation


# static fields
.field public static final c:Ljava/lang/Object;


# instance fields
.field public final a:Ll/pcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pcj<",
            "TR;>;"
        }
    .end annotation
.end field

.field public final b:Ll/rcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/rcj<",
            "TR;-TT;TR;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/Object;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/b460;->c:Ljava/lang/Object;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Ll/rcj;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TR;",
            "Ll/rcj<",
            "TR;-TT;TR;>;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/b460$a;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/b460$a;-><init>(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0, p2}, Ll/b460;-><init>(Ll/pcj;Ll/rcj;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Ll/pcj;Ll/rcj;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pcj<",
            "TR;>;",
            "Ll/rcj<",
            "TR;-TT;TR;>;)V"
        }
    .end annotation

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    iput-object p1, p0, Ll/b460;->a:Ll/pcj;

    .line 12
    iput-object p2, p0, Ll/b460;->b:Ll/rcj;

    return-void
.end method

.method public constructor <init>(Ll/rcj;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/rcj<",
            "TR;-TT;TR;>;)V"
        }
    .end annotation

    .line 13
    sget-object v0, Ll/b460;->c:Ljava/lang/Object;

    invoke-direct {p0, v0, p1}, Ll/b460;-><init>(Ljava/lang/Object;Ll/rcj;)V

    return-void
.end method


# virtual methods
.method public a(Ll/gcg0;)Ll/gcg0;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-TR;>;)",
            "Ll/gcg0<",
            "-TT;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/b460;->a:Ll/pcj;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/pcj;->call()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Ll/b460;->c:Ljava/lang/Object;

    .line 8
    .line 9
    if-ne v0, v1, :cond_0

    .line 10
    .line 11
    new-instance v0, Ll/b460$b;

    .line 12
    .line 13
    invoke-direct {v0, p0, p1, p1}, Ll/b460$b;-><init>(Ll/b460;Ll/gcg0;Ll/gcg0;)V

    .line 14
    .line 15
    .line 16
    return-object v0

    .line 17
    :cond_0
    new-instance v1, Ll/b460$d;

    .line 18
    .line 19
    invoke-direct {v1, v0, p1}, Ll/b460$d;-><init>(Ljava/lang/Object;Ll/gcg0;)V

    .line 20
    .line 21
    .line 22
    new-instance v2, Ll/b460$c;

    .line 23
    .line 24
    invoke-direct {v2, p0, v0, v1}, Ll/b460$c;-><init>(Ll/b460;Ljava/lang/Object;Ll/b460$d;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1, v2}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1, v1}, Ll/gcg0;->f(Ll/vk90;)V

    .line 31
    .line 32
    .line 33
    return-object v2
.end method

.method public bridge synthetic call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/b460;->a(Ll/gcg0;)Ll/gcg0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
