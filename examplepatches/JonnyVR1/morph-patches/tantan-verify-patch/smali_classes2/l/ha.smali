.class public final synthetic Ll/ha;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/facebook/GraphRequest$b;


# instance fields
.field public final synthetic a:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public final synthetic b:Ljava/util/Set;

.field public final synthetic c:Ljava/util/Set;

.field public final synthetic d:Ljava/util/Set;


# direct methods
.method public synthetic constructor <init>(Ljava/util/concurrent/atomic/AtomicBoolean;Ljava/util/Set;Ljava/util/Set;Ljava/util/Set;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ha;->a:Ljava/util/concurrent/atomic/AtomicBoolean;

    iput-object p2, p0, Ll/ha;->b:Ljava/util/Set;

    iput-object p3, p0, Ll/ha;->c:Ljava/util/Set;

    iput-object p4, p0, Ll/ha;->d:Ljava/util/Set;

    return-void
.end method


# virtual methods
.method public final a(Lcom/facebook/GraphResponse;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ha;->a:Ljava/util/concurrent/atomic/AtomicBoolean;

    iget-object v1, p0, Ll/ha;->b:Ljava/util/Set;

    iget-object v2, p0, Ll/ha;->c:Ljava/util/Set;

    iget-object p0, p0, Ll/ha;->d:Ljava/util/Set;

    invoke-static {v0, v1, v2, p0, p1}, Lcom/facebook/b;->d(Ljava/util/concurrent/atomic/AtomicBoolean;Ljava/util/Set;Ljava/util/Set;Ljava/util/Set;Lcom/facebook/GraphResponse;)V

    return-void
.end method
