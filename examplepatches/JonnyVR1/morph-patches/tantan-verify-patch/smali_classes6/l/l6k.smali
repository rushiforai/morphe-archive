.class public final synthetic Ll/l6k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/o6k;

.field public final synthetic b:Lcom/p1/mobile/putong/location/Location;


# direct methods
.method public synthetic constructor <init>(Ll/o6k;Lcom/p1/mobile/putong/location/Location;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l6k;->a:Ll/o6k;

    iput-object p2, p0, Ll/l6k;->b:Lcom/p1/mobile/putong/location/Location;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/l6k;->a:Ll/o6k;

    iget-object p0, p0, Ll/l6k;->b:Lcom/p1/mobile/putong/location/Location;

    check-cast p1, Ljava/util/List;

    invoke-static {v0, p0, p1}, Ll/o6k;->d(Ll/o6k;Lcom/p1/mobile/putong/location/Location;Ljava/util/List;)V

    return-void
.end method
