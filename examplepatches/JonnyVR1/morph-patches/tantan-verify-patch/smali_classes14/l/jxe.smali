.class public final synthetic Ll/jxe;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/uxe;


# direct methods
.method public synthetic constructor <init>(Ll/uxe;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jxe;->a:Ll/uxe;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jxe;->a:Ll/uxe;

    check-cast p1, Ljava/lang/Long;

    invoke-static {p0, p1}, Ll/uxe;->v(Ll/uxe;Ljava/lang/Long;)V

    return-void
.end method
