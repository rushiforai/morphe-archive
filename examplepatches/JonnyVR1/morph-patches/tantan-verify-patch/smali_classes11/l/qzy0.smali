.class public final synthetic Ll/qzy0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/l0z0;

.field public final synthetic b:Ll/m0z0;

.field public final synthetic c:Ll/bzy0;

.field public final synthetic d:Ll/gzy0;

.field public final synthetic e:Ljava/io/IOException;

.field public final synthetic f:Z


# direct methods
.method public synthetic constructor <init>(Ll/l0z0;Ll/m0z0;Ll/bzy0;Ll/gzy0;Ljava/io/IOException;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/qzy0;->a:Ll/l0z0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/qzy0;->b:Ll/m0z0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/qzy0;->c:Ll/bzy0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/qzy0;->d:Ll/gzy0;

    .line 11
    .line 12
    iput-object p5, p0, Ll/qzy0;->e:Ljava/io/IOException;

    .line 13
    .line 14
    iput-boolean p6, p0, Ll/qzy0;->f:Z

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/qzy0;->a:Ll/l0z0;

    .line 2
    .line 3
    iget-object v3, v0, Ll/l0z0;->b:Ll/kzy0;

    .line 4
    .line 5
    iget-object v4, p0, Ll/qzy0;->c:Ll/bzy0;

    .line 6
    .line 7
    iget-object v5, p0, Ll/qzy0;->d:Ll/gzy0;

    .line 8
    .line 9
    iget-object v6, p0, Ll/qzy0;->e:Ljava/io/IOException;

    .line 10
    .line 11
    iget-object v1, p0, Ll/qzy0;->b:Ll/m0z0;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    iget-boolean v7, p0, Ll/qzy0;->f:Z

    .line 15
    .line 16
    invoke-interface/range {v1 .. v7}, Ll/m0z0;->w(ILl/kzy0;Ll/bzy0;Ll/gzy0;Ljava/io/IOException;Z)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
