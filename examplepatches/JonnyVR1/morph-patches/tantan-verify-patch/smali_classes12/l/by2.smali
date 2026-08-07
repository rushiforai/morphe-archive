.class public abstract Ll/by2;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/uhw;


# direct methods
.method public constructor <init>(Ll/uhw;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/by2;->a:Ll/uhw;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public abstract a(Ll/uhw;)Ll/by2;
.end method

.method public abstract b()Ll/d13;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation
.end method

.method public abstract c(ILl/b13;)Ll/b13;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;
        }
    .end annotation
.end method

.method public final d()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/by2;->a:Ll/uhw;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/uhw;->a()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final e()Ll/uhw;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/by2;->a:Ll/uhw;

    .line 2
    .line 3
    return-object p0
.end method

.method public final f()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/by2;->a:Ll/uhw;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/uhw;->d()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
