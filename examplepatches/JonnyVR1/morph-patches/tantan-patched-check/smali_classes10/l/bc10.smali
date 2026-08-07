.class public final synthetic Ll/bc10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/dc10;


# direct methods
.method public synthetic constructor <init>(Ll/dc10;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bc10;->a:Ll/dc10;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bc10;->a:Ll/dc10;

    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Ll/dc10;->W3(Ljava/lang/String;)V

    return-void
.end method
