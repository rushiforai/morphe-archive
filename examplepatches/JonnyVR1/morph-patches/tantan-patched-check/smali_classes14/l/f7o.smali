.class public final synthetic Ll/f7o;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/h7o;

.field public final synthetic b:Ll/z8o;


# direct methods
.method public synthetic constructor <init>(Ll/h7o;Ll/z8o;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/f7o;->a:Ll/h7o;

    iput-object p2, p0, Ll/f7o;->b:Ll/z8o;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/f7o;->a:Ll/h7o;

    iget-object p0, p0, Ll/f7o;->b:Ll/z8o;

    check-cast p1, Ljava/util/List;

    invoke-static {v0, p0, p1}, Ll/h7o;->d3(Ll/h7o;Ll/z8o;Ljava/util/List;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
