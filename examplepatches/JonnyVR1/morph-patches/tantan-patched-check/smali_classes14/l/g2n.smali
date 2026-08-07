.class public final synthetic Ll/g2n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/j2n;


# direct methods
.method public synthetic constructor <init>(Ll/j2n;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g2n;->a:Ll/j2n;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g2n;->a:Ll/j2n;

    invoke-static {p0}, Ll/j2n;->S2(Ll/j2n;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
