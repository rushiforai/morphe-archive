.class public final synthetic Ll/lho;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/uho;


# direct methods
.method public synthetic constructor <init>(Ll/uho;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lho;->a:Ll/uho;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lho;->a:Ll/uho;

    check-cast p1, Ljava/lang/Long;

    invoke-static {p0, p1}, Ll/uho;->f0(Ll/uho;Ljava/lang/Long;)V

    return-void
.end method
