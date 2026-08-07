.class public final synthetic Ll/kvl0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/qvl0;


# direct methods
.method public synthetic constructor <init>(Ll/qvl0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kvl0;->a:Ll/qvl0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kvl0;->a:Ll/qvl0;

    check-cast p1, Lcom/p1/mobile/putong/location/Location;

    invoke-static {p0, p1}, Ll/qvl0;->t0(Ll/qvl0;Lcom/p1/mobile/putong/location/Location;)V

    return-void
.end method
