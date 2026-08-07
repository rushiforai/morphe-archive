.class public final synthetic Landroidx/work/impl/utils/c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Landroidx/work/impl/WorkDatabase;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ll/xiq0;


# direct methods
.method public synthetic constructor <init>(Landroidx/work/impl/WorkDatabase;Ljava/lang/String;Ll/xiq0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/work/impl/utils/c;->a:Landroidx/work/impl/WorkDatabase;

    iput-object p2, p0, Landroidx/work/impl/utils/c;->b:Ljava/lang/String;

    iput-object p3, p0, Landroidx/work/impl/utils/c;->c:Ll/xiq0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/work/impl/utils/c;->a:Landroidx/work/impl/WorkDatabase;

    iget-object v1, p0, Landroidx/work/impl/utils/c;->b:Ljava/lang/String;

    iget-object p0, p0, Landroidx/work/impl/utils/c;->c:Ll/xiq0;

    invoke-static {v0, v1, p0}, Landroidx/work/impl/utils/CancelWorkRunnable$forTag$1;->a(Landroidx/work/impl/WorkDatabase;Ljava/lang/String;Ll/xiq0;)V

    return-void
.end method
