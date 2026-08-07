.class public Ll/wya0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static b:Ll/wya0;


# instance fields
.field public a:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/wya0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/wya0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/wya0;->b:Ll/wya0;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/wya0;->a:Lrx/subjects/b;

    .line 9
    .line 10
    return-void
.end method

.method public static b()Ll/wya0;
    .locals 1

    .line 1
    sget-object v0, Ll/wya0;->b:Ll/wya0;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public a()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/wya0;->a:Lrx/subjects/b;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/c;->asObservable()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public c(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wya0;->a:Lrx/subjects/b;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
