.class public final synthetic Ll/r3a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ljava/util/ArrayList;

.field public final synthetic b:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ljava/util/ArrayList;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/r3a;->a:Ljava/util/ArrayList;

    iput-object p2, p0, Ll/r3a;->b:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/r3a;->a:Ljava/util/ArrayList;

    iget-object p0, p0, Ll/r3a;->b:Ljava/util/List;

    check-cast p1, Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, p0, p1}, Ll/f4a;->j3(Ljava/util/ArrayList;Ljava/util/List;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method
