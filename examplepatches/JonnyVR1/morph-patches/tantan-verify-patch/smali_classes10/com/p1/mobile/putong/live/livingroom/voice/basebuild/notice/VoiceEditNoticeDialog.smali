.class public final Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/constraintlayout/widget/ConstraintLayout;",
        "Ll/iam<",
        "Ll/gdn0;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0088\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u000b\n\u0002\u0008\u000b\n\u0002\u0010\u0001\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0016\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\n\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\r\n\u0002\u0018\u0002\n\u0002\u0008\u0008\u0018\u00002\u00020\u00012\u0008\u0012\u0004\u0012\u00020\u00030\u0002B\'\u0008\u0007\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\n\u0008\u0002\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u0012\u0008\u0008\u0002\u0010\t\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\u0017\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\r\u001a\u00020\u000cH\u0002\u00a2\u0006\u0004\u0008\u000f\u0010\u0010J\u000f\u0010\u0011\u001a\u00020\u000eH\u0002\u00a2\u0006\u0004\u0008\u0011\u0010\u0012J\u000f\u0010\u0013\u001a\u00020\u000eH\u0002\u00a2\u0006\u0004\u0008\u0013\u0010\u0012J\u0017\u0010\u0016\u001a\u00020\u000e2\u0006\u0010\u0015\u001a\u00020\u0014H\u0002\u00a2\u0006\u0004\u0008\u0016\u0010\u0017J\u001f\u0010\u001c\u001a\u00020\u000c2\u0006\u0010\u0019\u001a\u00020\u00182\u0008\u0010\u001b\u001a\u0004\u0018\u00010\u001a\u00a2\u0006\u0004\u0008\u001c\u0010\u001dJ\u000f\u0010\u001e\u001a\u00020\u000eH\u0014\u00a2\u0006\u0004\u0008\u001e\u0010\u0012J\u001d\u0010\"\u001a\u00020\u000e2\u0006\u0010 \u001a\u00020\u001f2\u0006\u0010!\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\"\u0010#J\u0015\u0010%\u001a\u00020\u000e2\u0006\u0010$\u001a\u00020\u0014\u00a2\u0006\u0004\u0008%\u0010\u0017J\u0015\u0010&\u001a\u00020\u000e2\u0006\u0010\u0015\u001a\u00020\u0014\u00a2\u0006\u0004\u0008&\u0010\u0017J\r\u0010\'\u001a\u00020\u000e\u00a2\u0006\u0004\u0008\'\u0010\u0012J\u0019\u0010)\u001a\u00020\u000e2\u0008\u0010(\u001a\u0004\u0018\u00010\u0003H\u0016\u00a2\u0006\u0004\u0008)\u0010*J%\u0010,\u001a\u0004\u0018\u00010+2\u0008\u0010\u0019\u001a\u0004\u0018\u00010\u00182\u0008\u0010\u001b\u001a\u0004\u0018\u00010\u001aH\u0016\u00a2\u0006\u0004\u0008,\u0010-J\u000f\u0010.\u001a\u00020\u000eH\u0016\u00a2\u0006\u0004\u0008.\u0010\u0012J\u0011\u00100\u001a\u0004\u0018\u00010/H\u0016\u00a2\u0006\u0004\u00080\u00101J\u0015\u00103\u001a\u00020\u000e2\u0006\u00102\u001a\u00020\u0014\u00a2\u0006\u0004\u00083\u0010\u0017J\u0015\u00104\u001a\u00020\u000e2\u0006\u0010$\u001a\u00020\u0014\u00a2\u0006\u0004\u00084\u0010\u0017R\"\u0010;\u001a\u00020\u00008\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u00085\u00106\u001a\u0004\u00087\u00108\"\u0004\u00089\u0010:R\"\u0010A\u001a\u00020\u000c8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008<\u0010=\u001a\u0004\u0008>\u0010?\"\u0004\u0008@\u0010\u0010R\"\u0010E\u001a\u00020\u000c8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008B\u0010=\u001a\u0004\u0008C\u0010?\"\u0004\u0008D\u0010\u0010R\"\u0010M\u001a\u00020F8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008G\u0010H\u001a\u0004\u0008I\u0010J\"\u0004\u0008K\u0010LR\"\u0010U\u001a\u00020N8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008O\u0010P\u001a\u0004\u0008Q\u0010R\"\u0004\u0008S\u0010TR\"\u0010X\u001a\u00020N8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008!\u0010P\u001a\u0004\u0008V\u0010R\"\u0004\u0008W\u0010TR\"\u0010`\u001a\u00020Y8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008Z\u0010[\u001a\u0004\u0008\\\u0010]\"\u0004\u0008^\u0010_R\"\u0010h\u001a\u00020a8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008b\u0010c\u001a\u0004\u0008d\u0010e\"\u0004\u0008f\u0010gR\"\u0010l\u001a\u00020N8\u0006@\u0006X\u0086.\u00a2\u0006\u0012\n\u0004\u0008i\u0010P\u001a\u0004\u0008j\u0010R\"\u0004\u0008k\u0010TR\u0018\u0010(\u001a\u0004\u0018\u00010\u00038\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008m\u0010nR\u0018\u0010r\u001a\u0004\u0018\u00010o8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008p\u0010qR\u0016\u00102\u001a\u00020\u00148\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008s\u0010tR\u0016\u0010v\u001a\u00020\u00148\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008u\u0010t\u00a8\u0006w"
    }
    d2 = {
        "Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;",
        "Landroidx/constraintlayout/widget/ConstraintLayout;",
        "Ll/iam;",
        "Ll/gdn0;",
        "Landroid/content/Context;",
        "context",
        "Landroid/util/AttributeSet;",
        "attrs",
        "",
        "defStyleAttr",
        "<init>",
        "(Landroid/content/Context;Landroid/util/AttributeSet;I)V",
        "Landroid/view/View;",
        "view",
        "",
        "m0",
        "(Landroid/view/View;)V",
        "r",
        "()V",
        "u0",
        "",
        "text",
        "setCompleteBtnStyle",
        "(Ljava/lang/String;)V",
        "Landroid/view/LayoutInflater;",
        "inflater",
        "Landroid/view/ViewGroup;",
        "parent",
        "n0",
        "(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;",
        "onFinishInflate",
        "",
        "show",
        "i",
        "t0",
        "(ZI)V",
        "currentNotice",
        "v0",
        "setCheckSuccessToCache",
        "r0",
        "presenter",
        "p0",
        "(Ll/gdn0;)V",
        "",
        "s0",
        "(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Ljava/lang/Void;",
        "destroy",
        "Lcom/p1/mobile/android/app/Act;",
        "q0",
        "()Lcom/p1/mobile/android/app/Act;",
        "announcementStatus",
        "setConfirmBtnStatus",
        "w0",
        "d",
        "Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;",
        "get_root",
        "()Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;",
        "set_root",
        "(Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;)V",
        "_root",
        "e",
        "Landroid/view/View;",
        "get_empty",
        "()Landroid/view/View;",
        "set_empty",
        "_empty",
        "f",
        "get_empty_anchor",
        "set_empty_anchor",
        "_empty_anchor",
        "Landroid/widget/RelativeLayout;",
        "g",
        "Landroid/widget/RelativeLayout;",
        "get_container",
        "()Landroid/widget/RelativeLayout;",
        "set_container",
        "(Landroid/widget/RelativeLayout;)V",
        "_container",
        "Landroid/widget/TextView;",
        "h",
        "Landroid/widget/TextView;",
        "get_title",
        "()Landroid/widget/TextView;",
        "set_title",
        "(Landroid/widget/TextView;)V",
        "_title",
        "get_can_input_num",
        "set_can_input_num",
        "_can_input_num",
        "Lv/VFrame;",
        "j",
        "Lv/VFrame;",
        "get_edit_layout",
        "()Lv/VFrame;",
        "set_edit_layout",
        "(Lv/VFrame;)V",
        "_edit_layout",
        "Lv/VEditText;",
        "k",
        "Lv/VEditText;",
        "get_input_notice_text",
        "()Lv/VEditText;",
        "set_input_notice_text",
        "(Lv/VEditText;)V",
        "_input_notice_text",
        "l",
        "get_complete_update",
        "set_complete_update",
        "_complete_update",
        "m",
        "Ll/gdn0;",
        "Ll/c0s;",
        "n",
        "Ll/c0s;",
        "dialog",
        "o",
        "Ljava/lang/String;",
        "p",
        "lastInputText",
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

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# instance fields
.field public d:Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;

.field public e:Landroid/view/View;

.field public f:Landroid/view/View;

.field public g:Landroid/widget/RelativeLayout;

.field public h:Landroid/widget/TextView;

.field public i:Landroid/widget/TextView;

.field public j:Lv/VFrame;

.field public k:Lv/VEditText;

.field public l:Landroid/widget/TextView;

.field public m:Ll/gdn0;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public n:Ll/c0s;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public o:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public p:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 6
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .line 19
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v4, 0x6

    const/4 v5, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;IILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 6
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .line 15
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v4, 0x4

    const/4 v5, 0x0

    const/4 v3, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-direct/range {v0 .. v5}, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;IILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 16
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 17
    const-string p1, ""

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->o:Ljava/lang/String;

    .line 18
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->p:Ljava/lang/String;

    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;IILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 1
    and-int/lit8 p5, p4, 0x2

    .line 2
    .line 3
    if-eqz p5, :cond_0

    .line 4
    .line 5
    const/4 p2, 0x0

    .line 6
    :cond_0
    and-int/lit8 p4, p4, 0x4

    .line 7
    .line 8
    if-eqz p4, :cond_1

    .line 9
    .line 10
    const/4 p3, 0x0

    .line 11
    :cond_1
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static h0(Landroid/view/View;)V
    .locals 0

    .line 1
    const-string p0, "\u5ba1\u6838\u4e2d\u4e0d\u53ef\u4ee5\u4fee\u6539"

    .line 2
    .line 3
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static i0(Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;Ljava/lang/Boolean;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->t0(ZI)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static j0(Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->p:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->get_input_notice_text()Lv/VEditText;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1, v0}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-nez p1, :cond_1

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->get_input_notice_text()Lv/VEditText;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->p:Ljava/lang/String;

    .line 33
    .line 34
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->m:Ll/gdn0;

    .line 35
    .line 36
    if-eqz p1, :cond_0

    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->get_input_notice_text()Lv/VEditText;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p1, p0}, Ll/gdn0;->O3(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    :cond_0
    return-void

    .line 54
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->r0()V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public static k0(Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->get_input_notice_text()Lv/VEditText;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static l0(Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->r0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final synthetic o0(Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->setCompleteBtnStyle(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final r()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->n:Ll/c0s;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/c0s;

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->m:Ll/gdn0;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-static {v2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 18
    .line 19
    .line 20
    const/4 v3, 0x0

    .line 21
    invoke-virtual {p0, v2, v3}, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->n0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-direct {v0, v1, v2}, Ll/c0s;-><init>(Ll/xzs;Landroid/view/View;)V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->n:Ll/c0s;

    .line 29
    .line 30
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->u0()V

    .line 31
    .line 32
    .line 33
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->get_input_notice_text()Lv/VEditText;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->p:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->get_input_notice_text()Lv/VEditText;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->get_input_notice_text()Lv/VEditText;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setSelection(I)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->m:Ll/gdn0;

    .line 62
    .line 63
    const/4 v1, 0x1

    .line 64
    if-eqz v0, :cond_1

    .line 65
    .line 66
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    check-cast v0, Ll/rwn0;

    .line 71
    .line 72
    if-eqz v0, :cond_1

    .line 73
    .line 74
    invoke-virtual {v0}, Ll/rwn0;->i3()Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    if-ne v0, v1, :cond_1

    .line 79
    .line 80
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->get_input_notice_text()Lv/VEditText;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    const-string v2, "\u4ecb\u7ecd\u672c\u7fa4\u89c4\u5219\u548c\u73a9\u6cd5\uff0c\u8ba9\u66f4\u591a\u4eba\u53c2\u4e0e\u8fdb\u6765"

    .line 85
    .line 86
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 87
    .line 88
    .line 89
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->get_can_input_num()Landroid/widget/TextView;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->p:Ljava/lang/String;

    .line 94
    .line 95
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 96
    .line 97
    .line 98
    move-result v2

    .line 99
    rsub-int v2, v2, 0x3e8

    .line 100
    .line 101
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 106
    .line 107
    .line 108
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->p:Ljava/lang/String;

    .line 109
    .line 110
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->setCompleteBtnStyle(Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->get_title()Landroid/widget/TextView;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    sget v2, Ll/n9c0;->p1:I

    .line 118
    .line 119
    invoke-static {v2}, Ll/n3d0;->a(I)I

    .line 120
    .line 121
    .line 122
    move-result v2

    .line 123
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 131
    .line 132
    .line 133
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->get_can_input_num()Landroid/widget/TextView;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    sget v2, Ll/n9c0;->j1:I

    .line 138
    .line 139
    invoke-static {v2}, Ll/n3d0;->a(I)I

    .line 140
    .line 141
    .line 142
    move-result v2

    .line 143
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->get_input_notice_text()Lv/VEditText;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    sget v1, Ll/n9c0;->p1:I

    .line 158
    .line 159
    invoke-static {v1}, Ll/n3d0;->a(I)I

    .line 160
    .line 161
    .line 162
    move-result v1

    .line 163
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 164
    .line 165
    .line 166
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->get_input_notice_text()Lv/VEditText;

    .line 167
    .line 168
    .line 169
    move-result-object p0

    .line 170
    sget v0, Ll/n9c0;->j1:I

    .line 171
    .line 172
    invoke-static {v0}, Ll/n3d0;->a(I)I

    .line 173
    .line 174
    .line 175
    move-result v0

    .line 176
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setHintTextColor(I)V

    .line 177
    .line 178
    .line 179
    return-void
.end method

.method private final setCompleteBtnStyle(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->get_complete_update()Landroid/widget/TextView;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    sget v0, Ll/obc0;->h8:I

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->get_complete_update()Landroid/widget/TextView;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    sget v0, Ll/n9c0;->j1:I

    .line 21
    .line 22
    invoke-static {v0}, Ll/n3d0;->a(I)I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->get_complete_update()Landroid/widget/TextView;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const/4 p1, 0x0

    .line 34
    invoke-virtual {p0, p1}, Landroid/view/View;->setClickable(Z)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->get_complete_update()Landroid/widget/TextView;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    sget v0, Ll/n9c0;->e1:I

    .line 43
    .line 44
    invoke-static {v0}, Ll/n3d0;->a(I)I

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->get_complete_update()Landroid/widget/TextView;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    sget v0, Ll/obc0;->g8:I

    .line 56
    .line 57
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->get_complete_update()Landroid/widget/TextView;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    const/4 p1, 0x1

    .line 65
    invoke-virtual {p0, p1}, Landroid/view/View;->setClickable(Z)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method private final u0()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->get_empty()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/xcn0;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/xcn0;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->m:Ll/gdn0;

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    new-instance v1, Landroid/view/View;

    .line 24
    .line 25
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-direct {v1, v2}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->get_input_notice_text()Lv/VEditText;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    new-instance v3, Ll/ycn0;

    .line 37
    .line 38
    invoke-direct {v3, p0}, Ll/ycn0;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, v1, v2, v3}, Lcom/p1/mobile/android/app/Act;->setUpKeyboardDetectorLayout(Landroid/view/View;Landroid/view/View;Ll/z20;)Landroid/view/View;

    .line 42
    .line 43
    .line 44
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->get_complete_update()Landroid/widget/TextView;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    new-instance v1, Ll/zcn0;

    .line 49
    .line 50
    invoke-direct {v1, p0}, Ll/zcn0;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;)V

    .line 51
    .line 52
    .line 53
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->get_input_notice_text()Lv/VEditText;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    new-instance v1, Ll/adn0;

    .line 61
    .line 62
    invoke-direct {v1, p0}, Ll/adn0;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->get_input_notice_text()Lv/VEditText;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    new-instance v1, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog$a;

    .line 73
    .line 74
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 78
    .line 79
    .line 80
    return-void
.end method


# virtual methods
.method public bridge synthetic C0()Landroid/content/Context;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->q0()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public final get_can_input_num()Landroid/widget/TextView;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->i:Landroid/widget/TextView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_can_input_num"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final get_complete_update()Landroid/widget/TextView;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->l:Landroid/widget/TextView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_complete_update"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final get_container()Landroid/widget/RelativeLayout;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->g:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_container"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final get_edit_layout()Lv/VFrame;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->j:Lv/VFrame;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_edit_layout"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final get_empty()Landroid/view/View;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->e:Landroid/view/View;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_empty"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final get_empty_anchor()Landroid/view/View;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->f:Landroid/view/View;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_empty_anchor"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final get_input_notice_text()Lv/VEditText;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->k:Lv/VEditText;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_input_notice_text"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final get_root()Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->d:Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_root"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final get_title()Landroid/widget/TextView;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->h:Landroid/widget/TextView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "_title"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/gdn0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->p0(Ll/gdn0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->s0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Ljava/lang/Void;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Landroid/view/View;

    .line 6
    .line 7
    return-object p0
.end method

.method public final m0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/bdn0;->a(Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final n0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0
    .param p1    # Landroid/view/LayoutInflater;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/view/ViewGroup;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {p0, p1, p2}, Ll/bdn0;->b(Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->m0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public p0(Ll/gdn0;)V
    .locals 0
    .param p1    # Ll/gdn0;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->m:Ll/gdn0;

    .line 2
    .line 3
    return-void
.end method

.method public q0()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->m:Ll/gdn0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public final r0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->n:Ll/c0s;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->m:Ll/gdn0;

    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->get_input_notice_text()Lv/VEditText;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->hideInput(Landroid/view/View;)Z

    .line 29
    .line 30
    .line 31
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->n:Ll/c0s;

    .line 32
    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 36
    .line 37
    .line 38
    :cond_1
    const-string v0, ""

    .line 39
    .line 40
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->o:Ljava/lang/String;

    .line 41
    .line 42
    return-void
.end method

.method public s0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Ljava/lang/Void;
    .locals 0
    .param p1    # Landroid/view/LayoutInflater;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Landroid/view/ViewGroup;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method

.method public final setCheckSuccessToCache(Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->p:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public final setConfirmBtnStatus(Ljava/lang/String;)V
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->o:Ljava/lang/String;

    .line 5
    .line 6
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->isStatePending(Ljava/lang/String;)Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->get_complete_update()Landroid/widget/TextView;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    const-string v0, "\u5ba1\u6838\u4e2d"

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->get_complete_update()Landroid/widget/TextView;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    const/4 v0, 0x0

    .line 26
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->get_edit_layout()Lv/VFrame;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    new-instance v0, Ll/wcn0;

    .line 34
    .line 35
    invoke-direct {v0}, Ll/wcn0;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p1, v0}, Lv/VFrame;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->get_complete_update()Landroid/widget/TextView;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    sget v0, Ll/obc0;->e7:I

    .line 46
    .line 47
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->get_complete_update()Landroid/widget/TextView;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    const-string p1, "#66FFFFFF"

    .line 55
    .line 56
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->get_complete_update()Landroid/widget/TextView;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    const/4 v0, 0x1

    .line 69
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->get_complete_update()Landroid/widget/TextView;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    const-string v0, "\u786e\u8ba4"

    .line 77
    .line 78
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->get_edit_layout()Lv/VFrame;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    const/4 v0, 0x0

    .line 86
    invoke-virtual {p1, v0}, Lv/VFrame;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->get_complete_update()Landroid/widget/TextView;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    sget v0, Ll/obc0;->g8:I

    .line 94
    .line 95
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->get_complete_update()Landroid/widget/TextView;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    const-string p1, "#FFFFFF"

    .line 103
    .line 104
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 105
    .line 106
    .line 107
    move-result p1

    .line 108
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 109
    .line 110
    .line 111
    return-void
.end method

.method public final set_can_input_num(Landroid/widget/TextView;)V
    .locals 0
    .param p1    # Landroid/widget/TextView;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->i:Landroid/widget/TextView;

    .line 5
    .line 6
    return-void
.end method

.method public final set_complete_update(Landroid/widget/TextView;)V
    .locals 0
    .param p1    # Landroid/widget/TextView;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->l:Landroid/widget/TextView;

    .line 5
    .line 6
    return-void
.end method

.method public final set_container(Landroid/widget/RelativeLayout;)V
    .locals 0
    .param p1    # Landroid/widget/RelativeLayout;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->g:Landroid/widget/RelativeLayout;

    .line 5
    .line 6
    return-void
.end method

.method public final set_edit_layout(Lv/VFrame;)V
    .locals 0
    .param p1    # Lv/VFrame;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->j:Lv/VFrame;

    .line 5
    .line 6
    return-void
.end method

.method public final set_empty(Landroid/view/View;)V
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->e:Landroid/view/View;

    .line 5
    .line 6
    return-void
.end method

.method public final set_empty_anchor(Landroid/view/View;)V
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->f:Landroid/view/View;

    .line 5
    .line 6
    return-void
.end method

.method public final set_input_notice_text(Lv/VEditText;)V
    .locals 0
    .param p1    # Lv/VEditText;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->k:Lv/VEditText;

    .line 5
    .line 6
    return-void
.end method

.method public final set_root(Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->d:Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;

    .line 5
    .line 6
    return-void
.end method

.method public final set_title(Landroid/widget/TextView;)V
    .locals 0
    .param p1    # Landroid/widget/TextView;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->h:Landroid/widget/TextView;

    .line 5
    .line 6
    return-void
.end method

.method public final t0(ZI)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->get_root()Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    int-to-float p1, p2

    .line 8
    neg-float p1, p1

    .line 9
    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationY(F)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->get_root()Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const/4 p1, 0x0

    .line 18
    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationY(F)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final v0(Ljava/lang/String;)V
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->p:Ljava/lang/String;

    .line 5
    .line 6
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->p:Ljava/lang/String;

    .line 19
    .line 20
    :cond_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->r()V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->n:Ll/c0s;

    .line 24
    .line 25
    if-eqz p1, :cond_1

    .line 26
    .line 27
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1}, Landroid/app/Dialog;->isShowing()Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-nez p1, :cond_1

    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->n:Ll/c0s;

    .line 37
    .line 38
    if-eqz p0, :cond_1

    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->show()V

    .line 41
    .line 42
    .line 43
    :cond_1
    return-void
.end method

.method public final w0(Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->p:Ljava/lang/String;

    .line 5
    .line 6
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->r()V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->n:Ll/c0s;

    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/app/Dialog;->isShowing()Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-nez p1, :cond_0

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/basebuild/notice/VoiceEditNoticeDialog;->n:Ll/c0s;

    .line 23
    .line 24
    if-eqz p0, :cond_0

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->show()V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method
