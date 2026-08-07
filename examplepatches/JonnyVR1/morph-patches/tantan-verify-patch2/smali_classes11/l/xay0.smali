.class public final synthetic Ll/xay0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/cby0;

.field public final synthetic b:Ll/mqw0;

.field public final synthetic c:Ll/kzy0;


# direct methods
.method public synthetic constructor <init>(Ll/cby0;Ll/mqw0;Ll/kzy0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/xay0;->a:Ll/cby0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/xay0;->b:Ll/mqw0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/xay0;->c:Ll/kzy0;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xay0;->a:Ll/cby0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/xay0;->b:Ll/mqw0;

    .line 4
    .line 5
    iget-object p0, p0, Ll/xay0;->c:Ll/kzy0;

    .line 6
    .line 7
    invoke-virtual {v0, v1, p0}, Ll/cby0;->n(Ll/mqw0;Ll/kzy0;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
