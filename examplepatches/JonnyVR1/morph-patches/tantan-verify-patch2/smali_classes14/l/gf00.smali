.class public final synthetic Ll/gf00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/jf00;


# direct methods
.method public synthetic constructor <init>(Ll/jf00;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gf00;->a:Ll/jf00;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gf00;->a:Ll/jf00;

    check-cast p1, Ljava/lang/String;

    invoke-static {p0, p1}, Ll/jf00;->c(Ll/jf00;Ljava/lang/String;)Ljava/lang/Object;

    return-void
.end method
