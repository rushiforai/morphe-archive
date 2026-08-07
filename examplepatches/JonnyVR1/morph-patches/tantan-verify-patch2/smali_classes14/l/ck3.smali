.class public final synthetic Ll/ck3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/fk3;


# direct methods
.method public synthetic constructor <init>(Ll/fk3;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ck3;->a:Ll/fk3;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ck3;->a:Ll/fk3;

    check-cast p1, Lcom/p1/mobile/putong/data/User;

    invoke-static {p0, p1}, Ll/fk3;->b(Ll/fk3;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method
