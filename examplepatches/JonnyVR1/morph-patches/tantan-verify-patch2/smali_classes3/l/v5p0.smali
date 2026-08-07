.class public final synthetic Ll/v5p0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/e6p0;


# direct methods
.method public synthetic constructor <init>(Ll/e6p0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/v5p0;->a:Ll/e6p0;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v5p0;->a:Ll/e6p0;

    invoke-static {p0}, Ll/e6p0;->T(Ll/e6p0;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
