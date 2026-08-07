.class public final synthetic Ll/urp0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/wrp0;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/wrp0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/urp0;->a:Ll/wrp0;

    iput-object p2, p0, Ll/urp0;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/urp0;->a:Ll/wrp0;

    iget-object p0, p0, Ll/urp0;->b:Ljava/lang/String;

    check-cast p1, Lcom/p1/mobile/putong/data/AuthData;

    invoke-static {v0, p0, p1}, Ll/wrp0;->J3(Ll/wrp0;Ljava/lang/String;Lcom/p1/mobile/putong/data/AuthData;)V

    return-void
.end method
