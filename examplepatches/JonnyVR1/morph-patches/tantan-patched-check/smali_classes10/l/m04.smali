.class public final synthetic Ll/m04;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/o04;


# direct methods
.method public synthetic constructor <init>(Ll/o04;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/m04;->a:Ll/o04;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m04;->a:Ll/o04;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;

    invoke-static {p0, p1}, Ll/o04;->h4(Ll/o04;Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;)V

    return-void
.end method
