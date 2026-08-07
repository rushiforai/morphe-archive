.class public final synthetic Ll/ltu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/stu;


# direct methods
.method public synthetic constructor <init>(Ll/stu;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ltu;->a:Ll/stu;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ltu;->a:Ll/stu;

    check-cast p1, Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$MultiDevice;

    invoke-static {p0, p1}, Ll/stu;->e3(Ll/stu;Lcom/p1/mobile/longlink/msg/liveConnector/liveAuthMessageNew$MultiDevice;)V

    return-void
.end method
