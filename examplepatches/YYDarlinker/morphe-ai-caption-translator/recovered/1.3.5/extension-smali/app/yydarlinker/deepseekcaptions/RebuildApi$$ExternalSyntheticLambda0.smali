.class public final synthetic Lapp/yydarlinker/deepseekcaptions/RebuildApi$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Predicate;


# instance fields
.field public final synthetic f$0:Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$LayoutBudget;


# direct methods
.method public synthetic constructor <init>(Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$LayoutBudget;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/RebuildApi$$ExternalSyntheticLambda0;->f$0:Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$LayoutBudget;

    return-void
.end method


# virtual methods
.method public final test(Ljava/lang/Object;)Z
    .registers 2

    .line 0
    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/RebuildApi$$ExternalSyntheticLambda0;->f$0:Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$LayoutBudget;

    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$LayoutBudget;->fits(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method
