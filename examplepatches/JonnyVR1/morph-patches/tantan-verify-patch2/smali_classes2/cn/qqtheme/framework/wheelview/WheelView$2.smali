.class Lcn/qqtheme/framework/wheelview/WheelView$2;
.super Landroid/database/DataSetObserver;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcn/qqtheme/framework/wheelview/WheelView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcn/qqtheme/framework/wheelview/WheelView;


# direct methods
.method public constructor <init>(Lcn/qqtheme/framework/wheelview/WheelView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcn/qqtheme/framework/wheelview/WheelView$2;->this$0:Lcn/qqtheme/framework/wheelview/WheelView;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/database/DataSetObserver;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onChanged()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcn/qqtheme/framework/wheelview/WheelView$2;->this$0:Lcn/qqtheme/framework/wheelview/WheelView;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Lcn/qqtheme/framework/wheelview/WheelView;->invalidateWheel(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onInvalidated()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcn/qqtheme/framework/wheelview/WheelView$2;->this$0:Lcn/qqtheme/framework/wheelview/WheelView;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, v0}, Lcn/qqtheme/framework/wheelview/WheelView;->invalidateWheel(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
