.class public final synthetic Ll/tiq0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/uiq0;

.field public final synthetic b:Ll/e3g0;

.field public final synthetic c:Landroidx/work/WorkerParameters$a;


# direct methods
.method public synthetic constructor <init>(Ll/uiq0;Ll/e3g0;Landroidx/work/WorkerParameters$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tiq0;->a:Ll/uiq0;

    iput-object p2, p0, Ll/tiq0;->b:Ll/e3g0;

    iput-object p3, p0, Ll/tiq0;->c:Landroidx/work/WorkerParameters$a;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/tiq0;->a:Ll/uiq0;

    iget-object v1, p0, Ll/tiq0;->b:Ll/e3g0;

    iget-object p0, p0, Ll/tiq0;->c:Landroidx/work/WorkerParameters$a;

    invoke-static {v0, v1, p0}, Ll/uiq0;->f(Ll/uiq0;Ll/e3g0;Landroidx/work/WorkerParameters$a;)V

    return-void
.end method
