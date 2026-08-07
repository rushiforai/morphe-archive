.class public final synthetic Ll/wkp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/zkp;

.field public final synthetic b:Ll/rfh0$a;


# direct methods
.method public synthetic constructor <init>(Ll/zkp;Ll/rfh0$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wkp;->a:Ll/zkp;

    iput-object p2, p0, Ll/wkp;->b:Ll/rfh0$a;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wkp;->a:Ll/zkp;

    iget-object p0, p0, Ll/wkp;->b:Ll/rfh0$a;

    invoke-static {v0, p0}, Ll/zkp;->k(Ll/zkp;Ll/rfh0$a;)V

    return-void
.end method
