.class public final synthetic Ll/ch0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Lcom/p1/mobile/putong/core/ui/messages/view/AiTranslateView;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Lcom/p1/mobile/putong/core/ui/messages/view/AiTranslateView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ch0;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/ch0;->b:Lcom/p1/mobile/putong/core/ui/messages/view/AiTranslateView;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ch0;->a:Ljava/lang/String;

    iget-object p0, p0, Ll/ch0;->b:Lcom/p1/mobile/putong/core/ui/messages/view/AiTranslateView;

    check-cast p1, Lcom/p1/mobile/putong/data/AiTranslateResultData;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/view/AiTranslateView;->P(Ljava/lang/String;Lcom/p1/mobile/putong/core/ui/messages/view/AiTranslateView;Lcom/p1/mobile/putong/data/AiTranslateResultData;)V

    return-void
.end method
