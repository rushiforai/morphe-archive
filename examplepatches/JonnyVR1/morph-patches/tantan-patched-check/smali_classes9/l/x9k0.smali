.class public final synthetic Ll/x9k0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/tak0;


# direct methods
.method public synthetic constructor <init>(Ll/tak0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/x9k0;->a:Ll/tak0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x9k0;->a:Ll/tak0;

    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    invoke-virtual {p0, p1}, Ll/tak0;->g5(Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;)V

    return-void
.end method
