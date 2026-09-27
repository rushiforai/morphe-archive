.class Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference$1;
.super Landroid/widget/ScrollView;
.source "DeepSeekDiagnosticsPreference.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference;->onCreateView(Landroid/view/ViewGroup;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference;


# direct methods
.method constructor <init>(Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference;Landroid/content/Context;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0
        }
        names = {
            null,
            null
        }
    .end annotation

    .line 23
    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference$1;->this$0:Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference;

    invoke-direct {p0, p2}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 4

    .line 23
    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference$1;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_e

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference$1;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    :cond_e
    invoke-super {p0, p1}, Landroid/widget/ScrollView;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method
