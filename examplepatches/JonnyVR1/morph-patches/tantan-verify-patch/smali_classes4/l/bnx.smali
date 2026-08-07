.class public final synthetic Ll/bnx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/enx;


# direct methods
.method public synthetic constructor <init>(Ll/enx;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bnx;->a:Ll/enx;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bnx;->a:Ll/enx;

    check-cast p1, Ljava/lang/Long;

    invoke-static {p0, p1}, Ll/enx;->i1(Ll/enx;Ljava/lang/Long;)V

    return-void
.end method
