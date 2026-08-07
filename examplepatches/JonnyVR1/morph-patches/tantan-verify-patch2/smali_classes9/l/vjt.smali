.class public final synthetic Ll/vjt;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/bkt;

.field public final synthetic b:Ll/isv;


# direct methods
.method public synthetic constructor <init>(Ll/bkt;Ll/isv;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vjt;->a:Ll/bkt;

    iput-object p2, p0, Ll/vjt;->b:Ll/isv;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/vjt;->a:Ll/bkt;

    iget-object p0, p0, Ll/vjt;->b:Ll/isv;

    check-cast p1, Ll/ubu;

    invoke-static {v0, p0, p1}, Ll/bkt;->l(Ll/bkt;Ll/isv;Ll/ubu;)V

    return-void
.end method
