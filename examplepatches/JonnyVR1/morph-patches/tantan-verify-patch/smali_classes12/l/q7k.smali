.class public Ll/q7k;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private a:Ll/t7k;

.field private b:Ll/s7k;


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

.method public static synthetic a(Ll/q7k;)Ll/s7k;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q7k;->b:Ll/s7k;

    .line 2
    .line 3
    return-object p0
.end method

.method private b()V
    .locals 2

    .line 1
    new-instance v0, Ll/t7k;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/t7k;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/q7k;->a:Ll/t7k;

    .line 7
    .line 8
    new-instance v0, Ll/afj;

    .line 9
    .line 10
    const/16 v1, 0x200

    .line 11
    .line 12
    invoke-direct {v0, v1, v1}, Ll/afj;-><init>(II)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ll/q7k;->a:Ll/t7k;

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ll/uej;->a(Ll/afj;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public c()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/q7k;->a:Ll/t7k;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/uej;->i()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Ll/q7k;->a:Ll/t7k;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public d(Ll/s7k;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/q7k;->b:Ll/s7k;

    .line 2
    .line 3
    return-void
.end method

.method public e()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/q7k;->b()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/q7k;->a:Ll/t7k;

    .line 5
    .line 6
    new-instance v1, Ll/q7k$a;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Ll/q7k$a;-><init>(Ll/q7k;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ll/t7k;->n(Ll/v7k;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/q7k;->a:Ll/t7k;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/uej;->l()V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Ll/q7k;->a:Ll/t7k;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/uej;->k()V

    .line 22
    .line 23
    .line 24
    return-void
.end method
