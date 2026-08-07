.class public Ll/r7f0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public b:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public c:J


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a()Ll/y20;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/r7f0;->b:Ll/y20;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()Ll/y20;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/r7f0;->a:Ll/y20;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/r7f0;->c:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public d(Ll/y20;)Ll/r7f0;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)",
            "Ll/r7f0;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/r7f0;->b:Ll/y20;

    .line 2
    .line 3
    return-object p0
.end method

.method public e(Ll/y20;)Ll/r7f0;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)",
            "Ll/r7f0;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/r7f0;->a:Ll/y20;

    .line 2
    .line 3
    return-object p0
.end method

.method public f(J)Ll/r7f0;
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/r7f0;->c:J

    .line 2
    .line 3
    return-object p0
.end method
