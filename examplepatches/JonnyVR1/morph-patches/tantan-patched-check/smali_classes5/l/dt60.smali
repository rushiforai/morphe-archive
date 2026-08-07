.class public final synthetic Ll/dt60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/rt60;


# direct methods
.method public synthetic constructor <init>(Ll/rt60;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dt60;->a:Ll/rt60;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dt60;->a:Ll/rt60;

    invoke-static {p0}, Ll/rt60;->s(Ll/rt60;)Ljava/lang/Double;

    move-result-object p0

    return-object p0
.end method
