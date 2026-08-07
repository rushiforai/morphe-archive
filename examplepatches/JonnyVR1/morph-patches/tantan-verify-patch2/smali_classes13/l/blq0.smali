.class public final synthetic Ll/blq0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/momo/xeengine/xnative/XEEventDispatcher;

.field public final synthetic b:[J


# direct methods
.method public synthetic constructor <init>(Lcom/momo/xeengine/xnative/XEEventDispatcher;[J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/blq0;->a:Lcom/momo/xeengine/xnative/XEEventDispatcher;

    iput-object p2, p0, Ll/blq0;->b:[J

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/blq0;->a:Lcom/momo/xeengine/xnative/XEEventDispatcher;

    iget-object p0, p0, Ll/blq0;->b:[J

    invoke-static {v0, p0}, Lcom/momo/xeengine/xnative/XEEventDispatcher;->e(Lcom/momo/xeengine/xnative/XEEventDispatcher;[J)V

    return-void
.end method
