.class Lcom/immomo/audioeffect/AudioEffect$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/immomo/audioeffect/AudioEffect$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/audioeffect/AudioEffect;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field final synthetic a:Lcom/immomo/audioeffect/AudioEffect;


# direct methods
.method public constructor <init>(Lcom/immomo/audioeffect/AudioEffect;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/audioeffect/AudioEffect$a;->a:Lcom/immomo/audioeffect/AudioEffect;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a([BI)[B
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/immomo/audioeffect/AudioEffect$a;->a:Lcom/immomo/audioeffect/AudioEffect;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/immomo/audioeffect/AudioEffect;->ELC:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p0, v0, p1, p2}, Lcom/immomo/audioeffect/AudioEffect;->a(Lcom/immomo/audioeffect/AudioEffect;Ljava/lang/String;[BI)[B

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method
