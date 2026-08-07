.class public final Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/announcement/AnnouncementView;
.super Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceAnnouncementViewBindings;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceAnnouncementViewBindings<",
        "Ll/ss0;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0004\n\u0002\u0010\u000b\n\u0002\u0008\u0005\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\u0017\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\r\u0010\n\u001a\u00020\t\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\u0015\u0010\u000e\u001a\u00020\t2\u0006\u0010\r\u001a\u00020\u000c\u00a2\u0006\u0004\u0008\u000e\u0010\u000fJ\r\u0010\u0010\u001a\u00020\t\u00a2\u0006\u0004\u0008\u0010\u0010\u000bJ\u0015\u0010\u0013\u001a\u00020\t2\u0006\u0010\u0012\u001a\u00020\u0011\u00a2\u0006\u0004\u0008\u0013\u0010\u0014J\u000f\u0010\u0015\u001a\u00020\tH\u0002\u00a2\u0006\u0004\u0008\u0015\u0010\u000b\u00a8\u0006\u0016"
    }
    d2 = {
        "Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/announcement/AnnouncementView;",
        "Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceAnnouncementViewBindings;",
        "Ll/ss0;",
        "Landroid/content/Context;",
        "context",
        "Landroid/util/AttributeSet;",
        "attrs",
        "<init>",
        "(Landroid/content/Context;Landroid/util/AttributeSet;)V",
        "",
        "r",
        "()V",
        "",
        "announcement",
        "e",
        "(Ljava/lang/String;)V",
        "d",
        "",
        "isCollapse",
        "f",
        "(Z)V",
        "i",
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


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceAnnouncementViewBindings;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static b(Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/announcement/AnnouncementView;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceAnnouncementViewBindings;->d:Lv/VLinear;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceAnnouncementViewBindings;->e:Lv/VText;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    const/high16 v1, 0x42e20000    # 113.0f

    .line 10
    .line 11
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    add-int/2addr p0, v1

    .line 16
    invoke-static {v0, p0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static c(Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/announcement/AnnouncementView;Landroid/view/View;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceAnnouncementViewBindings;->a:Ll/k3m;

    .line 5
    .line 6
    check-cast p0, Ll/ss0;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/ss0;->R3()V

    .line 9
    .line 10
    .line 11
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 12
    .line 13
    return-object p0
.end method


# virtual methods
.method public final d()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceAnnouncementViewBindings;->f:Lv/VText;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceAnnouncementViewBindings;->a:Ll/k3m;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    check-cast v1, Ll/i6t;

    .line 9
    .line 10
    invoke-static {v1}, Ll/i9o0;->h(Ll/i6t;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/announcement/AnnouncementView;->i()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final e(Ljava/lang/String;)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceAnnouncementViewBindings;->f:Lv/VText;

    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceAnnouncementViewBindings;->a:Ll/k3m;

    .line 7
    .line 8
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    check-cast v1, Ll/i6t;

    .line 12
    .line 13
    invoke-static {v1}, Ll/i9o0;->h(Ll/i6t;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceAnnouncementViewBindings;->e:Lv/VText;

    .line 25
    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    const-string p1, "\u6b22\u8fce\u52a0\u5165\u672c\u7fa4\uff0c\u548c\u5927\u5bb6\u4e00\u8d77\u804a\u5929\u5427\uff01"

    .line 29
    .line 30
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 35
    .line 36
    .line 37
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/announcement/AnnouncementView;->i()V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final f(Z)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceAnnouncementViewBindings;->d:Lv/VLinear;

    .line 2
    .line 3
    xor-int/lit8 v1, p1, 0x1

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceAnnouncementViewBindings;->c:Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/functionpanel/collapse/LiveVirtualVoicePanelCollapseView;

    .line 9
    .line 10
    new-instance v0, Ll/q6s;

    .line 11
    .line 12
    sget v1, Ll/obc0;->q9:I

    .line 13
    .line 14
    new-instance v2, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    const-string v3, "res://drawable/"

    .line 17
    .line 18
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    const/16 v5, 0x8

    .line 29
    .line 30
    const/4 v6, 0x0

    .line 31
    const-string v3, "\u7fa4\u516c\u544a\u677f"

    .line 32
    .line 33
    const/4 v4, 0x0

    .line 34
    move v1, p1

    .line 35
    invoke-direct/range {v0 .. v6}, Ll/q6s;-><init>(ZLjava/lang/String;Ljava/lang/String;ZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/functionpanel/collapse/LiveVirtualVoicePanelCollapseView;->b(Ll/q6s;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final i()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceAnnouncementViewBindings;->a:Ll/k3m;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    check-cast v0, Ll/i6t;

    .line 7
    .line 8
    invoke-static {v0}, Ll/i9o0;->h(Ll/i6t;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceAnnouncementViewBindings;->e:Lv/VText;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    const/high16 v0, 0x42700000    # 60.0f

    .line 17
    .line 18
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setMaxHeight(I)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/high16 v0, 0x43480000    # 200.0f

    .line 27
    .line 28
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setMaxHeight(I)V

    .line 33
    .line 34
    .line 35
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceAnnouncementViewBindings;->e:Lv/VText;

    .line 36
    .line 37
    new-instance v1, Ll/ws0;

    .line 38
    .line 39
    invoke-direct {v1, p0}, Ll/ws0;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/announcement/AnnouncementView;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public final r()V
    .locals 12

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceAnnouncementViewBindings;->e:Lv/VText;

    .line 2
    .line 3
    invoke-static {}, Landroid/text/method/ScrollingMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceAnnouncementViewBindings;->f:Lv/VText;

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceAnnouncementViewBindings;->a:Ll/k3m;

    .line 13
    .line 14
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 15
    .line 16
    .line 17
    check-cast v1, Ll/i6t;

    .line 18
    .line 19
    invoke-static {v1}, Ll/i9o0;->h(Ll/i6t;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    invoke-static {p0}, Ll/bnl0;->n0(Landroid/view/View;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceAnnouncementViewBindings;->f:Lv/VText;

    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 32
    .line 33
    .line 34
    new-instance v1, Ll/us0;

    .line 35
    .line 36
    invoke-direct {v1, p0}, Ll/us0;-><init>(Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/announcement/AnnouncementView;)V

    .line 37
    .line 38
    .line 39
    invoke-static {v0, v1}, Ll/czq;->c(Landroid/view/View;Lkotlin/jvm/functions/Function1;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceAnnouncementViewBindings;->c:Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/functionpanel/collapse/LiveVirtualVoicePanelCollapseView;

    .line 43
    .line 44
    sget v1, Ll/qa00;->y:I

    .line 45
    .line 46
    invoke-static {v0, v1}, Ll/bnl0;->e0(Landroid/view/View;I)V

    .line 47
    .line 48
    .line 49
    invoke-static {}, Ll/bhn0;->a()I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceAnnouncementViewBindings;->d:Lv/VLinear;

    .line 54
    .line 55
    const/4 v2, 0x1

    .line 56
    new-array v3, v2, [Landroid/view/View;

    .line 57
    .line 58
    const/4 v4, 0x0

    .line 59
    aput-object v1, v3, v4

    .line 60
    .line 61
    invoke-static {v0, v3}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/room/functions/panel/announcement/AnnouncementView;->i()V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceAnnouncementViewBindings;->c:Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/functionpanel/collapse/LiveVirtualVoicePanelCollapseView;

    .line 68
    .line 69
    new-instance v5, Ll/q6s;

    .line 70
    .line 71
    sget v1, Ll/obc0;->q9:I

    .line 72
    .line 73
    new-instance v3, Ljava/lang/StringBuilder;

    .line 74
    .line 75
    const-string v6, "res://drawable/"

    .line 76
    .line 77
    invoke-direct {v3, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v7

    .line 87
    const/16 v10, 0x9

    .line 88
    .line 89
    const/4 v11, 0x0

    .line 90
    const/4 v6, 0x0

    .line 91
    const-string v8, "\u7fa4\u516c\u544a\u677f"

    .line 92
    .line 93
    const/4 v9, 0x0

    .line 94
    invoke-direct/range {v5 .. v11}, Ll/q6s;-><init>(ZLjava/lang/String;Ljava/lang/String;ZILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {v0, v5}, Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/functionpanel/collapse/LiveVirtualVoicePanelCollapseView;->c(Ll/q6s;)V

    .line 98
    .line 99
    .line 100
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceAnnouncementViewBindings;->c:Lcom/p1/mobile/putong/live/livingroom/virtual/virtualmotion/creator/functionpanel/collapse/LiveVirtualVoicePanelCollapseView;

    .line 101
    .line 102
    invoke-static {v0, v4}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 103
    .line 104
    .line 105
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVirtualVoiceAnnouncementViewBindings;->d:Lv/VLinear;

    .line 106
    .line 107
    invoke-static {p0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 108
    .line 109
    .line 110
    return-void
.end method
