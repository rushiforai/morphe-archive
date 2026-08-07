.class public final synthetic Ll/nna;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/yna;

.field public final synthetic b:Ljava/util/HashMap;

.field public final synthetic c:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ll/yna;Ljava/util/HashMap;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nna;->a:Ll/yna;

    iput-object p2, p0, Ll/nna;->b:Ljava/util/HashMap;

    iput-object p3, p0, Ll/nna;->c:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/nna;->a:Ll/yna;

    iget-object v1, p0, Ll/nna;->b:Ljava/util/HashMap;

    iget-object p0, p0, Ll/nna;->c:Ljava/util/List;

    check-cast p1, Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, v1, p0, p1}, Ll/yna;->c3(Ll/yna;Ljava/util/HashMap;Ljava/util/List;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method
