.class public final Ll/lmu0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/upx0;


# instance fields
.field public final a:Ll/gmu0;

.field public final b:Ll/kqx0;

.field public final c:Ll/kqx0;


# direct methods
.method public constructor <init>(Ll/gmu0;Ll/kqx0;Ll/kqx0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/lmu0;->a:Ll/gmu0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/lmu0;->b:Ll/kqx0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/lmu0;->c:Ll/kqx0;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final a()Ll/o9t0;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/lmu0;->b:Ll/kqx0;

    .line 2
    .line 3
    check-cast v0, Ll/jlt0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/jlt0;->a()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object p0, p0, Ll/lmu0;->c:Ll/kqx0;

    .line 10
    .line 11
    check-cast p0, Ll/z5u0;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/z5u0;->a()Ll/o7w0;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    iget-object p0, p0, Ll/o7w0;->f:Ljava/lang/String;

    .line 18
    .line 19
    new-instance v1, Ll/o9t0;

    .line 20
    .line 21
    invoke-direct {v1, v0, p0}, Ll/o9t0;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-object v1
.end method

.method public final bridge synthetic zzb()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/lmu0;->a()Ll/o9t0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
