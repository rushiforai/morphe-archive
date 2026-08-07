.class public Lcom/p1/mobile/putong/live/LiveServiceImpl$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/LiveServiceImpl;->T(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/apibean/FanBaseGroupSummaryBean;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Lcom/p1/mobile/putong/live/base/apibean/FanBaseGroupSummaryBean;

.field public final synthetic c:Lcom/p1/mobile/android/app/Dialog;

.field public final synthetic d:Lcom/p1/mobile/putong/live/LiveServiceImpl;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/LiveServiceImpl;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/apibean/FanBaseGroupSummaryBean;Lcom/p1/mobile/android/app/Dialog;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/LiveServiceImpl$a;->d:Lcom/p1/mobile/putong/live/LiveServiceImpl;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/live/LiveServiceImpl$a;->a:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/live/LiveServiceImpl$a;->b:Lcom/p1/mobile/putong/live/base/apibean/FanBaseGroupSummaryBean;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/p1/mobile/putong/live/LiveServiceImpl$a;->c:Lcom/p1/mobile/android/app/Dialog;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/LiveServiceImpl$a;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    sget-object v0, Ll/tbs;->f:Ll/j6t;

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->getBuilder()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object v2, p0, Lcom/p1/mobile/putong/live/LiveServiceImpl$a;->b:Lcom/p1/mobile/putong/live/base/apibean/FanBaseGroupSummaryBean;

    .line 10
    .line 11
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/base/apibean/FanBaseGroupSummaryBean;->getLiveId()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->E(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const-string v2, "group_profile_fans"

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->O(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->u()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0, p1, v1}, Ll/j6t;->f(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;)Landroid/content/Intent;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/live/LiveServiceImpl$a;->c:Lcom/p1/mobile/android/app/Dialog;

    .line 37
    .line 38
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 39
    .line 40
    .line 41
    return-void
.end method
