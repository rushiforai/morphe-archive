.class public final synthetic Ll/nzy0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/l0z0;

.field public final synthetic b:Ll/m0z0;

.field public final synthetic c:Ll/gzy0;


# direct methods
.method public synthetic constructor <init>(Ll/l0z0;Ll/m0z0;Ll/gzy0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/nzy0;->a:Ll/l0z0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/nzy0;->b:Ll/m0z0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/nzy0;->c:Ll/gzy0;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/nzy0;->a:Ll/l0z0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/l0z0;->b:Ll/kzy0;

    .line 4
    .line 5
    iget-object v1, p0, Ll/nzy0;->b:Ll/m0z0;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    iget-object p0, p0, Ll/nzy0;->c:Ll/gzy0;

    .line 9
    .line 10
    invoke-interface {v1, v2, v0, p0}, Ll/m0z0;->U(ILl/kzy0;Ll/gzy0;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
