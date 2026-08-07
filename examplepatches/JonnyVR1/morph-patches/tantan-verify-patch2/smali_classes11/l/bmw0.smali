.class public final Ll/bmw0;
.super Ll/xmw0;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:Ljava/lang/String;

.field public c:B


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/xmw0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;)Ll/xmw0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/bmw0;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final b(I)Ll/xmw0;
    .locals 0

    .line 1
    iput p1, p0, Ll/bmw0;->a:I

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    iput-byte p1, p0, Ll/bmw0;->c:B

    .line 5
    .line 6
    return-object p0
.end method

.method public final c()Ll/ymw0;
    .locals 3

    .line 1
    iget-byte v0, p0, Ll/bmw0;->c:B

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    new-instance v0, Ll/dmw0;

    .line 7
    .line 8
    iget v1, p0, Ll/bmw0;->a:I

    .line 9
    .line 10
    iget-object p0, p0, Ll/bmw0;->b:Ljava/lang/String;

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    invoke-direct {v0, v1, p0, v2}, Ll/dmw0;-><init>(ILjava/lang/String;Ll/cmw0;)V

    .line 14
    .line 15
    .line 16
    return-object v0

    .line 17
    :cond_0
    const-string p0, "Missing required properties: statusCode"

    .line 18
    .line 19
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    const/4 p0, 0x0

    .line 23
    return-object p0
.end method
