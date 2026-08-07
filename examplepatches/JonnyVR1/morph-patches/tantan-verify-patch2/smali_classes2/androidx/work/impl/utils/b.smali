.class public final synthetic Landroidx/work/impl/utils/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/xiq0;

.field public final synthetic b:Ljava/util/UUID;


# direct methods
.method public synthetic constructor <init>(Ll/xiq0;Ljava/util/UUID;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/work/impl/utils/b;->a:Ll/xiq0;

    iput-object p2, p0, Landroidx/work/impl/utils/b;->b:Ljava/util/UUID;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/work/impl/utils/b;->a:Ll/xiq0;

    iget-object p0, p0, Landroidx/work/impl/utils/b;->b:Ljava/util/UUID;

    invoke-static {v0, p0}, Landroidx/work/impl/utils/CancelWorkRunnable$forId$1;->a(Ll/xiq0;Ljava/util/UUID;)V

    return-void
.end method
