.class public Ll/ayh;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ll/x20;

.field public b:Z

.field public c:Ll/ayh;


# direct methods
.method public constructor <init>(ZLl/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/ayh;->a:Ll/x20;

    .line 5
    .line 6
    iput-boolean p1, p0, Ll/ayh;->b:Z

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/ayh;->b:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/ayh;->a:Ll/x20;

    .line 6
    .line 7
    invoke-interface {p0}, Ll/x20;->call()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget-object v0, p0, Ll/ayh;->c:Ll/ayh;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    iget-object p0, p0, Ll/ayh;->c:Ll/ayh;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/ayh;->a()V

    .line 22
    .line 23
    .line 24
    :cond_1
    return-void
.end method

.method public b(Ll/ayh;)Ll/ayh;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ayh;->c:Ll/ayh;

    .line 2
    .line 3
    return-object p1
.end method
