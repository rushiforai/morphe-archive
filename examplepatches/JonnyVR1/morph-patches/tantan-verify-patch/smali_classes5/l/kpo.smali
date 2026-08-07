.class public final synthetic Ll/kpo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/eqo;


# direct methods
.method public synthetic constructor <init>(Ll/eqo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kpo;->a:Ll/eqo;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kpo;->a:Ll/eqo;

    check-cast p1, Lcom/p1/mobile/putong/location/Location;

    invoke-static {p0, p1}, Ll/eqo;->g(Ll/eqo;Lcom/p1/mobile/putong/location/Location;)V

    return-void
.end method
