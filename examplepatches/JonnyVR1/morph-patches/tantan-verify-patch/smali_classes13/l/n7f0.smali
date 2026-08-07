.class public Ll/n7f0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljava/lang/String;

.field public b:J

.field public c:Z

.field public d:I

.field public e:I


# direct methods
.method public constructor <init>(Ljava/lang/String;JZII)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/n7f0;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput-wide p2, p0, Ll/n7f0;->b:J

    .line 7
    .line 8
    iput-boolean p4, p0, Ll/n7f0;->c:Z

    .line 9
    .line 10
    iput p5, p0, Ll/n7f0;->d:I

    .line 11
    .line 12
    iput p6, p0, Ll/n7f0;->e:I

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public a()I
    .locals 0

    .line 1
    iget p0, p0, Ll/n7f0;->e:I

    .line 2
    .line 3
    return p0
.end method

.method public b()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/n7f0;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/n7f0;->b:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public d()I
    .locals 0

    .line 1
    iget p0, p0, Ll/n7f0;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public e()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/n7f0;->c:Z

    .line 2
    .line 3
    return p0
.end method

.method public f(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/n7f0;->c:Z

    .line 2
    .line 3
    return-void
.end method

.method public g(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/n7f0;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public h(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/n7f0;->b:J

    .line 2
    .line 3
    return-void
.end method

.method public i(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/n7f0;->d:I

    .line 2
    .line 3
    return-void
.end method
