.class final Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;
.super Ljava/lang/Object;
.source "RebuildReview.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lapp/yydarlinker/deepseekcaptions/RebuildReview;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Issue"
.end annotation


# instance fields
.field final code:Ljava/lang/String;

.field final detail:Ljava/lang/String;

.field final from:I

.field final repair:Z

.field final to:I


# direct methods
.method constructor <init>(IILjava/lang/String;Ljava/lang/String;Z)V
    .registers 6

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;->from:I

    iput p2, p0, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;->to:I

    iput-object p3, p0, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;->code:Ljava/lang/String;

    iput-object p4, p0, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;->detail:Ljava/lang/String;

    iput-boolean p5, p0, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;->repair:Z

    return-void
.end method


# virtual methods
.method describe()Ljava/lang/String;
    .registers 3

    .line 15
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;->code:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " range="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;->from:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;->to:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ": "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildReview$Issue;->detail:Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
