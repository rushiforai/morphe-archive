.class public final synthetic Ll/f0k0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/p0k0;

.field public final synthetic b:Ll/p0k0$b;

.field public final synthetic c:Lrx/subjects/a;

.field public final synthetic d:Ll/gcg0;


# direct methods
.method public synthetic constructor <init>(Ll/p0k0;Ll/p0k0$b;Lrx/subjects/a;Ll/gcg0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/f0k0;->a:Ll/p0k0;

    iput-object p2, p0, Ll/f0k0;->b:Ll/p0k0$b;

    iput-object p3, p0, Ll/f0k0;->c:Lrx/subjects/a;

    iput-object p4, p0, Ll/f0k0;->d:Ll/gcg0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/f0k0;->a:Ll/p0k0;

    iget-object v1, p0, Ll/f0k0;->b:Ll/p0k0$b;

    iget-object v2, p0, Ll/f0k0;->c:Lrx/subjects/a;

    iget-object p0, p0, Ll/f0k0;->d:Ll/gcg0;

    invoke-static {v0, v1, v2, p0}, Ll/p0k0;->B(Ll/p0k0;Ll/p0k0$b;Lrx/subjects/a;Ll/gcg0;)V

    return-void
.end method
