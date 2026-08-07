.class public final synthetic Ll/fdg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/z20;


# instance fields
.field public final synthetic a:Ll/hdg0;


# direct methods
.method public synthetic constructor <init>(Ll/hdg0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fdg0;->a:Ll/hdg0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fdg0;->a:Ll/hdg0;

    check-cast p1, Landroid/view/View;

    check-cast p2, Lcom/p1/mobile/putong/data/Contract;

    invoke-static {p0, p1, p2}, Ll/hdg0;->a(Ll/hdg0;Landroid/view/View;Lcom/p1/mobile/putong/data/Contract;)V

    return-void
.end method
