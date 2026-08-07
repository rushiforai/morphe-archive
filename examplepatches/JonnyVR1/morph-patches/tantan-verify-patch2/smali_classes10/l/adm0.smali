.class public final synthetic Ll/adm0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ddm0;


# direct methods
.method public synthetic constructor <init>(Ll/ddm0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/adm0;->a:Ll/ddm0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/adm0;->a:Ll/ddm0;

    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveSpecialFriendRelation;

    invoke-virtual {p0, p1}, Ll/ddm0;->l4(Lcom/p1/mobile/putong/live/base/data/BLiveSpecialFriendRelation;)V

    return-void
.end method
