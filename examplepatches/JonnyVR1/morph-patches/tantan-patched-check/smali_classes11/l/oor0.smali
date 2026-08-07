.class public final Ll/oor0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/per0;


# instance fields
.field public final a:Ll/dgr0;


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/dgr0;

    .line 5
    .line 6
    const v1, 0x8950

    .line 7
    .line 8
    .line 9
    const/4 v2, 0x2

    .line 10
    const-string v3, "image/png"

    .line 11
    .line 12
    invoke-direct {v0, v1, v2, v3}, Ll/dgr0;-><init>(IILjava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Ll/oor0;->a:Ll/dgr0;

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public final c(JJ)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/oor0;->a:Ll/dgr0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/dgr0;->c(JJ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final d(Ll/qer0;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/oor0;->a:Ll/dgr0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/dgr0;->d(Ll/qer0;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final e(Ll/ser0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/oor0;->a:Ll/dgr0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/dgr0;->e(Ll/ser0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final f(Ll/qer0;Ll/yfr0;)I
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/oor0;->a:Ll/dgr0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/dgr0;->f(Ll/qer0;Ll/yfr0;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
