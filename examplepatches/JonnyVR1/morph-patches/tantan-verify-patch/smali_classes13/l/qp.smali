.class public final synthetic Ll/qp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/wp;


# direct methods
.method public synthetic constructor <init>(Ll/wp;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qp;->a:Ll/wp;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qp;->a:Ll/wp;

    invoke-static {p0}, Ll/wp;->i(Ll/wp;)V

    return-void
.end method
