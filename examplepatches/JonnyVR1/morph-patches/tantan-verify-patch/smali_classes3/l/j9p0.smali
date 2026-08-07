.class public final synthetic Ll/j9p0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/o9p0;


# direct methods
.method public synthetic constructor <init>(Ll/o9p0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/j9p0;->a:Ll/o9p0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/j9p0;->a:Ll/o9p0;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {p0, p1}, Ll/o9p0;->e(Ll/o9p0;Ljava/lang/Boolean;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
