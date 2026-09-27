.class Lapp/yydarlinker/deepseekcaptions/DeepSeekSliderPreference$1;
.super Ljava/lang/Object;
.source "DeepSeekSliderPreference.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lapp/yydarlinker/deepseekcaptions/DeepSeekSliderPreference;->onCreateView(Landroid/view/ViewGroup;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lapp/yydarlinker/deepseekcaptions/DeepSeekSliderPreference;

.field final synthetic val$minimum:I

.field final synthetic val$valueLabel:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Lapp/yydarlinker/deepseekcaptions/DeepSeekSliderPreference;Landroid/widget/TextView;I)V
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

    .line 120
    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekSliderPreference$1;->this$0:Lapp/yydarlinker/deepseekcaptions/DeepSeekSliderPreference;

    iput-object p2, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekSliderPreference$1;->val$valueLabel:Landroid/widget/TextView;

    iput p3, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekSliderPreference$1;->val$minimum:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .registers 6

    .line 122
    iget-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekSliderPreference$1;->val$valueLabel:Landroid/widget/TextView;

    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekSliderPreference$1;->this$0:Lapp/yydarlinker/deepseekcaptions/DeepSeekSliderPreference;

    iget v1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekSliderPreference$1;->val$minimum:I

    add-int/2addr v1, p2

    invoke-static {v0, v1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekSliderPreference;->-$$Nest$mformat(Lapp/yydarlinker/deepseekcaptions/DeepSeekSliderPreference;I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    if-eqz p3, :cond_1c

    .line 123
    iget-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekSliderPreference$1;->this$0:Lapp/yydarlinker/deepseekcaptions/DeepSeekSliderPreference;

    invoke-virtual {p1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekSliderPreference;->getKey()Ljava/lang/String;

    move-result-object p1

    iget p0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekSliderPreference$1;->val$minimum:I

    add-int/2addr p0, p2

    invoke-static {p1, p0}, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview;->update(Ljava/lang/String;I)V

    :cond_1c
    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .registers 2

    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .registers 3

    .line 129
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekSliderPreference$1;->this$0:Lapp/yydarlinker/deepseekcaptions/DeepSeekSliderPreference;

    iget p0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekSliderPreference$1;->val$minimum:I

    invoke-virtual {p1}, Landroid/widget/SeekBar;->getProgress()I

    move-result p1

    add-int/2addr p0, p1

    invoke-static {v0, p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekSliderPreference;->-$$Nest$msaveValue(Lapp/yydarlinker/deepseekcaptions/DeepSeekSliderPreference;I)V

    return-void
.end method
