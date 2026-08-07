.class public Ll/sdl0$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/sdl0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:Landroid/net/Uri;

.field public b:I

.field public c:I

.field public d:I

.field public e:I

.field public f:I

.field public g:Ll/udl0;

.field public h:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/tdl0;",
            ">;"
        }
    .end annotation
.end field

.field public i:Ll/txl;


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
.method public a()Ll/sdl0;
    .locals 2

    .line 1
    new-instance v0, Ll/sdl0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/sdl0;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/sdl0$a;->a:Landroid/net/Uri;

    .line 7
    .line 8
    iput-object v1, v0, Ll/sdl0;->a:Landroid/net/Uri;

    .line 9
    .line 10
    iget v1, p0, Ll/sdl0$a;->b:I

    .line 11
    .line 12
    iput v1, v0, Ll/sdl0;->b:I

    .line 13
    .line 14
    iget v1, p0, Ll/sdl0$a;->c:I

    .line 15
    .line 16
    iput v1, v0, Ll/sdl0;->c:I

    .line 17
    .line 18
    iget v1, p0, Ll/sdl0$a;->d:I

    .line 19
    .line 20
    iput v1, v0, Ll/sdl0;->d:I

    .line 21
    .line 22
    iget v1, p0, Ll/sdl0$a;->e:I

    .line 23
    .line 24
    iput v1, v0, Ll/sdl0;->e:I

    .line 25
    .line 26
    iget v1, p0, Ll/sdl0$a;->f:I

    .line 27
    .line 28
    iput v1, v0, Ll/sdl0;->f:I

    .line 29
    .line 30
    iget-object v1, p0, Ll/sdl0$a;->g:Ll/udl0;

    .line 31
    .line 32
    iput-object v1, v0, Ll/sdl0;->g:Ll/udl0;

    .line 33
    .line 34
    iget-object v1, p0, Ll/sdl0$a;->h:Ljava/util/List;

    .line 35
    .line 36
    invoke-static {v0, v1}, Ll/sdl0;->a(Ll/sdl0;Ljava/util/List;)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Ll/sdl0$a;->i:Ll/txl;

    .line 40
    .line 41
    iput-object p0, v0, Ll/sdl0;->i:Ll/txl;

    .line 42
    .line 43
    return-object v0
.end method

.method public b(Ljava/util/List;)Ll/sdl0$a;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/tdl0;",
            ">;)",
            "Ll/sdl0$a;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/sdl0$a;->h:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Ll/udl0;)Ll/sdl0$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sdl0$a;->g:Ll/udl0;

    .line 2
    .line 3
    return-object p0
.end method

.method public d(I)Ll/sdl0$a;
    .locals 0

    .line 1
    iput p1, p0, Ll/sdl0$a;->b:I

    .line 2
    .line 3
    return-object p0
.end method

.method public e(Ll/txl;)Ll/sdl0$a;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sdl0$a;->i:Ll/txl;

    .line 2
    .line 3
    return-object p0
.end method
