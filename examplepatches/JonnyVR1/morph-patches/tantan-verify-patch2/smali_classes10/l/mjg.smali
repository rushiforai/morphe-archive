.class public final synthetic Ll/mjg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/sjg;


# direct methods
.method public synthetic constructor <init>(Ll/sjg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mjg;->a:Ll/sjg;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mjg;->a:Ll/sjg;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;

    invoke-static {p0, p1}, Ll/sjg;->u4(Ll/sjg;Lcom/p1/mobile/putong/live/base/data/BLiveData;)V

    return-void
.end method
