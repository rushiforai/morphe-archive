.class public final synthetic Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$$ExternalSyntheticLambda5;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Landroid/app/Activity;


# direct methods
.method public synthetic constructor <init>(Landroid/app/Activity;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$$ExternalSyntheticLambda5;->f$0:Landroid/app/Activity;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 1

    .line 0
    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay$$ExternalSyntheticLambda5;->f$0:Landroid/app/Activity;

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/CaptionOverlay;->lambda$setActivity$1(Landroid/app/Activity;)V

    return-void
.end method
