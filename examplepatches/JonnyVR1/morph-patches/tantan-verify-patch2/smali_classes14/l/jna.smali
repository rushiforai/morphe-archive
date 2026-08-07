.class public final synthetic Ll/jna;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/yna;


# direct methods
.method public synthetic constructor <init>(Ll/yna;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jna;->a:Ll/yna;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jna;->a:Ll/yna;

    invoke-static {p0}, Ll/yna;->l3(Ll/yna;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
