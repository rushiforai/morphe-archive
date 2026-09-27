.class public final synthetic Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Landroid/content/Context;

.field public final synthetic f$1:Landroid/widget/Button;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;Landroid/widget/Button;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference$$ExternalSyntheticLambda2;->f$0:Landroid/content/Context;

    iput-object p2, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference$$ExternalSyntheticLambda2;->f$1:Landroid/widget/Button;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    .line 0
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference$$ExternalSyntheticLambda2;->f$0:Landroid/content/Context;

    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference$$ExternalSyntheticLambda2;->f$1:Landroid/widget/Button;

    invoke-static {v0, p0}, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference;->lambda$onCreateView$6(Landroid/content/Context;Landroid/widget/Button;)V

    return-void
.end method
