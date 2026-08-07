.class public final synthetic Ll/kjs;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/qjs;


# direct methods
.method public synthetic constructor <init>(Ll/qjs;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kjs;->a:Ll/qjs;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kjs;->a:Ll/qjs;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowTipsConfig;

    invoke-static {p0, p1}, Ll/qjs;->a(Ll/qjs;Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowTipsConfig;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0
.end method
