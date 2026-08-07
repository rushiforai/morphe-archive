.class public final synthetic Ll/mtk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/User;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/User;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mtk;->a:Lcom/p1/mobile/putong/data/User;

    iput-boolean p2, p0, Ll/mtk;->b:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mtk;->a:Lcom/p1/mobile/putong/data/User;

    iget-boolean p0, p0, Ll/mtk;->b:Z

    invoke-static {v0, p0}, Ll/qtk;->G(Lcom/p1/mobile/putong/data/User;Z)V

    return-void
.end method
