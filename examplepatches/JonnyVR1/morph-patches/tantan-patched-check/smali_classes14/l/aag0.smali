.class public final synthetic Ll/aag0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;

.field public final synthetic b:Ll/q1e;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;Ll/q1e;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/aag0;->a:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;

    iput-object p2, p0, Ll/aag0;->b:Ll/q1e;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/aag0;->a:Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;

    iget-object p0, p0, Ll/aag0;->b:Ll/q1e;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;->d(Lcom/p1/mobile/putong/core/ui/campus/detailinfo/a;Ll/q1e;)V

    return-void
.end method
