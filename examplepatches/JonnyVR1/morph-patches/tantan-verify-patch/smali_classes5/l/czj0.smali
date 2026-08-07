.class public final synthetic Ll/czj0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/p0k0;

.field public final synthetic b:Ll/p0k0$b;

.field public final synthetic c:Lrx/subjects/a;


# direct methods
.method public synthetic constructor <init>(Ll/p0k0;Ll/p0k0$b;Lrx/subjects/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/czj0;->a:Ll/p0k0;

    iput-object p2, p0, Ll/czj0;->b:Ll/p0k0$b;

    iput-object p3, p0, Ll/czj0;->c:Lrx/subjects/a;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/czj0;->a:Ll/p0k0;

    iget-object v1, p0, Ll/czj0;->b:Ll/p0k0$b;

    iget-object p0, p0, Ll/czj0;->c:Lrx/subjects/a;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {v0, v1, p0, p1}, Ll/p0k0;->d(Ll/p0k0;Ll/p0k0$b;Lrx/subjects/a;Ljava/lang/Throwable;)V

    return-void
.end method
