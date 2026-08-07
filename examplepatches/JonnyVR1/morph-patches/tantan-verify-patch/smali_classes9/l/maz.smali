.class public final synthetic Ll/maz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ljava/util/ArrayList;

.field public final synthetic b:Ll/clz;


# direct methods
.method public synthetic constructor <init>(Ljava/util/ArrayList;Ll/clz;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/maz;->a:Ljava/util/ArrayList;

    iput-object p2, p0, Ll/maz;->b:Ll/clz;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/maz;->a:Ljava/util/ArrayList;

    iget-object p0, p0, Ll/maz;->b:Ll/clz;

    invoke-static {v0, p0}, Ll/nbz;->c2(Ljava/util/ArrayList;Ll/clz;)V

    return-void
.end method
