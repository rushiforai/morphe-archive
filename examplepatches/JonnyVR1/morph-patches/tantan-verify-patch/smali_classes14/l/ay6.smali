.class public final synthetic Ll/ay6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/GeoLocation;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/GeoLocation;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ay6;->a:Lcom/p1/mobile/putong/data/GeoLocation;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ay6;->a:Lcom/p1/mobile/putong/data/GeoLocation;

    invoke-static {p0}, Lcom/p1/mobile/putong/core/api/c;->c3(Lcom/p1/mobile/putong/data/GeoLocation;)Ll/x1d0;

    move-result-object p0

    return-object p0
.end method
