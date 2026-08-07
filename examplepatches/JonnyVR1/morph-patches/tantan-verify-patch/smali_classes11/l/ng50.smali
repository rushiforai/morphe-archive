.class public final synthetic Ll/ng50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ljava/net/URL;

.field public final synthetic b:Lkotlin/jvm/internal/Ref$ObjectRef;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/util/concurrent/locks/ReentrantLock;

.field public final synthetic e:Ljava/util/concurrent/locks/Condition;


# direct methods
.method public synthetic constructor <init>(Ljava/net/URL;Lkotlin/jvm/internal/Ref$ObjectRef;Ljava/lang/String;Ljava/util/concurrent/locks/ReentrantLock;Ljava/util/concurrent/locks/Condition;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ng50;->a:Ljava/net/URL;

    iput-object p2, p0, Ll/ng50;->b:Lkotlin/jvm/internal/Ref$ObjectRef;

    iput-object p3, p0, Ll/ng50;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/ng50;->d:Ljava/util/concurrent/locks/ReentrantLock;

    iput-object p5, p0, Ll/ng50;->e:Ljava/util/concurrent/locks/Condition;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ng50;->a:Ljava/net/URL;

    iget-object v1, p0, Ll/ng50;->b:Lkotlin/jvm/internal/Ref$ObjectRef;

    iget-object v2, p0, Ll/ng50;->c:Ljava/lang/String;

    iget-object v3, p0, Ll/ng50;->d:Ljava/util/concurrent/locks/ReentrantLock;

    iget-object p0, p0, Ll/ng50;->e:Ljava/util/concurrent/locks/Condition;

    invoke-static {v0, v1, v2, v3, p0}, Ll/og50;->a(Ljava/net/URL;Lkotlin/jvm/internal/Ref$ObjectRef;Ljava/lang/String;Ljava/util/concurrent/locks/ReentrantLock;Ljava/util/concurrent/locks/Condition;)V

    return-void
.end method
