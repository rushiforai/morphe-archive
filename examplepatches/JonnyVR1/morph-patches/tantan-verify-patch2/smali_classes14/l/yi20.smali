.class public final synthetic Ll/yi20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ljava/util/TreeMap;

.field public final synthetic b:Landroid/os/HandlerThread;


# direct methods
.method public synthetic constructor <init>(Ljava/util/TreeMap;Landroid/os/HandlerThread;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yi20;->a:Ljava/util/TreeMap;

    iput-object p2, p0, Ll/yi20;->b:Landroid/os/HandlerThread;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/yi20;->a:Ljava/util/TreeMap;

    iget-object p0, p0, Ll/yi20;->b:Landroid/os/HandlerThread;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/api/api/Network;->j(Ljava/util/TreeMap;Landroid/os/HandlerThread;)V

    return-void
.end method
