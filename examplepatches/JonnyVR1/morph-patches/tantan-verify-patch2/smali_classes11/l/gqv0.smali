.class public final Ll/gqv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/upx0;


# instance fields
.field public final a:Ll/kqx0;

.field public final b:Ll/kqx0;

.field public final c:Ll/kqx0;

.field public final d:Ll/kqx0;


# direct methods
.method public constructor <init>(Ll/kqx0;Ll/kqx0;Ll/kqx0;Ll/kqx0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/gqv0;->a:Ll/kqx0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/gqv0;->b:Ll/kqx0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/gqv0;->c:Ll/kqx0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/gqv0;->d:Ll/kqx0;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final bridge synthetic zzb()Ljava/lang/Object;
    .locals 4

    .line 1
    sget-object v0, Ll/oct0;->a:Ll/xvw0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/cqx0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/gqv0;->b:Ll/kqx0;

    .line 7
    .line 8
    invoke-interface {v1}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    check-cast v1, Ll/muu0;

    .line 13
    .line 14
    iget-object v2, p0, Ll/gqv0;->c:Ll/kqx0;

    .line 15
    .line 16
    check-cast v2, Ll/z5u0;

    .line 17
    .line 18
    invoke-virtual {v2}, Ll/z5u0;->a()Ll/o7w0;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    iget-object p0, p0, Ll/gqv0;->d:Ll/kqx0;

    .line 23
    .line 24
    invoke-interface {p0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    check-cast p0, Ljava/lang/String;

    .line 29
    .line 30
    new-instance v3, Ll/eqv0;

    .line 31
    .line 32
    invoke-direct {v3, v0, v1, v2, p0}, Ll/eqv0;-><init>(Ll/xvw0;Ll/muu0;Ll/o7w0;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    return-object v3
.end method
