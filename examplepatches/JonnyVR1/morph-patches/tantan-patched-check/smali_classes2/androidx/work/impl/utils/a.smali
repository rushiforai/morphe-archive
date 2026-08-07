.class public final synthetic Landroidx/work/impl/utils/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Landroidx/work/impl/WorkDatabase;

.field public final synthetic b:Ll/xiq0;


# direct methods
.method public synthetic constructor <init>(Landroidx/work/impl/WorkDatabase;Ll/xiq0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/work/impl/utils/a;->a:Landroidx/work/impl/WorkDatabase;

    iput-object p2, p0, Landroidx/work/impl/utils/a;->b:Ll/xiq0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/work/impl/utils/a;->a:Landroidx/work/impl/WorkDatabase;

    iget-object p0, p0, Landroidx/work/impl/utils/a;->b:Ll/xiq0;

    invoke-static {v0, p0}, Landroidx/work/impl/utils/CancelWorkRunnable$forAll$1;->a(Landroidx/work/impl/WorkDatabase;Ll/xiq0;)V

    return-void
.end method
