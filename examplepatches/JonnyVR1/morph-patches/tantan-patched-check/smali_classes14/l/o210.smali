.class public Ll/o210;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/v1f;

.field public b:Ll/ypr;


# direct methods
.method public constructor <init>(Ll/v1f;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/o210;->a:Ll/v1f;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()V
    .locals 3

    .line 1
    new-instance v0, Ll/eas;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/eas;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/ypr;

    .line 7
    .line 8
    invoke-direct {v1, v0}, Ll/ypr;-><init>(Ll/w6m;)V

    .line 9
    .line 10
    .line 11
    iput-object v1, p0, Ll/o210;->b:Ll/ypr;

    .line 12
    .line 13
    const-class v0, Ll/eas;

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0}, Ljava/lang/Class;->getInterfaces()[Ljava/lang/Class;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v2, p0, Ll/o210;->b:Ll/ypr;

    .line 24
    .line 25
    invoke-static {v1, v0, v2}, Ljava/lang/reflect/Proxy;->newProxyInstance(Ljava/lang/ClassLoader;[Ljava/lang/Class;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Ll/w6m;

    .line 30
    .line 31
    iget-object v1, p0, Ll/o210;->a:Ll/v1f;

    .line 32
    .line 33
    iget-object v1, v1, Ll/v1f;->c:Ll/a210;

    .line 34
    .line 35
    invoke-virtual {v1, v0}, Ll/a210;->g1(Ll/w6m;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Ll/o210;->a:Ll/v1f;

    .line 39
    .line 40
    iget-object v0, v0, Ll/v1f;->c:Ll/a210;

    .line 41
    .line 42
    invoke-virtual {p0, v0}, Ll/o210;->b(Ll/w6m;)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Ll/o210;->a:Ll/v1f;

    .line 46
    .line 47
    iget-object v0, v0, Ll/v1f;->d:Ll/q410;

    .line 48
    .line 49
    invoke-virtual {p0, v0}, Ll/o210;->b(Ll/w6m;)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Ll/o210;->a:Ll/v1f;

    .line 53
    .line 54
    iget-object v0, v0, Ll/v1f;->e:Ll/j210;

    .line 55
    .line 56
    invoke-virtual {p0, v0}, Ll/o210;->b(Ll/w6m;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public b(Ll/w6m;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/o210;->b:Ll/ypr;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ypr;->e(Ll/w6m;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/o210;->a:Ll/v1f;

    .line 2
    .line 3
    iget-object p0, p0, Ll/v1f;->c:Ll/a210;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, v0}, Ll/a210;->g1(Ll/w6m;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public d(Ll/w6m;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/o210;->b:Ll/ypr;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ypr;->f(Ll/w6m;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
