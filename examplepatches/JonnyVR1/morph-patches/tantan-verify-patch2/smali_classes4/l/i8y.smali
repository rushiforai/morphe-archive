.class public final Ll/i8y;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bzl;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000N\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0010\r\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0003\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u001f\u0010\u0008\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u0006H\u0016\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u0011\u0010\u000b\u001a\u0004\u0018\u00010\nH\u0016\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\u000f\u0010\r\u001a\u00020\u0006H\u0016\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\u000f\u0010\u0010\u001a\u00020\u000fH\u0016\u00a2\u0006\u0004\u0008\u0010\u0010\u0011J\u000f\u0010\u0013\u001a\u00020\u0012H\u0016\u00a2\u0006\u0004\u0008\u0013\u0010\u0014J\u000f\u0010\u0015\u001a\u00020\u0012H\u0016\u00a2\u0006\u0004\u0008\u0015\u0010\u0014J\u001f\u0010\u001b\u001a\u00020\u001a2\u0006\u0010\u0017\u001a\u00020\u00162\u0006\u0010\u0019\u001a\u00020\u0018H\u0016\u00a2\u0006\u0004\u0008\u001b\u0010\u001cJ\u000f\u0010\u001e\u001a\u00020\u001dH\u0016\u00a2\u0006\u0004\u0008\u001e\u0010\u001f\u00a8\u0006 "
    }
    d2 = {
        "Ll/i8y;",
        "Ll/bzl;",
        "<init>",
        "()V",
        "Ll/j8y;",
        "meetEntranceData",
        "",
        "acceleratePairStrategyEnable",
        "b",
        "(Ll/j8y;Z)Z",
        "Lcom/p1/mobile/putong/data/Picture$ImageUri;",
        "getAvatar",
        "()Lcom/p1/mobile/putong/data/Picture$ImageUri;",
        "c",
        "()Z",
        "",
        "f",
        "()I",
        "",
        "getTitle",
        "()Ljava/lang/CharSequence;",
        "g",
        "Lcom/p1/mobile/putong/core/newui/messages/business/meet/MeetEntranceModel;",
        "viewModel",
        "Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;",
        "_view",
        "",
        "a",
        "(Lcom/p1/mobile/putong/core/newui/messages/business/meet/MeetEntranceModel;Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;)V",
        "",
        "d",
        "()Ljava/lang/String;",
        "b_core_intlGmsRelease"
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
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/core/newui/messages/business/meet/MeetEntranceModel;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/i8y;->j(Lcom/p1/mobile/putong/core/newui/messages/business/meet/MeetEntranceModel;)V

    return-void
.end method

.method public static i(Ll/i8y;Lcom/p1/mobile/putong/core/newui/messages/business/meet/MeetEntranceModel;Landroid/view/View;)V
    .locals 3

    .line 1
    const-string p2, "guidance_type"

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/i8y;->d()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p2, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    filled-new-array {p0}, [Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string p2, "e_red_dot_message_see"

    .line 16
    .line 17
    const-string v0, "p_messages_view"

    .line 18
    .line 19
    invoke-static {p2, v0, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 20
    .line 21
    .line 22
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m1:Lcom/p1/mobile/putong/core/api/s;

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/s;->G5()V

    .line 27
    .line 28
    .line 29
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m1:Lcom/p1/mobile/putong/core/api/s;

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/s;->J5()V

    .line 34
    .line 35
    .line 36
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->c2:Ll/dw6;

    .line 39
    .line 40
    invoke-virtual {p0}, Ll/dw6;->t3()Z

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    if-eqz p0, :cond_0

    .line 45
    .line 46
    sget-object p0, Ll/y9;->Companion:Ll/y9$a;

    .line 47
    .line 48
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/messages/business/meet/MeetEntranceModel;->A()Lcom/p1/mobile/android/app/Act;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-virtual {p0, p1}, Ll/y9$a;->q(Lcom/p1/mobile/android/app/Act;)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_0
    sget-object p0, Ll/y9;->Companion:Ll/y9$a;

    .line 57
    .line 58
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/messages/business/meet/MeetEntranceModel;->A()Lcom/p1/mobile/android/app/Act;

    .line 59
    .line 60
    .line 61
    move-result-object p2

    .line 62
    new-instance v0, Ll/h8y;

    .line 63
    .line 64
    invoke-direct {v0, p1}, Ll/h8y;-><init>(Lcom/p1/mobile/putong/core/newui/messages/business/meet/MeetEntranceModel;)V

    .line 65
    .line 66
    .line 67
    const/4 v1, 0x0

    .line 68
    const-string v2, "p_message,accelerate_guide"

    .line 69
    .line 70
    invoke-virtual {p0, p2, v1, v2, v0}, Ll/y9$a;->u(Lcom/p1/mobile/android/app/Act;ZLjava/lang/String;Ll/x20;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/messages/business/meet/MeetEntranceModel;->B()V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public static final j(Lcom/p1/mobile/putong/core/newui/messages/business/meet/MeetEntranceModel;)V
    .locals 1

    .line 1
    sget-object v0, Ll/y9;->Companion:Ll/y9$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/business/meet/MeetEntranceModel;->A()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {v0, p0}, Ll/y9$a;->q(Lcom/p1/mobile/android/app/Act;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/core/newui/messages/business/meet/MeetEntranceModel;Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;)V
    .locals 3
    .param p1    # Lcom/p1/mobile/putong/core/newui/messages/business/meet/MeetEntranceModel;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;
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
    iget-object v0, p2, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->i:Landroid/widget/ImageView;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p2, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->h:Lv/VDraweeView;

    .line 14
    .line 15
    const/high16 v2, 0x40e00000    # 7.0f

    .line 16
    .line 17
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    invoke-static {v0, v2}, Ll/bnl0;->h0(Landroid/view/View;I)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p2, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->h:Lv/VDraweeView;

    .line 25
    .line 26
    sget v2, Ll/dbc0;->Se:I

    .line 27
    .line 28
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p2, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->u:Lv/VImage;

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p2, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->u:Lv/VImage;

    .line 37
    .line 38
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p2, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->z:Lv/VText;

    .line 42
    .line 43
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p2, Lcom/p1/mobile/putong/core/newui/messages/business/BusinessConversationView;->A:Lv/VText;

    .line 47
    .line 48
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 49
    .line 50
    .line 51
    new-instance v0, Ll/g8y;

    .line 52
    .line 53
    invoke-direct {v0, p0, p1}, Ll/g8y;-><init>(Ll/i8y;Lcom/p1/mobile/putong/core/newui/messages/business/meet/MeetEntranceModel;)V

    .line 54
    .line 55
    .line 56
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public b(Ll/j8y;Z)Z
    .locals 0
    .param p1    # Ll/j8y;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    if-eqz p2, :cond_0

    .line 5
    .line 6
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->m1:Lcom/p1/mobile/putong/core/api/s;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/s;->h4()Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public c()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public d()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    const-string p0, "boost"

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge e()I
    .locals 0

    .line 1
    invoke-super {p0}, Ll/bzl;->e()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public f()I
    .locals 0

    .line 1
    invoke-static {}, Ll/gra;->z()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget p0, Ll/dbc0;->Pg:I

    .line 8
    .line 9
    return p0

    .line 10
    :cond_0
    sget p0, Ll/dbc0;->We:I

    .line 11
    .line 12
    return p0
.end method

.method public g()Ljava/lang/CharSequence;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    const-string p0, "\u5361\u7247\u6392\u5728\u9996\u4f4d\uff0c\u8ba9\u66f4\u591a\u4eba\u4f18\u5148\u770b\u5230\u4f60"

    .line 2
    .line 3
    return-object p0
.end method

.method public getAvatar()Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public getTitle()Ljava/lang/CharSequence;
    .locals 4
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    const-string v0, "10"

    .line 2
    .line 3
    filled-new-array {v0}, [Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0}, Ll/i8y;->e()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    filled-new-array {p0}, [Ljava/lang/Integer;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const/4 v1, 0x2

    .line 28
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    const/4 v2, 0x1

    .line 33
    invoke-static {v1, v2}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    const/16 v2, 0xf

    .line 38
    .line 39
    invoke-static {v2}, Ll/qa00;->f(I)I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    const-string v3, "\u6700\u9ad8\u6536\u83b710\u500d\u559c\u6b22"

    .line 44
    .line 45
    invoke-static {v3, v0, p0, v1, v2}, Ll/q8g0;->d0(Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;Landroid/graphics/Typeface;I)Landroid/text/SpannableStringBuilder;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 50
    .line 51
    .line 52
    return-object p0
.end method
