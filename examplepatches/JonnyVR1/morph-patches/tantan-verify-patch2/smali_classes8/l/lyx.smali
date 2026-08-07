.class public final synthetic Ll/lyx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lyx;->a:Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lyx;->a:Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;

    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->c2(Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
