.class public final synthetic Ll/nsp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/btp;

.field public final synthetic b:Ll/xup;


# direct methods
.method public synthetic constructor <init>(Ll/btp;Ll/xup;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nsp;->a:Ll/btp;

    iput-object p2, p0, Ll/nsp;->b:Ll/xup;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/nsp;->a:Ll/btp;

    iget-object p0, p0, Ll/nsp;->b:Ll/xup;

    invoke-static {v0, p0}, Ll/btp;->u0(Ll/btp;Ll/xup;)V

    return-void
.end method
