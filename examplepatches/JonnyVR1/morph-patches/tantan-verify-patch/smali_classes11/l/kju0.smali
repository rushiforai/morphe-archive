.class public final Ll/kju0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/upx0;


# instance fields
.field public final a:Ll/kqx0;

.field public final b:Ll/kqx0;

.field public final c:Ll/kqx0;

.field public final d:Ll/kqx0;

.field public final e:Ll/kqx0;


# direct methods
.method public constructor <init>(Ll/kqx0;Ll/kqx0;Ll/kqx0;Ll/kqx0;Ll/kqx0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/kju0;->a:Ll/kqx0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/kju0;->b:Ll/kqx0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/kju0;->c:Ll/kqx0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/kju0;->d:Ll/kqx0;

    .line 11
    .line 12
    iput-object p5, p0, Ll/kju0;->e:Ll/kqx0;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final bridge synthetic zzb()Ljava/lang/Object;
    .locals 7

    .line 1
    iget-object v0, p0, Ll/kju0;->a:Ll/kqx0;

    .line 2
    .line 3
    check-cast v0, Ll/ypx0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/ypx0;->c()Ljava/util/Map;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    iget-object v0, p0, Ll/kju0;->b:Ll/kqx0;

    .line 10
    .line 11
    check-cast v0, Ll/ypx0;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/ypx0;->c()Ljava/util/Map;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    iget-object v0, p0, Ll/kju0;->c:Ll/kqx0;

    .line 18
    .line 19
    check-cast v0, Ll/ypx0;

    .line 20
    .line 21
    invoke-virtual {v0}, Ll/ypx0;->c()Ljava/util/Map;

    .line 22
    .line 23
    .line 24
    move-result-object v4

    .line 25
    iget-object v0, p0, Ll/kju0;->e:Ll/kqx0;

    .line 26
    .line 27
    check-cast v0, Ll/oju0;

    .line 28
    .line 29
    invoke-virtual {v0}, Ll/oju0;->a()Ll/fmu0;

    .line 30
    .line 31
    .line 32
    move-result-object v6

    .line 33
    iget-object v5, p0, Ll/kju0;->d:Ll/kqx0;

    .line 34
    .line 35
    new-instance v1, Ll/jju0;

    .line 36
    .line 37
    invoke-direct/range {v1 .. v6}, Ll/jju0;-><init>(Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;Ll/kqx0;Ll/fmu0;)V

    .line 38
    .line 39
    .line 40
    return-object v1
.end method
