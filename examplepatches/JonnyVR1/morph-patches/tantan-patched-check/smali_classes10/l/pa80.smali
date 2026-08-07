.class public final synthetic Ll/pa80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/ra80;


# direct methods
.method public synthetic constructor <init>(Ll/ra80;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pa80;->a:Ll/ra80;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pa80;->a:Ll/ra80;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchors;

    invoke-static {p0, p1}, Ll/ra80;->r(Ll/ra80;Lcom/p1/mobile/putong/live/base/data/BLivePkSuggestAnchors;)Ll/ja80;

    move-result-object p0

    return-object p0
.end method
