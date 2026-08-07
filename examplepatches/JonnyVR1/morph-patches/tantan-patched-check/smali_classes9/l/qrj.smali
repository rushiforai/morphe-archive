.class public final synthetic Ll/qrj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogSkinView;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Lv/VDraweeView;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogSkinView;Ljava/lang/String;Lv/VDraweeView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qrj;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogSkinView;

    iput-object p2, p0, Ll/qrj;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/qrj;->c:Lv/VDraweeView;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/qrj;->a:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogSkinView;

    iget-object v1, p0, Ll/qrj;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/qrj;->c:Lv/VDraweeView;

    invoke-static {v0, v1, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogSkinView;->d(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogSkinView;Ljava/lang/String;Lv/VDraweeView;)V

    return-void
.end method
