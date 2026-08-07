.class public final synthetic Ll/qwu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/rwu;


# direct methods
.method public synthetic constructor <init>(Ll/rwu;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qwu;->a:Ll/rwu;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qwu;->a:Ll/rwu;

    check-cast p1, Ljava/lang/Long;

    invoke-static {p0, p1}, Ll/rwu;->r2(Ll/rwu;Ljava/lang/Long;)V

    return-void
.end method
