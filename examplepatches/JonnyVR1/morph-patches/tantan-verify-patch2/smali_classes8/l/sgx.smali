.class public final synthetic Ll/sgx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/ugx;


# direct methods
.method public synthetic constructor <init>(Ll/ugx;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sgx;->a:Ll/ugx;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sgx;->a:Ll/ugx;

    invoke-static {p0}, Ll/ugx;->a(Ll/ugx;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
