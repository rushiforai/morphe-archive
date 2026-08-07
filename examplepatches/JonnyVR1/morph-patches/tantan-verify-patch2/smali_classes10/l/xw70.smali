.class public final synthetic Ll/xw70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/ja80;


# direct methods
.method public synthetic constructor <init>(Ll/ja80;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xw70;->a:Ll/ja80;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xw70;->a:Ll/ja80;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchors;

    invoke-static {p0, p1}, Ll/gx70;->U3(Ll/ja80;Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchors;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
