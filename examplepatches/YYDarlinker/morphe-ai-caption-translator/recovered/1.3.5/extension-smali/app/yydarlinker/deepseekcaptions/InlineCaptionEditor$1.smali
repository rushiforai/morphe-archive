.class Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor$1;
.super Landroid/view/ActionMode$Callback2;
.source "InlineCaptionEditor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;->performLongClick()Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;


# direct methods
.method constructor <init>(Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 56
    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor$1;->this$0:Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;

    invoke-direct {p0}, Landroid/view/ActionMode$Callback2;-><init>()V

    return-void
.end method


# virtual methods
.method public onActionItemClicked(Landroid/view/ActionMode;Landroid/view/MenuItem;)Z
    .registers 4

    .line 65
    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor$1;->this$0:Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;

    invoke-interface {p2}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    invoke-virtual {p0, v0}, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;->onTextContextMenuItem(I)Z

    move-result p0

    invoke-interface {p2}, Landroid/view/MenuItem;->getItemId()I

    move-result p2

    const v0, 0x102001f

    if-eq p2, v0, :cond_16

    invoke-virtual {p1}, Landroid/view/ActionMode;->finish()V

    :cond_16
    return p0
.end method

.method public onCreateActionMode(Landroid/view/ActionMode;Landroid/view/Menu;)Z
    .registers 7

    const p1, 0x1020022

    const v0, 0x104000b

    const/4 v1, 0x0

    .line 58
    invoke-interface {p2, v1, p1, v1, v0}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    move-result-object p1

    const/4 v0, 0x2

    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setShowAsAction(I)V

    const p1, 0x104000d

    const v2, 0x102001f

    const/4 v3, 0x1

    .line 59
    invoke-interface {p2, v1, v2, v3, p1}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    .line 60
    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor$1;->this$0:Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;->-$$Nest$fgetsensitive(Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;)Z

    move-result p0

    if-nez p0, :cond_2a

    const p0, 0x1020021

    const p1, 0x1040001

    invoke-interface {p2, v1, p0, v0, p1}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    :cond_2a
    return v3
.end method

.method public onDestroyActionMode(Landroid/view/ActionMode;)V
    .registers 2

    .line 67
    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor$1;->this$0:Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;

    const/4 p1, 0x0

    invoke-static {p0, p1}, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;->-$$Nest$fputactions(Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;Landroid/view/ActionMode;)V

    return-void
.end method

.method public onGetContentRect(Landroid/view/ActionMode;Landroid/view/View;Landroid/graphics/Rect;)V
    .registers 4

    .line 68
    iget-object p1, p0, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor$1;->this$0:Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;

    invoke-virtual {p1}, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;->getWidth()I

    move-result p1

    iget-object p0, p0, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor$1;->this$0:Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;

    invoke-virtual {p0}, Lapp/yydarlinker/deepseekcaptions/InlineCaptionEditor;->getHeight()I

    move-result p0

    const/4 p2, 0x0

    invoke-virtual {p3, p2, p2, p1, p0}, Landroid/graphics/Rect;->set(IIII)V

    return-void
.end method

.method public onPrepareActionMode(Landroid/view/ActionMode;Landroid/view/Menu;)Z
    .registers 3

    const/4 p0, 0x0

    return p0
.end method
