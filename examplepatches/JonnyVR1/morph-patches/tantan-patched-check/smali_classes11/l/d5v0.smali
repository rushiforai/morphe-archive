.class public final Ll/d5v0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/upx0;


# instance fields
.field public final a:Ll/kqx0;

.field public final b:Ll/kqx0;

.field public final c:Ll/kqx0;


# direct methods
.method public constructor <init>(Ll/kqx0;Ll/kqx0;Ll/kqx0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/d5v0;->a:Ll/kqx0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/d5v0;->b:Ll/kqx0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/d5v0;->c:Ll/kqx0;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final a()Ll/c5v0;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/d5v0;->a:Ll/kqx0;

    .line 2
    .line 3
    check-cast v0, Ll/bqx0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/bqx0;->c()Ljava/util/Map;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Ll/oct0;->a:Ll/xvw0;

    .line 10
    .line 11
    invoke-static {v1}, Ll/cqx0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/d5v0;->c:Ll/kqx0;

    .line 15
    .line 16
    check-cast p0, Ll/w9u0;

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/w9u0;->a()Ll/v9u0;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    new-instance v2, Ll/c5v0;

    .line 23
    .line 24
    invoke-direct {v2, v0, v1, p0}, Ll/c5v0;-><init>(Ljava/util/Map;Ll/xvw0;Ll/v9u0;)V

    .line 25
    .line 26
    .line 27
    return-object v2
.end method

.method public final bridge synthetic zzb()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/d5v0;->a()Ll/c5v0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
