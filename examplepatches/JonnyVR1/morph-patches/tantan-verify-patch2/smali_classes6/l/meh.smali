.class public final synthetic Ll/meh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/peh;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

.field public final synthetic d:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;


# direct methods
.method public synthetic constructor <init>(Ll/peh;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/meh;->a:Ll/peh;

    iput-object p2, p0, Ll/meh;->b:Lcom/p1/mobile/android/app/Act;

    iput-object p3, p0, Ll/meh;->c:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    iput-object p4, p0, Ll/meh;->d:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/meh;->a:Ll/peh;

    iget-object v1, p0, Ll/meh;->b:Lcom/p1/mobile/android/app/Act;

    iget-object v2, p0, Ll/meh;->c:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;

    iget-object p0, p0, Ll/meh;->d:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    check-cast p1, Ljava/util/ArrayList;

    invoke-static {v0, v1, v2, p0, p1}, Ll/peh;->i(Ll/peh;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;Ljava/util/ArrayList;)V

    return-void
.end method
