.class Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference$1;
.super Ljava/lang/Object;
.source "DeepSeekTextPreference.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->onCreateView(Landroid/view/ViewGroup;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;

.field final synthetic val$createdEditor:Landroid/widget/EditText;

.field final synthetic val$createdProfile:Ljava/lang/String;


# direct methods
.method constructor <init>(Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;Landroid/widget/EditText;Ljava/lang/String;)V
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

    .line 139
    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference$1;->this$0:Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;

    iput-object p2, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference$1;->val$createdEditor:Landroid/widget/EditText;

    iput-object p3, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference$1;->val$createdProfile:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .registers 4

    .line 144
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference$1;->val$createdEditor:Landroid/widget/EditText;

    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference$1;->this$0:Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;

    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->-$$Nest$fgeteditor(Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;)Landroid/widget/EditText;

    move-result-object v1

    if-ne v0, v1, :cond_2a

    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference$1;->val$createdProfile:Ljava/lang/String;

    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference$1;->this$0:Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;

    invoke-virtual {v1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->active(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2a

    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference$1;->this$0:Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;

    if-nez p1, :cond_23

    const-string p1, ""

    goto :goto_27

    :cond_23
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    :goto_27
    invoke-static {p0, p1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->-$$Nest$mscheduleSave(Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;Ljava/lang/String;)V

    :cond_2a
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
