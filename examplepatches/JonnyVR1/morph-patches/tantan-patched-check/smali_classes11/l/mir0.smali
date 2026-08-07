.class public final Ll/mir0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/per0;


# instance fields
.field public final a:Ll/per0;


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 12
    invoke-direct {p0, v0}, Ll/mir0;-><init>(I)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/nir0;

    .line 5
    .line 6
    invoke-direct {p1}, Ll/nir0;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/mir0;->a:Ll/per0;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final c(JJ)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mir0;->a:Ll/per0;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2, p3, p4}, Ll/per0;->c(JJ)V

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
    iget-object p0, p0, Ll/mir0;->a:Ll/per0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/per0;->d(Ll/qer0;)Z

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
    iget-object p0, p0, Ll/mir0;->a:Ll/per0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/per0;->e(Ll/ser0;)V

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
    iget-object p0, p0, Ll/mir0;->a:Ll/per0;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Ll/per0;->f(Ll/qer0;Ll/yfr0;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
