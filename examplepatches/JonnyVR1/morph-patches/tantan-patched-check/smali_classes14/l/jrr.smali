.class public final synthetic Ll/jrr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/prr;

.field public final synthetic b:Ll/msr;

.field public final synthetic c:Ljava/util/List;

.field public final synthetic d:Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;


# direct methods
.method public synthetic constructor <init>(Ll/prr;Ll/msr;Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jrr;->a:Ll/prr;

    iput-object p2, p0, Ll/jrr;->b:Ll/msr;

    iput-object p3, p0, Ll/jrr;->c:Ljava/util/List;

    iput-object p4, p0, Ll/jrr;->d:Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/jrr;->a:Ll/prr;

    iget-object v1, p0, Ll/jrr;->b:Ll/msr;

    iget-object v2, p0, Ll/jrr;->c:Ljava/util/List;

    iget-object p0, p0, Ll/jrr;->d:Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;

    invoke-static {v0, v1, v2, p0, p1}, Ll/prr;->o(Ll/prr;Ll/msr;Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;Landroid/view/View;)V

    return-void
.end method
