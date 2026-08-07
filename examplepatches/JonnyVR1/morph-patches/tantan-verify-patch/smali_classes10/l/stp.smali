.class public final synthetic Ll/stp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/utp;

.field public final synthetic b:Ll/xup;


# direct methods
.method public synthetic constructor <init>(Ll/utp;Ll/xup;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/stp;->a:Ll/utp;

    iput-object p2, p0, Ll/stp;->b:Ll/xup;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/stp;->a:Ll/utp;

    iget-object p0, p0, Ll/stp;->b:Ll/xup;

    check-cast p1, Ljava/util/List;

    invoke-static {v0, p0, p1}, Ll/utp;->n0(Ll/utp;Ll/xup;Ljava/util/List;)V

    return-void
.end method
