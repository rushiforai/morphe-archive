.class public final synthetic Ll/hcn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/location/Location;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/location/Location;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hcn;->a:Lcom/p1/mobile/putong/location/Location;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hcn;->a:Lcom/p1/mobile/putong/location/Location;

    check-cast p1, Lcom/p1/mobile/putong/core/util/CityAreaScope;

    invoke-static {p0, p1}, Ll/rcn;->m(Lcom/p1/mobile/putong/location/Location;Lcom/p1/mobile/putong/core/util/CityAreaScope;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
