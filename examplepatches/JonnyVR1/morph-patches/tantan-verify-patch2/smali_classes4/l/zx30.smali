.class public final synthetic Ll/zx30;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/b240;

.field public final synthetic b:Lcom/p1/mobile/putong/core/api/CoreLikers$a;


# direct methods
.method public synthetic constructor <init>(Ll/b240;Lcom/p1/mobile/putong/core/api/CoreLikers$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zx30;->a:Ll/b240;

    iput-object p2, p0, Ll/zx30;->b:Lcom/p1/mobile/putong/core/api/CoreLikers$a;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zx30;->a:Ll/b240;

    iget-object p0, p0, Ll/zx30;->b:Lcom/p1/mobile/putong/core/api/CoreLikers$a;

    invoke-static {v0, p0}, Ll/b240;->g2(Ll/b240;Lcom/p1/mobile/putong/core/api/CoreLikers$a;)V

    return-void
.end method
