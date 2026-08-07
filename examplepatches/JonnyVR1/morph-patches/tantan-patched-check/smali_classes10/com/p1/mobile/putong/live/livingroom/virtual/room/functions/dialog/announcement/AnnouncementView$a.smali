.class public final Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/dialog/announcement/AnnouncementView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/dialog/announcement/AnnouncementView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\'\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\r\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0003*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J1\u0010\t\u001a\u00020\u00082\u0008\u0010\u0003\u001a\u0004\u0018\u00010\u00022\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0006\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u0004H\u0016\u00a2\u0006\u0004\u0008\t\u0010\nJ/\u0010\u000c\u001a\u00020\u00082\u0006\u0010\u0003\u001a\u00020\u00022\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u000b\u001a\u00020\u00042\u0006\u0010\u0006\u001a\u00020\u0004H\u0016\u00a2\u0006\u0004\u0008\u000c\u0010\nJ\u0017\u0010\u000e\u001a\u00020\u00082\u0006\u0010\u0003\u001a\u00020\rH\u0016\u00a2\u0006\u0004\u0008\u000e\u0010\u000f\u00a8\u0006\u0010"
    }
    d2 = {
        "com/p1/mobile/putong/live/livingroom/virtual/room/functions/dialog/announcement/AnnouncementView$a",
        "Landroid/text/TextWatcher;",
        "",
        "s",
        "",
        "start",
        "count",
        "after",
        "",
        "beforeTextChanged",
        "(Ljava/lang/CharSequence;III)V",
        "before",
        "onTextChanged",
        "Landroid/text/Editable;",
        "afterTextChanged",
        "(Landroid/text/Editable;)V",
        "livingroom_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/dialog/announcement/AnnouncementView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/dialog/announcement/AnnouncementView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/dialog/announcement/AnnouncementView$a;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/dialog/announcement/AnnouncementView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, 0x0

    .line 9
    if-lez v0, :cond_0

    .line 10
    .line 11
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/16 v2, 0x3e8

    .line 16
    .line 17
    if-le v0, v2, :cond_0

    .line 18
    .line 19
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Aj:I

    .line 20
    .line 21
    invoke-static {v0}, Ll/r1j0;->f(I)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/dialog/announcement/AnnouncementView$a;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/dialog/announcement/AnnouncementView;

    .line 25
    .line 26
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceAnnouncementDialogViewBindings;->c:Landroid/widget/EditText;

    .line 27
    .line 28
    invoke-interface {p1, v1, v2}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/dialog/announcement/AnnouncementView$a;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/dialog/announcement/AnnouncementView;

    .line 40
    .line 41
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceAnnouncementDialogViewBindings;->c:Landroid/widget/EditText;

    .line 42
    .line 43
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-interface {v2}, Ljava/lang/CharSequence;->length()I

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setSelection(I)V

    .line 52
    .line 53
    .line 54
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/dialog/announcement/AnnouncementView$a;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/dialog/announcement/AnnouncementView;

    .line 55
    .line 56
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceAnnouncementDialogViewBindings;->d:Lv/VText;

    .line 57
    .line 58
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    if-lez p1, :cond_1

    .line 63
    .line 64
    const/4 v1, 0x1

    .line 65
    :cond_1
    invoke-virtual {v0, v1}, Landroid/view/View;->setSelected(Z)V

    .line 66
    .line 67
    .line 68
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/dialog/announcement/AnnouncementView$a;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/dialog/announcement/AnnouncementView;

    .line 69
    .line 70
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceAnnouncementDialogViewBindings;->d:Lv/VText;

    .line 71
    .line 72
    invoke-virtual {p1}, Landroid/view/View;->isSelected()Z

    .line 73
    .line 74
    .line 75
    move-result p1

    .line 76
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/dialog/announcement/AnnouncementView$a;->a:Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/dialog/announcement/AnnouncementView;

    .line 77
    .line 78
    if-eqz p1, :cond_2

    .line 79
    .line 80
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceAnnouncementDialogViewBindings;->d:Lv/VText;

    .line 81
    .line 82
    sget p1, Ll/n9c0;->w1:I

    .line 83
    .line 84
    invoke-static {p1}, Ll/n3d0;->a(I)I

    .line 85
    .line 86
    .line 87
    move-result p1

    .line 88
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 89
    .line 90
    .line 91
    return-void

    .line 92
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceAnnouncementDialogViewBindings;->d:Lv/VText;

    .line 93
    .line 94
    sget p1, Ll/n9c0;->m1:I

    .line 95
    .line 96
    invoke-static {p1}, Ll/n3d0;->a(I)I

    .line 97
    .line 98
    .line 99
    move-result p1

    .line 100
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 101
    .line 102
    .line 103
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method
