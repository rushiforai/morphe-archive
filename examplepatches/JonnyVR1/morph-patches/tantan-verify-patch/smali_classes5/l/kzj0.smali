.class public final synthetic Ll/kzj0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/p0k0;

.field public final synthetic b:Lrx/subjects/a;


# direct methods
.method public synthetic constructor <init>(Ll/p0k0;Lrx/subjects/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kzj0;->a:Ll/p0k0;

    iput-object p2, p0, Ll/kzj0;->b:Lrx/subjects/a;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/kzj0;->a:Ll/p0k0;

    iget-object p0, p0, Ll/kzj0;->b:Lrx/subjects/a;

    check-cast p1, Ll/p0k0$b;

    invoke-static {v0, p0, p1}, Ll/p0k0;->f(Ll/p0k0;Lrx/subjects/a;Ll/p0k0$b;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
