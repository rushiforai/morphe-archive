.class public final synthetic Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference$$ExternalSyntheticLambda6;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Landroid/widget/TextView;

.field public final synthetic f$1:Landroid/content/Context;

.field public final synthetic f$2:Landroid/widget/ScrollView;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/TextView;Landroid/content/Context;Landroid/widget/ScrollView;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference$$ExternalSyntheticLambda6;->f$0:Landroid/widget/TextView;

    iput-object p2, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference$$ExternalSyntheticLambda6;->f$1:Landroid/content/Context;

    iput-object p3, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference$$ExternalSyntheticLambda6;->f$2:Landroid/widget/ScrollView;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 4

    .line 0
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference$$ExternalSyntheticLambda6;->f$0:Landroid/widget/TextView;

    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference$$ExternalSyntheticLambda6;->f$1:Landroid/content/Context;

    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference$$ExternalSyntheticLambda6;->f$2:Landroid/widget/ScrollView;

    invoke-static {v0, v1, p0, p1}, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference;->lambda$onCreateView$1(Landroid/widget/TextView;Landroid/content/Context;Landroid/widget/ScrollView;Landroid/view/View;)V

    return-void
.end method
