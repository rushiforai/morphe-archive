.class public Ll/otk0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/j6e;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/otk0;->L4()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

.field public final synthetic b:Ll/otk0;


# direct methods
.method public constructor <init>(Ll/otk0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/otk0$a;->b:Ll/otk0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/otk0$a;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 1
    return-void
.end method

.method public b(Z)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/otk0$a;->b:Ll/otk0;

    .line 2
    .line 3
    new-instance v0, Ll/bzm0;

    .line 4
    .line 5
    invoke-direct {v0}, Ll/bzm0;-><init>()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/otk0$a;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ll/bzm0;->b(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Ll/bzm0;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    const-string v0, ""

    .line 15
    .line 16
    invoke-virtual {p1, p0, v0}, Ll/ztk0;->b4(Ll/bzm0;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public c()V
    .locals 0

    .line 1
    return-void
.end method
