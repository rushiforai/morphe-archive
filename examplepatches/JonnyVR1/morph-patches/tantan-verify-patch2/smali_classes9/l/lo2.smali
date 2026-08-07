.class public final synthetic Ll/lo2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/oo2;

.field public final synthetic b:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Ll/oo2;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lo2;->a:Ll/oo2;

    iput-object p2, p0, Ll/lo2;->b:Ll/x20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/lo2;->a:Ll/oo2;

    iget-object p0, p0, Ll/lo2;->b:Ll/x20;

    check-cast p1, Lcom/p1/mobile/putong/data/Followship;

    invoke-static {v0, p0, p1}, Ll/oo2;->z(Ll/oo2;Ll/x20;Lcom/p1/mobile/putong/data/Followship;)V

    return-void
.end method
