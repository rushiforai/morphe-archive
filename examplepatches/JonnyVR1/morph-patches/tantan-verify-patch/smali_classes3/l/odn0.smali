.class public final synthetic Ll/odn0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/odn0;->a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;

    iput-object p2, p0, Ll/odn0;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/odn0;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/odn0;->a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;

    iget-object v1, p0, Ll/odn0;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/odn0;->c:Ljava/lang/String;

    invoke-static {v0, v1, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;->c(Lcom/p1/mobile/putong/live/livingroom/voice/intl/liveend/VoiceEndFireListItemView;Ljava/lang/String;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method
