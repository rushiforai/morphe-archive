.class public final synthetic Ll/yby0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/ncy0;

.field public final synthetic b:Landroid/util/Pair;

.field public final synthetic c:Ll/bzy0;

.field public final synthetic d:Ll/gzy0;


# direct methods
.method public synthetic constructor <init>(Ll/ncy0;Landroid/util/Pair;Ll/bzy0;Ll/gzy0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/yby0;->a:Ll/ncy0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/yby0;->b:Landroid/util/Pair;

    .line 7
    .line 8
    iput-object p3, p0, Ll/yby0;->c:Ll/bzy0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/yby0;->d:Ll/gzy0;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/yby0;->b:Landroid/util/Pair;

    .line 2
    .line 3
    iget-object v1, p0, Ll/yby0;->a:Ll/ncy0;

    .line 4
    .line 5
    iget-object v1, v1, Ll/ncy0;->b:Ll/bdy0;

    .line 6
    .line 7
    invoke-static {v1}, Ll/bdy0;->e(Ll/bdy0;)Ll/wfy0;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iget-object v2, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast v2, Ljava/lang/Integer;

    .line 14
    .line 15
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 20
    .line 21
    check-cast v0, Ll/kzy0;

    .line 22
    .line 23
    iget-object v3, p0, Ll/yby0;->c:Ll/bzy0;

    .line 24
    .line 25
    iget-object p0, p0, Ll/yby0;->d:Ll/gzy0;

    .line 26
    .line 27
    invoke-interface {v1, v2, v0, v3, p0}, Ll/m0z0;->M(ILl/kzy0;Ll/bzy0;Ll/gzy0;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method
