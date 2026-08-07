.class public abstract Ll/wr4;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/wr4$a;
    }
.end annotation


# instance fields
.field private final a:Ljava/lang/String;

.field private b:Ll/xr4;

.field private c:Ll/wr4$a;

.field private d:I


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput v0, p0, Ll/wr4;->d:I

    .line 6
    .line 7
    iput-object p1, p0, Ll/wr4;->a:Ljava/lang/String;

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public a()Ll/wr4$a;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wr4;->c:Ll/wr4$a;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()Ll/xr4;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wr4;->b:Ll/xr4;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()I
    .locals 0

    .line 1
    iget p0, p0, Ll/wr4;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public d()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wr4;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public abstract e(Ll/aje;)Z
.end method

.method public f(Ll/wr4$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/wr4;->c:Ll/wr4$a;

    .line 2
    .line 3
    return-void
.end method

.method public g(Ll/xr4;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/wr4;->b:Ll/xr4;

    .line 2
    .line 3
    return-void
.end method

.method public h(ILjava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wr4;->b:Ll/xr4;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/xr4;->e(ILjava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public i(ILjava/lang/Exception;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wr4;->b:Ll/xr4;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/xr4;->d(ILjava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public j(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/wr4;->d:I

    .line 2
    .line 3
    return-void
.end method
