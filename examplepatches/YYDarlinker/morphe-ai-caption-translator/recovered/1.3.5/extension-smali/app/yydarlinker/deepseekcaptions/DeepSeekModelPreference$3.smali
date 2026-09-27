.class Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference$3;
.super Ljava/lang/Object;
.source "DeepSeekModelPreference.java"

# interfaces
.implements Landroid/view/View$OnAttachStateChangeListener;


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

.field final synthetic val$createdProfile:Ljava/lang/String;


# direct methods
.method constructor <init>(Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;Ljava/lang/String;)V
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

    .line 230
    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference$3;->this$0:Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;

    iput-object p2, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference$3;->val$createdProfile:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onViewAttachedToWindow(Landroid/view/View;)V
    .registers 3

    .line 232
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference$3;->this$0:Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->-$$Nest$fgeteditor(Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;)Landroid/widget/EditText;

    move-result-object v0

    if-ne p1, v0, :cond_41

    iget-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference$3;->val$createdProfile:Ljava/lang/String;

    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference$3;->this$0:Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;

    invoke-virtual {v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->active(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1b

    goto :goto_41

    .line 233
    :cond_1b
    iget-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference$3;->this$0:Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;

    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->register(Lapp/yydarlinker/deepseekcaptions/ApiProfiles$Editor;)V

    .line 234
    new-instance p1, Ljava/lang/ref/WeakReference;

    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference$3;->this$0:Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;

    invoke-direct {p1, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->-$$Nest$sfputactive(Ljava/lang/ref/WeakReference;)V

    .line 235
    iget-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference$3;->this$0:Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;

    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->-$$Nest$fgetrefresh(Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;)Landroid/widget/Button;

    move-result-object p1

    if-eqz p1, :cond_3c

    iget-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference$3;->this$0:Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;

    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->-$$Nest$fgetrefresh(Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;)Landroid/widget/Button;

    move-result-object p1

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setEnabled(Z)V

    .line 236
    :cond_3c
    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference$3;->this$0:Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->-$$Nest$mshowCachedOrFetch(Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;)V

    :cond_41
    :goto_41
    return-void
.end method

.method public onViewDetachedFromWindow(Landroid/view/View;)V
    .registers 4

    .line 240
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference$3;->this$0:Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->-$$Nest$fgeteditor(Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;)Landroid/widget/EditText;

    move-result-object v0

    if-ne p1, v0, :cond_d

    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference$3;->this$0:Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->unregister(Lapp/yydarlinker/deepseekcaptions/ApiProfiles$Editor;)V

    .line 241
    :cond_d
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference$3;->this$0:Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->-$$Nest$fgeteditor(Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;)Landroid/widget/EditText;

    move-result-object v0

    if-ne p1, v0, :cond_5d

    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference$3;->val$createdProfile:Ljava/lang/String;

    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference$3;->this$0:Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;

    invoke-virtual {v1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->active(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_28

    goto :goto_5d

    .line 242
    :cond_28
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference$3;->this$0:Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;

    invoke-static {v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->-$$Nest$mdismissModelMenu(Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;)V

    .line 243
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference$3;->this$0:Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;

    check-cast p1, Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    const/4 v1, 0x0

    invoke-static {v0, p1, v1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->-$$Nest$mcommitNow(Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;Ljava/lang/String;Z)V

    .line 244
    iget-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference$3;->this$0:Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;

    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->-$$Nest$fgetfetchGeneration(Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-static {p1, v0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->-$$Nest$fputfetchGeneration(Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;I)V

    .line 245
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->-$$Nest$sfgetactive()Ljava/lang/ref/WeakReference;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference$3;->this$0:Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;

    if-ne p1, p0, :cond_5d

    .line 246
    new-instance p0, Ljava/lang/ref/WeakReference;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->-$$Nest$sfputactive(Ljava/lang/ref/WeakReference;)V

    :cond_5d
    :goto_5d
    return-void
.end method
