.class public final synthetic Ll/lln;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/nln;

.field public final synthetic b:Ljava/util/concurrent/atomic/AtomicInteger;


# direct methods
.method public synthetic constructor <init>(Ll/nln;Ljava/util/concurrent/atomic/AtomicInteger;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lln;->a:Ll/nln;

    iput-object p2, p0, Ll/lln;->b:Ljava/util/concurrent/atomic/AtomicInteger;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/lln;->a:Ll/nln;

    iget-object p0, p0, Ll/lln;->b:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-static {v0, p0}, Ll/nln;->O3(Ll/nln;Ljava/util/concurrent/atomic/AtomicInteger;)V

    return-void
.end method
