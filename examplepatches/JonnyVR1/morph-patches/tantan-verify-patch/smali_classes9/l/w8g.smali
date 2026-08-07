.class public final synthetic Ll/w8g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/d9g;


# direct methods
.method public synthetic constructor <init>(Ll/d9g;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/w8g;->a:Ll/d9g;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w8g;->a:Ll/d9g;

    check-cast p1, Ll/e9g;

    invoke-static {p0, p1}, Ll/d9g;->a4(Ll/d9g;Ll/e9g;)Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    move-result-object p0

    return-object p0
.end method
