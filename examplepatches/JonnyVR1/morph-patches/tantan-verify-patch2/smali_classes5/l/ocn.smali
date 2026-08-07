.class public final synthetic Ll/ocn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/util/CityAreaScope;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/core/util/CityAreaScope;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ocn;->a:Lcom/p1/mobile/putong/core/util/CityAreaScope;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ocn;->a:Lcom/p1/mobile/putong/core/util/CityAreaScope;

    check-cast p1, Lcom/p1/mobile/putong/location/Location;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/util/CityAreaScope;->cover(Lcom/p1/mobile/putong/location/Location;)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
