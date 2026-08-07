.class public final synthetic Ll/rt3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/au3;


# direct methods
.method public synthetic constructor <init>(Ll/au3;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rt3;->a:Ll/au3;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rt3;->a:Ll/au3;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;

    invoke-static {p0, p1}, Ll/au3;->p4(Ll/au3;Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;)V

    return-void
.end method
