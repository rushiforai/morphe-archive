.class public final synthetic Ll/sz50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/c060;


# direct methods
.method public synthetic constructor <init>(Ll/c060;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sz50;->a:Ll/c060;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sz50;->a:Ll/c060;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;

    invoke-static {p0, p1}, Ll/c060;->T3(Ll/c060;Lcom/p1/mobile/putong/live/base/data/BLiveOperationItem;)V

    return-void
.end method
