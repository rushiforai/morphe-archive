.class public final synthetic Ll/awm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;

.field public final synthetic b:Ljava/util/ArrayList;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/awm;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;

    iput-object p2, p0, Ll/awm;->b:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/awm;->a:Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;

    iget-object p0, p0, Ll/awm;->b:Ljava/util/ArrayList;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;->n2(Lcom/p1/mobile/putong/feed/newui/mediapicker/InstaLikePickerAct;Ljava/util/ArrayList;)V

    return-void
.end method
