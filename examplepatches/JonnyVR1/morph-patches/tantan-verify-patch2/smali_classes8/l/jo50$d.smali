.class public Ll/jo50$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/jo50;->a(Ll/gcg0;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lrx/c;

.field public final synthetic b:Ll/gcg0;

.field public final synthetic c:Ljava/util/concurrent/atomic/AtomicLong;

.field public final synthetic d:Ll/f2e0$a;

.field public final synthetic e:Ll/x20;

.field public final synthetic f:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public final synthetic g:Ll/jo50;


# direct methods
.method public constructor <init>(Ll/jo50;Lrx/c;Ll/gcg0;Ljava/util/concurrent/atomic/AtomicLong;Ll/f2e0$a;Ll/x20;Ljava/util/concurrent/atomic/AtomicBoolean;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jo50$d;->g:Ll/jo50;

    .line 2
    .line 3
    iput-object p2, p0, Ll/jo50$d;->a:Lrx/c;

    .line 4
    .line 5
    iput-object p3, p0, Ll/jo50$d;->b:Ll/gcg0;

    .line 6
    .line 7
    iput-object p4, p0, Ll/jo50$d;->c:Ljava/util/concurrent/atomic/AtomicLong;

    .line 8
    .line 9
    iput-object p5, p0, Ll/jo50$d;->d:Ll/f2e0$a;

    .line 10
    .line 11
    iput-object p6, p0, Ll/jo50$d;->e:Ll/x20;

    .line 12
    .line 13
    iput-object p7, p0, Ll/jo50$d;->f:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 14
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public call()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/jo50$d;->a:Lrx/c;

    .line 2
    .line 3
    new-instance v1, Ll/jo50$d$a;

    .line 4
    .line 5
    iget-object v2, p0, Ll/jo50$d;->b:Ll/gcg0;

    .line 6
    .line 7
    invoke-direct {v1, p0, v2}, Ll/jo50$d$a;-><init>(Ll/jo50$d;Ll/gcg0;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lrx/c;->unsafeSubscribe(Ll/gcg0;)Ll/kcg0;

    .line 11
    .line 12
    .line 13
    return-void
.end method
