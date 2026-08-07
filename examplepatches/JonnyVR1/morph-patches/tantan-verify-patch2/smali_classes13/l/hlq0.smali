.class public final synthetic Ll/hlq0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/momo/xeengine/xnative/XEEventDispatcher;


# direct methods
.method public synthetic constructor <init>(Lcom/momo/xeengine/xnative/XEEventDispatcher;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hlq0;->a:Lcom/momo/xeengine/xnative/XEEventDispatcher;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hlq0;->a:Lcom/momo/xeengine/xnative/XEEventDispatcher;

    invoke-static {p0}, Lcom/momo/xeengine/xnative/XEEventDispatcher;->f(Lcom/momo/xeengine/xnative/XEEventDispatcher;)V

    return-void
.end method
