.class public final synthetic Ll/obn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/mdk;

.field public final synthetic b:Ll/fzq;


# direct methods
.method public synthetic constructor <init>(Ll/mdk;Ll/fzq;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/obn;->a:Ll/mdk;

    iput-object p2, p0, Ll/obn;->b:Ll/fzq;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/obn;->a:Ll/mdk;

    iget-object p0, p0, Ll/obn;->b:Ll/fzq;

    check-cast p1, Ll/uxj0;

    invoke-static {v0, p0, p1}, Ll/qbn;->M(Ll/mdk;Ll/fzq;Ll/uxj0;)V

    return-void
.end method
