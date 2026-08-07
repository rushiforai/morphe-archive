.class public final synthetic Ll/neh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Ljava/util/ArrayList;

.field public final synthetic c:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/neh;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/neh;->b:Ljava/util/ArrayList;

    iput-object p3, p0, Ll/neh;->c:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/neh;->a:Lcom/p1/mobile/android/app/Act;

    iget-object v1, p0, Ll/neh;->b:Ljava/util/ArrayList;

    iget-object p0, p0, Ll/neh;->c:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    invoke-static {v0, v1, p0}, Ll/peh;->g(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;)Ljava/util/ArrayList;

    move-result-object p0

    return-object p0
.end method
