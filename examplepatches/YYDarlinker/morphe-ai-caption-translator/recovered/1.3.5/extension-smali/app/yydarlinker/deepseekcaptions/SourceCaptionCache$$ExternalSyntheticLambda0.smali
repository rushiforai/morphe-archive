.class public final synthetic Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Landroid/content/Context;

.field public final synthetic f$1:Ljava/lang/String;

.field public final synthetic f$2:[B

.field public final synthetic f$3:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;Ljava/lang/String;[BLjava/lang/String;)V
    .registers 5

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache$$ExternalSyntheticLambda0;->f$0:Landroid/content/Context;

    iput-object p2, p0, Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache$$ExternalSyntheticLambda0;->f$1:Ljava/lang/String;

    iput-object p3, p0, Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache$$ExternalSyntheticLambda0;->f$2:[B

    iput-object p4, p0, Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache$$ExternalSyntheticLambda0;->f$3:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    .line 0
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache$$ExternalSyntheticLambda0;->f$0:Landroid/content/Context;

    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache$$ExternalSyntheticLambda0;->f$1:Ljava/lang/String;

    iget-object v2, p0, Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache$$ExternalSyntheticLambda0;->f$2:[B

    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache$$ExternalSyntheticLambda0;->f$3:Ljava/lang/String;

    invoke-static {v0, v1, v2, p0}, Lapp/yydarlinker/deepseekcaptions/SourceCaptionCache;->lambda$put$1(Landroid/content/Context;Ljava/lang/String;[BLjava/lang/String;)V

    return-void
.end method
