.class public final synthetic Ll/gf50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:I


# direct methods
.method public synthetic constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ll/gf50;->a:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget p0, p0, Ll/gf50;->a:I

    check-cast p1, Ljava/util/Map;

    invoke-static {p0, p1}, Ll/qf50;->U3(ILjava/util/Map;)V

    return-void
.end method
