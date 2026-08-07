.class public final synthetic Ll/bxp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/gxp;

.field public final synthetic b:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Ll/gxp;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bxp;->a:Ll/gxp;

    iput-object p2, p0, Ll/bxp;->b:Ll/x20;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bxp;->a:Ll/gxp;

    iget-object p0, p0, Ll/bxp;->b:Ll/x20;

    invoke-static {v0, p0}, Ll/gxp;->d(Ll/gxp;Ll/x20;)V

    return-void
.end method
