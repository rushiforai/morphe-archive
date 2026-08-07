.class public final synthetic Ll/kro0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

.field public final synthetic b:Lcom/p1/mobile/putong/live/external/intl/voicesquare/common/VoiceRoomSquareCommonViewModel;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;Lcom/p1/mobile/putong/live/external/intl/voicesquare/common/VoiceRoomSquareCommonViewModel;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kro0;->a:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    iput-object p2, p0, Ll/kro0;->b:Lcom/p1/mobile/putong/live/external/intl/voicesquare/common/VoiceRoomSquareCommonViewModel;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/kro0;->a:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    iget-object p0, p0, Ll/kro0;->b:Lcom/p1/mobile/putong/live/external/intl/voicesquare/common/VoiceRoomSquareCommonViewModel;

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/live/external/intl/voicesquare/common/VoiceRoomSquareCommonViewModel;->i(Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;Lcom/p1/mobile/putong/live/external/intl/voicesquare/common/VoiceRoomSquareCommonViewModel;I)V

    return-void
.end method
