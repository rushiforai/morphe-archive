.class public final synthetic Ll/fp0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/ip0;


# direct methods
.method public synthetic constructor <init>(Ll/ip0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fp0;->a:Ll/ip0;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fp0;->a:Ll/ip0;

    invoke-static {p0}, Ll/ip0;->l(Ll/ip0;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
