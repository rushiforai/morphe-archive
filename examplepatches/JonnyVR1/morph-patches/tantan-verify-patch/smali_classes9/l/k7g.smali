.class public final synthetic Ll/k7g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ll/cm0;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ll/cm0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/k7g;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/k7g;->b:Ll/cm0;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/k7g;->a:Ljava/lang/String;

    iget-object p0, p0, Ll/k7g;->b:Ll/cm0;

    invoke-static {v0, p0}, Ll/x7g;->e(Ljava/lang/String;Ll/cm0;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
