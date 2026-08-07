.class public final synthetic Ll/ljs;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/rjs;


# direct methods
.method public synthetic constructor <init>(Ll/rjs;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ljs;->a:Ll/rjs;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ljs;->a:Ll/rjs;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowTipsConfig;

    invoke-static {p0, p1}, Ll/rjs;->c(Ll/rjs;Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowTipsConfig;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0
.end method
