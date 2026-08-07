.class public final synthetic Ll/ykt;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$a;


# instance fields
.field public final synthetic a:Lrx/subjects/a;


# direct methods
.method public synthetic constructor <init>(Lrx/subjects/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ykt;->a:Lrx/subjects/a;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ykt;->a:Lrx/subjects/a;

    check-cast p1, Ll/gcg0;

    invoke-static {p0, p1}, Ll/elt;->b(Lrx/subjects/a;Ll/gcg0;)V

    return-void
.end method
