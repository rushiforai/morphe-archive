.class public final synthetic Ll/m2s;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/r2s;


# direct methods
.method public synthetic constructor <init>(Ll/r2s;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/m2s;->a:Ll/r2s;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m2s;->a:Ll/r2s;

    check-cast p1, Ljava/lang/Long;

    invoke-static {p0, p1}, Ll/r2s;->t4(Ll/r2s;Ljava/lang/Long;)V

    return-void
.end method
