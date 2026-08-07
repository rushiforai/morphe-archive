.class public final Ll/x860;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/d13;

.field public final b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "[",
            "Ll/s5d0;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/d13;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/d13;",
            "Ljava/util/List<",
            "[",
            "Ll/s5d0;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/x860;->a:Ll/d13;

    .line 5
    .line 6
    iput-object p2, p0, Ll/x860;->b:Ljava/util/List;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a()Ll/d13;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x860;->a:Ll/d13;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "[",
            "Ll/s5d0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/x860;->b:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method
