.class public final Ll/j560$d;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/j560;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "d"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field public static final d:Ll/j560$d;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/j560$d<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final a:Ll/bb50;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/bb50<",
            "TT;>;"
        }
    .end annotation
.end field

.field public final b:Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation
.end field

.field public final c:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Ll/j560$d;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x0

    .line 5
    invoke-direct {v0, v1, v1, v2}, Ll/j560$d;-><init>(Ll/bb50;Lrx/c;I)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Ll/j560$d;->d:Ll/j560$d;

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(Ll/bb50;Lrx/c;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/bb50<",
            "TT;>;",
            "Lrx/c<",
            "TT;>;I)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/j560$d;->a:Ll/bb50;

    .line 5
    .line 6
    iput-object p2, p0, Ll/j560$d;->b:Lrx/c;

    .line 7
    .line 8
    iput p3, p0, Ll/j560$d;->c:I

    .line 9
    .line 10
    return-void
.end method

.method public static c()Ll/j560$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Ll/j560$d<",
            "TT;>;"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/j560$d;->d:Ll/j560$d;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public a()Ll/j560$d;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/j560$d<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/j560$d;->c()Ll/j560$d;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public b(Ll/bb50;Lrx/c;)Ll/j560$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/bb50<",
            "TT;>;",
            "Lrx/c<",
            "TT;>;)",
            "Ll/j560$d<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance p0, Ll/j560$d;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-direct {p0, p1, p2, v0}, Ll/j560$d;-><init>(Ll/bb50;Lrx/c;I)V

    .line 5
    .line 6
    .line 7
    return-object p0
.end method

.method public d()Ll/j560$d;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/j560$d<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/j560$d;

    .line 2
    .line 3
    iget-object v1, p0, Ll/j560$d;->a:Ll/bb50;

    .line 4
    .line 5
    iget-object v2, p0, Ll/j560$d;->b:Lrx/c;

    .line 6
    .line 7
    iget p0, p0, Ll/j560$d;->c:I

    .line 8
    .line 9
    add-int/lit8 p0, p0, 0x1

    .line 10
    .line 11
    invoke-direct {v0, v1, v2, p0}, Ll/j560$d;-><init>(Ll/bb50;Lrx/c;I)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method
