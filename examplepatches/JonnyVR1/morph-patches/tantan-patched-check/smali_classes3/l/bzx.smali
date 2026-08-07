.class public final synthetic Ll/bzx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;

.field public final synthetic b:Ll/bvx;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;Ll/bvx;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bzx;->a:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;

    iput-object p2, p0, Ll/bzx;->b:Ll/bvx;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bzx;->a:Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;

    iget-object p0, p0, Ll/bzx;->b:Ll/bvx;

    check-cast p1, Ljava/util/List;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;->l5(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerFrag;Ll/bvx;Ljava/util/List;)V

    return-void
.end method
