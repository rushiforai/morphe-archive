.class public final synthetic Ll/aqr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ljava/util/concurrent/CopyOnWriteArraySet;

.field public final synthetic b:I

.field public final synthetic c:Ll/bqr$a;


# direct methods
.method public synthetic constructor <init>(Ljava/util/concurrent/CopyOnWriteArraySet;ILl/bqr$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/aqr;->a:Ljava/util/concurrent/CopyOnWriteArraySet;

    iput p2, p0, Ll/aqr;->b:I

    iput-object p3, p0, Ll/aqr;->c:Ll/bqr$a;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/aqr;->a:Ljava/util/concurrent/CopyOnWriteArraySet;

    iget v1, p0, Ll/aqr;->b:I

    iget-object p0, p0, Ll/aqr;->c:Ll/bqr$a;

    invoke-static {v0, v1, p0}, Ll/bqr;->a(Ljava/util/concurrent/CopyOnWriteArraySet;ILl/bqr$a;)V

    return-void
.end method
