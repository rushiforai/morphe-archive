.class public final synthetic Ll/o2u;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/p2u;


# direct methods
.method public synthetic constructor <init>(Ll/p2u;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/o2u;->a:Ll/p2u;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/o2u;->a:Ll/p2u;

    invoke-static {p0}, Ll/p2u;->l(Ll/p2u;)Ll/nus;

    move-result-object p0

    return-object p0
.end method
