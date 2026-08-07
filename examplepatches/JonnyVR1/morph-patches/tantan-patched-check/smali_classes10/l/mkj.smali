.class public Ll/mkj;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/mkj$a;
    }
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:I

.field public c:Z

.field public d:Ljava/lang/String;

.field public e:I

.field public final f:[I

.field public g:Z


# direct methods
.method public constructor <init>(Ll/mkj$a;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/mkj$a;->f(Ll/mkj$a;)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/mkj;->d:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {p1}, Ll/mkj$a;->d(Ll/mkj$a;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Ll/mkj;->a:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {p1}, Ll/mkj$a;->b(Ll/mkj$a;)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iput v0, p0, Ll/mkj;->b:I

    .line 21
    .line 22
    invoke-static {p1}, Ll/mkj$a;->e(Ll/mkj$a;)[I

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iput-object v0, p0, Ll/mkj;->f:[I

    .line 27
    .line 28
    invoke-static {p1}, Ll/mkj$a;->a(Ll/mkj$a;)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iput v0, p0, Ll/mkj;->e:I

    .line 33
    .line 34
    invoke-static {p1}, Ll/mkj$a;->g(Ll/mkj$a;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    iput-boolean v0, p0, Ll/mkj;->c:Z

    .line 39
    .line 40
    invoke-static {p1}, Ll/mkj$a;->c(Ll/mkj$a;)Z

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    iput-boolean p1, p0, Ll/mkj;->g:Z

    .line 45
    .line 46
    return-void
.end method

.method public synthetic constructor <init>(Ll/mkj$a;Ll/nkj;)V
    .locals 0

    .line 47
    invoke-direct {p0, p1}, Ll/mkj;-><init>(Ll/mkj$a;)V

    return-void
.end method


# virtual methods
.method public a()I
    .locals 0

    .line 1
    iget p0, p0, Ll/mkj;->e:I

    .line 2
    .line 3
    return p0
.end method

.method public b()I
    .locals 0

    .line 1
    iget p0, p0, Ll/mkj;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public c()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mkj;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()[I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mkj;->f:[I

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/mkj;->g:Z

    .line 2
    .line 3
    return p0
.end method
