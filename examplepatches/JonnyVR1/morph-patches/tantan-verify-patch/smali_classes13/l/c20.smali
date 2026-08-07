.class public final synthetic Ll/c20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public final synthetic c:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Ljava/util/concurrent/atomic/AtomicBoolean;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/c20;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/c20;->b:Ljava/util/concurrent/atomic/AtomicBoolean;

    iput-object p3, p0, Ll/c20;->c:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/c20;->a:Lcom/p1/mobile/android/app/Act;

    iget-object v1, p0, Ll/c20;->b:Ljava/util/concurrent/atomic/AtomicBoolean;

    iget-object p0, p0, Ll/c20;->c:Lcom/p1/mobile/android/app/Act;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/android/app/Act;->o1(Lcom/p1/mobile/android/app/Act;Ljava/util/concurrent/atomic/AtomicBoolean;Lcom/p1/mobile/android/app/Act;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
