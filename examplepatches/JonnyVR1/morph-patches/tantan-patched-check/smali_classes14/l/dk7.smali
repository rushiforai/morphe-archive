.class public final synthetic Ll/dk7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/e;

.field public final synthetic b:Z

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/e;ZZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dk7;->a:Lcom/p1/mobile/putong/core/api/e;

    iput-boolean p2, p0, Ll/dk7;->b:Z

    iput-boolean p3, p0, Ll/dk7;->c:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/dk7;->a:Lcom/p1/mobile/putong/core/api/e;

    iget-boolean v1, p0, Ll/dk7;->b:Z

    iget-boolean p0, p0, Ll/dk7;->c:Z

    check-cast p1, Ll/uxj0;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/core/api/e;->a6(Lcom/p1/mobile/putong/core/api/e;ZZLl/uxj0;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method
