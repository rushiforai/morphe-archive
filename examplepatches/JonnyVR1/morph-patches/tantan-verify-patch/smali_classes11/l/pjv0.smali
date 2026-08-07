.class public final Ll/pjv0;
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
    iput-object p1, p0, Ll/pjv0;->a:Ll/kqx0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/pjv0;->b:Ll/kqx0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/pjv0;->c:Ll/kqx0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/pjv0;->d:Ll/kqx0;

    .line 11
    .line 12
    iput-object p5, p0, Ll/pjv0;->e:Ll/kqx0;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final bridge synthetic zzb()Ljava/lang/Object;
    .locals 7

    .line 1
    iget-object v0, p0, Ll/pjv0;->a:Ll/kqx0;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    move-object v2, v0

    .line 8
    check-cast v2, Landroid/content/Context;

    .line 9
    .line 10
    iget-object v0, p0, Ll/pjv0;->b:Ll/kqx0;

    .line 11
    .line 12
    invoke-interface {v0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    move-object v3, v0

    .line 17
    check-cast v3, Ll/zxt0;

    .line 18
    .line 19
    iget-object v0, p0, Ll/pjv0;->c:Ll/kqx0;

    .line 20
    .line 21
    invoke-interface {v0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    move-object v4, v0

    .line 26
    check-cast v4, Ll/lcw0;

    .line 27
    .line 28
    iget-object v0, p0, Ll/pjv0;->d:Ll/kqx0;

    .line 29
    .line 30
    invoke-interface {v0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    move-object v5, v0

    .line 35
    check-cast v5, Ll/xvw0;

    .line 36
    .line 37
    iget-object p0, p0, Ll/pjv0;->e:Ll/kqx0;

    .line 38
    .line 39
    check-cast p0, Ll/vjv0;

    .line 40
    .line 41
    invoke-virtual {p0}, Ll/vjv0;->a()Ll/yhs0;

    .line 42
    .line 43
    .line 44
    move-result-object v6

    .line 45
    new-instance v1, Ll/njv0;

    .line 46
    .line 47
    invoke-direct/range {v1 .. v6}, Ll/njv0;-><init>(Landroid/content/Context;Ll/zxt0;Ll/lcw0;Ll/xvw0;Ll/yhs0;)V

    .line 48
    .line 49
    .line 50
    return-object v1
.end method
