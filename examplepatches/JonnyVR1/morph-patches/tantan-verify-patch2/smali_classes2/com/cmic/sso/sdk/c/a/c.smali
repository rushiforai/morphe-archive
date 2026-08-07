.class public Lcom/cmic/sso/sdk/c/a/c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/cmic/sso/sdk/c/a/b;


# instance fields
.field private a:Lcom/cmic/sso/sdk/c/a/b;

.field private b:Lcom/cmic/sso/sdk/c/d/c;

.field private final c:Lcom/cmic/sso/sdk/c/b;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/cmic/sso/sdk/c/b;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/cmic/sso/sdk/c/b;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/cmic/sso/sdk/c/a/c;->c:Lcom/cmic/sso/sdk/c/b;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic a(Lcom/cmic/sso/sdk/c/a/c;)Lcom/cmic/sso/sdk/c/b;
    .locals 0

    .line 5
    iget-object p0, p0, Lcom/cmic/sso/sdk/c/a/c;->c:Lcom/cmic/sso/sdk/c/b;

    return-object p0
.end method


# virtual methods
.method public a(Lcom/cmic/sso/sdk/c/a/b;)V
    .locals 0

    .line 6
    iput-object p1, p0, Lcom/cmic/sso/sdk/c/a/c;->a:Lcom/cmic/sso/sdk/c/a/b;

    return-void
.end method

.method public a(Lcom/cmic/sso/sdk/c/c/c;Lcom/cmic/sso/sdk/c/d/c;Lcom/cmic/sso/sdk/a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/cmic/sso/sdk/c/a/c;->b(Lcom/cmic/sso/sdk/c/c/c;Lcom/cmic/sso/sdk/c/d/c;Lcom/cmic/sso/sdk/a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b(Lcom/cmic/sso/sdk/c/c/c;Lcom/cmic/sso/sdk/c/d/c;Lcom/cmic/sso/sdk/a;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/cmic/sso/sdk/c/a/c;->a:Lcom/cmic/sso/sdk/c/a/b;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/cmic/sso/sdk/c/a/c$1;

    .line 6
    .line 7
    invoke-direct {v0, p0, p1, p3, p2}, Lcom/cmic/sso/sdk/c/a/c$1;-><init>(Lcom/cmic/sso/sdk/c/a/c;Lcom/cmic/sso/sdk/c/c/c;Lcom/cmic/sso/sdk/a;Lcom/cmic/sso/sdk/c/d/c;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/cmic/sso/sdk/c/a/c;->b:Lcom/cmic/sso/sdk/c/d/c;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/cmic/sso/sdk/c/a/c;->a:Lcom/cmic/sso/sdk/c/a/b;

    .line 13
    .line 14
    invoke-interface {p0, p1, v0, p3}, Lcom/cmic/sso/sdk/c/a/b;->a(Lcom/cmic/sso/sdk/c/c/c;Lcom/cmic/sso/sdk/c/d/c;Lcom/cmic/sso/sdk/a;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method
