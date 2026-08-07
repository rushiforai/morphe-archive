.class public final synthetic Ll/jyi0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Comparator;


# instance fields
.field public final synthetic a:Lcom/tantanapp/common/utils/ThreadUtil$b;


# direct methods
.method public synthetic constructor <init>(Lcom/tantanapp/common/utils/ThreadUtil$b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jyi0;->a:Lcom/tantanapp/common/utils/ThreadUtil$b;

    return-void
.end method


# virtual methods
.method public final compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jyi0;->a:Lcom/tantanapp/common/utils/ThreadUtil$b;

    check-cast p1, Ljava/lang/Runnable;

    check-cast p2, Ljava/lang/Runnable;

    invoke-static {p0, p1, p2}, Lcom/tantanapp/common/utils/ThreadUtil$b;->a(Lcom/tantanapp/common/utils/ThreadUtil$b;Ljava/lang/Runnable;Ljava/lang/Runnable;)I

    move-result p0

    return p0
.end method
