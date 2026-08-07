.class public final synthetic Ll/rev0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Ll/tev0;

.field public final synthetic b:Ll/b7w0;

.field public final synthetic c:Ll/q6w0;


# direct methods
.method public synthetic constructor <init>(Ll/tev0;Ll/b7w0;Ll/q6w0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/rev0;->a:Ll/tev0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/rev0;->b:Ll/b7w0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/rev0;->c:Ll/q6w0;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/rev0;->a:Ll/tev0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/rev0;->b:Ll/b7w0;

    .line 4
    .line 5
    iget-object p0, p0, Ll/rev0;->c:Ll/q6w0;

    .line 6
    .line 7
    invoke-virtual {v0, v1, p0}, Ll/tev0;->c(Ll/b7w0;Ll/q6w0;)Ll/uwt0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method
