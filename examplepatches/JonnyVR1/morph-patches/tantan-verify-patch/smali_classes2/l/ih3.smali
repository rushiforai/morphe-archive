.class public final synthetic Ll/ih3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Ljava/lang/Object;

.field public final synthetic b:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public final synthetic c:Ll/mh3;

.field public final synthetic d:Ll/by3;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/util/concurrent/atomic/AtomicBoolean;Ll/mh3;Ll/by3;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ih3;->a:Ljava/lang/Object;

    iput-object p2, p0, Ll/ih3;->b:Ljava/util/concurrent/atomic/AtomicBoolean;

    iput-object p3, p0, Ll/ih3;->c:Ll/mh3;

    iput-object p4, p0, Ll/ih3;->d:Ll/by3;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ih3;->a:Ljava/lang/Object;

    iget-object v1, p0, Ll/ih3;->b:Ljava/util/concurrent/atomic/AtomicBoolean;

    iget-object v2, p0, Ll/ih3;->c:Ll/mh3;

    iget-object p0, p0, Ll/ih3;->d:Ll/by3;

    invoke-static {v0, v1, v2, p0}, Ll/mh3;->d(Ljava/lang/Object;Ljava/util/concurrent/atomic/AtomicBoolean;Ll/mh3;Ll/by3;)Ll/n0f;

    move-result-object p0

    return-object p0
.end method
