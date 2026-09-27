.class public final synthetic Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Landroid/widget/Button;

.field public final synthetic f$1:Landroid/content/Context;

.field public final synthetic f$2:Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview;


# direct methods
.method public synthetic constructor <init>(Landroid/widget/Button;Landroid/content/Context;Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$$ExternalSyntheticLambda0;->f$0:Landroid/widget/Button;

    iput-object p2, p0, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$$ExternalSyntheticLambda0;->f$1:Landroid/content/Context;

    iput-object p3, p0, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$$ExternalSyntheticLambda0;->f$2:Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    .line 0
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$$ExternalSyntheticLambda0;->f$0:Landroid/widget/Button;

    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$$ExternalSyntheticLambda0;->f$1:Landroid/content/Context;

    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$$ExternalSyntheticLambda0;->f$2:Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview;

    invoke-static {v0, v1, p0}, Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview;->lambda$onCreateView$0(Landroid/widget/Button;Landroid/content/Context;Lapp/yydarlinker/deepseekcaptions/SubtitleStylePreview$Preview;)V

    return-void
.end method
