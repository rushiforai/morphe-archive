.class public Ll/ob0$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcn/qqtheme/framework/wheelview/OnWheelScrollListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ob0;->n(Landroid/view/View;II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/ob0;


# direct methods
.method public constructor <init>(Ll/ob0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ob0$c;->a:Ll/ob0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onScrollingFinished(Lcn/qqtheme/framework/wheelview/WheelView;)V
    .locals 1

    .line 1
    const-string p1, "e_birthday_tips_calendar"

    .line 2
    .line 3
    const-string v0, "p_birthday_tips_view"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/ob0$c;->a:Ll/ob0;

    .line 9
    .line 10
    invoke-static {p0}, Ll/ob0;->e(Ll/ob0;)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-static {p0, p1}, Ll/ob0;->j(Ll/ob0;Landroid/view/View;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public onScrollingStarted(Lcn/qqtheme/framework/wheelview/WheelView;)V
    .locals 0

    .line 1
    return-void
.end method
