.class public final synthetic Ll/c5j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/i5j;


# direct methods
.method public synthetic constructor <init>(Ll/i5j;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/c5j;->a:Ll/i5j;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c5j;->a:Ll/i5j;

    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;

    invoke-static {p0, p1}, Ll/i5j;->N3(Ll/i5j;Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;)V

    return-void
.end method
