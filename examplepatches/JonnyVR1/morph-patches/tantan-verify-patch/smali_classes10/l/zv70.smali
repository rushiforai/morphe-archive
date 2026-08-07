.class public final synthetic Ll/zv70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/jw70;

.field public final synthetic b:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Ll/jw70;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zv70;->a:Ll/jw70;

    iput-object p2, p0, Ll/zv70;->b:Ll/y20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zv70;->a:Ll/jw70;

    iget-object p0, p0, Ll/zv70;->b:Ll/y20;

    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;

    invoke-static {v0, p0, p1}, Ll/jw70;->Y3(Ll/jw70;Ll/y20;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkFriendInfo;)V

    return-void
.end method
