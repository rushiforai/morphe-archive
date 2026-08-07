.class public final synthetic Ll/tk90;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Landroidx/work/impl/a;

.field public final synthetic b:Ll/hpr;

.field public final synthetic c:Landroidx/work/impl/WorkerWrapper;


# direct methods
.method public synthetic constructor <init>(Landroidx/work/impl/a;Ll/hpr;Landroidx/work/impl/WorkerWrapper;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tk90;->a:Landroidx/work/impl/a;

    iput-object p2, p0, Ll/tk90;->b:Ll/hpr;

    iput-object p3, p0, Ll/tk90;->c:Landroidx/work/impl/WorkerWrapper;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/tk90;->a:Landroidx/work/impl/a;

    iget-object v1, p0, Ll/tk90;->b:Ll/hpr;

    iget-object p0, p0, Ll/tk90;->c:Landroidx/work/impl/WorkerWrapper;

    invoke-static {v0, v1, p0}, Landroidx/work/impl/a;->d(Landroidx/work/impl/a;Ll/hpr;Landroidx/work/impl/WorkerWrapper;)V

    return-void
.end method
