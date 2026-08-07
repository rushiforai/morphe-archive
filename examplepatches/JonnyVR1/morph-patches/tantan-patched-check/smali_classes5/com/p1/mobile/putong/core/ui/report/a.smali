.class public Lcom/p1/mobile/putong/core/ui/report/a;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Lcom/p1/mobile/putong/core/ui/report/c;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/report/ReportCategoriesFrag$a;


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/report/a;->a:Lcom/p1/mobile/putong/core/ui/report/ReportCategoriesFrag$a;

    .line 3
    .line 4
    return-void
.end method

.method public e0(Lcom/p1/mobile/putong/core/ui/report/ReportCategoriesFrag$a;Z)V
    .locals 7

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/report/a;->a:Lcom/p1/mobile/putong/core/ui/report/ReportCategoriesFrag$a;

    .line 2
    .line 3
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 4
    .line 5
    if-nez p2, :cond_0

    .line 6
    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/ui/report/c;

    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/ui/report/ReportCategory;->SPAM:Lcom/p1/mobile/putong/core/ui/report/ReportCategory;

    .line 10
    .line 11
    sget-object v1, Lcom/p1/mobile/putong/core/ui/report/ReportCategory;->EXPLICIT:Lcom/p1/mobile/putong/core/ui/report/ReportCategory;

    .line 12
    .line 13
    sget-object v2, Lcom/p1/mobile/putong/core/ui/report/ReportCategory;->FAKE_ACCOUNT:Lcom/p1/mobile/putong/core/ui/report/ReportCategory;

    .line 14
    .line 15
    sget-object v3, Lcom/p1/mobile/putong/core/ui/report/ReportCategory;->YOUNGER:Lcom/p1/mobile/putong/core/ui/report/ReportCategory;

    .line 16
    .line 17
    sget-object v4, Lcom/p1/mobile/putong/core/ui/report/ReportCategory;->VIOLENCE:Lcom/p1/mobile/putong/core/ui/report/ReportCategory;

    .line 18
    .line 19
    sget-object v5, Lcom/p1/mobile/putong/core/ui/report/ReportCategory;->RECOMMEND:Lcom/p1/mobile/putong/core/ui/report/ReportCategory;

    .line 20
    .line 21
    sget-object v6, Lcom/p1/mobile/putong/core/ui/report/ReportCategory;->OTHER:Lcom/p1/mobile/putong/core/ui/report/ReportCategory;

    .line 22
    .line 23
    filled-new-array/range {v0 .. v6}, [Lcom/p1/mobile/putong/core/ui/report/ReportCategory;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/report/c;->d([Lcom/p1/mobile/putong/core/ui/report/ReportCategory;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    check-cast p0, Lcom/p1/mobile/putong/core/ui/report/c;

    .line 32
    .line 33
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/report/ReportCategory;->values()[Lcom/p1/mobile/putong/core/ui/report/ReportCategory;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/report/c;->d([Lcom/p1/mobile/putong/core/ui/report/ReportCategory;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public f0(Lcom/p1/mobile/putong/core/ui/report/ReportCategory;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/report/a;->a:Lcom/p1/mobile/putong/core/ui/report/ReportCategoriesFrag$a;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/report/a;->a:Lcom/p1/mobile/putong/core/ui/report/ReportCategoriesFrag$a;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/core/ui/report/ReportCategoriesFrag$a;->j0(Lcom/p1/mobile/putong/core/ui/report/ReportCategory;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method
