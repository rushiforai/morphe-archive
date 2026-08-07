.class public Ll/kje$b;
.super Lcom/tantan/library/svga/AnimListener;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/kje;->j(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/kje;


# direct methods
.method public constructor <init>(Ll/kje;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/kje$b;->a:Ll/kje;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/tantan/library/svga/AnimListener;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onFinished()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/tantan/library/svga/AnimListener;->onFinished()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/kje$b;->a:Ll/kje;

    .line 5
    .line 6
    invoke-static {v0}, Ll/kje;->b(Ll/kje;)I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    add-int/lit8 v1, v1, 0x1

    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/kje;->c(Ll/kje;I)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ll/kje$b;->a:Ll/kje;

    .line 16
    .line 17
    invoke-static {p0}, Ll/kje;->d(Ll/kje;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
