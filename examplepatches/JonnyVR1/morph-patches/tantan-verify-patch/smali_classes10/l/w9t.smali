.class public final synthetic Ll/w9t;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/eat;


# direct methods
.method public synthetic constructor <init>(Ll/eat;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/w9t;->a:Ll/eat;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w9t;->a:Ll/eat;

    check-cast p1, Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus;

    invoke-static {p0, p1}, Ll/eat;->P3(Ll/eat;Lcom/p1/mobile/longlink/msg/mln/OfficialShowMessage$OfficialShowUpdateStatus;)V

    return-void
.end method
