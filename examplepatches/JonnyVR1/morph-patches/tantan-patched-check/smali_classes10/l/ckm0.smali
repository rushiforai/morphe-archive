.class public final synthetic Ll/ckm0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/dlm0;


# direct methods
.method public synthetic constructor <init>(Ll/dlm0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ckm0;->a:Ll/dlm0;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ckm0;->a:Ll/dlm0;

    invoke-virtual {p0}, Ll/dlm0;->p4()Lrx/c;

    move-result-object p0

    return-object p0
.end method
