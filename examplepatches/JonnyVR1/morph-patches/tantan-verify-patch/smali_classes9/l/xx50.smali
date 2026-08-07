.class public final synthetic Ll/xx50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/fy50;


# direct methods
.method public synthetic constructor <init>(Ll/fy50;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xx50;->a:Ll/fy50;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xx50;->a:Ll/fy50;

    check-cast p1, Lcom/p1/mobile/putong/data/User;

    invoke-static {p0, p1}, Ll/fy50;->j0(Ll/fy50;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method
