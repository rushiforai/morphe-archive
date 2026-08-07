.class public final synthetic Ll/yx6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/c;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yx6;->a:Lcom/p1/mobile/putong/core/api/c;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yx6;->a:Lcom/p1/mobile/putong/core/api/c;

    check-cast p1, Lcom/p1/mobile/putong/location/Location;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/api/c;->d3(Lcom/p1/mobile/putong/core/api/c;Lcom/p1/mobile/putong/location/Location;)V

    return-void
.end method
