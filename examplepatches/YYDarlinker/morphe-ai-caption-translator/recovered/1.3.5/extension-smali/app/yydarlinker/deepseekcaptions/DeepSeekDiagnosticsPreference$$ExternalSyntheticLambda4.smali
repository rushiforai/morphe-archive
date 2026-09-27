.class public final synthetic Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference$$ExternalSyntheticLambda4;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Landroid/content/Context;

.field public final synthetic f$1:Landroid/widget/TextView;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;Landroid/widget/TextView;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference$$ExternalSyntheticLambda4;->f$0:Landroid/content/Context;

    iput-object p2, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference$$ExternalSyntheticLambda4;->f$1:Landroid/widget/TextView;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    .line 0
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference$$ExternalSyntheticLambda4;->f$0:Landroid/content/Context;

    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference$$ExternalSyntheticLambda4;->f$1:Landroid/widget/TextView;

    invoke-static {v0, p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference;->lambda$onCreateView$9(Landroid/content/Context;Landroid/widget/TextView;)V

    return-void
.end method
