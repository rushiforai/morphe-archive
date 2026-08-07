.class public Ll/lu10;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljava/lang/String;

.field public b:J

.field public c:J

.field public d:I


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    const-string p1, ""

    .line 7
    .line 8
    iput-object p1, p0, Ll/lu10;->a:Ljava/lang/String;

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    iput-object p1, p0, Ll/lu10;->a:Ljava/lang/String;

    .line 12
    .line 13
    :goto_0
    const-wide/16 v0, -0x1

    .line 14
    .line 15
    iput-wide v0, p0, Ll/lu10;->b:J

    .line 16
    .line 17
    iput-wide v0, p0, Ll/lu10;->c:J

    .line 18
    .line 19
    const/4 p1, 0x0

    .line 20
    iput p1, p0, Ll/lu10;->d:I

    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public a()I
    .locals 0

    .line 1
    iget p0, p0, Ll/lu10;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public b()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lu10;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/lu10;->b:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public d()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/lu10;->c:J

    .line 2
    .line 3
    return-wide v0
.end method
