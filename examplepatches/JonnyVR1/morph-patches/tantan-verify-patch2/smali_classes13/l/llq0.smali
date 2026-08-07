.class public final synthetic Ll/llq0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/momo/xeengine/game/XEGameView;


# direct methods
.method public synthetic constructor <init>(Lcom/momo/xeengine/game/XEGameView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/llq0;->a:Lcom/momo/xeengine/game/XEGameView;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/llq0;->a:Lcom/momo/xeengine/game/XEGameView;

    invoke-static {p0}, Lcom/momo/xeengine/game/XEGameView;->a(Lcom/momo/xeengine/game/XEGameView;)V

    return-void
.end method
