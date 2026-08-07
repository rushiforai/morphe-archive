.class public final synthetic Ll/z9v;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Ll/bav;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareBean;


# direct methods
.method public synthetic constructor <init>(Ll/bav;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareBean;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/z9v;->a:Ll/bav;

    iput-object p2, p0, Ll/z9v;->b:Lcom/p1/mobile/android/app/Act;

    iput-object p3, p0, Ll/z9v;->c:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareBean;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/z9v;->a:Ll/bav;

    iget-object v1, p0, Ll/z9v;->b:Lcom/p1/mobile/android/app/Act;

    iget-object p0, p0, Ll/z9v;->c:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareBean;

    invoke-static {v0, v1, p0, p1}, Ll/bav;->a(Ll/bav;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceInternalSquareBean;Landroid/view/View;)V

    return-void
.end method
