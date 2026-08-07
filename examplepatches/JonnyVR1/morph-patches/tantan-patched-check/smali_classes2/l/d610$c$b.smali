.class public Ll/d610$c$b;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/d610$c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field private a:Ll/d610$c;


# direct methods
.method private constructor <init>(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/d610$c;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-direct {v0, v1}, Ll/d610$c;-><init>(Ll/d610$a;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/d610$c$b;->a:Ll/d610$c;

    .line 11
    .line 12
    iput-object p1, v0, Ll/d610$c;->a:Ljava/lang/String;

    .line 13
    .line 14
    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;Ll/d610$a;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1}, Ll/d610$c$b;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public a()Ll/d610$c;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/d610$c$b;->a:Ll/d610$c;

    .line 2
    .line 3
    return-object p0
.end method

.method public b(Ljava/lang/String;)Ll/d610$c$b;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/d610$c$b;->a:Ll/d610$c;

    .line 2
    .line 3
    iput-object p1, v0, Ll/d610$c;->c:Ljava/lang/String;

    .line 4
    .line 5
    return-object p0
.end method

.method public c(Ll/d610$c$a;)Ll/d610$c$b;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/d610$c$b;->a:Ll/d610$c;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/d610$c;->a(Ll/d610$c;Ll/d610$c$a;)Ll/d610$c$a;

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public varargs d([Ljava/lang/String;)Ll/d610$c$b;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/d610$c$b;->a:Ll/d610$c;

    .line 2
    .line 3
    iput-object p1, v0, Ll/d610$c;->f:[Ljava/lang/String;

    .line 4
    .line 5
    return-object p0
.end method

.method public varargs e([Ljava/lang/String;)Ll/d610$c$b;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/d610$c$b;->a:Ll/d610$c;

    .line 2
    .line 3
    iput-object p1, v0, Ll/d610$c;->g:[Ljava/lang/String;

    .line 4
    .line 5
    return-object p0
.end method

.method public f(Ljava/lang/String;)Ll/d610$c$b;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/d610$c$b;->a:Ll/d610$c;

    .line 2
    .line 3
    iput-object p1, v0, Ll/d610$c;->b:Ljava/lang/String;

    .line 4
    .line 5
    return-object p0
.end method

.method public g(J)Ll/d610$c$b;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/d610$c$b;->a:Ll/d610$c;

    .line 2
    .line 3
    iput-wide p1, v0, Ll/d610$c;->d:J

    .line 4
    .line 5
    return-object p0
.end method

.method public h(Ljava/lang/String;)Ll/d610$c$b;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/d610$c$b;->a:Ll/d610$c;

    .line 2
    .line 3
    iput-object p1, v0, Ll/d610$c;->e:Ljava/lang/String;

    .line 4
    .line 5
    return-object p0
.end method
