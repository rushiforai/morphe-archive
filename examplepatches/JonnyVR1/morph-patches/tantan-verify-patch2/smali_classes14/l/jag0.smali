.class public final synthetic Ll/jag0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;

.field public final synthetic b:Landroid/util/Pair;

.field public final synthetic c:Landroid/util/Pair;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;Landroid/util/Pair;Landroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jag0;->a:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;

    iput-object p2, p0, Ll/jag0;->b:Landroid/util/Pair;

    iput-object p3, p0, Ll/jag0;->c:Landroid/util/Pair;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/jag0;->a:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;

    iget-object v1, p0, Ll/jag0;->b:Landroid/util/Pair;

    iget-object p0, p0, Ll/jag0;->c:Landroid/util/Pair;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->a(Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;Landroid/util/Pair;Landroid/util/Pair;)V

    return-void
.end method
