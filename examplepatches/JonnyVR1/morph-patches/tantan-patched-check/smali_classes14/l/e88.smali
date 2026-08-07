.class public final synthetic Ll/e88;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/g;

.field public final synthetic b:J


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/g;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/e88;->a:Lcom/p1/mobile/putong/core/api/g;

    iput-wide p2, p0, Ll/e88;->b:J

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/e88;->a:Lcom/p1/mobile/putong/core/api/g;

    iget-wide v1, p0, Ll/e88;->b:J

    invoke-static {v0, v1, v2}, Lcom/p1/mobile/putong/core/api/g;->L6(Lcom/p1/mobile/putong/core/api/g;J)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method
