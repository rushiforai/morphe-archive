.class public final synthetic Ll/pby0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/ncy0;

.field public final synthetic b:Landroid/util/Pair;

.field public final synthetic c:Ll/bzy0;

.field public final synthetic d:Ll/gzy0;

.field public final synthetic e:Ljava/io/IOException;

.field public final synthetic f:Z


# direct methods
.method public synthetic constructor <init>(Ll/ncy0;Landroid/util/Pair;Ll/bzy0;Ll/gzy0;Ljava/io/IOException;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/pby0;->a:Ll/ncy0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/pby0;->b:Landroid/util/Pair;

    .line 7
    .line 8
    iput-object p3, p0, Ll/pby0;->c:Ll/bzy0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/pby0;->d:Ll/gzy0;

    .line 11
    .line 12
    iput-object p5, p0, Ll/pby0;->e:Ljava/io/IOException;

    .line 13
    .line 14
    iput-boolean p6, p0, Ll/pby0;->f:Z

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/pby0;->b:Landroid/util/Pair;

    .line 2
    .line 3
    iget-object v1, p0, Ll/pby0;->a:Ll/ncy0;

    .line 4
    .line 5
    iget-object v1, v1, Ll/ncy0;->b:Ll/bdy0;

    .line 6
    .line 7
    invoke-static {v1}, Ll/bdy0;->e(Ll/bdy0;)Ll/wfy0;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    iget-object v1, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast v1, Ljava/lang/Integer;

    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 20
    .line 21
    move-object v4, v0

    .line 22
    check-cast v4, Ll/kzy0;

    .line 23
    .line 24
    iget-object v5, p0, Ll/pby0;->c:Ll/bzy0;

    .line 25
    .line 26
    iget-object v6, p0, Ll/pby0;->d:Ll/gzy0;

    .line 27
    .line 28
    iget-object v7, p0, Ll/pby0;->e:Ljava/io/IOException;

    .line 29
    .line 30
    iget-boolean v8, p0, Ll/pby0;->f:Z

    .line 31
    .line 32
    invoke-interface/range {v2 .. v8}, Ll/m0z0;->w(ILl/kzy0;Ll/bzy0;Ll/gzy0;Ljava/io/IOException;Z)V

    .line 33
    .line 34
    .line 35
    return-void
.end method
