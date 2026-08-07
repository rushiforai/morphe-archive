.class public final synthetic Ll/tc9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/cd9;


# direct methods
.method public synthetic constructor <init>(Ll/cd9;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tc9;->a:Ll/cd9;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tc9;->a:Ll/cd9;

    invoke-static {p0}, Ll/cd9;->l3(Ll/cd9;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
