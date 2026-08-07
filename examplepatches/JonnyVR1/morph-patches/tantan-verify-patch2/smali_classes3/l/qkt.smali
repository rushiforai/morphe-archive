.class public final synthetic Ll/qkt;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lrx/subjects/a;

.field public final synthetic b:Ll/gcg0;


# direct methods
.method public synthetic constructor <init>(Lrx/subjects/a;Ll/gcg0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qkt;->a:Lrx/subjects/a;

    iput-object p2, p0, Ll/qkt;->b:Ll/gcg0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qkt;->a:Lrx/subjects/a;

    iget-object p0, p0, Ll/qkt;->b:Ll/gcg0;

    check-cast p1, Lcom/tantanapp/sharedlibrary/loader/LoadEvent;

    invoke-static {v0, p0, p1}, Ll/elt;->c(Lrx/subjects/a;Ll/gcg0;Lcom/tantanapp/sharedlibrary/loader/LoadEvent;)V

    return-void
.end method
