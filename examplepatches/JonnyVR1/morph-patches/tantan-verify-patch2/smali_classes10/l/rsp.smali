.class public final synthetic Ll/rsp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/btp;

.field public final synthetic b:Ll/xup;


# direct methods
.method public synthetic constructor <init>(Ll/btp;Ll/xup;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rsp;->a:Ll/btp;

    iput-object p2, p0, Ll/rsp;->b:Ll/xup;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rsp;->a:Ll/btp;

    iget-object p0, p0, Ll/rsp;->b:Ll/xup;

    check-cast p1, Ljava/util/List;

    invoke-static {v0, p0, p1}, Ll/btp;->m0(Ll/btp;Ll/xup;Ljava/util/List;)V

    return-void
.end method
