.class public final synthetic Ll/bit0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/bft0;

.field public final synthetic b:Ljava/util/Map;


# direct methods
.method public synthetic constructor <init>(Ll/bft0;Ljava/util/Map;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/bit0;->a:Ll/bft0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/bit0;->b:Ljava/util/Map;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    sget v0, Ll/fit0;->w:I

    .line 2
    .line 3
    iget-object v0, p0, Ll/bit0;->a:Ll/bft0;

    .line 4
    .line 5
    const-string v1, "onGcacheInfoEvent"

    .line 6
    .line 7
    iget-object p0, p0, Ll/bit0;->b:Ljava/util/Map;

    .line 8
    .line 9
    invoke-interface {v0, v1, p0}, Ll/kts0;->Z(Ljava/lang/String;Ljava/util/Map;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
