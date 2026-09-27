.class public final synthetic Lapp/yydarlinker/deepseekcaptions/CaptionDiagnosticArchive$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Ljava/io/File;

.field public final synthetic f$1:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ljava/io/File;Ljava/lang/String;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnosticArchive$$ExternalSyntheticLambda2;->f$0:Ljava/io/File;

    iput-object p2, p0, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnosticArchive$$ExternalSyntheticLambda2;->f$1:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    .line 0
    iget-object v0, p0, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnosticArchive$$ExternalSyntheticLambda2;->f$0:Ljava/io/File;

    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnosticArchive$$ExternalSyntheticLambda2;->f$1:Ljava/lang/String;

    invoke-static {v0, p0}, Lapp/yydarlinker/deepseekcaptions/CaptionDiagnosticArchive;->lambda$append$1(Ljava/io/File;Ljava/lang/String;)V

    return-void
.end method
