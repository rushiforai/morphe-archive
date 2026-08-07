.class public final synthetic Ll/i0k0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/p0k0;

.field public final synthetic b:Lrx/subjects/a;

.field public final synthetic c:Ll/p0k0$b;


# direct methods
.method public synthetic constructor <init>(Ll/p0k0;Lrx/subjects/a;Ll/p0k0$b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i0k0;->a:Ll/p0k0;

    iput-object p2, p0, Ll/i0k0;->b:Lrx/subjects/a;

    iput-object p3, p0, Ll/i0k0;->c:Ll/p0k0$b;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/i0k0;->a:Ll/p0k0;

    iget-object v1, p0, Ll/i0k0;->b:Lrx/subjects/a;

    iget-object p0, p0, Ll/i0k0;->c:Ll/p0k0$b;

    check-cast p1, Ljava/util/List;

    invoke-static {v0, v1, p0, p1}, Ll/p0k0;->l(Ll/p0k0;Lrx/subjects/a;Ll/p0k0$b;Ljava/util/List;)Ll/p0k0$b;

    move-result-object p0

    return-object p0
.end method
