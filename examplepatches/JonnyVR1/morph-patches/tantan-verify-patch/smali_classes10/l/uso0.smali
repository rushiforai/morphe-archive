.class public final synthetic Ll/uso0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/fto0;


# direct methods
.method public synthetic constructor <init>(Ll/fto0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/uso0;->a:Ll/fto0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/uso0;->a:Ll/fto0;

    check-cast p1, Ljava/lang/String;

    invoke-static {p0, p1}, Ll/fto0;->Z3(Ll/fto0;Ljava/lang/String;)V

    return-void
.end method
