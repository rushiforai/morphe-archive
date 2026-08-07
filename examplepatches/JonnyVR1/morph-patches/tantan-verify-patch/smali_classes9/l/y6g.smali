.class public final synthetic Ll/y6g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/x7g;


# direct methods
.method public synthetic constructor <init>(Ll/x7g;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/y6g;->a:Ll/x7g;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/y6g;->a:Ll/x7g;

    invoke-static {p0}, Ll/x7g;->j(Ll/x7g;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
