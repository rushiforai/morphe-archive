.class public final synthetic Ll/mln;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/nln;

.field public final synthetic b:Ljava/util/concurrent/atomic/AtomicInteger;

.field public final synthetic c:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Ll/nln;Ljava/util/concurrent/atomic/AtomicInteger;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mln;->a:Ll/nln;

    iput-object p2, p0, Ll/mln;->b:Ljava/util/concurrent/atomic/AtomicInteger;

    iput-object p3, p0, Ll/mln;->c:Ll/x20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mln;->a:Ll/nln;

    iget-object v1, p0, Ll/mln;->b:Ljava/util/concurrent/atomic/AtomicInteger;

    iget-object p0, p0, Ll/mln;->c:Ll/x20;

    check-cast p1, Ljava/lang/Long;

    invoke-static {v0, v1, p0, p1}, Ll/nln;->N3(Ll/nln;Ljava/util/concurrent/atomic/AtomicInteger;Ll/x20;Ljava/lang/Long;)V

    return-void
.end method
