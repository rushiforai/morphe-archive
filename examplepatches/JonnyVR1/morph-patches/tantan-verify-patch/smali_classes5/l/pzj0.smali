.class public final synthetic Ll/pzj0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/p0k0;

.field public final synthetic b:Ll/p0k0$b;

.field public final synthetic c:Lrx/subjects/a;


# direct methods
.method public synthetic constructor <init>(Ll/p0k0;Ll/p0k0$b;Lrx/subjects/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pzj0;->a:Ll/p0k0;

    iput-object p2, p0, Ll/pzj0;->b:Ll/p0k0$b;

    iput-object p3, p0, Ll/pzj0;->c:Lrx/subjects/a;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pzj0;->a:Ll/p0k0;

    iget-object v1, p0, Ll/pzj0;->b:Ll/p0k0$b;

    iget-object p0, p0, Ll/pzj0;->c:Lrx/subjects/a;

    check-cast p1, Ljava/util/List;

    invoke-static {v0, v1, p0, p1}, Ll/p0k0;->U(Ll/p0k0;Ll/p0k0$b;Lrx/subjects/a;Ljava/util/List;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
