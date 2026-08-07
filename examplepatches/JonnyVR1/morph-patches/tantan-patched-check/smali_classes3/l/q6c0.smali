.class public final synthetic Ll/q6c0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:[Ljava/lang/Object;

.field public final synthetic b:Landroid/os/HandlerThread;


# direct methods
.method public synthetic constructor <init>([Ljava/lang/Object;Landroid/os/HandlerThread;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/q6c0;->a:[Ljava/lang/Object;

    iput-object p2, p0, Ll/q6c0;->b:Landroid/os/HandlerThread;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/q6c0;->a:[Ljava/lang/Object;

    iget-object p0, p0, Ll/q6c0;->b:Landroid/os/HandlerThread;

    invoke-static {v0, p0}, Lcom/quickjs/QuickJS;->d([Ljava/lang/Object;Landroid/os/HandlerThread;)V

    return-void
.end method
