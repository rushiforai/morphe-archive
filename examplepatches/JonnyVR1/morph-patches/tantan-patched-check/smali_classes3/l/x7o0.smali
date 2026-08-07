.class public final synthetic Ll/x7o0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/z7o0;


# direct methods
.method public synthetic constructor <init>(Ll/z7o0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/x7o0;->a:Ll/z7o0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x7o0;->a:Ll/z7o0;

    check-cast p1, Ll/rsn0;

    invoke-static {p0, p1}, Ll/z7o0;->Y3(Ll/z7o0;Ll/rsn0;)Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    move-result-object p0

    return-object p0
.end method
