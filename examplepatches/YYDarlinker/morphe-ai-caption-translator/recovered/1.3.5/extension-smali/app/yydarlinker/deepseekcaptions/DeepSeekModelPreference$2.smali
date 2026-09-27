.class Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference$2;
.super Ljava/lang/Object;
.source "DeepSeekModelPreference.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->onCreateView(Landroid/view/ViewGroup;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;

.field final synthetic val$createdEditor:Landroid/widget/EditText;

.field final synthetic val$createdProfile:Ljava/lang/String;


# direct methods
.method constructor <init>(Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;Landroid/widget/EditText;Ljava/lang/String;)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 205
    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference$2;->this$0:Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;

    iput-object p2, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference$2;->val$createdEditor:Landroid/widget/EditText;

    iput-object p3, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference$2;->val$createdProfile:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .registers 4

    .line 210
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference$2;->val$createdEditor:Landroid/widget/EditText;

    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference$2;->this$0:Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;

    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->-$$Nest$fgeteditor(Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;)Landroid/widget/EditText;

    move-result-object v1

    if-ne v0, v1, :cond_2f

    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference$2;->val$createdProfile:Ljava/lang/String;

    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference$2;->this$0:Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;

    invoke-virtual {v1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->active(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2f

    .line 211
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference$2;->this$0:Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;

    if-nez p1, :cond_23

    const-string p1, ""

    goto :goto_27

    :cond_23
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    :goto_27
    invoke-static {v0, p1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->-$$Nest$mscheduleSave(Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;Ljava/lang/String;)V

    .line 212
    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference$2;->this$0:Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->-$$Nest$mupdatePickerLabel(Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;)V

    :cond_2f
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5

    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5

    return-void
.end method
