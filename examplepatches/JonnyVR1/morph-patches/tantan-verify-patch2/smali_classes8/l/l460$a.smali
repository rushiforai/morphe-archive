.class public Ll/l460$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/l460;->a(Ll/gcg0;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/gcg0;

.field public final synthetic b:Ll/f2e0$a;

.field public final synthetic c:Ll/l460;


# direct methods
.method public constructor <init>(Ll/l460;Ll/gcg0;Ll/f2e0$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/l460$a;->c:Ll/l460;

    .line 2
    .line 3
    iput-object p2, p0, Ll/l460$a;->a:Ll/gcg0;

    .line 4
    .line 5
    iput-object p3, p0, Ll/l460$a;->b:Ll/f2e0$a;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public call()V
    .locals 3

    .line 1
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/l460$a$a;

    .line 6
    .line 7
    iget-object v2, p0, Ll/l460$a;->a:Ll/gcg0;

    .line 8
    .line 9
    invoke-direct {v1, p0, v2, v0}, Ll/l460$a$a;-><init>(Ll/l460$a;Ll/gcg0;Ljava/lang/Thread;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/l460$a;->c:Ll/l460;

    .line 13
    .line 14
    iget-object p0, p0, Ll/l460;->b:Lrx/c;

    .line 15
    .line 16
    invoke-virtual {p0, v1}, Lrx/c;->unsafeSubscribe(Ll/gcg0;)Ll/kcg0;

    .line 17
    .line 18
    .line 19
    return-void
.end method
