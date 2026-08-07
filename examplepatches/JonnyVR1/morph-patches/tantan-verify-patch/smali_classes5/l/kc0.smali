.class public final synthetic Ll/kc0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/pc0;


# direct methods
.method public synthetic constructor <init>(Ll/pc0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kc0;->a:Ll/pc0;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kc0;->a:Ll/pc0;

    invoke-static {p0}, Ll/pc0;->m(Ll/pc0;)Ljava/lang/Double;

    move-result-object p0

    return-object p0
.end method
