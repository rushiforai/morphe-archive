.class public Ll/igj0$a$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/igj0$a;->e(Ll/x20;J)Ll/kcg0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/igj0$b;

.field public final synthetic b:Ll/igj0$a;


# direct methods
.method public constructor <init>(Ll/igj0$a;Ll/igj0$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/igj0$a$a;->b:Ll/igj0$a;

    .line 2
    .line 3
    iput-object p2, p0, Ll/igj0$a$a;->a:Ll/igj0$b;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/igj0$a$a;->b:Ll/igj0$a;

    .line 2
    .line 3
    iget-object v0, v0, Ll/igj0$a;->b:Ljava/util/concurrent/PriorityBlockingQueue;

    .line 4
    .line 5
    iget-object p0, p0, Ll/igj0$a$a;->a:Ll/igj0$b;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Ljava/util/concurrent/PriorityBlockingQueue;->remove(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    return-void
.end method
