.class public final synthetic Ll/pd50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ae50;


# direct methods
.method public synthetic constructor <init>(Ll/ae50;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pd50;->a:Ll/ae50;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pd50;->a:Ll/ae50;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;

    invoke-static {p0, p1}, Ll/ae50;->Y3(Ll/ae50;Lcom/p1/mobile/putong/live/base/data/BLiveAnchor;)V

    return-void
.end method
