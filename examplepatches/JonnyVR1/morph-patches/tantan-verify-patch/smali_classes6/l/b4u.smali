.class public final synthetic Ll/b4u;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/b4u;->a:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    iput-object p2, p0, Ll/b4u;->b:Ljava/lang/String;

    iput-boolean p3, p0, Ll/b4u;->c:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/b4u;->a:Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;

    iget-object v1, p0, Ll/b4u;->b:Ljava/lang/String;

    iget-boolean p0, p0, Ll/b4u;->c:Z

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;->c(Lcom/p1/mobile/putong/live/base/view/LiveSquareMediaView;Ljava/lang/String;Z)V

    return-void
.end method
