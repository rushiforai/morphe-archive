.class public final synthetic Ll/lme;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/nme;


# direct methods
.method public synthetic constructor <init>(Ll/nme;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lme;->a:Ll/nme;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lme;->a:Ll/nme;

    invoke-static {p0}, Ll/nme;->S(Ll/nme;)V

    return-void
.end method
