.class public final synthetic Ll/v1t;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/z1t;


# direct methods
.method public synthetic constructor <init>(Ll/z1t;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/v1t;->a:Ll/z1t;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v1t;->a:Ll/z1t;

    check-cast p1, Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowJump;

    invoke-static {p0, p1}, Ll/z1t;->M3(Ll/z1t;Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowJump;)V

    return-void
.end method
