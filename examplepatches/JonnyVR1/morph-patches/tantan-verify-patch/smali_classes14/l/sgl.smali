.class public final synthetic Ll/sgl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ugl;


# direct methods
.method public synthetic constructor <init>(Ll/ugl;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/sgl;->a:Ll/ugl;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/sgl;->a:Ll/ugl;

    check-cast p1, Ljava/lang/String;

    invoke-static {p0, p1}, Ll/ugl;->n(Ll/ugl;Ljava/lang/String;)V

    return-void
.end method
