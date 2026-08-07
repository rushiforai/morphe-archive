.class public Ll/gxi0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:J

.field public b:J

.field public c:I

.field public d:I

.field public e:Ll/d7m;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/32 v0, 0xea60

    .line 5
    .line 6
    .line 7
    iput-wide v0, p0, Ll/gxi0;->a:J

    .line 8
    .line 9
    const-wide/16 v0, 0x2710

    .line 10
    .line 11
    iput-wide v0, p0, Ll/gxi0;->b:J

    .line 12
    .line 13
    const/16 v0, 0x1f4

    .line 14
    .line 15
    iput v0, p0, Ll/gxi0;->c:I

    .line 16
    .line 17
    const/16 v0, 0xa

    .line 18
    .line 19
    iput v0, p0, Ll/gxi0;->d:I

    .line 20
    .line 21
    new-instance v0, Ll/gxi0$a;

    .line 22
    .line 23
    invoke-direct {v0, p0}, Ll/gxi0$a;-><init>(Ll/gxi0;)V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Ll/gxi0;->e:Ll/d7m;

    .line 27
    .line 28
    return-void
.end method


# virtual methods
.method public a()Ll/d7m;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gxi0;->e:Ll/d7m;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/gxi0;->a:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public c()I
    .locals 0

    .line 1
    iget p0, p0, Ll/gxi0;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public d()I
    .locals 0

    .line 1
    iget p0, p0, Ll/gxi0;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public e()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/gxi0;->b:J

    .line 2
    .line 3
    return-wide v0
.end method
