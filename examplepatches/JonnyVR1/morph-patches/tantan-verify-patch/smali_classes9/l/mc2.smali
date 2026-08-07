.class public final synthetic Ll/mc2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/hpl;


# direct methods
.method public synthetic constructor <init>(Ll/hpl;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mc2;->a:Ll/hpl;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mc2;->a:Ll/hpl;

    check-cast p1, Ll/hpl;

    invoke-static {p0, p1}, Ll/pc2;->a(Ll/hpl;Ll/hpl;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
