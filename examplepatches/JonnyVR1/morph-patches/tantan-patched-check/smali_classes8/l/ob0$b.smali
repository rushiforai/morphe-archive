.class public Ll/ob0$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcn/qqtheme/framework/wheelview/OnWheelScrollListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ob0;->o(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroid/view/View;

.field public final synthetic b:Ll/ob0;


# direct methods
.method public constructor <init>(Ll/ob0;Landroid/view/View;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/ob0$b;->b:Ll/ob0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/ob0$b;->a:Landroid/view/View;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onScrollingFinished(Lcn/qqtheme/framework/wheelview/WheelView;)V
    .locals 3

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
    iget-object p1, p0, Ll/ob0$b;->b:Ll/ob0;

    .line 9
    .line 10
    iget-object v0, p0, Ll/ob0$b;->a:Landroid/view/View;

    .line 11
    .line 12
    invoke-static {p1}, Ll/ob0;->g(Ll/ob0;)I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    iget-object v2, p0, Ll/ob0$b;->b:Ll/ob0;

    .line 17
    .line 18
    invoke-static {v2}, Ll/ob0;->f(Ll/ob0;)I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    invoke-static {p1, v0, v1, v2}, Ll/ob0;->h(Ll/ob0;Landroid/view/View;II)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Ll/ob0$b;->b:Ll/ob0;

    .line 26
    .line 27
    invoke-static {p0}, Ll/ob0;->e(Ll/ob0;)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-static {p0, p1}, Ll/ob0;->j(Ll/ob0;Landroid/view/View;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public onScrollingStarted(Lcn/qqtheme/framework/wheelview/WheelView;)V
    .locals 0

    .line 1
    return-void
.end method
