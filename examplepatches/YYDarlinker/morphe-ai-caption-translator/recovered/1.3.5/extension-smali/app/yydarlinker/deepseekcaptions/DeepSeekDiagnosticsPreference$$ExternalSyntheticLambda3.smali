.class public final synthetic Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference$$ExternalSyntheticLambda3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic f$0:Landroid/content/Context;

.field public final synthetic f$1:I

.field public final synthetic f$2:Ljava/lang/String;

.field public final synthetic f$3:I


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;ILjava/lang/String;I)V
    .registers 5

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference$$ExternalSyntheticLambda3;->f$0:Landroid/content/Context;

    iput p2, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference$$ExternalSyntheticLambda3;->f$1:I

    iput-object p3, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference$$ExternalSyntheticLambda3;->f$2:Ljava/lang/String;

    iput p4, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference$$ExternalSyntheticLambda3;->f$3:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .registers 9

    .line 0
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference$$ExternalSyntheticLambda3;->f$0:Landroid/content/Context;

    iget v1, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference$$ExternalSyntheticLambda3;->f$1:I

    iget-object v2, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference$$ExternalSyntheticLambda3;->f$2:Ljava/lang/String;

    iget v3, p0, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference$$ExternalSyntheticLambda3;->f$3:I

    move-object v4, p1

    move v5, p2

    invoke-static/range {v0 .. v5}, Lapp/yydarlinker/deepseekcaptions/DeepSeekDiagnosticsPreference;->lambda$copyPages$12(Landroid/content/Context;ILjava/lang/String;ILandroid/content/DialogInterface;I)V

    return-void
.end method
