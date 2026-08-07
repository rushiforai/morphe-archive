.class public final synthetic Ll/a2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Ll/l2;

.field public final synthetic b:Lcom/p1/mobile/putong/api/ABManager$Mode;

.field public final synthetic c:J


# direct methods
.method public synthetic constructor <init>(Ll/l2;Lcom/p1/mobile/putong/api/ABManager$Mode;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/a2;->a:Ll/l2;

    iput-object p2, p0, Ll/a2;->b:Lcom/p1/mobile/putong/api/ABManager$Mode;

    iput-wide p3, p0, Ll/a2;->c:J

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/a2;->a:Ll/l2;

    iget-object v1, p0, Ll/a2;->b:Lcom/p1/mobile/putong/api/ABManager$Mode;

    iget-wide v2, p0, Ll/a2;->c:J

    invoke-static {v0, v1, v2, v3}, Ll/l2;->D(Ll/l2;Lcom/p1/mobile/putong/api/ABManager$Mode;J)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
