.class public final synthetic Ll/od9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/yd9;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/yd9;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/od9;->a:Ll/yd9;

    iput-object p2, p0, Ll/od9;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/od9;->a:Ll/yd9;

    iget-object p0, p0, Ll/od9;->b:Ljava/lang/String;

    check-cast p1, Ljava/util/List;

    invoke-static {v0, p0, p1}, Ll/yd9;->d3(Ll/yd9;Ljava/lang/String;Ljava/util/List;)Lcom/p1/mobile/putong/core/data/RiskSelfData;

    move-result-object p0

    return-object p0
.end method
