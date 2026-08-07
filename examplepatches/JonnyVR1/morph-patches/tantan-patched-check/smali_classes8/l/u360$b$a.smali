.class public Ll/u360$b$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/vk90;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/u360$b;->h()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/u360$b;


# direct methods
.method public constructor <init>(Ll/u360$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/u360$b$a;->a:Ll/u360$b;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public request(J)V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-lez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/u360$b$a;->a:Ll/u360$b;

    .line 8
    .line 9
    iget-object v0, v0, Ll/u360$b;->l:Ljava/util/concurrent/atomic/AtomicLong;

    .line 10
    .line 11
    invoke-static {v0, p1, p2}, Ll/rc2;->b(Ljava/util/concurrent/atomic/AtomicLong;J)J

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/u360$b$a;->a:Ll/u360$b;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/u360$b;->i()V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method
