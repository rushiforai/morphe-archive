.class public final synthetic Lcom/p1/mobile/putong/core/ui/report/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/report/c;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/report/ReportCategory;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/report/c;Lcom/p1/mobile/putong/core/ui/report/ReportCategory;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/report/b;->a:Lcom/p1/mobile/putong/core/ui/report/c;

    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/report/b;->b:Lcom/p1/mobile/putong/core/ui/report/ReportCategory;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/report/b;->a:Lcom/p1/mobile/putong/core/ui/report/c;

    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/report/b;->b:Lcom/p1/mobile/putong/core/ui/report/ReportCategory;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/report/c;->a(Lcom/p1/mobile/putong/core/ui/report/c;Lcom/p1/mobile/putong/core/ui/report/ReportCategory;Landroid/view/View;)V

    return-void
.end method
