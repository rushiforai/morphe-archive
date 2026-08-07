.class public final synthetic Ll/l6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Ll/n6;


# direct methods
.method public synthetic constructor <init>(Ll/n6;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/l6;->a:Ll/n6;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/l6;->a:Ll/n6;

    check-cast p1, Lcom/p1/mobile/putong/data/Picture$ImageUri;

    check-cast p2, Ljava/lang/Integer;

    invoke-static {p0, p1, p2}, Ll/n6;->c(Ll/n6;Lcom/p1/mobile/putong/data/Picture$ImageUri;Ljava/lang/Integer;)V

    return-void
.end method
