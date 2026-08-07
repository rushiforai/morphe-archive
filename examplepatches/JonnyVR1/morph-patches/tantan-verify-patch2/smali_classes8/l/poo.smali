.class public final synthetic Ll/poo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/apo;


# direct methods
.method public synthetic constructor <init>(Ll/apo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/poo;->a:Ll/apo;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/poo;->a:Ll/apo;

    check-cast p1, Ljava/util/List;

    invoke-static {p0, p1}, Ll/apo;->O0(Ll/apo;Ljava/util/List;)V

    return-void
.end method
