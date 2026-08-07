.class public Ll/zge;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/c5e;


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
.method public a(Ll/b4e;)Lcom/facebook/cache/disk/b;
    .locals 3

    .line 1
    new-instance p0, Lcom/facebook/cache/disk/d;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/b4e;->l()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-virtual {p1}, Ll/b4e;->c()Ll/a7h0;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {p1}, Ll/b4e;->b()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {p1}, Ll/b4e;->d()Lcom/facebook/cache/common/CacheErrorLogger;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-direct {p0, v0, v1, v2, p1}, Lcom/facebook/cache/disk/d;-><init>(ILl/a7h0;Ljava/lang/String;Lcom/facebook/cache/common/CacheErrorLogger;)V

    .line 20
    .line 21
    .line 22
    return-object p0
.end method
