.class Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference$2;
.super Ljava/lang/Object;
.source "DeepSeekTextPreference.java"

# interfaces
.implements Landroid/view/View$OnAttachStateChangeListener;


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

.field final synthetic val$createdProfile:Ljava/lang/String;


# direct methods
.method constructor <init>(Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;Ljava/lang/String;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 170
    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference$2;->this$0:Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;

    iput-object p2, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference$2;->val$createdProfile:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onViewAttachedToWindow(Landroid/view/View;)V
    .registers 3

    .line 171
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference$2;->this$0:Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->-$$Nest$fgeteditor(Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;)Landroid/widget/EditText;

    move-result-object v0

    if-ne p1, v0, :cond_d

    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference$2;->this$0:Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->register(Lapp/yydarlinker/deepseekcaptions/ApiProfiles$Editor;)V

    :cond_d
    return-void
.end method

.method public onViewDetachedFromWindow(Landroid/view/View;)V
    .registers 5

    .line 174
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference$2;->this$0:Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->-$$Nest$fgeteditor(Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;)Landroid/widget/EditText;

    move-result-object v0

    if-ne p1, v0, :cond_d

    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference$2;->this$0:Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->unregister(Lapp/yydarlinker/deepseekcaptions/ApiProfiles$Editor;)V

    .line 175
    :cond_d
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference$2;->this$0:Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->-$$Nest$fgeteditor(Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;)Landroid/widget/EditText;

    move-result-object v0

    if-ne p1, v0, :cond_55

    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference$2;->val$createdProfile:Ljava/lang/String;

    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference$2;->this$0:Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;

    invoke-virtual {v1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->active(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_28

    goto :goto_55

    .line 176
    :cond_28
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference$2;->this$0:Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;

    check-cast p1, Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->-$$Nest$mcommitNow(Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;Ljava/lang/String;Z)V

    .line 177
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference$2;->this$0:Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;

    invoke-virtual {v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->getKey()Ljava/lang/String;

    move-result-object v0

    const-string v1, "deepseek_caption_api_key"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_55

    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference$2;->this$0:Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->-$$Nest$mcancelPendingSave(Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;)V

    const-string v0, ""

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference$2;->this$0:Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;->-$$Nest$mcancelPendingSave(Lapp/yydarlinker/deepseekcaptions/DeepSeekTextPreference;)V

    :cond_55
    :goto_55
    return-void
.end method
