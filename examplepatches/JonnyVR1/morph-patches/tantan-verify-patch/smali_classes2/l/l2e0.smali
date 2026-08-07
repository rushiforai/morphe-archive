.class public final synthetic Ll/l2e0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/v6f;


# instance fields
.field public final synthetic a:Ljava/util/concurrent/Executor;

.field public final synthetic b:Ljava/util/List;

.field public final synthetic c:Landroidx/work/a;

.field public final synthetic d:Landroidx/work/impl/WorkDatabase;


# direct methods
.method public synthetic constructor <init>(Ljava/util/concurrent/Executor;Ljava/util/List;Landroidx/work/a;Landroidx/work/impl/WorkDatabase;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l2e0;->a:Ljava/util/concurrent/Executor;

    iput-object p2, p0, Ll/l2e0;->b:Ljava/util/List;

    iput-object p3, p0, Ll/l2e0;->c:Landroidx/work/a;

    iput-object p4, p0, Ll/l2e0;->d:Landroidx/work/impl/WorkDatabase;

    return-void
.end method


# virtual methods
.method public final onExecuted(Ll/piq0;Z)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/l2e0;->a:Ljava/util/concurrent/Executor;

    iget-object v1, p0, Ll/l2e0;->b:Ljava/util/List;

    iget-object v2, p0, Ll/l2e0;->c:Landroidx/work/a;

    iget-object v3, p0, Ll/l2e0;->d:Landroidx/work/impl/WorkDatabase;

    move-object v4, p1

    move v5, p2

    invoke-static/range {v0 .. v5}, Ll/n2e0;->a(Ljava/util/concurrent/Executor;Ljava/util/List;Landroidx/work/a;Landroidx/work/impl/WorkDatabase;Ll/piq0;Z)V

    return-void
.end method
