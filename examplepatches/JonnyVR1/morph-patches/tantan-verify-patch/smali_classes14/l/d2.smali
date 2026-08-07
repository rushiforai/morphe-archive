.class public final synthetic Ll/d2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Ll/l2;

.field public final synthetic b:Lcom/p1/mobile/putong/api/ABManager$Mode;


# direct methods
.method public synthetic constructor <init>(Ll/l2;Lcom/p1/mobile/putong/api/ABManager$Mode;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/d2;->a:Ll/l2;

    iput-object p2, p0, Ll/d2;->b:Lcom/p1/mobile/putong/api/ABManager$Mode;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/d2;->a:Ll/l2;

    iget-object p0, p0, Ll/d2;->b:Lcom/p1/mobile/putong/api/ABManager$Mode;

    invoke-static {v0, p0}, Ll/l2;->y(Ll/l2;Lcom/p1/mobile/putong/api/ABManager$Mode;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
