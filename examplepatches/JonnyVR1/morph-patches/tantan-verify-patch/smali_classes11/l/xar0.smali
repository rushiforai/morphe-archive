.class public final Ll/xar0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/vhu0;


# instance fields
.field public final a:Ll/bou0;

.field public final b:Ll/bou0;

.field public final c:Ll/bou0;


# direct methods
.method public constructor <init>(Ll/bou0;Ll/bou0;Ll/bou0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/xar0;->a:Ll/bou0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/xar0;->b:Ll/bou0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/xar0;->c:Ll/bou0;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final a()Ll/l3z0;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/xar0;->a:Ll/bou0;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/bou0;->zza()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/m1v0;

    .line 8
    .line 9
    iget-object v1, p0, Ll/xar0;->b:Ll/bou0;

    .line 10
    .line 11
    check-cast v1, Ll/kpr0;

    .line 12
    .line 13
    invoke-virtual {v1}, Ll/kpr0;->a()Ll/cor0;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iget-object p0, p0, Ll/xar0;->c:Ll/bou0;

    .line 18
    .line 19
    invoke-interface {p0}, Ll/bou0;->zza()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Ll/tqr0;

    .line 24
    .line 25
    new-instance v2, Ll/l3z0;

    .line 26
    .line 27
    invoke-direct {v2, v0, v1, p0}, Ll/l3z0;-><init>(Ll/m1v0;Ll/cor0;Ll/tqr0;)V

    .line 28
    .line 29
    .line 30
    return-object v2
.end method

.method public final bridge synthetic zza()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xar0;->a()Ll/l3z0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
