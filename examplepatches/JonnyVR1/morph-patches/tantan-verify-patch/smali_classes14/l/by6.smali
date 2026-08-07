.class public final synthetic Ll/by6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/api/c;

.field public final synthetic b:Lcom/p1/mobile/putong/location/Location;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/api/c;Lcom/p1/mobile/putong/location/Location;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/by6;->a:Lcom/p1/mobile/putong/core/api/c;

    iput-object p2, p0, Ll/by6;->b:Lcom/p1/mobile/putong/location/Location;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/by6;->a:Lcom/p1/mobile/putong/core/api/c;

    iget-object p0, p0, Ll/by6;->b:Lcom/p1/mobile/putong/location/Location;

    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {v0, p0, p1}, Lcom/p1/mobile/putong/core/api/c;->f3(Lcom/p1/mobile/putong/core/api/c;Lcom/p1/mobile/putong/location/Location;Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method
