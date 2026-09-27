.class Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$1;
.super Landroid/view/View$AccessibilityDelegate;
.source "ApiProfilesPreference.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->addRow(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;


# direct methods
.method constructor <init>(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 132
    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$1;->this$0:Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;

    invoke-direct {p0}, Landroid/view/View$AccessibilityDelegate;-><init>()V

    return-void
.end method


# virtual methods
.method public onInitializeAccessibilityNodeInfo(Landroid/view/View;Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .registers 4

    .line 134
    invoke-super {p0, p1, p2}, Landroid/view/View$AccessibilityDelegate;->onInitializeAccessibilityNodeInfo(Landroid/view/View;Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 135
    new-instance p1, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;

    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$1;->this$0:Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;

    const-string v0, "profile_more"

    .line 136
    invoke-static {p0, v0}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->-$$Nest$mtext(Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const/16 v0, 0x20

    invoke-direct {p1, v0, p0}, Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;-><init>(ILjava/lang/CharSequence;)V

    .line 135
    invoke-virtual {p2, p1}, Landroid/view/accessibility/AccessibilityNodeInfo;->addAction(Landroid/view/accessibility/AccessibilityNodeInfo$AccessibilityAction;)V

    return-void
.end method
