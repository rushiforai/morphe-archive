.class public Ll/vxk$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/vxk;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:Z

.field public e:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x12c

    .line 5
    .line 6
    iput v0, p0, Ll/vxk$a;->a:I

    .line 7
    .line 8
    const/16 v0, 0x2710

    .line 9
    .line 10
    iput v0, p0, Ll/vxk$a;->b:I

    .line 11
    .line 12
    const/16 v0, 0x32

    .line 13
    .line 14
    iput v0, p0, Ll/vxk$a;->c:I

    .line 15
    .line 16
    const/4 v0, 0x1

    .line 17
    iput-boolean v0, p0, Ll/vxk$a;->d:Z

    .line 18
    .line 19
    const/16 v0, 0x1388

    .line 20
    .line 21
    iput v0, p0, Ll/vxk$a;->e:I

    .line 22
    .line 23
    return-void
.end method

.method public static bridge synthetic a(Ll/vxk$a;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/vxk$a;->e:I

    return p0
.end method

.method public static bridge synthetic b(Ll/vxk$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/vxk$a;->d:Z

    return p0
.end method

.method public static bridge synthetic c(Ll/vxk$a;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/vxk$a;->b:I

    return p0
.end method

.method public static bridge synthetic d(Ll/vxk$a;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/vxk$a;->c:I

    return p0
.end method

.method public static bridge synthetic e(Ll/vxk$a;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/vxk$a;->a:I

    return p0
.end method


# virtual methods
.method public f()Ll/vxk;
    .locals 2

    .line 1
    new-instance v0, Ll/vxk;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Ll/vxk;-><init>(Ll/vxk$a;Ll/wxk;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method

.method public g(I)Ll/vxk$a;
    .locals 0

    .line 1
    iput p1, p0, Ll/vxk$a;->e:I

    .line 2
    .line 3
    return-object p0
.end method

.method public h(Z)Ll/vxk$a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/vxk$a;->d:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public i(I)Ll/vxk$a;
    .locals 0

    .line 1
    iput p1, p0, Ll/vxk$a;->b:I

    .line 2
    .line 3
    return-object p0
.end method

.method public j(I)Ll/vxk$a;
    .locals 0

    .line 1
    iput p1, p0, Ll/vxk$a;->c:I

    .line 2
    .line 3
    return-object p0
.end method

.method public k(I)Ll/vxk$a;
    .locals 0

    .line 1
    iput p1, p0, Ll/vxk$a;->a:I

    .line 2
    .line 3
    return-object p0
.end method
