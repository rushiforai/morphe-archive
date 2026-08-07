.class public final Ll/bkv0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/piu0;


# direct methods
.method public constructor <init>(Ll/piu0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/bkv0;->a:Ll/piu0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final bridge synthetic a(Ll/b7w0;Ll/q6w0;Landroid/view/View;Ll/xjv0;)Ljava/lang/Object;
    .locals 2

    .line 1
    new-instance p3, Ll/zjv0;

    .line 2
    .line 3
    sget-object v0, Ll/yjv0;->a:Ll/yjv0;

    .line 4
    .line 5
    invoke-direct {p3, p0, v0}, Ll/zjv0;-><init>(Ll/bkv0;Ll/wiu0;)V

    .line 6
    .line 7
    .line 8
    new-instance v0, Ll/a0u0;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-direct {v0, p1, p2, v1}, Ll/a0u0;-><init>(Ll/b7w0;Ll/q6w0;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Ll/bkv0;->a:Ll/piu0;

    .line 15
    .line 16
    invoke-virtual {p1, v0, p3}, Ll/piu0;->c(Ll/a0u0;Ll/lhu0;)Ll/ihu0;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    new-instance p2, Ll/akv0;

    .line 21
    .line 22
    invoke-direct {p2, p0, p1}, Ll/akv0;-><init>(Ll/bkv0;Ll/ihu0;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p4, p2}, Ll/xjv0;->b(Ll/myv0;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1}, Ll/ihu0;->i()Ll/hhu0;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method
