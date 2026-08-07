.class public final synthetic Ll/icp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Ll/jcp;


# direct methods
.method public synthetic constructor <init>(Ll/jcp;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/icp;->a:Ll/jcp;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/icp;->a:Ll/jcp;

    check-cast p1, Ljava/lang/Integer;

    check-cast p2, Lcom/p1/mobile/putong/data/User;

    invoke-static {p0, p1, p2}, Ll/jcp;->N(Ll/jcp;Ljava/lang/Integer;Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method
