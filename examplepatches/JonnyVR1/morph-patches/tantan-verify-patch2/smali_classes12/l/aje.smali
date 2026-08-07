.class public Ll/aje;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private a:Ljava/lang/String;

.field private b:I

.field private volatile c:Z

.field private d:I

.field private volatile e:Ll/ire0;

.field private f:Z

.field private g:J

.field private volatile h:Ljava/lang/String;

.field private i:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;ZIZ)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Ll/aje;->g:J

    .line 7
    .line 8
    iput-object p1, p0, Ll/aje;->a:Ljava/lang/String;

    .line 9
    .line 10
    iput p3, p0, Ll/aje;->b:I

    .line 11
    .line 12
    iput-boolean p2, p0, Ll/aje;->f:Z

    .line 13
    .line 14
    iput-boolean p4, p0, Ll/aje;->i:Z

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/aje;->h:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/aje;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/aje;->g:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public d()Ll/ire0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/aje;->e:Ll/ire0;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()I
    .locals 0

    .line 1
    iget p0, p0, Ll/aje;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public f()I
    .locals 0

    .line 1
    iget p0, p0, Ll/aje;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public g()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/aje;->c:Z

    .line 2
    .line 3
    return p0
.end method

.method public h()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/aje;->f:Z

    .line 2
    .line 3
    return p0
.end method

.method public i(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/aje;->c:Z

    .line 2
    .line 3
    return-void
.end method

.method public j(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/aje;->h:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public k(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/aje;->g:J

    .line 2
    .line 3
    return-void
.end method

.method public l(Ll/ire0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/aje;->e:Ll/ire0;

    .line 2
    .line 3
    return-void
.end method

.method public m(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/aje;->d:I

    .line 2
    .line 3
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/aje;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
