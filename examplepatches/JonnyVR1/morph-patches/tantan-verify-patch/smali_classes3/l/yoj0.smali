.class public final synthetic Ll/yoj0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yoj0;->a:Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation;

    iput-object p2, p0, Ll/yoj0;->b:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/yoj0;->a:Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation;

    iget-object p0, p0, Ll/yoj0;->b:Lcom/p1/mobile/android/app/Act;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation;->f(Lcom/p1/mobile/putong/ui/jsbridge/implement/UIBridgeImplementation;Lcom/p1/mobile/android/app/Act;)V

    return-void
.end method
