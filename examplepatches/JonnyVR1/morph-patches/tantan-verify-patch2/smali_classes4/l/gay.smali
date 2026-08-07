.class public final synthetic Ll/gay;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSvipWeeklyItemData$SvipWeeklyItem;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSvipWeeklyItemData$SvipWeeklyItem;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gay;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/gay;->b:Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSvipWeeklyItemData$SvipWeeklyItem;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gay;->a:Lcom/p1/mobile/android/app/Act;

    iget-object p0, p0, Ll/gay;->b:Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSvipWeeklyItemData$SvipWeeklyItem;

    invoke-static {v0, p0, p1}, Ll/iay;->b(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedSvipWeeklyItemData$SvipWeeklyItem;Landroid/view/View;)V

    return-void
.end method
