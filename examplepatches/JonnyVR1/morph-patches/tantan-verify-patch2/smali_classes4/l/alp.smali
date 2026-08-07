.class public final synthetic Ll/alp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/clp;

.field public final synthetic b:Ll/rfh0$a;


# direct methods
.method public synthetic constructor <init>(Ll/clp;Ll/rfh0$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/alp;->a:Ll/clp;

    iput-object p2, p0, Ll/alp;->b:Ll/rfh0$a;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/alp;->a:Ll/clp;

    iget-object p0, p0, Ll/alp;->b:Ll/rfh0$a;

    invoke-static {v0, p0}, Ll/clp;->i(Ll/clp;Ll/rfh0$a;)V

    return-void
.end method
