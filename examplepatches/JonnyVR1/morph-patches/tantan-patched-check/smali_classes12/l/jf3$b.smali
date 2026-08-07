.class public Ll/jf3$b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/jf3;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field private a:Ll/hul;

.field private b:Ljava/lang/String;

.field private c:I

.field private d:I

.field private e:Ljava/lang/String;

.field private f:Ljava/lang/String;


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
.method public a()Ll/jf3;
    .locals 3

    .line 1
    new-instance v0, Ll/jf3;

    .line 2
    .line 3
    iget-object v1, p0, Ll/jf3$b;->a:Ll/hul;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, Ll/jf3;-><init>(Ll/hul;Ll/jf3$a;)V

    .line 7
    .line 8
    .line 9
    iget-object v1, p0, Ll/jf3$b;->b:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v0, v1}, Ll/jf3;->b(Ll/jf3;Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    iget v1, p0, Ll/jf3$b;->c:I

    .line 15
    .line 16
    invoke-static {v0, v1}, Ll/jf3;->c(Ll/jf3;I)I

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Ll/jf3$b;->e:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {v0, v1}, Ll/jf3;->d(Ll/jf3;Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    iget v1, p0, Ll/jf3$b;->d:I

    .line 25
    .line 26
    invoke-static {v0, v1}, Ll/jf3;->e(Ll/jf3;I)I

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Ll/jf3$b;->f:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {v0, p0}, Ll/jf3;->f(Ll/jf3;Ljava/lang/String;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    return-object v0
.end method

.method public b(I)Ll/jf3$b;
    .locals 0

    .line 1
    iput p1, p0, Ll/jf3$b;->d:I

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Ljava/lang/String;)Ll/jf3$b;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jf3$b;->f:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public d(Ljava/lang/String;)Ll/jf3$b;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jf3$b;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public e(Ll/hul;)Ll/jf3$b;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jf3$b;->a:Ll/hul;

    .line 2
    .line 3
    return-object p0
.end method

.method public f(I)Ll/jf3$b;
    .locals 0

    .line 1
    iput p1, p0, Ll/jf3$b;->c:I

    .line 2
    .line 3
    return-object p0
.end method

.method public g(Ljava/lang/String;)Ll/jf3$b;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jf3$b;->e:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
