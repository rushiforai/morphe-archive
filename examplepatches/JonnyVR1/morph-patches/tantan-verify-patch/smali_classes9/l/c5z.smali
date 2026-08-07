.class public final synthetic Ll/c5z;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/clz;


# direct methods
.method public synthetic constructor <init>(Ll/clz;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/c5z;->a:Ll/clz;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/c5z;->a:Ll/clz;

    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreData;

    invoke-static {p0, p1}, Ll/nbz;->z(Ll/clz;Lcom/p1/mobile/putong/core/data/CoreData;)V

    return-void
.end method
