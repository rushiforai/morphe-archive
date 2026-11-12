.class public final synthetic Lcom/leanplum/messagetemplates/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:Landroid/content/Context;

.field public final synthetic b:Lcom/leanplum/ActionContext;

.field public final synthetic c:Lorm;

.field public final synthetic d:Lcom/leanplum/messagetemplates/OperaRateSheet$TimedReviewInfo;

.field public final synthetic e:Lskm;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;Lcom/leanplum/ActionContext;Lorm;Lcom/leanplum/messagetemplates/OperaRateSheet$TimedReviewInfo;Lskm;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/leanplum/messagetemplates/a;->a:Landroid/content/Context;

    iput-object p2, p0, Lcom/leanplum/messagetemplates/a;->b:Lcom/leanplum/ActionContext;

    iput-object p3, p0, Lcom/leanplum/messagetemplates/a;->c:Lorm;

    iput-object p4, p0, Lcom/leanplum/messagetemplates/a;->d:Lcom/leanplum/messagetemplates/OperaRateSheet$TimedReviewInfo;

    iput-object p5, p0, Lcom/leanplum/messagetemplates/a;->e:Lskm;

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 8

    iget-object v4, p0, Lcom/leanplum/messagetemplates/a;->e:Lskm;

    move-object v5, p1

    check-cast v5, Lpjh;

    iget-object v0, p0, Lcom/leanplum/messagetemplates/a;->a:Landroid/content/Context;

    iget-object v1, p0, Lcom/leanplum/messagetemplates/a;->b:Lcom/leanplum/ActionContext;

    iget-object v2, p0, Lcom/leanplum/messagetemplates/a;->c:Lorm;

    iget-object v3, p0, Lcom/leanplum/messagetemplates/a;->d:Lcom/leanplum/messagetemplates/OperaRateSheet$TimedReviewInfo;

    invoke-static/range {v0 .. v5}, Lcom/leanplum/messagetemplates/OperaRateSheet;->c(Landroid/content/Context;Lcom/leanplum/ActionContext;Lorm;Lcom/leanplum/messagetemplates/OperaRateSheet$TimedReviewInfo;Lskm;Lpjh;)V

    return-void
.end method
