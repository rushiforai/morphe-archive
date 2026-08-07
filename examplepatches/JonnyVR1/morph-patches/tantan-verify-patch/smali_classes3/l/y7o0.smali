.class public final synthetic Ll/y7o0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/z7o0;

.field public final synthetic b:Ll/psn0;


# direct methods
.method public synthetic constructor <init>(Ll/z7o0;Ll/psn0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/y7o0;->a:Ll/z7o0;

    iput-object p2, p0, Ll/y7o0;->b:Ll/psn0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/y7o0;->a:Ll/z7o0;

    iget-object p0, p0, Ll/y7o0;->b:Ll/psn0;

    check-cast p1, Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    invoke-static {v0, p0, p1}, Ll/z7o0;->a4(Ll/z7o0;Ll/psn0;Lcom/p1/mobile/putong/live/base/bean/LivingUsers;)V

    return-void
.end method
