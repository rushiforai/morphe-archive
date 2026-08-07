.class public abstract Lcom/tencent/open/log/Tracer;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private volatile a:I

.field private volatile b:Z

.field private c:Lcom/tencent/open/log/g;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 25
    sget v0, Lcom/tencent/open/log/c;->a:I

    const/4 v1, 0x1

    sget-object v2, Lcom/tencent/open/log/g;->a:Lcom/tencent/open/log/g;

    invoke-direct {p0, v0, v1, v2}, Lcom/tencent/open/log/Tracer;-><init>(IZLcom/tencent/open/log/g;)V

    return-void
.end method

.method public constructor <init>(IZLcom/tencent/open/log/g;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget v0, Lcom/tencent/open/log/c;->a:I

    .line 5
    .line 6
    iput v0, p0, Lcom/tencent/open/log/Tracer;->a:I

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p0, Lcom/tencent/open/log/Tracer;->b:Z

    .line 10
    .line 11
    sget-object v0, Lcom/tencent/open/log/g;->a:Lcom/tencent/open/log/g;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/tencent/open/log/Tracer;->c:Lcom/tencent/open/log/g;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Lcom/tencent/open/log/Tracer;->a(I)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, p2}, Lcom/tencent/open/log/Tracer;->a(Z)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, p3}, Lcom/tencent/open/log/Tracer;->a(Lcom/tencent/open/log/g;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public a(I)V
    .locals 0

    .line 19
    iput p1, p0, Lcom/tencent/open/log/Tracer;->a:I

    return-void
.end method

.method public a(ILjava/lang/Thread;JLjava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/tencent/open/log/Tracer;->d()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget v0, p0, Lcom/tencent/open/log/Tracer;->a:I

    .line 8
    .line 9
    invoke-static {v0, p1}, Lcom/tencent/open/log/d$a;->a(II)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual/range {p0 .. p7}, Lcom/tencent/open/log/Tracer;->doTrace(ILjava/lang/Thread;JLjava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public a(Lcom/tencent/open/log/g;)V
    .locals 0

    .line 21
    iput-object p1, p0, Lcom/tencent/open/log/Tracer;->c:Lcom/tencent/open/log/g;

    return-void
.end method

.method public a(Z)V
    .locals 0

    .line 20
    iput-boolean p1, p0, Lcom/tencent/open/log/Tracer;->b:Z

    return-void
.end method

.method public d()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/tencent/open/log/Tracer;->b:Z

    .line 2
    .line 3
    return p0
.end method

.method public abstract doTrace(ILjava/lang/Thread;JLjava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
.end method

.method public e()Lcom/tencent/open/log/g;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/open/log/Tracer;->c:Lcom/tencent/open/log/g;

    .line 2
    .line 3
    return-object p0
.end method
