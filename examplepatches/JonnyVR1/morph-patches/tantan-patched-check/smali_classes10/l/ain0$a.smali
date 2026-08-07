.class public Ll/ain0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ain0;->j(Lcom/p1/mobile/android/app/Act;Lcom/tantan/live/eventbus/LiveEventBus;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Lcom/tantan/live/eventbus/LiveEventBus;

.field public final synthetic c:Ll/ain0;


# direct methods
.method public constructor <init>(Ll/ain0;ILcom/tantan/live/eventbus/LiveEventBus;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/ain0$a;->c:Ll/ain0;

    .line 2
    .line 3
    iput p2, p0, Ll/ain0$a;->a:I

    .line 4
    .line 5
    iput-object p3, p0, Ll/ain0$a;->b:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ain0$a;->c:Ll/ain0;

    .line 2
    .line 3
    iget v1, p0, Ll/ain0$a;->a:I

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/ain0;->b(Ll/ain0;I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/ain0$a;->b:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceGameChangeEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceGameChangeEvent;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceGameChangeEvent;->startVoiceGame()Ll/v3f$d;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget p0, p0, Ll/ain0$a;->a:I

    .line 17
    .line 18
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {v0, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method
