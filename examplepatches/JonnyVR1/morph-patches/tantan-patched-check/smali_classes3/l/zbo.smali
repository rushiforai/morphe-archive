.class public final synthetic Ll/zbo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/txw;


# direct methods
.method public synthetic constructor <init>(Ll/txw;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zbo;->a:Ll/txw;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zbo;->a:Ll/txw;

    check-cast p1, Lcom/p1/mobile/putong/core/map/IntlMapFragment$a;

    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/map/IntlMapFragment;->Z3(Ll/txw;Lcom/p1/mobile/putong/core/map/IntlMapFragment$a;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
