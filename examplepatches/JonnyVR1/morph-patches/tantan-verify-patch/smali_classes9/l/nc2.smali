.class public final synthetic Ll/nc2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/pc2;


# direct methods
.method public synthetic constructor <init>(Ll/pc2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nc2;->a:Ll/pc2;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nc2;->a:Ll/pc2;

    check-cast p1, Ll/hpl;

    invoke-static {p0, p1}, Ll/pc2;->c(Ll/pc2;Ll/hpl;)V

    return-void
.end method
