.class public final synthetic Ll/zm10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/en10;


# direct methods
.method public synthetic constructor <init>(Ll/en10;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zm10;->a:Ll/en10;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zm10;->a:Ll/en10;

    check-cast p1, Ljava/lang/Long;

    invoke-static {p0, p1}, Ll/en10;->P3(Ll/en10;Ljava/lang/Long;)V

    return-void
.end method
