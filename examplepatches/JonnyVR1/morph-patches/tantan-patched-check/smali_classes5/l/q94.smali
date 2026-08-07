.class public final synthetic Ll/q94;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;

.field public final synthetic b:[B


# direct methods
.method public synthetic constructor <init>(Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;[B)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/q94;->a:Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;

    iput-object p2, p0, Ll/q94;->b:[B

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/q94;->a:Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;

    iget-object p0, p0, Ll/q94;->b:[B

    invoke-static {v0, p0}, Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;->a(Lcom/tencent/could/huiyansdk/view/CameraDateBotGatherView;[B)V

    return-void
.end method
