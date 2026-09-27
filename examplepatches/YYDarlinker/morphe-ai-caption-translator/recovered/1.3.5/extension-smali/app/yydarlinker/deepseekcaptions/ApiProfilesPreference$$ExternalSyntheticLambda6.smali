.class public final synthetic Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$$ExternalSyntheticLambda6;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/widget/TextView$OnEditorActionListener;


# instance fields
.field public final synthetic f$0:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Runnable;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$$ExternalSyntheticLambda6;->f$0:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .registers 4

    .line 0
    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference$$ExternalSyntheticLambda6;->f$0:Ljava/lang/Runnable;

    invoke-static {p0, p1, p2, p3}, Lapp/yydarlinker/deepseekcaptions/ApiProfilesPreference;->lambda$beginRename$12(Ljava/lang/Runnable;Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z

    move-result p0

    return p0
.end method
