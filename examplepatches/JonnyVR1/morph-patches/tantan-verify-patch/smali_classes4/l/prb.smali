.class public final synthetic Ll/prb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/ss/bytertc/engine/mediaio/CountDownLatchI420Buffer;

.field public final synthetic b:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Lcom/ss/bytertc/engine/mediaio/CountDownLatchI420Buffer;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/prb;->a:Lcom/ss/bytertc/engine/mediaio/CountDownLatchI420Buffer;

    iput-object p2, p0, Ll/prb;->b:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/prb;->a:Lcom/ss/bytertc/engine/mediaio/CountDownLatchI420Buffer;

    iget-object p0, p0, Ll/prb;->b:Ljava/lang/Runnable;

    invoke-static {v0, p0}, Lcom/ss/bytertc/engine/mediaio/CountDownLatchI420Buffer;->a(Lcom/ss/bytertc/engine/mediaio/CountDownLatchI420Buffer;Ljava/lang/Runnable;)V

    return-void
.end method
