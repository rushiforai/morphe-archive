.class public final synthetic Ll/g720;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/u820;


# direct methods
.method public synthetic constructor <init>(Ll/u820;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/g720;->a:Ll/u820;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/g720;->a:Ll/u820;

    check-cast p1, Ljava/util/ArrayList;

    invoke-static {p0, p1}, Ll/u820;->Q0(Ll/u820;Ljava/util/ArrayList;)V

    return-void
.end method
