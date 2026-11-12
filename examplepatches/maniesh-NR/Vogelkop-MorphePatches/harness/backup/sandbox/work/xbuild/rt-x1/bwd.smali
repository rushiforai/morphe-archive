.class public final Lbwd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ly6f;


# instance fields
.field public final synthetic a:Ldwd;


# direct methods
.method public constructor <init>(Ldwd;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lbwd;->a:Ldwd;

    return-void
.end method


# virtual methods
.method public final a(Lhjm;)V
    .registers 3

    iget-object p1, p0, Lbwd;->a:Ldwd;

    iget-object v0, p1, Ldej;->a:Li7f;

    invoke-virtual {v0, p0}, Li7f;->c(Ljava/lang/Object;)Z

    invoke-virtual {p1}, Ldwd;->j()V

    return-void
.end method
