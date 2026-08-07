.class public final synthetic Ll/ibg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/mbg;


# direct methods
.method public synthetic constructor <init>(Ll/mbg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ibg;->a:Ll/mbg;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ibg;->a:Ll/mbg;

    check-cast p1, Ljava/lang/Long;

    invoke-static {p0, p1}, Ll/mbg;->k4(Ll/mbg;Ljava/lang/Long;)V

    return-void
.end method
