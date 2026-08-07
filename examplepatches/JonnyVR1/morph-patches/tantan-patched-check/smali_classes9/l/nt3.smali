.class public final synthetic Ll/nt3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/au3;


# direct methods
.method public synthetic constructor <init>(Ll/au3;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nt3;->a:Ll/au3;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nt3;->a:Ll/au3;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveMagicList;

    invoke-static {p0, p1}, Ll/au3;->D4(Ll/au3;Lcom/p1/mobile/putong/live/base/data/BLiveMagicList;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
