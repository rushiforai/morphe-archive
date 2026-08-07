.class public final synthetic Ll/exw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/fxw;


# direct methods
.method public synthetic constructor <init>(Ll/fxw;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/exw;->a:Ll/fxw;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/exw;->a:Ll/fxw;

    check-cast p1, Lcom/p1/mobile/putong/location/Location;

    invoke-static {p0, p1}, Ll/fxw;->e0(Ll/fxw;Lcom/p1/mobile/putong/location/Location;)V

    return-void
.end method
